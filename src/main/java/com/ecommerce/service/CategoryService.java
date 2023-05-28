package com.ecommerce.service;

import com.ecommerce.model.dao.CategoryDAO;
import com.ecommerce.model.dao.ProductDAO;
import com.ecommerce.model.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static com.ecommerce.utility.CommonUtility.forwardToPage;
import static com.ecommerce.utility.CommonUtility.messageForAdmin;

public class CategoryService {

	private final CategoryDAO categoryDAO;
	private final HttpServletRequest request;
	private final HttpServletResponse response;

	public CategoryService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		categoryDAO = new CategoryDAO();
	}

	public void listCategory() throws ServletException, IOException {
		listCategory(null);
	}

	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategories = categoryDAO.listAll();

		request.setAttribute("listCategories", listCategories);

		if (message != null) {
			request.setAttribute("message", message);
		}

		forwardToPage("category_list.jsp", request, response);
	}

	public void createCategory() throws ServletException, IOException {
		String categoryName = request.getParameter("name");
		Category existCategory = categoryDAO.findByName(categoryName);

		if (existCategory != null) {
			messageForAdmin(
					String.format("Could not create category. A category with name %s already exists.", categoryName),
					request, response);

		} else {
			Category newCategory = new Category(categoryName);
			categoryDAO.create(newCategory);
			listCategory("New category created successfully.");
		}
	}

	public void editCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);

		if (category != null) {
			request.setAttribute("category", category);
			forwardToPage("category_form.jsp", request, response);

		} else {
			messageForAdmin(
					String.format("Could not find the category with ID %s or it might have been deleted.", categoryId),
					request, response);
		}
	}

	public void updateCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("name");

		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByName(categoryName);

		if (categoryByName != null && !Objects.equals(categoryById.getCategoryId(), categoryByName.getCategoryId())) {
			messageForAdmin(
					String.format("Could not update category. A category with name %s already exists.", categoryName),
					request, response);

		} else {
			categoryById.setName(categoryName);
			categoryDAO.update(categoryById);
			listCategory("Category has been updated successfully.");
		}
	}

	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));

		Category category = categoryDAO.get(categoryId);

		if (category == null) {
			messageForAdmin(
					String.format("Could not find the category with ID %s or it might have been deleted.", categoryId),
					request, response);
			return;
		}

		ProductDAO productDAO = new ProductDAO();
		long numberOfProducts = productDAO.countByCategory(categoryId);

		if (numberOfProducts > 0) {
			listCategory(
					String.format("Could not delete the category (ID: %d) because it currently contains some products.",
							numberOfProducts));

		} else {
			categoryDAO.delete(categoryId);
			listCategory(String.format("The category with ID %s has been removed successfully.", categoryId));
		}
	}

}
