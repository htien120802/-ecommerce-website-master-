package com.ecommerce.service;

import com.ecommerce.model.dao.UserDAO;
import com.ecommerce.model.entity.User;
import com.ecommerce.utility.HashUtility;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static com.ecommerce.utility.CommonUtility.forwardToPage;
import static com.ecommerce.utility.CommonUtility.messageForAdmin;

public class UserService {
	private final UserDAO userDAO;
	private final HttpServletRequest request;
	private final HttpServletResponse response;

	public UserService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		userDAO = new UserDAO();
	}

	public void listUser() throws ServletException, IOException {
		listUser(null);
	}

	public void listUser(String message) throws ServletException, IOException {
		List<User> listUsers = userDAO.listAll();

		request.setAttribute("listUsers", listUsers);

		if (message != null) {
			request.setAttribute("message", message);
		}

		forwardToPage("user_list.jsp", request, response);
	}

	public void createUser() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String fullName = request.getParameter("fullName");

		User existUser = userDAO.findByEmail(email);

		if (existUser != null) {
			messageForAdmin(String.format("Could not create new user. A user with email %s already exists.", email),
					request, response);

		} else {
			User newUser = new User(email, password, fullName);
			userDAO.create(newUser);

			listUser("New user created successfully.");
		}
	}

	public void editUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = userDAO.get(userId);

		if (user == null) {
			messageForAdmin(String.format("Could not find the user with ID %s or it might have been deleted.", userId),
					request, response);

		} else {
			user.setPassword(null);
			request.setAttribute("user", user);

			forwardToPage("user_form.jsp", request, response);
		}
	}

	public void updateUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String checkPassword = request.getParameter("checkPassword");
		String password = request.getParameter("password");
		String fullName = request.getParameter("fullName");

		User userById = userDAO.get(userId);
		User userByEmail = userDAO.findByEmail(email);

		boolean checkResult = userDAO.findByEmailAndPassword(email, checkPassword);

		if (userByEmail != null && !Objects.equals(userByEmail.getUserId(), userById.getUserId())) {
			messageForAdmin(String.format("Could not update user. User with email %s already exists.", email), request,
					response);

		} else if (checkResult) {
			userById.setEmail(email);
			userById.setFullName(fullName);

			if (password != null && !password.isEmpty()) {
				String encryptedPassword = HashUtility.generateMD5(password);
				userById.setPassword(encryptedPassword);
			}

			userDAO.update(userById);
			listUser("User has been updated successfully.");

		} else {
			messageForAdmin("Could not update user because the password is wrong.", request, response);
		}
	}

	public void deleteUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = userDAO.get(userId);

		if (userId == 1) {
			messageForAdmin("The default admin user account cannot be deleted.", request, response);
			return;
		}

		if (user == null) {
			messageForAdmin(String.format("Could not find the user with ID %s or it might have been deleted.", userId),
					request, response);

		} else {
			userDAO.delete(userId);
			listUser("User has been deleted successfully.");
		}
	}

	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		boolean loginResult = userDAO.findByEmailAndPassword(email, password);

		if (loginResult) {
			request.getSession().setAttribute("userEmail", email);

			forwardToPage("/admin/", request, response);

		} else {
			forwardToPage("login.jsp", "Login failed.", request, response);
		}
	}

	public void logout() throws ServletException, IOException {
		request.getSession().removeAttribute("userEmail");

		forwardToPage("login.jsp", request, response);
	}
}
