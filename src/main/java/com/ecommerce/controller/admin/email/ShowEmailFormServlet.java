package com.ecommerce.controller.admin.email;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.service.EmailService;

@WebServlet(name = "ShowEmailFormServlet", value = "/admin/new_email")
public class ShowEmailFormServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmailService emailService = new EmailService(request, response);
		emailService.showEmailNewForm();
	}

}
