<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
          content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, AdminWrap lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, AdminWrap lite design, AdminWrap lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
          content="AdminWrap Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>Order Detail - Administration</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/adminwrap-lite/"/>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../admin/images/favicon.png">
    <!-- Bootstrap Core CSS -->
    <link href="../admin/node_modules/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../admin/html/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="../admin/html/css/colors/default.css" id="theme" rel="stylesheet">
</head>
<body class="fix-header card-no-border fix-sidebar">
<%@ include file="header.jsp" %>
<%@ include file="slidebar.jsp" %>
<!--end of Navigation bar-->
<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="row page-titles">
            <div class="col-md-5 align-self-center">
                <h3 class="text-themecolor">Order detail</h3>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Order detail</li>
                </ol>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <!-- Row -->
        <div class="row">
            <!-- Column -->
            <div class="col-lg-4 col-xlg-3 col-md-5">
                <div class="card">
                    <div class="card-body">
                        <center class="mt-4"><img src="../assets/images/logo-store.jpg" class="img-circle"
                                                  width="150"/>
                            <h4 class="card-title mt-2">Venus Shop</h4>
                        </center>
                    </div>
                </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-lg-8 col-xlg-9 col-md-7">
                <div class="card">
                    <!-- Tab panes -->
                    <div class="card-body">
                        <h2 class="text-themecolor" style="text-align: center;">Order Overview</h2>
                        <div class="form-group">
                            <label class="col-md-12">Ordered By:</label>
                            <a style="text-align: center;"
                               class="form-control form-control-line">${order.customer.fullName}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Order Status:</label>
                            <a class="form-control form-control-line">${order.status}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Order Date:</label>
                            <a class="form-control form-control-line">${order.orderDate}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Payment Method:</label>
                            <a class="form-control form-control-line">${order.paymentMethod}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Product Copies:</label>
                            <a class="form-control form-control-line">${order.productCopies}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Total Amount:</label>
                            <a class="form-control form-control-line">$${order.total}</a>
                        </div>
                        <h2 class="text-themecolor" style="text-align: center;">Recipient Information</h2>
                        <div class="form-group">
                            <label class="col-md-12">First Name:</label>
                            <a class="form-control form-control-line">${order.recipientFullName}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Last Name:</label>
                            <a class="form-control form-control-line">${order.recipientLastName}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Phone:</label>
                            <a class="form-control form-control-line">${order.recipientPhone}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Address Line 1:</label>
                            <a class="form-control form-control-line">${order.recipientAddressLine1}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Address Line 2:</label>
                            <a class="form-control form-control-line">${order.recipientAddressLine2}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">City:</label>
                            <a class="form-control form-control-line">${order.recipientCity}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">State:</label>
                            <a class="form-control form-control-line">${order.recipientState}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Country:</label>
                            <a class="form-control form-control-line">${order.recipientCountryName}</a>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Zip Code:</label>
                            <a class="form-control form-control-line">${order.recipientZipCode}</a>
                        </div>
                        <h2 class="text-themecolor" style="text-align: center;">Ordered Products</h2>
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>Index</th>
                                            <th>Product Title</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Subtotal</th>
                                        </tr>
                                        </thead>
                                        <tbody class="list">
                                        <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>
                                                    <img style="vertical-align: middle;"
                                                         src="data:image/jpg;base64,${orderDetail.product.base64Image}"
                                                         width="48" height="64"/>
                                                        ${orderDetail.product.title}
                                                </td>
                                                <td>$${orderDetail.product.price}</td>
                                                <td>${orderDetail.quantity}</td>
                                                <td>$${orderDetail.subtotal}</td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="5" align="right">
                                                <p>Subtotal: $${order.subtotal}</p>
                                                <p>Tax: $${order.tax}</p>
                                                <p>Shipping fee: $${order.shippingFee}</p>
                                                <p>TOTAL: $${order.total}</p>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <a class="btn btn-success" href="edit_order?id=${order.orderId}">Edit this Order</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn waves-effect waves-light btn btn-info hidden-sm-down text-white"
                                        type="button" onclick="delete_order(${order.orderId})">Delete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Column -->
        </div>
        <!-- Row -->
        <!-- ============================================================== -->
        <!-- End PAge Content -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <footer class="footer"> © 2021 Adminwrap by <a href="https://www.wrappixel.com/">wrappixel.com</a></footer>
    <!-- ============================================================== -->
    <!-- End footer -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="../admin/node_modules/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="../admin/node_modules/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- slim scrollbar scrollbar JavaScript -->
<script src="../admin/html/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="../admin/html/js/waves.js"></script>
<!--Menu sidebar -->
<script src="../admin/html/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="../admin/html/js/custom.min.js"></script>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/richtext.min.css">

<script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>

<script type="text/javascript" src="../assets/js/jquery.richtext.min.js"></script>
<script>
    function delete_order(id) {
        let orderId = id;
        if (confirm('Are you sure you want to delete the order with ID ' + orderId + '?')) {
            window.location = 'delete_order?id=' + orderId;
        }
    }
</script>
</body>
</html>