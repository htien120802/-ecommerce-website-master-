package com.ecommerce.service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.ecommerce.utility.CommonUtility.forwardToPage;

public class ErrorService {
	private final HttpServletRequest request;
	private final HttpServletResponse response;

	public ErrorService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public void catchError() throws ServletException, IOException {
		String errorCode = request.getParameter("code");
		String errorTitle;
		String errorDetail;

		switch (errorCode) {
		case "400": {
			errorTitle = "Invalid request";
			errorDetail = "The server could not identify your request.<br>Click the button below to go back!";
			break;
		}
		case "401": {
			errorTitle = "Access is not allowed";
			errorDetail = "The requested page requires permission to access.<br>Click the button below to go back!";
			break;
		}
		case "402": {
			errorTitle = "Can not use";
			errorDetail = "You cannot use this code yet.<br>Click the button below to go back!";
			break;
		}
		case "403": {
			errorTitle = "Banned page";
			errorDetail = "The requested page access is prohibited.<br>Click the button below to go back!";
			break;
		}
		case "404": {
			errorTitle = "The page you're looking for does not exist";
			errorDetail = "The URL may be broken or deleted by the administrator.<br>Click the button below to go back!";
			break;
		}
		case "405": {
			errorTitle = "Method is not allowed";
			errorDetail = "The method specified in the request is not allowed.<br>Click the button below to go back!";
			break;
		}
		case "406": {
			errorTitle = "Not accepted";
			errorDetail = "The response was not accepted by the server.<br>Click the button below to go back!";
			break;
		}
		case "407": {
			errorTitle = "Proxy authentication required";
			errorDetail = "You must authenticate the proxy before sending this request.<br>Click the button below to go back!";
			break;
		}
		case "408": {
			errorTitle = "Request timeout";
			errorDetail = "The request took longer than expected at the server.<br>Click the button below to go back!";
			break;
		}
		case "409": {
			errorTitle = "Conflict";
			errorDetail = "Unable to complete due to request conflict.<br>Click the button below to go back!";
			break;
		}
		case "410": {
			errorTitle = "Does not exist";
			errorDetail = "The requested page has been deleted.<br>Click the button below to go back!";
			break;
		}
		case "411": {
			errorTitle = "Exceeded the specified length";
			errorDetail = "Unknown content length.<br>The server did not accept this request.<br>Click the button below to go back!";
			break;
		}
		case "412": {
			errorTitle = "Precondition is not correct";
			errorDetail = "The condition given in the request is evaluated as false by the server.<br>Click the button below to go back!";
			break;
		}
		case "413": {
			errorTitle = "Request object is too large";
			errorDetail = "The server did not accept the request because the request entity was too large.<br>Click the button below to go back!";
			break;
		}
		case "414": {
			errorTitle = "URL too long";
			errorDetail = "Click the button below to go back!";
			break;
		}
		case "415": {
			errorTitle = "Unsupported";
			errorDetail = "Server does not accept this type of request.<br>Click the button below to go back!";
			break;
		}
		case "417": {
			errorTitle = "Expectation Failed";
			errorDetail = "Click the button below to go back!";
			break;
		}
		case "500": {
			errorTitle = "Server connection error";
			errorDetail = "The connection to the server is currently inaccessible.<br>Please visit later.<br>Click the button below to go back!";
			break;
		}
		case "501": {
			errorTitle = "Not done yet";
			errorDetail = "The request has not been completed.<br>The server does not support the requested function.<br>Click the button below to go back!";
			break;
		}
		case "502": {
			errorTitle = "Request port error";
			errorDetail = "The server did not receive a valid request response.<br>Click the button below to go back!";
			break;
		}
		case "503": {
			errorTitle = "Service not available";
			errorDetail = "The server is temporarily overloaded or down.<br>Click the button below to go back!";
			break;
		}
		case "504": {
			errorTitle = "Connection timed out";
			errorDetail = "Gateway timed out.<br>Click the button below to go back!";
			break;
		}
		case "505": {
			errorTitle = "HTTP is not supported";
			errorDetail = "The server does not support the HTTP protocol.<br>Click the button below to go back!";
			break;
		}
		default: {
			errorTitle = "Something has gone wrong";
			errorDetail = "Contact to the administrator.";
		}
		}

		request.setAttribute("errorCode", errorCode);
		request.setAttribute("errorTitle", errorTitle);
		request.setAttribute("errorDetail", errorDetail);

		forwardToPage("common/error.jsp", request, response);
	}

}
