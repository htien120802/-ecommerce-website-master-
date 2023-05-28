package com.ecommerce.model.dao;

import com.ecommerce.model.entity.Customer;
import com.ecommerce.model.entity.OrderDetail;
import com.ecommerce.model.entity.Product;
import com.ecommerce.model.entity.ProductOrder;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class OrderDAOTest {

    private static OrderDAO orderDAO;

    @BeforeAll
    static void setUpBeforeClass() {
        orderDAO = new OrderDAO();
    }

    @AfterAll
    static void tearDownAfterClass() {
        orderDAO.close();
    }

    @Test
    final void testCreateProductOrder() {
        ProductOrder order = new ProductOrder();
        Customer customer = new Customer();
        customer.setCustomerId(2);

        order.setCustomer(customer);
        order.setRecipientFirstName("Thanh Phuong");
        order.setRecipientLastName("Nguyen");
        order.setRecipientPhone("123456789");
        order.setRecipientAddressLine1("373 Ly Thuong Kiet");
        order.setRecipientAddressLine2("1A Vo Van Ngan");
        order.setRecipientCity("Ho Chi Minh");
        order.setRecipientState("Ho Chi Minh");
        order.setRecipientZipCode("700000");
        order.setRecipientCountry("US");
        order.setPaymentMethod("Cash on delivery");

        Set<OrderDetail> orderDetails = new HashSet<>();
        OrderDetail orderDetail = new OrderDetail();

        Product product = new Product(5);
        orderDetail.setProduct(product);
        orderDetail.setQuantity(2);
        orderDetail.setSubtotal(268.0f);
        orderDetail.setProductOrder(order);

        orderDetails.add(orderDetail);

        order.setOrderDetails(orderDetails);
        order.setTax(26.8f);
        order.setShippingFee(5.0f);
        order.setSubtotal(268.0f);
        order.setTotal(299.8f);

        orderDAO.create(order);

        assertTrue(order.getOrderId() > 0);
    }

    @Test
    final void testCreateProductOrder2() {
        ProductOrder order = new ProductOrder();
        Customer customer = new Customer();
        customer.setCustomerId(1);

        order.setCustomer(customer);
        order.setRecipientFirstName("Nam");
        order.setRecipientLastName("Ha Minh");
        order.setRecipientPhone("123456789");
        order.setRecipientAddressLine1("53 Ngo Tat To");
        order.setRecipientAddressLine2("25 Huynh Thuc Khang");
        order.setRecipientCity("Ho Chi Minh");
        order.setRecipientState("Ho Chi Minh");
        order.setRecipientZipCode("700000");
        order.setRecipientCountry("VN");
        order.setPaymentMethod("Paypal or Credit card");

        Set<OrderDetail> orderDetails = new HashSet<>();
        OrderDetail orderDetail1 = new OrderDetail();

        Product product1 = new Product(1);
        orderDetail1.setProduct(product1);
        orderDetail1.setQuantity(2);
        orderDetail1.setSubtotal(50.5f);
        orderDetail1.setProductOrder(order);

        orderDetails.add(orderDetail1);

        Product product2 = new Product(5);
        OrderDetail orderDetail2 = new OrderDetail();
        orderDetail2.setProduct(product2);
        orderDetail2.setQuantity(1);
        orderDetail2.setSubtotal(40f);
        orderDetail2.setProductOrder(order);

        orderDetails.add(orderDetail2);

        order.setOrderDetails(orderDetails);

        orderDAO.create(order);

        assertTrue(order.getOrderId() > 0 && order.getOrderDetails().size() == 2);
    }

    @Test
    final void testUpdateProductOrderShippingAddress() {
        Integer orderId = 2;
        ProductOrder order = orderDAO.get(orderId);
        order.setRecipientAddressLine1("New Shipping Address");

        orderDAO.update(order);

        ProductOrder updatedOrder = orderDAO.get(orderId);

        assertEquals(order.getRecipientAddressLine1(), updatedOrder.getRecipientAddressLine1());
    }

    @Test
    final void testUpdateBookOrderDetail() {
        Integer orderId = 1;
        ProductOrder order = orderDAO.get(orderId);

        Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();

        while (iterator.hasNext()) {
            OrderDetail orderDetail = iterator.next();
            if (orderDetail.getProduct().getProductId() == 5) {
                orderDetail.setQuantity(3);
                orderDetail.setSubtotal(804.0f);
            }
        }

        orderDAO.update(order);

        ProductOrder updatedOrder = orderDAO.get(orderId);

        iterator = updatedOrder.getOrderDetails().iterator();

        int expectedQuantity = 3;
        float expectedSubtotal = 804.0f;
        int actualQuantity = 0;
        float actualSubtotal = 0;

        while (iterator.hasNext()) {
            OrderDetail orderDetail = iterator.next();
            if (orderDetail.getProduct().getProductId() == 5) {
                actualQuantity = orderDetail.getQuantity();
                actualSubtotal = orderDetail.getSubtotal();
            }
        }

        assertEquals(expectedQuantity, actualQuantity);
        assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
    }

    @Test
    final void testGetOrder() {
        Integer orderId = 1;
        ProductOrder order = orderDAO.get(orderId);
        System.out.println(order.getRecipientFirstName());
        System.out.println(order.getRecipientLastName());
        System.out.println(order.getRecipientPhone());
        System.out.println(order.getRecipientAddressLine1());
        System.out.println(order.getRecipientAddressLine2());
        System.out.println(order.getRecipientCity());
        System.out.println(order.getRecipientState());
        System.out.println(order.getRecipientCountry());
        System.out.println(order.getRecipientZipCode());
        System.out.println(order.getStatus());
        System.out.println(order.getTax());
        System.out.println(order.getShippingFee());
        System.out.println(order.getSubtotal());
        System.out.println(order.getTotal());
        System.out.println(order.getPaymentMethod());

        assertEquals(1, order.getOrderDetails().size());
    }

    @Test
    final void testDeleteOrder() {
        int orderId = 3;
        orderDAO.delete(orderId);
        ProductOrder order = orderDAO.get(orderId);

        assertNull(order);
    }

    @Test
    final void testListAll() {
        List<ProductOrder> listOrder = orderDAO.listAll();
        for (ProductOrder order : listOrder) {
            System.out.printf("%s - %s - %s - %s%n", order.getOrderId(), order.getCustomer().getFullName(),
                    order.getTotal(), order.getStatus());
            for (OrderDetail detail : order.getOrderDetails()) {
                Product product = detail.getProduct();
                int quantity = detail.getQuantity();
                float subtotal = detail.getSubtotal();
                System.out.printf("\t %s - %s - %s%n", product.getTitle(), quantity, subtotal);
            }
        }

        assertTrue(listOrder.size() > 0);
    }

    @Test
    final void testCount() {
        long totalOrders = orderDAO.count();

        assertEquals(1, totalOrders);
    }

    @Test
    final void testListByCustomerHaveOrders() {
        Integer customerId = 1;
        List<ProductOrder> listOrder = orderDAO.listByCustomer(customerId);

        assertTrue(listOrder.size() > 0);
    }

    @Test
    final void testListByCustomerNoOrders() {
        Integer customerId = 99;
        List<ProductOrder> listOrder = orderDAO.listByCustomer(customerId);

        assertTrue(listOrder.isEmpty());
    }

    @Test
    final void testGetByIdAndCustomerNull() {
        Integer orderId = 1;
        Integer customerId = 99;
        ProductOrder order = orderDAO.get(orderId, customerId);

        assertNull(order);
    }

    @Test
    public void testGetByIdAndCustomerNotNull() {
        Integer orderId = 1;
        Integer customerId = 1;
        ProductOrder order = orderDAO.get(orderId, customerId);

        assertNotNull(order);
    }

    @Test
    final void testListMostRecentSales() {
        List<ProductOrder> recentOrders = orderDAO.listMostRecentSales();

        assertTrue(recentOrders.size() > 0);
    }

    @Test
    final void testCountOrderDetailByProductNotFound() {
        int productId = 100;
        long orderCount = orderDAO.countOrderDetailByProduct(productId);

        assertEquals(0, orderCount);
    }

    @Test
    final void testCountOrderDetailByProductFound() {
        int productId = 1;
        long orderCount = orderDAO.countOrderDetailByProduct(productId);

        assertEquals(2, orderCount);
    }

    @Test
    public void testCountByCustomerNotFound() {
        int customerId = 100;
        long orderCount = orderDAO.countByCustomer(customerId);

        assertEquals(0, orderCount);
    }

    @Test
    public void testCountByCustomerFound() {
        int customerId = 1;
        long orderCount = orderDAO.countByCustomer(customerId);

        assertEquals(4, orderCount);
    }

}
