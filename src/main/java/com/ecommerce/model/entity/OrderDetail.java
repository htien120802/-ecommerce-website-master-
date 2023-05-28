package com.ecommerce.model.entity;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail")
@NamedQueries({
		@NamedQuery(name = "OrderDetail.bestSelling", query = "SELECT od.product FROM OrderDetail od WHERE od.product.active = TRUE GROUP by od.product.productId ORDER BY SUM(od.quantity) DESC"),
		@NamedQuery(name = "OrderDetail.bestSellingFindByCategory", query = "SELECT od.product FROM OrderDetail od JOIN Category c ON od.product.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE od.product.active = TRUE GROUP BY od.product.productId ORDER BY SUM(od.quantity) DESC"),
		@NamedQuery(name = "OrderDetail.countByProduct", query = "SELECT COUNT(od) FROM OrderDetail od WHERE od.product.productId = :productId"),
		@NamedQuery(name = "OrderDetail.findByCustomer", query = "SELECT DISTINCT od.product FROM OrderDetail od WHERE od.productOrder.customer.customerId = :customerId GROUP BY od.product.productId")})
public class OrderDetail {

	private OrderDetailId id = new OrderDetailId();
	private Product product;
	private ProductOrder productOrder;
	private int quantity;
	private float subtotal;

	public OrderDetail() {
	}

	public OrderDetail(OrderDetailId id) {
		this.id = id;
	}

	public OrderDetail(OrderDetailId id, Product product, ProductOrder productOrder, int quantity, float subtotal) {
		this.id = id;
		this.product = product;
		this.productOrder = productOrder;
		this.quantity = quantity;
		this.subtotal = subtotal;
	}

	@EmbeddedId

	@AttributeOverrides({ @AttributeOverride(name = "orderId", column = @Column(name = "order_id")),
			@AttributeOverride(name = "productId", column = @Column(name = "product_id")) })
	public OrderDetailId getId() {
		return this.id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id", insertable = false, updatable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
		this.id.setProduct(product);
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", insertable = false, updatable = false)
	public ProductOrder getProductOrder() {
		return this.productOrder;
	}

	public void setProductOrder(ProductOrder productOrder) {
		this.productOrder = productOrder;
		this.id.setProductOrder(productOrder);
	}

	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "subtotal", nullable = false, precision = 12)
	public float getSubtotal() {
		return this.subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}

}
