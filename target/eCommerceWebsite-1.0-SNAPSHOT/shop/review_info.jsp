<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/css/jquery.rateyo.min.css">

    <script type="text/javascript" src="shop/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="shop/js/jquery.rateyo.min.js"></script>

    <title>Write Review - Online Store</title>
</head>
<body>
<%@ include file="header.jsp" %>

<h2 class="products text-center">You already wrote reviews for this product</h2>
<div class="container">
    <div class="row">
        <div class="col-md-6 text-center">
            <div class="product-image mt-3">
                <img class="img-fluid" src="data:image/jpg;base64,${product.base64Image}" alt=""/>
            </div>
        </div>
        <div class="col-md-6 mt-5 mt-md-2 text-center text-md-left">
            <h3>${product.title}</h3>
            <h4>Headline</h4>
            <p>${review.headline}</p>
            <h4>Details</h4>
            <p>${review.comment}</p>
            <a href="#" class="signup-image-link" onclick="history.go(-1);">Go back</a>
        </div>
    </div>
</div>
<h2 class="products text-center"></h2>

<%@ include file="footer.jsp" %>
<!-- Placed at the end of the document so the pages load faster -->
<script src="shop/js/list.min.js"></script>
<script src="shop/js/jquery-3.1.1.min.js"></script>
<script src="shop/bootstrap/js/bootstrap.min.js"></script>
<script src="shop/js/tether.min.js"></script>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#rateYo").rateYo({
            starWidth: "40px",
            fullStar: true,
            rating: ${review.rating},
            readOnly: true,
        });
    });
</script>
</html>