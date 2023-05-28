<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/cssloginre/style.css">

    <title>Customer Login</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center">
    <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container_sign">
                <div class="signin-content">
                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>

                        <c:if test="${message != null}">
                            <div class="form-group">
                                <h6>${message}</h6>
                            </div>
                        </c:if>

                        <form method="post" action="login" class="register-form">

                            <div class="form-group">
                                <label><i
                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                    type="email" name="email" placeholder="Your email"
                                    required="required" maxlength="64"/>
                            </div>

                            <div class="form-group">
                                <label><i class="zmdi zmdi-lock"></i></label> <input
                                    type="password" name="password" placeholder="Your password"
                                    required="required" maxlength="32"/>
                            </div>

                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me"
                                       class="agree-term"/> <label for="remember-me"
                                                                   class="label-agree-term"><span><span></span></span>Remember
                                me</label>
                            </div>

                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin"
                                       class="form-submit" value="Log in"/>
                            </div>

                        </form>

                    </div>

                    <div class="signin-image">
                        <figure>
                            <img src="shop/images/logo-store.jpg" alt="sing up image">
                        </figure>
                        <a href="register">Create an account</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>

<%@ include file="footer.jsp" %>

</body>
<!-- Placed at the end of the document so the pages load faster -->
<script src="shop/js/jquery-3.3.1.min.js"></script>
<script src="shop/bootstrap/js/bootstrap.min.js"></script>
<script src="shop/js/tether.min.js"></script>
</html>