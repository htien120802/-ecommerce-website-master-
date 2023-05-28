package com.ecommerce.model.entity;

import javax.persistence.*;
import java.util.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "product", uniqueConstraints = @UniqueConstraint(columnNames = "title"))
@NamedQueries({ @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
		@NamedQuery(name = "Product.findActive", query = "SELECT p FROM Product p WHERE p.active = TRUE"),
		@NamedQuery(name = "Product.findByTitle", query = "SELECT p FROM Product p WHERE p.title = :title"),
		@NamedQuery(name = "Product.countAll", query = "SELECT COUNT(p) FROM Product p"),
		@NamedQuery(name = "Product.findByCategory", query = "SELECT p FROM Product p JOIN Category c ON p.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE p.active = TRUE"),
		@NamedQuery(name = "Product.findNew", query = "SELECT p FROM Product p WHERE p.active = TRUE ORDER BY p.publishDate DESC"),
		@NamedQuery(name = "Product.search", query = "SELECT p FROM Product p WHERE p.active = TRUE AND p.title LIKE '%' || :keyword || '%' OR p.description LIKE '%' || :keyword || '%'"),
		@NamedQuery(name = "Product.countByCategory", query = "SELECT COUNT(p) FROM Product p WHERE p.category.categoryId = :categoryId"),
		@NamedQuery(name = "Product.findByCategoryAndPriceDesc", query = "SELECT p FROM Product p JOIN Category c ON p.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE p.active = TRUE ORDER BY p.price DESC"),
		@NamedQuery(name = "Product.findByCategoryAndPriceAsc", query = "SELECT p FROM Product p JOIN Category c ON p.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE p.active = TRUE ORDER BY p.price"),
		@NamedQuery(name = "Product.findNewAndByCategory", query = "SELECT p FROM Product p JOIN Category c ON p.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE p.active = TRUE ORDER BY p.publishDate DESC"),
		@NamedQuery(name = "Product.findActiveAndPriceDesc", query = "SELECT p FROM Product p WHERE p.active = TRUE ORDER BY p.price DESC"),
		@NamedQuery(name = "Product.findActiveAndPriceAsc", query = "SELECT p FROM Product p WHERE p.active = TRUE ORDER BY p.price") })
public class Product {

	private Integer productId;
	private Category category;
	private String title;
	private String description;
	private byte[] image;
	private String base64Image;
	private float price;
	private Date publishDate;
	private Date lastUpdateTime;
	private boolean active;
	private Set<Review> reviews = new HashSet<>(0);
	private Set<OrderDetail> orderDetails = new HashSet<>(0);

	public Product() {
	}

	public Product(Integer productId) {
		super();
		this.productId = productId;
	}

	public Product(Category category, String title, String description, byte[] image, float price, Date publishDate,
			Date lastUpdateTime, boolean active) {
		this.category = category;
		this.title = title;
		this.description = description;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
		this.active = active;
	}

	public Product(Category category, String title, String description, byte[] image, float price, Date publishDate,
			Date lastUpdateTime, boolean active, Set<Review> reviews, Set<OrderDetail> orderDetails) {
		this.category = category;
		this.title = title;
		this.description = description;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
		this.active = active;
		this.reviews = reviews;
		this.orderDetails = orderDetails;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "product_id", unique = true, nullable = false)
	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "title", unique = true, nullable = false, length = 128)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "description", nullable = false, length = 16777215)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "image", nullable = false)
	public byte[] getImage() {
		return this.image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Column(name = "price", nullable = false, precision = 12)
	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "publish_date", nullable = false, length = 10)
	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_update_time", nullable = false, length = 19)
	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@Column(name = "active", nullable = false)
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "product")
	public Set<Review> getReviews() {
		TreeSet<Review> sortedReviews = new TreeSet<>(
				(review1, review2) -> review2.getReviewTime().compareTo(review1.getReviewTime()));
		sortedReviews.addAll(reviews);
		return sortedReviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Transient
	public String getBase64Image() {
		this.base64Image = Base64.getEncoder().encodeToString(this.image);
		return this.base64Image;
	}

	@Transient
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) {
			return true;
		}
		if (o == null || getClass() != o.getClass()) {
			return false;
		}
		Product product = (Product) o;
		return productId.equals(product.productId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(productId);
	}

	@Transient
	public float getAverageRating() {
		float averageRating;
		float sum = 0.0f;
		if (reviews.isEmpty()) {
			return 0.0f;
		}
		for (Review review : reviews) {
			sum += review.getRating();
		}
		averageRating = sum / reviews.size();
		return averageRating;
	}

	@Transient
	public String getRatingStars() {
		float averageRating = getAverageRating();
		return getRatingString(averageRating);
	}

	@Transient
	public String getRatingString(float averageRating) {
		StringBuilder result = new StringBuilder();

		int numberOfStarsOn = (int) averageRating;

		for (int i = 1; i <= numberOfStarsOn; i++) {
			result.append("on,");
		}

		int next = numberOfStarsOn + 1;

		if (averageRating > numberOfStarsOn) {
			result.append("half,");
			next++;
		}

		for (int j = next; j <= 5; j++) {
			result.append("off,");
		}

		return result.substring(0, result.length() - 1);
	}
}
