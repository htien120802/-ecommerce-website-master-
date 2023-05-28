package com.ecommerce.model.entity;

import javax.persistence.*;
import java.util.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "product_order")
@NamedQueries({
		@NamedQuery(name = "ProductOrder.findAll", query = "SELECT po FROM ProductOrder po ORDER BY po.orderDate DESC"),
		@NamedQuery(name = "ProductOrder.countAll", query = "SELECT COUNT(*) FROM ProductOrder"),
		@NamedQuery(name = "ProductOrder.countByCustomer", query = "SELECT COUNT(po.orderId) FROM ProductOrder po WHERE po.customer.customerId = :customerId"),
		@NamedQuery(name = "ProductOrder.findByCustomer", query = "SELECT po FROM ProductOrder po WHERE po.customer.customerId = :customerId ORDER BY po.orderDate DESC"),
		@NamedQuery(name = "ProductOrder.findByIdAndCustomer", query = "SELECT po FROM ProductOrder po WHERE po.orderId = :orderId AND po.customer.customerId = :customerId") })
public class ProductOrder {

	private Integer orderId;
	private Customer customer;
	private Date orderDate;
	private String recipientAddressLine1;
	private String recipientAddressLine2;
	private String recipientFirstName;
	private String recipientLastName;
	private String recipientPhone;
	private String recipientCountry;
	private String recipientState;
	private String recipientCity;
	private String recipientZipCode;
	private String paymentMethod;
	private float shippingFee;
	private float tax;
	private float subtotal;
	private float total;
	private String status;
	private Set<OrderDetail> orderDetails = new HashSet<>(0);

	public ProductOrder() {
	}

	public ProductOrder(Customer customer, Date orderDate, String recipientAddressLine1, String recipientAddressLine2,
			String recipientFirstName, String recipientLastName, String recipientPhone, String recipientCountry,
			String recipientState, String recipientCity, String recipientZipCode, String paymentMethod,
			float shippingFee, float tax, float subtotal, float total, String status) {
		this.customer = customer;
		this.orderDate = orderDate;
		this.recipientAddressLine1 = recipientAddressLine1;
		this.recipientAddressLine2 = recipientAddressLine2;
		this.recipientFirstName = recipientFirstName;
		this.recipientLastName = recipientLastName;
		this.recipientPhone = recipientPhone;
		this.recipientCountry = recipientCountry;
		this.recipientState = recipientState;
		this.recipientCity = recipientCity;
		this.recipientZipCode = recipientZipCode;
		this.paymentMethod = paymentMethod;
		this.shippingFee = shippingFee;
		this.tax = tax;
		this.subtotal = subtotal;
		this.total = total;
		this.status = status;
	}

	public ProductOrder(Customer customer, Date orderDate, String recipientAddressLine1, String recipientAddressLine2,
			String recipientFirstName, String recipientLastName, String recipientPhone, String recipientCountry,
			String recipientState, String recipientCity, String recipientZipCode, String paymentMethod,
			float shippingFee, float tax, float subtotal, float total, String status, Set<OrderDetail> orderDetails) {
		this.customer = customer;
		this.orderDate = orderDate;
		this.recipientAddressLine1 = recipientAddressLine1;
		this.recipientAddressLine2 = recipientAddressLine2;
		this.recipientFirstName = recipientFirstName;
		this.recipientLastName = recipientLastName;
		this.recipientPhone = recipientPhone;
		this.recipientCountry = recipientCountry;
		this.recipientState = recipientState;
		this.recipientCity = recipientCity;
		this.recipientZipCode = recipientZipCode;
		this.paymentMethod = paymentMethod;
		this.shippingFee = shippingFee;
		this.tax = tax;
		this.subtotal = subtotal;
		this.total = total;
		this.status = status;
		this.orderDetails = orderDetails;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "order_id", unique = true, nullable = false)
	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "order_date", nullable = false, length = 19)
	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Column(name = "recipient_address_line1", nullable = false, length = 128)
	public String getRecipientAddressLine1() {
		return this.recipientAddressLine1;
	}

	public void setRecipientAddressLine1(String recipientAddressLine1) {
		this.recipientAddressLine1 = recipientAddressLine1;
	}

	@Column(name = "recipient_address_line2", nullable = false, length = 128)
	public String getRecipientAddressLine2() {
		return this.recipientAddressLine2;
	}

	public void setRecipientAddressLine2(String recipientAddressLine2) {
		this.recipientAddressLine2 = recipientAddressLine2;
	}

	@Column(name = "recipient_first_name", nullable = false, length = 32)
	public String getRecipientFirstName() {
		return this.recipientFirstName;
	}

	public void setRecipientFirstName(String recipientFirstName) {
		this.recipientFirstName = recipientFirstName;
	}

	@Column(name = "recipient_last_name", nullable = false, length = 32)
	public String getRecipientLastName() {
		return this.recipientLastName;
	}

	public void setRecipientLastName(String recipientLastName) {
		this.recipientLastName = recipientLastName;
	}

	@Transient
	public String getRecipientFullName() {
		return String.format("%s %s", this.recipientFirstName, this.recipientLastName);
	}

	@Column(name = "recipient_phone", nullable = false, length = 16)
	public String getRecipientPhone() {
		return this.recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	@Column(name = "recipient_country", nullable = false, length = 2)
	public String getRecipientCountry() {
		return this.recipientCountry;
	}

	public void setRecipientCountry(String recipientCountry) {
		this.recipientCountry = recipientCountry;
	}

	@Transient
	public String getRecipientCountryName() {
		return new Locale("", this.recipientCountry).getDisplayCountry();
	}

	@Column(name = "recipient_state", nullable = false, length = 32)
	public String getRecipientState() {
		return this.recipientState;
	}

	public void setRecipientState(String recipientState) {
		this.recipientState = recipientState;
	}

	@Column(name = "recipient_city", nullable = false, length = 32)
	public String getRecipientCity() {
		return this.recipientCity;
	}

	public void setRecipientCity(String recipientCity) {
		this.recipientCity = recipientCity;
	}

	@Column(name = "recipient_zip_code", nullable = false, length = 16)
	public String getRecipientZipCode() {
		return this.recipientZipCode;
	}

	public void setRecipientZipCode(String recipientZipCode) {
		this.recipientZipCode = recipientZipCode;
	}

	@Column(name = "payment_method", nullable = false, length = 32)
	public String getPaymentMethod() {
		return this.paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	@Column(name = "shipping_fee", nullable = false, precision = 12)
	public float getShippingFee() {
		return this.shippingFee;
	}

	public void setShippingFee(float shippingFee) {
		this.shippingFee = shippingFee;
	}

	@Column(name = "tax", nullable = false, precision = 12)
	public float getTax() {
		return this.tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	@Column(name = "subtotal", nullable = false, precision = 12)
	public float getSubtotal() {
		return this.subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}

	@Column(name = "total", nullable = false, precision = 12)
	public float getTotal() {
		return this.total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	@Column(name = "status", nullable = false, length = 32)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "productOrder", cascade = CascadeType.ALL, orphanRemoval = true)
	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Transient
	public int getProductCopies() {
		int total = 0;

		for (OrderDetail orderDetail : orderDetails) {
			total += orderDetail.getQuantity();
		}

		return total;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		ProductOrder that = (ProductOrder) o;
		return orderId.equals(that.orderId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(orderId);
	}
}
