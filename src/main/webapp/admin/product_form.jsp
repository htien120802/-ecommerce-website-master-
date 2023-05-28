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
    <title>
        <c:if test="${product != null}">Edit Product - Administration</c:if>
        <c:if test="${product == null}">Create Product - Administration</c:if>
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
                <h3 class="text-themecolor">Product</h3>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Product</li>
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
                        <c:if test="${product != null}">
                            <form action="update_product" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="productId" value="${product.productId}">
                                <div class="form-group">
                                    <label class="col-md-12">Category</label>
                                    <div class="col-md-12">
                                        <select name="category" class="form-control form-control-line">
                                            <c:forEach items="${listCategories}" var="category">
                                                <c:if test="${category.categoryId eq product.category.categoryId}">
                                                    <option value="${category.categoryId}" selected>
                                                </c:if>
                                                <c:if test="${category.categoryId ne product.category.categoryId}">
                                                    <option value="${category.categoryId}">
                                                </c:if>
                                                ${category.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Title</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" id="title"
                                               name="title" value="${product.title}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="publishDate" class="col-md-12">Publish Date:</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="date" name="publishDate"
                                               id="publishDate"
                                               value="<fmt:formatDate pattern='yyyy-MM-dd' value='${product.publishDate}' />"
                                               required="required"/></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Product Image</label>
                                    <div class="col-md-12">
                                        <c:if test="${product == null}">
                                            <input id="productImage" class="form-control form-control-line" type="file"
                                                   name="productImage" required="required"/><br/>
                                        </c:if>
                                        <c:if test="${product != null}">
                                            <input id="productImage" class="form-control form-control-line" type="file"
                                                   name="productImage"/><br/>
                                        </c:if>
                                        <img id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px"
                                             src="data:image/jpg;base64,${product.base64Image}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-md-12">Price</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" id="price"
                                               name="price" size="20" value="${product.price}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="col-md-12">Description</label>
                                    <div class="col-md-12">
                                        <textarea class="form-control form-control-line" rows="5" cols="50"
                                                  name="description" id="description">${product.description}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Active</label>
                                    <div class="col-md-12">
                                        <select class="form-control form-control-line" name="active">
                                            <option value="true"
                                                    <c:if test="${product.active eq true}">selected='selected'</c:if> >
                                                Enable
                                            </option>
                                            <option value="false"
                                                    <c:if test="${product.active eq false}">selected='selected'</c:if>>
                                                Disable
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Save</button>
                                        <button type="cancel" class="btn btn-success">Cancel</button>
                                    </div>
                                </div>
                            </form>
                        </c:if>

                        <c:if test="${product == null}">
                            <form action="create_product" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="col-md-12">Category</label>
                                    <div class="col-md-12">
                                        <select name="category" class="form-control form-control-line">
                                            <c:forEach items="${listCategories}" var="category">
                                                <c:if test="${category.categoryId eq product.category.categoryId}">
                                                    <option value="${category.categoryId}" selected>
                                                </c:if>
                                                <c:if test="${category.categoryId ne product.category.categoryId}">
                                                    <option value="${category.categoryId}">
                                                </c:if>
                                                ${category.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Title</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" id="title"
                                               name="title" value="${product.title}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="publishDate" class="col-md-12">Publish Date:</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="date" id="publishDate"
                                               name="publishDate"
                                               value="<fmt:formatDate pattern='MM/dd/yyyy' value='${product.publishDate}' />"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Product Image</label>
                                    <div class="col-md-12">
                                        <c:if test="${product == null}">
                                            <input id="productImage" class="form-control form-control-line" type="file"
                                                   name="productImage" required="required"/><br/>
                                        </c:if>
                                        <c:if test="${product != null}">
                                            <input id="productImage" class="form-control form-control-line" type="file"
                                                   name="productImage"/><br/>
                                        </c:if>
                                        <img id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px"
                                             src="data:image/jpg;base64,${product.base64Image}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-md-12">Price</label>
                                    <div class="col-md-12">
                                        <input class="form-control form-control-line" type="text" id="price"
                                               name="price" size="20" value="${product.price}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="col-md-12">Description</label>
                                    <div class="col-md-12">
                                        <textarea class="form-control form-control-line" rows="5" cols="50"
                                                  name="description" id="description">${product.description}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Active</label>
                                    <div class="col-md-12">
                                        <select class="form-control form-control-line" name="active">
                                            <option value="true"
                                                    <c:if test="${product.active eq true}">selected='selected'</c:if> >
                                                Enable
                                            </option>
                                            <option value="false"
                                                    <c:if test="${product.active eq false}">selected='selected'</c:if>>
                                                Disable
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Save</button>
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
</div>
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
<script type="text/javascript">
    $(document).ready(function () {
        $('#description').richText();

        $('#productImage').change(function () {
            showImageThumbnail(this);
        });
    });

    function showImageThumbnail(fileInput) {
        let file = fileInput.files[0];
        let reader = new FileReader();
        reader.onload = function (e) {
            $('#thumbnail').attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
    }
</script>
</html>