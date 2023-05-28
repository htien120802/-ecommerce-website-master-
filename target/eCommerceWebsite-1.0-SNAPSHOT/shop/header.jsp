<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a id="btn-backtop"></a>
<section class="header text-center">
    <nav class="navbar navbar-expand-lg navbar-light navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><i
                    class="fas fa-shopping-bag primary-color mr-1"></i> Venus</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbar-1" aria-controls="navbar-1"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div
                    class="collapse navbar-collapse pull-xs-right justify-content-end"
                    id="navbar-1">
                <ul class="navbar-nav mt-2 mt-md-0">
                    <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/">Home
                    </a></li>
                    <li class="nav-item active"><a class="nav-link" href="view_all">Shop
                    </a></li>
                    <li class="nav-item dropdown mega-menu"><a
                            class="nav-link dropdown-toggle" href="#"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Category</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <div class="container">
                                <div class="divider"></div>
                                <div class="row">
                                    <c:forEach var="category" items="${listCategory}">
                                        <div class="col-md-2">
                                            <a href="view_category?id=${category.categoryId}" style="color: black">
                                                <h6 class="text-uppercase">${category.name}</h6></a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Pages </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/">Homepage</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="view_cart">Cart</a>
                        </div>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="show_contact">Contact</a></li>

                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="fas fa-solid fa-user"></i>
                    </a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:if test="${loggedCustomer == null}">
                                <a href="login" class="dropdown-item">Login</a>
                                <div class="dropdown-divider"></div>
                                <a href="register" class="dropdown-item">Register</a>
                            </c:if>

                            <c:if test="${loggedCustomer != null}">
                                <a href="view_profile" class="dropdown-item">Welcome,
                                        ${loggedCustomer.fullName}</a>
                                <div class="dropdown-divider"></div>
                                <a href="view_order" class="dropdown-item">My Orders</a>
                                <div class="dropdown-divider"></div>
                                <a href="logout" class="dropdown-item">Logout</a>
                            </c:if>
                        </div>
                    </li>

                    <c:set var="cart" value="${sessionScope['cart']}"/>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#"
                           role="button" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false"><i class="fas fa-shopping-cart"></i> <span
                                class="badge badge-pill badge-primary">${cart.totalItems}</span></a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-cart"
                             aria-labelledby="navbarDropdown">
                            <h6>${cart.totalItems}
                                Items <span class="emphasis">${cart.totalItems}</span>
                            </h6>
                            <div class="dropdown-divider"></div>
                            <ul class="shopping-cart-items">
                                <c:forEach items="${cart.items}" var="item">
                                    <li class="row">
                                        <div class="col-3">
                                            <img src="data:image/jpg;base64,${item.key.base64Image}" width="60" alt="">
                                        </div>
                                        <div class="col-9">
                                            <h6>
                                                <a href="#">${item.key.title}</a>
                                            </h6>
                                            <span class="text-muted">${item.value}</span> <span
                                                class="emphasis">$${item.key.price}</span>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>

                            <a href="view_cart" class="btn btn-lg btn-full-width btn-primary"
                               style="margin: 0;">View Cart</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <form action="search" method="post">
                            <div class="flexbox">
                                <div class="search">
                                    <div>
                                        <input type="text" name="keyword" placeholder="Search . . .">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</section>
