<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <title>${product.title}- Online Store</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="featured-block text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-center">
                <div class="product-image mt-3">
                    <img class="img-fluid"
                         src="data:image/jpg;base64,${product.base64Image}" alt="">
                </div>
            </div>

            <div class="col-md-6 mt-5 mt-md-2 text-center text-md-left">
                <h2 class="mb-3 mt-0">${product.title}</h2>
                <p class="lead mt-2 mb-3 primary-color">
                    <jsp:directive.include file="product_rating.jsp"/>&nbsp;&nbsp;
                    <a href="#reviews">${fn:length(product.reviews)} Review(s)</a></p>
                <p class="lead mt-2 mb-3 primary-color">$${product.price}</p>
                <p>${product.description}</p>
                <a href="#" type="button" id="buttonAddToCart" class="btn btn-full-width btn-lg btn-outline-primary">Add
                    to cart</a></div>
        </div>
    </div>
</section>
<div class="divider"></div>

<div class="container">
    <h3 class="products text-center"><a href="#" id="reviews">Customer Reviews</a></h3>
    <table>
        <tr>
            <td colspan="3" align="left">
                <table class="normal">
                    <c:forEach items="${product.reviews}" var="review">
                        <tr>
                            <td>
                                <c:forTokens items="${review.stars}" delims="," var="star">
                                    <c:if test="${star eq 'on'}">
                                        <img src="shop/images/rating_on.png" alt=""/>
                                    </c:if>
                                    <c:if test="${star eq 'off'}">
                                        <img src="shop/images/rating_off.png" alt=""/>
                                    </c:if>
                                </c:forTokens>
                                - <b>${review.headline}</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                by ${review.customer.fullName} on ${review.reviewTime}
                            </td>
                        </tr>
                        <tr>
                            <td><i>${review.comment}</i></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
    <div class="text-center">
        <c:if test="${unlockReview == true}">
            <button class="btn btn-lg btn-outline-primary" id="buttonWriteReview">Write reviews</button>
        </c:if>
    </div>
</div>
<div class="divider"></div>

<section class="products text-center">
    <div class="container">
        <h3 class="mb-4">Related Products</h3>
        <div class="row">
            <c:forEach items="${listProducts}" var="product" begin="0" end="3">
                <div class="col-sm-6 col-md-3 col-product">
                    <figure>
                        <img class="rounded-corners img-fluid" src="data:image/jpg;base64,${product.base64Image}"
                             width="240" height="240" alt="">
                        <figcaption>
                            <div class="thumb-overlay"><a href="view_product?id=${product.productId}" title="More Info">
                                <i class="fas fa-search-plus"></i>
                            </a></div>
                        </figcaption>
                    </figure>
                    <h4><a href="view_product?id=${product.productId}">${product.title}</a></h4>
                    <p><span class="emphasis">$${product.price}</span></p>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

<script src="shop/js/jquery-3.1.1.min.js"></script>
<script src="shop/bootstrap/js/bootstrap.min.js"></script>
<script src="shop/js/tether.min.js"></script>
<script type="text/javascript">
    const thumbs = document.querySelector(".product-thumbnails").children;

    function changeImage(event) {
        document.querySelector(".img-fluid").src = event.children[0].src

        for (let i = 0; i < thumbs.length; i++) {
            thumbs[i].classList.remove("active");
        }
        event.classList.add("active");
    }
</script>
<script type="text/javascript">
    let btn = $('#btn-backtop');
    $(window).scroll(function () {
        if ($(window).scrollTop() > 300) {
            btn.addClass('show');
        } else {
            btn.removeClass('show');
        }
    });

    btn.on('click', function (e) {
        e.preventDefault();
        $('html, body').animate({scrollTop: 0}, '300');
    });
</script>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#buttonWriteReview").click(function () {
            window.location = 'write_review?product_id=' + ${product.productId};
        });

        $("#buttonAddToCart").click(function () {
            window.location = 'add_to_cart?product_id=' + ${product.productId};
        });
    });
</script>
</html>