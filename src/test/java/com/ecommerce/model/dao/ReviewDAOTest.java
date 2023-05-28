package com.ecommerce.model.dao;

import com.ecommerce.model.entity.Customer;
import com.ecommerce.model.entity.Product;
import com.ecommerce.model.entity.Review;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ReviewDAOTest {

    private static ReviewDAO reviewDAO;

    @BeforeAll
    static void setUpBeforeClass() {
        reviewDAO = new ReviewDAO();
    }

    @AfterAll
    static void tearDownAfterClass() {
        reviewDAO.close();
    }

    @Test
    final void testCreateReview() {
        Review review = new Review();

        Product product = new Product();
        product.setProductId(1);
        Customer customer = new Customer();
        customer.setCustomerId(5);

        review.setProduct(product);
        review.setCustomer(customer);

        review.setHeadline("Excellent product!");
        review.setRating(5);
        review.setComment("A comprehensive product for best outfit");

        Review savedReview = reviewDAO.create(review);

        assertTrue(savedReview.getReviewId() > 0);
    }

    @Test
    final void testGet() {
        Review review = reviewDAO.get(1);

        assertNotNull(review);
    }

    @Test
    final void testUpdateReview() {
        Review review = reviewDAO.get(1);
        review.setHeadline("Excellent product");
        Review updatedReview = reviewDAO.update(review);

        assertEquals(review.getHeadline(), updatedReview.getHeadline());
    }

    @Test
    final void testDeleteReview() {
        reviewDAO.delete(2);
        Review review = reviewDAO.get(2);

        assertNull(review);
    }

    @Test
    final void testListAll() {
        List<Review> listReview = reviewDAO.listAll();
        listReview.forEach(r -> System.out.println(r.getReviewId() + " - " + r.getProduct().getTitle() + " - "
                + r.getCustomer().getFullName() + " - " + r.getHeadline() + " - " + r.getRating()));

        assertTrue(listReview.size() > 0);
    }

    @Test
    final void testCount() {
        long totalReviews = reviewDAO.count();
        System.out.println("Total Reviews: " + totalReviews);

        assertTrue(totalReviews > 0);
    }

    @Test
    public void testFindByCustomerAndProductNotFound() {
        Integer customerId = 100;
        Integer productId = 100;

        Review result = reviewDAO.findByCustomerAndProduct(customerId, productId);

        assertNull(result);
    }

    @Test
    public void testFindByCustomerAndBookFound() {
        Integer customerId = 1;
        Integer productId = 10;

        Review result = reviewDAO.findByCustomerAndProduct(customerId, productId);

        assertNotNull(result);
    }

    @Test
    public void testListMostRecent() {
        List<Review> recentReviews = reviewDAO.listMostRecent();

        assertEquals(3, recentReviews.size());
    }

    @Test
    public void testCountByCustomerNotFound() {
        int customerId = 100;
        long reviewCount = reviewDAO.countByCustomer(customerId);

        assertEquals(0, reviewCount);
    }

    @Test
    public void testCountByCustomerFound() {
        int customerId = 1;
        long reviewCount = reviewDAO.countByCustomer(customerId);

        assertEquals(4, reviewCount);
    }
}
