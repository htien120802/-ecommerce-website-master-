package com.ecommerce.model.domain;

import com.ecommerce.model.domain.Cart;
import com.ecommerce.model.entity.Product;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.Map;

class CartTest {
    private static Cart cart;

    @BeforeAll
    static void setUpBeforeClass() {
        cart = new Cart();
        Product product = new Product(1);

        product.setPrice(10);

        cart.addItem(product);
        cart.addItem(product);
    }

    @AfterAll
    static void tearDownAfterClass() {
    }

    @Test
    final void testAddItem() {
        Map<Product, Integer> items = cart.getItems();
        int quantity = items.get(new Product(1));

        Assertions.assertEquals(2, quantity);
    }

    @Test
    final void testRemoveItem() {
        cart.removeItem(new Product(1));

        Assertions.assertTrue(cart.getItems().isEmpty());
    }

    @Test
    final void testRemoveItem2() {
        Product product2 = new Product(2);
        cart.addItem(product2);
        cart.removeItem(new Product(2));

        Assertions.assertNull(cart.getItems().get(product2));
    }

    @Test
    final void testGetTotalQuantity() {
        Product product3 = new Product(3);
        cart.addItem(product3);
        cart.addItem(product3);
        cart.addItem(product3);

        Assertions.assertEquals(5, cart.getTotalQuantity());
    }

    @Test
    final void testGetTotalAmount() {
        Cart cart = new Cart();
        Assertions.assertEquals(0.0f, cart.getTotalAmount(), 0.0f);
    }

    @Test
    public void testGetTotalAmount2() {
        Assertions.assertEquals(20.0f, cart.getTotalAmount(), 0.0f);
    }

    @Test
    final void testUpdateCart() {
        Cart cart = new Cart();
        Product product1 = new Product(1);
        Product product2 = new Product(2);

        cart.addItem(product1);
        cart.addItem(product2);

        int[] productIds = {1, 2};
        int[] quantities = {3, 4};

        cart.updateCart(productIds, quantities);

        Assertions.assertEquals(7, cart.getTotalQuantity());
    }

    @Test
    final void testClear() {
        cart.clear();

        Assertions.assertEquals(0, cart.getTotalQuantity());
    }

    @Test
    final void testGetTotalItems() {
        Assertions.fail("Not yet implemented");
    }

    @Test
    final void testGetItems() {
        Assertions.fail("Not yet implemented");
    }

}
