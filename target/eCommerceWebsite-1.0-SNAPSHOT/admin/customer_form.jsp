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
    <title>
        <c:if test="${customer != null}">Edit Customer - Administration</c:if>
        <c:if test="${customer == null}">Create Customer - Administration</c:if>
    </title>
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
                <h3 class="text-themecolor">Customer</h3>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Customer</li>
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
                                                  width="150" alt=""/>
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
                        <c:if test="${customer != null}">
                            <form action="update_customer" method="post">
                                <input type="hidden" name="customerId" value="${customer.customerId}">
                                <div class="form-group">
                                    <label class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="email" name="email"
                                               size="45" value="${customer.email}" required="required" maxlength="64"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">First Name</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="firstName"
                                               size="45" value="${customer.firstName}" required="required"
                                               maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Last Name</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="lastName"
                                               size="45" value="${customer.lastName}" required="required"
                                               maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Password</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="hidden"
                                               name="checkPassword" size="45" value="password"
                                               required="required" maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Phone Number</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="phone" size="45"
                                               value="${customer.phone}" required="required" maxlength="16"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Address Line1</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="addressLine1"
                                               size="45" value="${customer.addressLine1}" required="required"
                                               maxlength="128"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Address Line2</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="addressLine2"
                                               size="45" value="${customer.addressLine2}" required="required"
                                               maxlength="128"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">City</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="city" size="45"
                                               value="${customer.city}" required="required" maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">State</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="state" size="45"
                                               value="${customer.state}" required="required" maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Zip Code</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="zipCode"
                                               size="45" value="${customer.zipCode}" required="required"
                                               maxlength="16"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Country</label>
                                    <div class="col-md-12">
                                        <select name="country" class="form-control form-control-line">
                                            <c:forEach items="${mapCountries}" var="country">
                                                <option value="${country.value}"
                                                        <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
                                        <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </c:if>
                        <c:if test="${customer == null}">
                            <form action="create_customer" method="post">
                                <div class="form-group">
                                    <label class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="email" name="email"
                                               size="45" value="${customer.email}" required="required" maxlength="64"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">First Name</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="firstName"
                                               size="45" value="${customer.firstName}" required="required"
                                               maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Last Name</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="lastName"
                                               size="45" value="${customer.lastName}" required="required"
                                               maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Password</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="password" name="password"
                                               size="45" value="${customer.password}" required="required"
                                               maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Confirm Password</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="password"
                                               name="confirmPassword" size="45" value="${customer.password}"
                                               required="required" maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Phone Number</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="phone" size="45"
                                               value="${customer.phone}" required="required" maxlength="16"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Address Line1</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="addressLine1"
                                               size="45" value="${customer.addressLine1}" required="required"
                                               maxlength="128"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Address Line2</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="addressLine2"
                                               size="45" value="${customer.addressLine2}" required="required"
                                               maxlength="128"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">City</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="city" size="45"
                                               value="${customer.city}" required="required" maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">State</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="state" size="45"
                                               value="${customer.state}" required="required" maxlength="32"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Zip Code</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" name="zipCode"
                                               size="45" value="${customer.zipCode}" required="required"
                                               maxlength="16"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Country</label>
                                    <div class="col-md-12">
                                        <select name="country" class="form-control form-control-line">
                                            <c:forEach items="${mapCountries}" var="country">
                                                <option value="${country.value}"
                                                        <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Save</button>&nbsp;&nbsp;&nbsp;
                                        <button type="button" onclick="history.go(-1);" class="btn btn-success">Cancel
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </c:if>
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
<!-- slimscrollbar scrollbar JavaScript -->
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
</html>