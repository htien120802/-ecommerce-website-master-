package com.ecommerce.controller.common.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.dao.CategoryDAO;
import com.ecommerce.model.entity.Category;
import com.ecommerce.utility.CSRFTokenUtil;

@WebFilter(filterName = "CommonFilter", value = "/*")
public class CommonFilter extends HttpFilter implements Filter {
	public static final String POLICY = "default-src 'self'; script-src 'self' 'unsafe-inline' http://www.w3.org/2000/svg http://code.jquery.com/jquery-1.10.2.min.js https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css https://use.fontawesome.com/releases/v5.0.6/js/all.js ; img-src 'self' data:; media-src https://lv-vod.fl.freecaster.net/vod/louisvuitton/dikq6kFFzG_HD.mp4; style-src 'self' 'unsafe-inline' https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css; font-src 'self'";
	private static final long serialVersionUID = 1L;
	private final CategoryDAO categoryDAO;

	public CommonFilter() {
		categoryDAO = new CategoryDAO();
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		if (httpRequest.getMethod().equalsIgnoreCase("GET"))
		{
			String csrfToken = CSRFTokenUtil.generateCSRFToken(httpRequest);
			request.setAttribute("csrfToken",csrfToken);
		}

		// Thiết lập X-Frame-Options
		httpResponse.setHeader("X-Frame-Options", "DENY");
		// Thiết lập X-Content Type
		httpResponse.setHeader("X-Content-Type-Options", "nosniff");
		// Thiết lập Content-Security-Policy
		httpResponse.setHeader("Content-Security-Policy", CommonFilter.POLICY);
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

		if (!path.startsWith("/admin/")) {
			List<Category> listCategory = categoryDAO.listAll();
			request.setAttribute("listCategory", listCategory);
		}

		chain.doFilter(request, response);

	}

}
