<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="common.jsp" %>
    <link rel="stylesheet" href="shop/cssloginre/style.css">
    <title>Online Website</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="collections text-center ">
    <div class="main">
        <!-- Sign up form -->
        <section class="signup">
            <div class="container_sign">
                <div class="signup-content">
                    <div class="register-form">
                        <div>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <h3>${message}</h3>
                        </div>
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