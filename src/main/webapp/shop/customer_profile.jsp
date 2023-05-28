<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/cssloginre/style.css">
    
    <title>Customer Profile - Online Store</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center ">
    <div class="main">
        <section class="signup">
            <div class="container_sign">
                <div class="signup-content">
                    <div class="signup-form">
                        <h6 class="form-title">Welcome, ${loggedCustomer.fullName}</h6>

                        <table class="form-group" style="border: 0">
                            <tr>
                                <td><b>Email Address:</b></td>
                                <td>${loggedCustomer.email}</td>
                            </tr>
                            <tr>
                                <td><b>First Name:</b></td>
                                <td>${loggedCustomer.firstName}</td>
                            </tr>
                            <tr>
                                <td><b>Last Name:</b></td>
                                <td>${loggedCustomer.lastName}</td>
                            </tr>
                            <tr>
                                <td><b>Phone Number:</b></td>
                                <td>${loggedCustomer.phone}</td>
                            </tr>
                            <tr>
                                <td><b>Address Line 1:</b></td>
                                <td>${loggedCustomer.addressLine1}</td>
                            </tr>
                            <tr>
                                <td><b>Address Line 2:</b></td>
                                <td>${loggedCustomer.addressLine2}</td>
                            </tr>
                            <tr>
                                <td><b>City:</b></td>
                                <td>${loggedCustomer.city}</td>
                            </tr>
                            <tr>
                                <td><b>State:</b></td>
                                <td>${loggedCustomer.state}</td>
                            </tr>
                            <tr>
                                <td><b>Zip Code:</b></td>
                                <td>${loggedCustomer.zipCode}</td>
                            </tr>
                            <tr>
                                <td><b>Country:</b></td>
                                <td>${loggedCustomer.countryName}</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><a href="edit_profile">Edit My Profile</a></td>
                            </tr>
                        </table>
                    </div>

                    <div class="signup-image">
                        <figure>
                            <img src="shop/images/logo-store.jpg" alt="">
                        </figure>
                        <a href="${pageContext.request.contextPath}/">Continue Shopping</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>