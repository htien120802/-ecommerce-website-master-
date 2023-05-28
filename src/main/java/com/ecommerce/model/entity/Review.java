package com.ecommerce.model.entity;

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "review")
@NamedQueries({ @NamedQuery(name = "Review.listAll", query = "SELECT r FROM Review r ORDER BY r.reviewTime DESC"),
		@NamedQuery(name = "Review.countAll", query = "SELECT COUNT(r) FROM Review r"),
		@NamedQuery(name = "Review.countByCustomer", query = "SELECT COUNT(r.reviewId) FROM Review r WHERE r.customer.customerId = :customerId"),
		@NamedQuery(name = "Review.findByCustomerAndProduct", query = "SELECT r FROM Review r WHERE r.product.active = TRUE AND r.customer.customerId = :customerId AND r.product.productId = :productId"),
		@NamedQuery(name = "Review.mostFavored", query = "SELECT r.product, COUNT(r.product.productId) AS ReviewCount, AVG(r.rating) as AvgRating FROM Review r WHERE r.product.active = TRUE GROUP BY r.product.productId HAVING AVG(r.rating) >= 4.0 ORDER BY ReviewCount DESC, AvgRating DESC"),
		@NamedQuery(name = "Review.mostFavoredFindByCategory", query = "SELECT r.product, COUNT(r.product.productId) AS ReviewCount, AVG(r.rating) as AvgRating FROM Review r JOIN Category c ON r.product.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE r.product.active = TRUE GROUP BY r.product.productId HAVING AVG(r.rating) >= 4.0 ORDER BY ReviewCount DESC, AvgRating DESC"),
		@NamedQuery(name = "Review.listRated", query = "SELECT r.product, AVG(r.rating) as AvgRating FROM Review r WHERE r.product.active = TRUE GROUP BY r.product.productId HAVING AVG(r.rating) >= :ratingStars ORDER BY AvgRating DESC"),
		@NamedQuery(name = "Review.listRatedFindByCategory", query = "SELECT r.product, AVG(r.rating) as AvgRating FROM Review r JOIN Category c ON r.product.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE r.product.active = TRUE GROUP BY r.product.productId HAVING AVG(r.rating) >= :ratingStars ORDER BY AvgRating DESC") })
public class Review {

	private Integer reviewId;
	private Customer customer;
	private Product product;
	private int rating;
	private String headline;
	private String comment;
	private Date reviewTime;

	public Review() {
	}

	public Review(Customer customer, Product product, int rating, String headline, String comment, Date reviewTime) {
		this.customer = customer;
		this.product = product;
		this.rating = rating;
		this.headline = headline;
		this.comment = comment;
		this.reviewTime = reviewTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "review_id", unique = true, nullable = false)
	public Integer getReviewId() {
		return this.reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "rating", nullable = false)
	public int getRating() {
		return this.rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Column(name = "headline", nullable = false, length = 128)
	public String getHeadline() {
		return this.headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	@Column(name = "comment", nullable = false, length = 512)
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "review_time", nullable = false, length = 19)
	public Date getReviewTime() {
		return this.reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}

	@Transient
	public String getStars() {
		StringBuilder result = new StringBuilder();

		int numberOfStarsOn = rating;

		for (int i = 1; i <= numberOfStarsOn; i++) {
			result.append("on,");
		}

		for (int j = numberOfStarsOn + 1; j <= 5; j++) {
			result.append("off,");
		}

		return result.substring(0, result.length() - 1);
	}
}
