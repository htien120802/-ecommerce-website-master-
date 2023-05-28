<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <%@ include file="common.jsp" %>

    <link rel="stylesheet" href="shop/css/style.css">

    <title>All Products</title>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-lg-3 sidebar-filter">
            <h3 class="mt-5 mb-5">
                <span class="primary-color"></span> Showing Products
            </h3>

            <p class="text-uppercase"><a style="color: #444342" href="view_all">Shop All</a></p>

            <p class="text-uppercase">Categories</p>

            <c:forEach items="${listCategories}" var="category">
                <div class="filter-checkbox">
                    <a id="${category.name}" style="color: #444342"
                       href="view_category?id=${category.categoryId}">${category.name}</a>
                </div>
            </c:forEach>

            <p class="text-uppercase">Rating</p>

            <div class="filter-checkbox">
                <a href="view_all?sort=${'4.5'}" style="color: #444342">
                    <c:forTokens items="${'on,on,on,on,half'}" delims="," var="star">
                        <%@ include file="rating_stars.jsp" %>
                    </c:forTokens>
                    &nbsp;4.5 & up (${rating4_5})
                </a>
            </div>
            <div class="filter-checkbox">
                <a href="view_all?sort=${'4.0'}" style="color: #444342">
                    <c:forTokens items="${'on,on,on,on,off'}" delims="," var="star">
                        <%@ include file="rating_stars.jsp" %>
                    </c:forTokens>
                    &nbsp;4.0 & up (${rating4})
                </a>
            </div>
            <div class="filter-checkbox">
                <a href="view_all?sort=${'3.5'}" style="color: #444342">
                    <c:forTokens items="${'on,on,on,half,off'}" delims="," var="star">
                        <%@ include file="rating_stars.jsp" %>
                    </c:forTokens>
                    &nbsp;3.5 & up (${rating3_5})
                </a>
            </div>
            <div class="filter-checkbox">
                <a href="view_all?sort=${'3.0'}" style="color: #444342">
                    <c:forTokens items="${'on,on,on,off,off'}" delims="," var="star">
                        <%@ include file="rating_stars.jsp" %>
                    </c:forTokens>
                    &nbsp;3.0 & up (${rating3})
                </a>
            </div>
        </div>

        <div class="col-md-8 col-lg-9">
            <section class="products">
                <div class="container">
                    <div class="row sorting mb-5">
                        <div class="col-12">
                            <div class="dropdown float-left">
                                <label class="mr-2">Sort by:</label> <a
                                    class="btn btn-lg btn-white dropdown-toggle"
                                    data-toggle="dropdown" role="button" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">Relevance <span
                                    class="caret"></span></a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item"
                                       href="view_all?sort=${'price_desc'}">Price
                                        Descending</a>
                                    <a class="dropdown-item"
                                       href="view_all?sort=${'price_asc'}">Price
                                        Ascending</a>
                                    <a class="dropdown-item"
                                       href="view_all?sort=${'newest'}">Newest</a>
                                    <a class="dropdown-item"
                                       href="view_all?sort=${'best_selling'}">Best
                                        Selling</a>
                                    <a class="dropdown-item"
                                       href="view_all?sort=${'most_favored'}">Most
                                        Favored</a>
                                </div>
                            </div>

                            <div class="btn-group float-right ml-3">
                                <c:forEach begin="1" end="${numberOfPages}" var="i">
                                    <a id="${i}" style="color: #444342"
                                       href="view_all?sort=${sort}&page=${i}">&nbsp${i}&nbsp</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <c:forEach items="${listProducts}" var="product"
                                   begin="${numBegin}" end="${numEnd}">
                            <div class="col-md-6 col-lg-4 col-product list">
                                <figure>
                                    <img class="rounded-corners img-fluid"
                                         src="data:image/jpg;base64,${product.base64Image}" alt="">
                                    <figcaption>
                                        <div class="thumb-overlay">
                                            <a href="view_product?id=${product.productId}"
                                               title="More Info"> <i class="fas fa-search-plus"></i>
                                            </a>
                                        </div>
                                    </figcaption>
                                </figure>
                                <h4 class="mb-1">
                                    <a href="view_product?id=${product.productId}">${product.title}</a>
                                </h4>
                                <div>
                                    <%@ include file="product_rating.jsp" %>
                                </div>
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

<%@ include file="footer.jsp" %>

<!-- Placed at the end of the document so the pages load faster -->
<script src="shop/js/list.min.js"></script>
<script src="shop/js/jquery-3.1.1.min.js"></script>
<script src="shop/bootstrap/js/bootstrap.min.js"></script>
<script src="shop/js/tether.min.js"></script>
<script>
    document.getElementById('${category.name}').style.color = "#c2ab87";
</script>
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
