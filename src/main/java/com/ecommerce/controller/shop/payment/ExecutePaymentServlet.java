package com.ecommerce.controller.shop.payment;

import static com.ecommerce.utility.CommonUtility.forwardToPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.service.OrderService;
import com.ecommerce.service.PaymentService;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

@WebServlet(name = "ExecutePaymentServlet", value = "/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PaymentService paymentService = new PaymentService(request, response);
		try {
			Payment payment = paymentService.executePayment();

			OrderService orderService = new OrderService(request, response);
			Integer orderId = orderService.placeOrderPayPal(payment);

			HttpSession session = request.getSession();
			session.setAttribute("orderId", orderId);

			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);

			session.setAttribute("payer", payerInfo);
			session.setAttribute("transaction", transaction);

			forwardToPage("shop/payment_receipt.jsp", request, response);

		} catch (PayPalRESTException e) {
			e.printStackTrace();
			throw new ServletException("Error in executing payment.");
		}
	}

}
