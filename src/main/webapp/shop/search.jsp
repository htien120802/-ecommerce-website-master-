<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <title></title>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-lg-3 sidebar-filter">
            <h3 class="mt-5 mb-5">
                Search: <span class="primary-color">${keyword}</span>
            </h3>
        </div>

        <div class="col-md-8 col-lg-9">
            <section class="products">
                <div class="container">
                    <div class="row sorting mb-5">
                        <div class="col-12">
                            <div class="dropdown float-left"></div>
                            <div>
                                <a>${message}</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${result}" var="product">
                            <div class="col-md-6 col-lg-4 col-product">
                                <figure>
                                    <img class="rounded-corners img-fluid"
                                         src="data:image/jpg;base64,${product.base64Image}" alt="">
                                    <figcaption>
                                        <div class="thumb-overlay">
                                            <a href="view_product?id=${product.productId}" title="More Info">
                                                <i class="fas fa-search-plus"></i>
                                            </a>
                                        </div>
                                    </figcaption>
                                </figure>
                                <h4 class="mb-1">
                                    <a href="view_product?id=${product.productId}">${product.title}</a>
                                </h4>
                                <p>
                                    <span class="emphasis">$${product.price}</span>
                                </p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<div class="divider"></div>

<%@ include file="footer.jsp" %>

<!-- Placed at the end of the document so the pages load faster -->
<script src="shop/js/jquery-3.1.1.min.js"></script>
<script src="shop/bootstrap/js/bootstrap.min.js"></script>
<script src="shop/js/tether.min.js"></script>
<script>
    document.getElementById('${pageId}').style.color = "#c2ab87";
</script>
<script>
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
        $('html, body').animate({
            scrollTop: 0
        }, '300');
    });
</script>
</body>
</html>