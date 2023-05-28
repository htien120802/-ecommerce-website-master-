<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/css/jquery.rateyo.min.css">

    <script type="text/javascript" src="shop/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="shop/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="shop/js/jquery.rateyo.min.js"></script>

    <title>${loggedCustomer.fullName} Reviews</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h2 class="products text-center">${loggedCustomer.fullName} Reviews</h2>
<form action="submit_review" method="post">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-center">
                <div class="product-image mt-3">
                    <img class="img-fluid" src="data:image/jpg;base64,${product.base64Image}" alt=""/>
                </div>
            </div>
            <div class="col-md-6 mt-5 mt-md-2 text-center text-md-left">
                <h2 class="mb-3 mt-0">${product.title}</h2>
                <p class="lead mt-2 mb-3 primary-color">
                <div id="rateYo"></div>
                <input type="hidden" id="rating" name="rating"/>
                <input type="hidden" name="productId" value="${product.productId}"/>
                <br>
                <input type="text" name="headline" size="60"
                       placeholder="Headline or summary for your review (required)" required="required"/>
                <textarea name="comment" cols="70" rows="10" placeholder="Write your review details..."
                          required="required"></textarea>
                <button class="btn btn-lg btn-outline-primary" type="submit">Submit</button>
                &nbsp;&nbsp;
                <button class="btn btn-lg btn-outline-primary" onclick="history.go(-1);">Cancel
                </button>
            </div>
        </div>
    </div>
</form>
<h2 class="products text-center"></h2>
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#rateYo").rateYo({
            starWidth: "40px",
            fullStar: true,
            onSet: function (rating, rateYoInstance) {
                $("#rating").val(rating);
            },
        });
    });
</script>
</html>