package com.ecommerce.controller.admin;

import static com.ecommerce.utility.CommonUtility.forwardToPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.dao.CustomerDAO;
import com.ecommerce.model.dao.OrderDAO;
import com.ecommerce.model.dao.ProductDAO;
import com.ecommerce.model.dao.ReviewDAO;
import com.ecommerce.model.dao.UserDAO;
import com.ecommerce.model.entity.ProductOrder;
import com.ecommerce.model.entity.Review;

@WebServlet(name = "AdminHomeServlet", value = "/admin/")
public class AdminHomeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		OrderDAO orderDAO = new OrderDAO();
		ReviewDAO reviewDAO = new ReviewDAO();
		ProductDAO productDAO = new ProductDAO();
		CustomerDAO customerDAO = new CustomerDAO();

		List<ProductOrder> listMostRecentSales = orderDAO.listMostRecentSales();
		List<Review> listMostRecentReviews = reviewDAO.listMostRecent();

		long totalUsers = userDAO.count();
		long totalProducts = productDAO.count();
		long totalCustomers = customerDAO.count();
		long totalReviews = reviewDAO.count();
		long totalOrders = orderDAO.count();

		request.setAttribute("listMostRecentSales", listMostRecentSales);
		request.setAttribute("listMostRecentReviews", listMostRecentReviews);

		request.setAttribute("totalUsers", totalUsers);
		request.setAttribute("totalProducts", totalProducts);
		request.setAttribute("totalCustomers", totalCustomers);
		request.setAttribute("totalReviews", totalReviews);
		request.setAttribute("totalOrders", totalOrders);

		forwardToPage("index.jsp", request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
