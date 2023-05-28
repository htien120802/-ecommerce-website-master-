<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/css/style.css">

    <title>Payment Receipt</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section class="featured-block text-center">
    <div class="container">
        <div class="row">
            <div class="text-center col-md-12">
                <h1>Thank you for purchasing!</h1>
            </div>
            <div class="col-md-6 text-center">
                <h2>Seller Information</h2>
                <div align="center">
                    <table>
                        <tr>
                            <td><b>Email: </b></td>
                            <td>sales@onlinestore.com</td>
                        </tr>
                        <tr>
                            <td><b>Phone: </b></td>
                            <td>+1 123 456 789</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-6 text-center">
                <h2>Buyer Information</h2>
                <div align="center">
                    <table>
                        <tr>
                            <td><b>First Name: </b></td>
                            <td>${payer.firstName}</td>
                        </tr>
                        <tr>
                            <td><b>Last Name: </b></td>
                            <td>${payer.lastName}</td>
                        </tr>
                        <tr>
                            <td><b>Email: </b></td>
                            <td>${payer.email}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="divider"></div>
<section class="cart text-center">
    <div class="container">
        <div class="text-center">
            <h2>Order Details</h2>
            <p>Ordered by: ${loggedCustomer.fullName}</p>
            <p>${transaction.description}</p>
        </div>
        <div class="row">
            <table class="table table-condensed">
                <thead>
                <tr>
                    <th style="width: 5%">No.</th>
                    <th style="width: 50%">Name</th>
                    <th style="width: 10%">Quantity</th>
                    <th style="width: 10%">Price</th>
                    <th style="width: 25%">Subtotal</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${transaction.itemList.items}" var="item" varStatus="var">
                    <tr>
                        <td>${var.index + 1}</td>
                        <td>${item.name}</td>
                        <td>${item.quantity}</td>
                        <td>$${item.price}</td>
                        <td>$${item.price * item.quantity}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5" align="right">
                        <p>Subtotal: $${transaction.amount.details.subtotal}</p>
                        <p>Tax: $${transaction.amount.details.tax}</p>
                        <p>Shipping Fee: $${transaction.amount.details.shipping}</p>
                        <p>TOTAL: $${transaction.amount.total}</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div>
            <button class="btn btn-primary btn-lg pl-5 pr-5" onclick="javascript:showPrintReceiptPopup();">Print
                Receipt
            </button>
        </div>
    </div>
</section>
<%@ include file="footer.jsp" %>

<script>
    function showPrintReceiptPopup() {
        let width = 1080;
        let height = 720;
        let left = (screen.width - width) / 2;
        let top = (screen.height - height) / 2;

        window.open('shop/print_receipt.jsp', '_blank', 'width=' + width, ', height=' + height, ', top=' + top, ', left=' + left)
    }
</script>
</body>
</html>