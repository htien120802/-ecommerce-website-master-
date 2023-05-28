<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/cssloginre/style.css">

    <script type="text/javascript" src="shop/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="shop/js/jquery.validate.min.js"></script>

    <title>Edit Customer Profile</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center ">
    <div class="main">

        <section class="signup">
            <div class="container_sign">
                <div class="signup-content">
                    <div class="signup-form">
                        <h5 class="form-title">Edit My Profile</h5>

                        <form method="post" action="update_profile" class="register-form" id="customerForm">
                            <div class="form-group">
                                <label><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="firstName" placeholder="Your first name."
                                       value="${loggedCustomer.firstName}" required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="lastName" placeholder="Your first name."
                                       value="${loggedCustomer.lastName}" required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" placeholder="Your email." readonly="readonly"
                                       value="${loggedCustomer.email}"/>
                                <i>Email cannot be changed</i>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <input type="number" name="phone" placeholder="Your phone number."
                                       value="${loggedCustomer.phone}" required="required" maxlength="16"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="addressLine1" placeholder="Your Address Line 1."
                                       value="${loggedCustomer.addressLine1}" required="required" maxlength="128"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="addressLine2" placeholder="Your Address Line 2."
                                       value="${loggedCustomer.addressLine2}" required="required" maxlength="128"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="city" placeholder="Your city." value="${loggedCustomer.city}"
                                       required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label for="state"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="state" id="state" placeholder="Your city."
                                       value="${loggedCustomer.state}"
                                       required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <label for="zipCode"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="zipCode" id="zipCode" placeholder="Your zip code."
                                       value="${loggedCustomer.zipCode}"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label>
                                <select name="country">
                                    <c:forEach items="${mapCountries}" var="country">
                                        <option value="${country.value}"
                                                <c:if test="${loggedCustomer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <i>Leave blank if you don't want to change it.</i>
                            </div>

                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="Your password."/>
                            </div>

                            <div class="form-group">
                                <label for="confirmPassword"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="confirmPassword" id="confirmPassword"
                                       placeholder="Comfirm your password."/>
                            </div>

                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Confirm"/>
                            </div>

                        </form>
                    </div>

                    <div class="signup-image">
                        <figure>
                            <img src="shop/images/logo-store.jpg" alt="sing up image">
                        </figure>
                        <a href="view_profile" class="signup-image-link">Go back</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>

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
                    equalTo: "Confirm password does not match."
                }
            }
        });
    });
</script>
<%@ include file="footer.jsp" %>
</body>
</html>