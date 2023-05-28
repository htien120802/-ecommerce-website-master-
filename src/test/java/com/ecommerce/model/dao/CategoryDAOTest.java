package com.ecommerce.model.dao;

import com.ecommerce.model.entity.Category;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CategoryDAOTest {

    private static CategoryDAO categoryDAO;

    @BeforeAll
    static void setUpBeforeClass() {
        categoryDAO = new CategoryDAO();
    }

    @AfterAll
    static void tearDownAfterClass() {
        categoryDAO.close();
    }

    @Test
    void testCreateCategory() {
        Category category = new Category();
        category.setName("Tops");

        Category newCategory = categoryDAO.create(category);

        assertTrue(newCategory != null && newCategory.getCategoryId() > 0);
    }

    @Test
    void testUpdateCategory() {
        Category cat = new Category("Bottoms");
        cat.setCategoryId(99);

        Category category = categoryDAO.update(cat);

        assertEquals(cat.getName(), category.getName());
    }

    @Test
    void testGet() {
        Integer categoryId = 1;
        Category category = categoryDAO.get(categoryId);

        assertNotNull(category);
    }

    @Test
    void testDeleteCategory() {
        Integer categoryId = 1;
        categoryDAO.delete(categoryId);

        Category category = categoryDAO.get(categoryId);

        assertNotNull(category);
    }

    @Test
    void testListAll() {
        List<Category> listCategories = categoryDAO.listAll();

        listCategories.forEach(c -> System.out.println(c.getName()));

        assertTrue(listCategories.size() > 0);
    }

    @Test
    void testCount() {
        long totalCategories = categoryDAO.count();

        assertEquals(1, totalCategories);
    }

    @Test
    public void testFindByName() {
        Category category = categoryDAO.findByName("Tops");

        assertNotNull(category);
    }

    @Test
    public void testFindByNameNotFound() {
        Category category = categoryDAO.findByName("Dresses");

        assertNull(category);
    }

}
