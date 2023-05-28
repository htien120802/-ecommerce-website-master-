<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/cssloginre/style.css">

    <title>Register as a Customer</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center ">
    <div class="main">
        <section class="signup">
            <div class="container_sign">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>

                        <form method="post" action="register_customer" class="register-form" id="customerForm">
                            <div class="form-group">
                                <label><i
                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                    type="text" name="firstName"
                                    placeholder="Your first name." required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i
                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                    type="text" name="lastName"
                                    placeholder="Your last name." required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-email"></i></label> <input
                                    type="email" name="email" placeholder="Your email." required="required"
                                    maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label> <input
                                    type="password" name="password" id="password"
                                    placeholder="Your password."/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="confirmPassword" id="confirmPassword"
                                       placeholder="Comfirm your password."/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="phone" placeholder="Your phone number." required="required"
                                    maxlength="16"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="addressLine1" placeholder="Your address line 1"
                                    required="required" maxlength="128"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="addressLine2" placeholder="Your address line 2"
                                    required="required" maxlength="128"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="city" placeholder="Your city" required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="state" placeholder="Your city" required="required"
                                    maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label> <input
                                    type="text" name="zipCode" placeholder="Your zipcode" required="required"
                                    maxlength="16"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-phone"></i></label>
                                <select name="country">
                                    <c:forEach items="${mapCountries}" var="country">
                                        <option value="${country.value}"
                                                <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                    </c:forEach>
                                </select>
                            </div>


                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term"
                                       class="agree-term"/> <label for="agree-term"
                                                                   class="label-agree-term"><span><span></span></span>I
                                agree all statements in <a href="#" class="term-service">Terms
                                    of service</a></label>
                            </div>

                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup"
                                       class="form-submit" value="Register"/>
                            </div>

                        </form>
                    </div>

                    <div class="signup-image">
                        <figure>
                            <img src="shop/images/logo-store.jpg" alt="sing up image">
                        </figure>
                        <a href="login" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>

<%@ include file="footer.jsp" %>

<script src="shop/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="shop/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="shop/js/jquery.validate.min.js"></script>
<script src="shop/js/tether.min.js"></script>
<script src="shop/js/popper.min.js"></script>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#customerForm").validate({
            rules: {
                confirmPassword: {
                    equalTo: "#password"
                }
            },

            messages: {
                confirmPassword: {
                    equalTo: "Confirm password does not match your password."
                }
            }
        });
    });
</script>
</html>