<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>Print Receipt</title>
</head>
<body onload="window.print();">
<div>
    <div>
        <div align="center">
            <h2 style="text-transform:uppercase;">Your Payment Receipt</h2>
        </div>
        <div>
            <h2 style="text-transform:uppercase;">Seller Information</h2>
            <div>
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
        <div>
            <h2 style="text-transform:uppercase;">Buyer Information</h2>
            <div>
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
<div>
    <div>
        <h2 style="text-transform:uppercase;">Order Details</h2>
        <p>Ordered by ${loggedCustomer.fullName}</p>
        <p>${transaction.description}</p>
    </div>
    <div>
        <table>
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
</div>
</body>
</html>
