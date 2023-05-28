/**
 *
 */
package com.ecommerce.model.dao;

import com.ecommerce.model.entity.Category;
import com.ecommerce.model.entity.Product;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ProductDAOTest {
    private static ProductDAO productDAO;

    @BeforeAll
    static void setUpBeforeClass() {
        productDAO = new ProductDAO();
    }

    @AfterAll
    static void tearDownAfterClass() {
        productDAO.close();
    }

    @Test
    void testCreateProduct() throws ParseException, IOException {
        Product newProduct = new Product();

        Category category = new Category("Tops");
        category.setCategoryId(2);
        newProduct.setCategory(category);

        newProduct.setTitle("");
        newProduct.setDescription("");
        newProduct.setPrice(38.87f);

        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date publishDate = dateFormat.parse("05/28/2008");
        newProduct.setPublishDate(publishDate);

        String imagePath = "../ProductStoreWebsite/products/ .png";

        byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
        newProduct.setImage(imageBytes);

        Product createdProduct = productDAO.create(newProduct);

        assertTrue(createdProduct.getProductId() > 0);
    }

    @Test
    void testUpdateProduct() throws ParseException, IOException {
        Product existProduct = new Product();
        existProduct.setProductId(1);

        Category category = new Category("Bottoms");
        category.setCategoryId(1);
        existProduct.setCategory(category);

        existProduct.setTitle("");
        existProduct.setDescription("");
        existProduct.setPrice(40f);

        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date publishDate = dateFormat.parse("05/28/2008");
        existProduct.setPublishDate(publishDate);

        String imagePath = "../ProductStoreWebsite/products/ .jpg";

        byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
        existProduct.setImage(imageBytes);

        Product updatedProduct = productDAO.update(existProduct);

        assertEquals(updatedProduct.getTitle(), "");
    }

    @Test
    void testGetProductSuccess() {
        Product product = productDAO.get(2);

        assertNotNull(product);
    }

    @Test
    void testGetProductFail() {
        Product product = productDAO.get(99);

        assertNull(product);
    }

    @Test
    void testDeleteProductSuccess() {
        productDAO.delete(1);

        assertTrue(true);
    }

    @Test
    void testDeleteProductFail() {
        Integer productId = 100;
        productDAO.delete(productId);
    }

    @Test
    void testListAll() {
        List<Product> listProduct = productDAO.listAll();
        for (Product product : listProduct) {
            System.out.println(product.getTitle() + " - " + product.isActive());
        }

        assertFalse(listProduct.isEmpty());
    }

    @Test
    void testCount() {
        long totalProduct = productDAO.count();

        assertEquals(2, totalProduct);
    }

    @Test
    void testFindByTitleExist() {
        Product product = productDAO.findByTitle("Bi-Swing Jacket");

        assertNotNull(product);
    }

    @Test
    void testFindByTitleNotExist() {
        Product product = productDAO.findByTitle("Hybrid Hooded Pullover");

        assertNull(product);
    }

    @Test
    public void testListByCategory() {
        List<Product> listProduct = productDAO.listByCategory(1);

        assertTrue(listProduct.size() > 0);
    }

    @Test
    public void testListRecently() {
        List<Product> listProduct = productDAO.listNewProducts();
        listProduct.forEach(p -> System.out.println(p.getTitle() + " - " + p.getPublishDate()));

        assertEquals(4, listProduct.size());
    }

    @Test
    public void testSearchProductInTitle() {
        List<Product> listProduct = productDAO.search("Java");
        listProduct.forEach(p -> System.out.println(p.getTitle()));

        assertEquals(7, listProduct.size());
    }

    @Test
    public void testSearchProductInAuthor() {
        List<Product> listProduct = productDAO.search("iconic");
        listProduct.forEach(p -> System.out.println(p.getTitle()));

        assertTrue(listProduct.size() > 0);
    }

    @Test
    public void testSearchProductInDescription() {
        List<Product> listProduct = productDAO.search("The Chino Jacket");
        listProduct.forEach(p -> System.out.println(p.getTitle()));

        assertEquals(1, listProduct.size());
    }

    @Test
    public void testCountByCategory() {
        long numberOfProducts = productDAO.countByCategory(1);

        assertEquals(2, numberOfProducts);
    }

    @Test
    public void testListBestSellingProducts() {
        List<Product> topBestSellingProducts = productDAO.listBestSellingProducts();

        for (Product product : topBestSellingProducts) {
            System.out.println(product.getTitle());
        }

        assertTrue(topBestSellingProducts.size() > 0);
    }

    @Test
    public void testListMostFavoredBooks() {
        List<Product> topFavoredProducts = productDAO.listMostFavoredProducts();

        for (Product product : topFavoredProducts) {
            System.out.println(product.getTitle());
        }

        assertEquals(0, topFavoredProducts.size());
    }

    @Test
    public void testListOrderedProductsByCustomer() {
        int customerId = 1;
        List<Product> listOrderedProductsByCustomer = productDAO.listOrderedProductsByCustomer(customerId);

        listOrderedProductsByCustomer.forEach(product -> System.out.println(product.getTitle()));

        assertTrue(listOrderedProductsByCustomer.size() > 0);
    }
}

