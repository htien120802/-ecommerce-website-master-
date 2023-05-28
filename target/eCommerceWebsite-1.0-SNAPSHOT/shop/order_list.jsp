<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="common.jsp" %>
    <link rel="stylesheet" href="shop/css/style.css">
    <title>${loggedCustomer.fullName} - Order History</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section class="cart text-center">
    <div class="container">
        <c:if test="${fn:length(listOrder) == 0}">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="mt-5 mb-2">You have not placed any order</h2>
                </div>
            </div>
        </c:if>
        <c:if test="${fn:length(listOrder) > 0}">
            <h2 class="mt-5 mb-2">${loggedCustomer.fullName} - Order History</h2>
            <table class="table table-condensed">
                <thead>
                <tr>
                    <th style="width: 5%">Index</th>
                    <th style="width: 10%">Order ID</th>
                    <th style="width: 10%">Quantity</th>
                    <th style="width: 15%">Total Amount</th>
                    <th style="width: 30%">Order Date</th>
                    <th style="width: 15%">Status</th>
                    <th style="width: 15%">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${listOrder}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${order.orderId}</td>
                        <td>${order.productCopies}</td>
                        <td data-th="Price">$${order.total}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.status}</td>
                        <td><a href="show_order_detail?id=${order.orderId}">View Detail</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>