<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
    <title>Edit Order - Administration</title>

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
                <h3 class="text-themecolor">Edit Order</h3>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Edit Order</li>
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
                        <form action="update_order" method="post">
                            <h2 class="text-themecolor" style="text-align: center;">Order Overview</h2>
                            <div class="form-group">
                                <label class="col-md-12">Ordered By:&nbsp;&nbsp;&nbsp;<a
                                        class="form-control form-control-line">${order.customer.fullName}</a></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Order Date:&nbsp;&nbsp;&nbsp;<a
                                        class="form-control form-control-line">${order.orderDate}</a></label>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Payment Method:</label>
                                <div class="col-md-12">
                                    <select class="form-control form-control-line" name="paymentMethod">
                                        <option value="Cash On Delivery"
                                                <c:if test="${order.paymentMethod eq 'Cash on Delivery'}">selected="selected"</c:if>>
                                            Cash On Delivery
                                        </option>
                                        <option value="Paypal"
                                                <c:if test="${order.paymentMethod eq 'Paypal'}">selected="selected"</c:if>>
                                            Paypal or Credit card
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Order Status:</label>
                                <div class="col-md-12">
                                    <select class="form-control form-control-line" name="orderStatus">
                                        <option value="Processing"
                                                <c:if test="${order.status eq 'Processing'}">selected='selected'</c:if> >
                                            Processing
                                        </option>
                                        <option value="Shipping"
                                                <c:if test="${order.status eq 'Shipping'}">selected='selected'</c:if>>
                                            Shipping
                                        </option>
                                        <option value="Delivered"
                                                <c:if test="${order.status eq 'Delivered'}">selected='selected'</c:if>>
                                            Delivered
                                        </option>
                                        <option value="Completed"
                                                <c:if test="${order.status eq 'Completed'}">selected='selected'</c:if>>
                                            Completed
                                        </option>
                                        <option value="Cancelled"
                                                <c:if test="${order.status eq 'Cancelled'}">selected='selected'</c:if>>
                                            Cancelled
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <h2 class="text-themecolor" style="text-align: center;">Recipient Information</h2>
                            <div class="form-group">
                                <label class="col-md-12">First Name:</label>
                                <div class="col-md-12">
                                    <input class="form-control form-control-line" type="text" name="recipientFirstName"
                                           value="${order.recipientFirstName}" size="45" required="required"
                                           maxlength="32"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Last Name:</label>
                                <div class="col-md-12">
                                    <input class="form-control form-control-line" type="text" name="recipientLastName"
                                           value="${order.recipientLastName}" size="45" required="required"
                                           maxlength="32"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Phone:</label>
                                <div class="col-md-12">
                                    <input class="form-control form-control-line" type="number" name="recipientPhone"
                                           value="${order.recipientPhone}" size="45" required="required"
                                           maxlength="16"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Address Line 1:</label>
                                <div class="col-md-12">
                                    <input class="form-control form-control-line" type="text"
                                           name="recipientAddressLine1" value="${order.recipientAddressLine1}" size="45"
                                           required="required" maxlength="128"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Address Line 2:</label>
                                <div class="col-md-12">
                                    <input class="form-control form-control-line" type="text"
                                           name="recipientAddressLine2" value="${order.recipientAddressLine2}" size="45"
                                           required="required" maxlength="128"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">City:</label>
                                <div class="col-md-12">
                                    <input class="form-control form-control-line" type="text" name="recipientCity"
                                           value="${order.recipientCity}" size="45" required="required" maxlength="32"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">State:</label>
                                <div class="col-md-12">
                                    <input class="form-control form-control-line" type="text" name="recipientState"
                                           value="${order.recipientState}" size="45" required="required"
                                           maxlength="32"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">ZipCode:</label>
                                <div class="col-md-12">
                                    <input class="form-control form-control-line" type="number" name="recipientZipCode"
                                           value="${order.recipientZipCode}" size="45" required="required"
                                           maxlength="16"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Country:</label>
                                <div class="col-md-12">
                                    <select class="form-control form-control-line" name="recipientCountry"
                                            required="required">
                                        <c:forEach items="${mapCountries}" var="country">
                                            <option value="${country.value}"
                                                    <c:if test="${order.recipientCountry eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                        </c:forEach>
                                    </select>
                                </div>
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
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody class="list">
                                            <c:forEach items="${order.orderDetails}" var="orderDetail"
                                                       varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td>${orderDetail.product.title}</td>
                                                    <td>
                                                        <input type="hidden" name="price"
                                                               value="${orderDetail.product.price}"/>$${orderDetail.product.price}
                                                    </td>
                                                    <td>
                                                        <input type="hidden" name="productId"
                                                               value="${orderDetail.product.productId}"/>
                                                        <input type="number" name="quantity${status.index + 1}"
                                                               value="${orderDetail.quantity}" size="5" min="1" step="1"
                                                               required="required"/>
                                                    </td>

                                                    <td>$${orderDetail.subtotal}</td>
                                                    <td><a href="remove_from_order?id=${orderDetail.product.productId}">Remove</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td colspan="5" align="right">
                                                    <p>Subtotal: $${order.subtotal}</p>
                                                    <p>Tax: <input type="number" size="5" name="tax"
                                                                   value="${order.tax}" min="0.0" step="0.1"/></p>
                                                    <p>Shipping fee: <input type="number" size="5" name="shippingFee"
                                                                            value="${order.shippingFee}" min="0.0"
                                                                            step="0.1"/></p>
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
                                    <a class="btn btn-success" href="javascript:showAddProductPopup()"><b>Add
                                        Product</b></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input class="btn btn-success" type="submit" value="Save"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input class="btn btn-success" type="button" value="Cancel"
                                           onclick="javascript:window.location.href='list_order';"/>
                                </div>
                            </div>
                        </form>
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
<!-- slim-scrollbar scrollbar JavaScript -->
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
</body>
<script>
    function showAddProductPopup() {
        let width = 600;
        let height = 250;
        let left = (screen.width - width) / 2;
        let top = (screen.height - height) / 2;

        window.open('add_product_form', '_blank', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
    }
</script>
</html>