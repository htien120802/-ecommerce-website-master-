<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="../assets/css/style_login_admin.css">

    <title>Admin Login</title>
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-in-container">
        <form action="login" method="post">
            <h1>Admin login</h1>
            <c:if test="${message != null}">
                <div align="center">
                    <h4>${message}</h4>
                </div>
            </c:if>
            <br>
            <input placeholder="Email" type="email" name="email" size="20" required="required" minlength="6"
                   maxlength="30">
            <input placeholder="Password" type="password" name="password" size="20" required="required" minlength="5"
                   maxlength="30">
            <br>
            <button type="submit">Sign In</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Ecommerce Website Administration</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>