<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="common.jsp" %>
    <link rel="stylesheet" href="shop/css/style.css">
    <title>${loggedCustomer.fullName} - Order Detail</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section class="featured-block text-center">
    <div class="container">
        <c:if test="${order == null}">
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="mt-5 mb-2">You are not authorized to view this order</h2>
                </div>
            </div>
        </c:if>
        <c:if test="${order != null}">
            <div class="row">
                <div class="col-md-6 text-center">
                    <h2>Order Overview</h2>
                    <div align="center">
                        <table>
                            <tr>
                                <td><b>Ordered By: </b></td>
                                <td>${order.customer.fullName}</td>
                            </tr>
                            <tr>
                                <td><b>Order Status: </b></td>
                                <td>${order.status}</td>
                            </tr>
                            <tr>
                                <td><b>Order Date: </b></td>
                                <td>${order.orderDate}</td>
                            </tr>
                            <tr>
                                <td><b>Payment Method: </b></td>
                                <td>${order.paymentMethod}</td>
                            </tr>
                            <tr>
                                <td><b>Product Copies: </b></td>
                                <td>${order.productCopies}</td>
                            </tr>
                            <tr>
                                <td><b>Total Amount: </b></td>
                                <td>$${order.total}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-6 text-center">
                    <h2>Recipient Information</h2>
                    <div align="center">
                        <table>
                            <tr>
                                <td><b>First Name: </b></td>
                                <td>${order.recipientFullName}</td>
                            </tr>
                            <tr>
                                <td><b>Last Name: </b></td>
                                <td>${order.recipientLastName}</td>
                            </tr>
                            <tr>
                                <td><b>Phone: </b></td>
                                <td>${order.recipientPhone}</td>
                            </tr>
                            <tr>
                                <td><b>Address Line 1: </b></td>
                                <td>${order.recipientAddressLine1}</td>
                            </tr>
                            <tr>
                                <td><b>Address Line 2: </b></td>
                                <td>${order.recipientAddressLine2}</td>
                            </tr>
                            <tr>
                                <td><b>City: </b></td>
                                <td>${order.recipientCity}</td>
                            </tr>
                            <tr>
                                <td><b>State: </b></td>
                                <td>${order.recipientState}</td>
                            </tr>
                            <tr>
                                <td><b>Country: </b></td>
                                <td>${order.recipientCountryName}</td>
                            </tr>
                            <tr>
                                <td><b>Zip Code: </b></td>
                                <td>${order.recipientZipCode}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</section>
<div class="divider"></div>
<section class="cart text-center">
    <c:if test="${order != null}">
        <div class="container">
            <div class="text-center">
                <h2>Ordered Products</h2>
            </div>
            <div class="row">
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th style="width: 5%">Index</th>
                        <th style="width: 50%">Product Title</th>
                        <th style="width: 10%">Price</th>
                        <th style="width: 10%">Quantity</th>
                        <th style="width: 10%">Subtotal</th>
                        <th style="width: 15%">Help us reviews</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td data-th="Product">
                                <div class="row">
                                    <div class="col-md-3 text-left">
                                        <img style="vertical-align: middle;" src="data:image/jpg;base64,${orderDetail.product.base64Image}" width="48" height="64" alt=""/>
                                    </div>
                                    <div class="col-md-9 text-left mt-sm-2">
                                        <a href="view_product?id=${orderDetail.product.productId}"><h4>${orderDetail.product.title}</h4></a>
                                    </div>
                                </div>
                            </td>
                            <td>$${orderDetail.product.price}</td>
                            <td>${orderDetail.quantity}</td>
                            <td>$${orderDetail.subtotal}</td>
                            <th><a href="write_review?product_id=${orderDetail.product.productId}">Write reviews</a></th>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6" align="right">
                            <p>Subtotal: $${order.subtotal}</p>
                            <p>Tax: $${order.tax}</p>
                            <p>Shipping fee: $${order.shippingFee}</p>
                            <p>TOTAL: $${order.total}</p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>