<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@ include file="common.jsp" %>

    <title>Contact</title>
</head>
<body>
<%@ include file="header.jsp" %>

<section class="contact">
    <div class="container">
        <div class="row contact-details">
            <div class="col-sm-8 text-center text-md-left">
                <h3 class="mb-4">Ask us a question</h3>
                <form action="send_contact" method="post" enctype="multipart/form-data" class="contact-form mt-4">
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" class="form-control mb-4" name="subject"
                                   placeholder="Your subject." required="required">
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control mb-4" placeholder="Your email."
                                   value="${loggedCustomer.email}" required="required" name="email">
                        </div>
                        <br/>
                    </div>
                    <div class="row">
                        <div class="col-md-10">
                            <textarea class="form-control mb-4" rows="5" style="height: 10em !important;" name="content"
                                      required="required">Your contact details.</textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <input type="file" name="file" size="50"/>
                        </div>
                        <label class="col-md-5">(If needed.)</label>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <button type="submit" class="btn btn-outline-primary btn-lg mb-4">Send Message
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-4 mb-5 text-center text-md-left">
                <h3>Contact</h3>
                <h4 class="pt-4">Email</h4>
                <p>contact@shop.com</p>
                <h4 class="pt-2">Phone</h4>
                <p>+111 999 888 77</p>
                <h4 class="pt-2">Address</h4>
                <p>Ho Chi Minh City<br/>Viet Nam</p>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

<!-- Placed at the end of the document so the pages load faster -->
<script src="shop/js/jquery-3.1.1.min.js"></script>
<script src="shop/bootstrap/js/bootstrap.min.js"></script>
<script src="shop/js/tether.min.js"></script>
<script src="shop/js/popper.min.js"></script>
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