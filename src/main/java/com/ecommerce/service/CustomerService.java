package com.ecommerce.service;

import com.ecommerce.model.dao.CustomerDAO;
import com.ecommerce.model.dao.OrderDAO;
import com.ecommerce.model.dao.ReviewDAO;
import com.ecommerce.model.entity.Customer;
import com.ecommerce.utility.CSRFTokenUtil;
import com.ecommerce.utility.EmailValidator;
import com.ecommerce.utility.HashUtility;
import com.ecommerce.utility.SQLInjectionValidator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static com.ecommerce.utility.CommonUtility.*;

public class CustomerService {

	private final HttpServletRequest request;
	private final HttpServletResponse response;
	private final CustomerDAO customerDAO;

	public CustomerService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		customerDAO = new CustomerDAO();
	}

	public void listCustomer() throws ServletException, IOException {
		listCustomer(null);
	}

	public void listCustomer(String message) throws ServletException, IOException {
		List<Customer> listCustomers = customerDAO.listAll();

		request.setAttribute("listCustomers", listCustomers);

		if (message != null) {
			request.setAttribute("message", message);
		}

		forwardToPage("customer_list.jsp", request, response);
	}

	private void updateCustomerFields(Customer customer) {
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String addressLine1 = request.getParameter("addressLine1");
		String addressLine2 = request.getParameter("addressLine2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipCode = request.getParameter("zipCode");
		String country = request.getParameter("country");

		if (email != null && !"".equals(email)) {
			customer.setEmail(email);
		}

		customer.setFirstName(firstName);
		customer.setLastName(lastName);

		if (password != null && !"".equals(password)) {
			String encryptedPassword = HashUtility.generateMD5(password);
			customer.setPassword(encryptedPassword);
		}

		customer.setPhone(phone);
		customer.setAddressLine1(addressLine1);
		customer.setAddressLine2(addressLine2);
		customer.setCity(city);
		customer.setState(state);
		customer.setZipCode(zipCode);
		customer.setCountry(country);
	}

	public void showCustomerNewForm() throws ServletException, IOException {
		generateCountryList(request);

		forwardToPage("customer_form.jsp", request, response);
	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);

		if (existCustomer != null) {
			listCustomer(String.format(
					"Could not create new customer. The email %s is already registered by another customer.", email));

		} else {
			Customer newCustomer = new Customer();

			updateCustomerFields(newCustomer);

			customerDAO.create(newCustomer);

			listCustomer("New customer has been created successfully.");
		}
	}

	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);

		if (customer == null) {
			messageForAdmin(
					String.format("Could not find the customer with ID %s or it might have been deleted.", customerId),
					request, response);
		} else {
			customer.setPassword(null);

			request.setAttribute("customer", customer);

			generateCountryList(request);

			forwardToPage("customer_form.jsp", request, response);
		}
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");

		Customer customerByEmail = customerDAO.findByEmail(email);

		if (customerByEmail != null && !Objects.equals(customerByEmail.getCustomerId(), customerId)) {
			messageForAdmin(String.format(
					"Could not update the customer ID %s because there is an existing customer having the same email.",
					customerId), request, response);
		} else {
			Customer customerById = customerDAO.get(customerId);

			updateCustomerFields(customerById);

			customerDAO.update(customerById);

			listCustomer("The customer has been updated successfully.");
		}
	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);

		if (customer != null) {
			ReviewDAO reviewDAO = new ReviewDAO();
			long reviewCount = reviewDAO.countByCustomer(customerId);

			if (reviewCount > 0) {
				messageForAdmin(String.format(
						"Could not delete the customer with ID %s because the customer posted reviews for product(s).",
						customerId), request, response);

			} else {
				OrderDAO orderDAO = new OrderDAO();
				long orderCount = orderDAO.countByCustomer(customerId);

				if (orderCount > 0) {
					messageForAdmin(String.format(
							"Could not delete the customer with ID %s because the customer placed order(s).",
							customerId), request, response);

				} else {
					customerDAO.delete(customerId);
					listCustomer("The customer has been deleted successfully.");
				}
			}
		} else {
			messageForAdmin(
					String.format("Could not find the customer with ID %s or it might have been deleted.", customerId),
					request, response);
		}
	}

	public void showCustomerRegisterForm() throws ServletException, IOException {
		CSRFTokenUtil.generateCSRFToken(request);
		generateCountryList(request);
		forwardToPage("shop/register_form.jsp", request, response);
	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phone = request.getParameter("phone");
		String addressLine1 = request.getParameter("addressLine1");
		String addressLine2 = request.getParameter("addressLine2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipCode = request.getParameter("zipCode");
		String country = request.getParameter("country");
		Customer existCustomer = customerDAO.findByEmail(email);

		if (!SQLInjectionValidator.isInputValid(email,firstName,lastName,phone,addressLine1,addressLine2,city,state,zipCode,country))
			messageForShop("Invalid input!",request,response);

		if (!CSRFTokenUtil.validateCSRFToken(request)){
			messageForShop(
					"Invalid CSRF token or session expired.",
					request, response);
		}

		if (EmailValidator.isValidEmail(email)){
			if (existCustomer != null) {
				messageForShop(
						String.format("Could not register. The email %s is already registered by another customer.", email),
						request, response);

			} else {
				Customer newCustomer = new Customer();
				updateCustomerFields(newCustomer);
				customerDAO.create(newCustomer);

				messageForShop("You have registered successfully! Thank you.<br/><a href='login'>Click here</a> to login",
						request, response);
			}
		}
		else {
			messageForShop(
					"Could not register. The email is invalid.",
					request, response);
		}
	}

	public void showLogin() throws ServletException, IOException {
		String csrfToken = CSRFTokenUtil.generateCSRFToken(request);
		request.setAttribute("csrfToken",csrfToken);
		forwardToPage("shop/login.jsp", request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if (!CSRFTokenUtil.validateCSRFToken(request)){
			request.setAttribute("message", "Invalid CSRF token or session expired.");
			showLogin();
			return;
		}
		if (EmailValidator.isValidEmail(email)){
			Customer customer = customerDAO.findByEmailAndPassword(email, password);

			if (customer == null) {
				request.setAttribute("message", "Login failed. Please check your email and password.");
				showLogin();

			} else {
				CSRFTokenUtil.generateCSRFToken(request);
				HttpSession session = request.getSession();
				session.setAttribute("loggedCustomer", customer);

				Object objectRedirectURL = session.getAttribute("redirectURL");

				if (objectRedirectURL != null) {
					String redirectURL = (String) objectRedirectURL;
					session.removeAttribute("redirectURL");
					response.sendRedirect(redirectURL);

				} else {
					showCustomerProfile();
				}
			}
		}
		else {
			request.setAttribute("message", "Login failed. Please check your email and password.");
			showLogin();
		}

	}

	public void logout() throws IOException {
		request.getSession().removeAttribute("loggedCustomer");
		response.sendRedirect(request.getContextPath());
	}

	public void showCustomerProfile() throws ServletException, IOException {
		forwardToPage("shop/customer_profile.jsp", request, response);
	}

	public void showCustomerProfileEditForm() throws ServletException, IOException {
		generateCountryList(request);
		forwardToPage("shop/edit_profile.jsp", request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFields(customer);
		customerDAO.update(customer);
		showCustomerProfile();
	}

}
