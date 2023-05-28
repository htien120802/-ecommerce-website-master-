package com.ecommerce.model.domain;


import com.ecommerce.model.entity.Product;
import com.ecommerce.model.entity.Review;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.HashSet;
import java.util.Set;

class ProductRatingTest {

    @BeforeAll
    static void setUpBeforeClass() {
    }

    @AfterAll
    static void tearDownAfterClass() {
    }

    @Test
    public void testAverageRating1() {
        Product product = new Product();

        Set<Review> reviews = new HashSet<>();
        Review review1 = new Review();
        review1.setRating(5);
        reviews.add(review1);

        product.setReviews(reviews);

        float averageRating = product.getAverageRating();

        Assertions.assertEquals(5.0, averageRating, 0.0);
    }

    @Test
    public void testAverageRating2() {
        Product product = new Product();

        float averageRating = product.getAverageRating();

        Assertions.assertEquals(0.0, averageRating, 0.0);
    }

    @Test
    public void testAverageRating3() {
        Product product = new Product();

        Set<Review> reviews = new HashSet<>();
        Review review1 = new Review();
        review1.setRating(5);
        reviews.add(review1);

        Review review2 = new Review();
        review2.setRating(4);
        reviews.add(review2);

        Review review3 = new Review();
        review3.setRating(3);
        reviews.add(review3);

        product.setReviews(reviews);

        float averageRating = product.getAverageRating();

        Assertions.assertEquals(4.0, averageRating, 0.0);
    }

    @Test
    public void testRatingString1() {
        float averageRating = 0.0f;
        Product product = new Product();
        String actual = product.getRatingString(averageRating);

        String expected = "off,off,off,off,off";

        Assertions.assertEquals(expected, actual);
    }

    @Test
    public void testRatingString2() {
        float averageRating = 5.0f;
        Product product = new Product();
        String actual = product.getRatingString(averageRating);

        String expected = "on,on,on,on,on";

        Assertions.assertEquals(expected, actual);
    }

    @Test
    public void testRatingString3() {
        float averageRating = 3.0f;
        Product product = new Product();
        String actual = product.getRatingString(averageRating);

        String expected = "on,on,on,off,off";

        Assertions.assertEquals(expected, actual);
    }

    @Test
    public void testRatingString4() {
        float averageRating = 4.5f;
        Product product = new Product();
        String actual = product.getRatingString(averageRating);

        String expected = "on,on,on,on,half";

        Assertions.assertEquals(expected, actual);
    }

    @Test
    public void testRatingString5() {
        float averageRating = 3.6f;
        Product product = new Product();
        String actual = product.getRatingString(averageRating);

        String expected = "on,on,on,half,off";

        Assertions.assertEquals(expected, actual);
    }

}
