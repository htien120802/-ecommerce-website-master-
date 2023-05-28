package com.ecommerce.service;

import com.ecommerce.model.entity.Customer;
import com.ecommerce.model.entity.OrderDetail;
import com.ecommerce.model.entity.Product;
import com.ecommerce.model.entity.ProductOrder;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.ecommerce.utility.CommonUtility.forwardToPage;

public class PaymentService {

	private static final String CLIENT_ID = "AbhDLOGRRsGvvUvgO74_FwMPhpS8BEbno1IW1pBxXTGV5z3TGSEIqleJG0JUk-Vw__pct6mvGRnTZr8S";
	private static final String CLIENT_SECRET = "EGV1Rr0myrwVI8_LS6o8hNmJOSR2nULOPGhYMKWwzHqgHUNpfR-F8NxPMyxFJm51DdSUmm-fUbl_KDxt";
	private final String mode = "sandbox";

	private final HttpServletRequest request;
	private final HttpServletResponse response;

	public PaymentService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
	}

	public void authorizePayment(ProductOrder order) throws ServletException, IOException {
		Payer payer = getPayerInformation(order);

		RedirectUrls redirectUrls = getRedirectURLs();

		List<Transaction> transactions = getTransactionInformation(order);

		// request payment
		Payment requestPayment = new Payment();
		requestPayment.setPayer(payer);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setIntent("authorize");
		requestPayment.setTransactions(transactions);

		System.out.println("====== REQUEST PAYMENT ======");
		System.out.println(requestPayment);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);

		// redirect tp PayPal's payment page
		try {
			Payment authorizedPayment = requestPayment.create(apiContext);
			System.out.println("====== AUTHORIZED PAYMENT ======");
			System.out.println(authorizedPayment);

			String approvalURL = getApprovalURL(authorizedPayment);

			response.sendRedirect(approvalURL);

		} catch (PayPalRESTException e) {
			e.printStackTrace();
			throw new ServletException("Error in authorizing payment.");
		}
	}

	private String getApprovalURL(Payment authorizedPayment) {
		// get approval link
		String approvalURL = null;

		List<Links> links = authorizedPayment.getLinks();

		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalURL = link.getHref();
				break;
			}
		}
		return approvalURL;
	}

	private Payer getPayerInformation(ProductOrder order) {
		// get payer information
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		PayerInfo payerInfo = new PayerInfo();

		Customer customer = order.getCustomer();
		payerInfo.setFirstName(customer.getFirstName());
		payerInfo.setLastName(customer.getLastName());
		payerInfo.setEmail(customer.getEmail());
		payer.setPayerInfo(payerInfo);

		return payer;
	}

	private RedirectUrls getRedirectURLs() {
		// get redirect URLs
		String requestURL = request.getRequestURL().toString();
		String requestURI = request.getRequestURI();
		String baseURL = requestURL.replace(requestURI, "").concat(request.getContextPath());

		RedirectUrls redirectUrls = new RedirectUrls();
		String cancelUrl = baseURL.concat("/view_cart");
		String returnUrl = baseURL.concat("/review_payment");

		System.out.printf("Return URL: %s%n", returnUrl);
		System.out.printf("Cancel URL: %s%n", cancelUrl);

		redirectUrls.setCancelUrl(cancelUrl);
		redirectUrls.setReturnUrl(returnUrl);

		return redirectUrls;
	}

	private Amount getAmountDetails(ProductOrder order) {
		// get amount details
		Details details = new Details();
		details.setShipping(String.valueOf(order.getShippingFee()));
		details.setTax(String.valueOf(order.getTax()));
		details.setSubtotal(String.valueOf(order.getSubtotal()));

		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setDetails(details);
		amount.setTotal(String.valueOf(order.getTotal()));

		return amount;
	}

	private ShippingAddress getRecipientInformation(ProductOrder order) {
		// shipping address (recipient info)
		ShippingAddress shippingAddress = new ShippingAddress();
		shippingAddress.setRecipientName(order.getRecipientFullName());
		shippingAddress.setPhone(order.getRecipientPhone());
		shippingAddress.setLine1(order.getRecipientAddressLine1());
		shippingAddress.setLine2(order.getRecipientAddressLine2());
		shippingAddress.setCity(order.getRecipientCity());
		shippingAddress.setState(order.getRecipientCity());
		shippingAddress.setCountryCode(order.getRecipientCountry());
		shippingAddress.setPostalCode(order.getRecipientZipCode());

		return shippingAddress;
	}

	private List<Transaction> getTransactionInformation(ProductOrder order) {
		// get transaction details
		Transaction transaction = new Transaction();
		transaction.setDescription("Products ordered on eCommerce store.");
		Amount amount = getAmountDetails(order);
		transaction.setAmount(amount);

		ItemList itemList = new ItemList();
		ShippingAddress shippingAddress = getRecipientInformation(order);
		itemList.setShippingAddress(shippingAddress);

		List<Item> paypalItems = new ArrayList<>();

		for (OrderDetail orderDetail : order.getOrderDetails()) {
			Product product = orderDetail.getProduct();
			Integer quantity = orderDetail.getQuantity();

			Item paypalItem = new Item();
			paypalItem.setCurrency("USD");
			paypalItem.setName(product.getTitle());
			paypalItem.setQuantity(String.valueOf(quantity));
			paypalItem.setPrice(String.valueOf(product.getPrice()));

			paypalItems.add(paypalItem);
		}

		itemList.setItems(paypalItems);
		transaction.setItemList(itemList);

		List<Transaction> listTransaction = new ArrayList<>();
		listTransaction.add(transaction);

		return listTransaction;
	}

	public void reviewPayment() throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		if (paymentId == null || payerId == null) {
			throw new ServletException("Error in displaying payment review.");
		}

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);

		try {
			Payment payment = Payment.get(apiContext, paymentId);

			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

			request.setAttribute("payer", payerInfo);
			request.setAttribute("recipient", shippingAddress);
			request.setAttribute("transaction", transaction);

			forwardToPage(String.format("shop/review_payment.jsp?paymentId=%s&PayerID=%s", paymentId, payerId), request,
					response);

		} catch (PayPalRESTException e) {
			e.printStackTrace();
			throw new ServletException("Error in getting payment details from PayPal.");
		}

	}

	public Payment executePayment() throws PayPalRESTException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);

		Payment payment = new Payment().setId(paymentId);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);

		return payment.execute(apiContext, paymentExecution);
	}

}
