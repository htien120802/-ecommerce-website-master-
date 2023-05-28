package com.ecommerce.service;

import com.ecommerce.utility.EmailUtility;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static com.ecommerce.utility.CommonUtility.forwardToPage;
import static com.ecommerce.utility.CommonUtility.messageForShop;

public class ContactService {

	private final HttpServletRequest request;
	private final HttpServletResponse response;

	public ContactService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public void showContact() throws ServletException, IOException {
		forwardToPage("shop/contact.jsp", request, response);
	}

	public void sendContact() throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");

		// handles form submission.
		List<File> uploadedFiles = saveUploadedFiles();

		String recipient = context.getInitParameter("recipient");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		try {
			EmailUtility.sendEmailWithAttachment(host, port, user, pass, recipient,
					String.format("%s from %s", subject, email), content, uploadedFiles);
			messageForShop("The email was sent successfully. Thank you for contact us.", request, response);

		} catch (Exception ex) {
			ex.printStackTrace();
			messageForShop(String.format(
					"There were an error %s.<br/><a href='#' type='button' onclick='history.go(-1);'>Click here</a> to send another contact.",
					ex.getMessage()), request, response);

		} finally {
			deleteUploadFiles(uploadedFiles);
		}
	}

	public List<File> saveUploadedFiles() throws IllegalStateException, IOException, ServletException {
		// Saves files uploaded from the client and return a list of these files which
		// will be attached to the email message.
		List<File> listFiles = new ArrayList<>();

		byte[] buffer = new byte[4096];
		int bytesRead;

		Collection<Part> multiParts = request.getParts();

		if (multiParts.size() > 0) {
			for (Part part : request.getParts()) {
				// creates a file to be saved
				String fileName = extractFileName(part);

				if (fileName == null || fileName.equals("")) {
					// not attachment part, continue
					continue;
				}

				File saveFile = new File(fileName);
				System.out.println("saveFile: " + saveFile.getAbsolutePath());
				FileOutputStream outputStream = new FileOutputStream(saveFile);

				// saves uploaded file
				InputStream inputStream = part.getInputStream();

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				outputStream.close();
				inputStream.close();

				listFiles.add(saveFile);
			}
		}

		return listFiles;
	}

	public String extractFileName(Part part) {
		// Retrieves file name of an upload part from its HTTP header.
		String contentDisposition = part.getHeader("content-disposition");
		String[] items = contentDisposition.split(";");

		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}

		return null;
	}

	public void deleteUploadFiles(List<File> listFiles) {
		// Deletes all uploaded files, should be called after the email was sent.
		if (listFiles != null && listFiles.size() > 0) {
			for (File file : listFiles) {
				file.delete();
			}
		}
	}

}
