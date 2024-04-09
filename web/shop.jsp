<%-- 
    Document   : shop
    Created on : Aug 7, 2023, 9:28:38 AM
    Author     : Raiku
--%>

<%@page import="dto.Category"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

    <%
        // Check for success message and display alert
        String Message = (String) session.getAttribute("Message");
        if (Message != null) {
            out.println("<script>");
            out.println("alert('" + Message + "');");
            out.println("</script>");
            session.removeAttribute("Message");
        }
        DAO dao = new DAO();
        List<Category> listC = dao.getAllCategories();
        session.setAttribute("listCC", listC);
    %>
    <head>
        <meta charset="utf-8">
        <title>Fashion web | View shop for details</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <link href="img/favicon.png" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <style>
            .product-img {
                height: 320px;
                overflow: hidden;
            }
            .product-img img {
                width: 100%;
                height: auto;
                max-height: 100%;

            }
            li {
                list-style: none;
            }
            a.active {
                color: #533f03;
                font-weight: bold;
            }

        </style>    
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-2 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark" href="FAQs.jsp">FAQs</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Help</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Support</a>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a class="text-dark pl-2" href="">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">S</span>Fashion</h1>
                    </a>
                </div>
            </div>

        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <c:if test="${sessionScope.user.getRole() == '2'} || ${sessionScope.user.getRole() == '1'}">
                        <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                            <h6 class="m-0">Categories</h6>
                            <i class="fa fa-angle-down text-dark"></i>
                        </a>

                        <nav class="collapse navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                            <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">

                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link" data-toggle="dropdown">Dresses <i class="fa fa-angle-down float-right mt-1"></i></a>
                                    <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                        <a href="" class="dropdown-item">Men's Dresses</a>
                                        <a href="" class="dropdown-item">Women's Dresses</a>
                                        <a href="" class="dropdown-item">Baby's Dresses</a>
                                    </div>
                                </div><!--
                                -->
                                <c:if test="${sessionScope.user.getRole() == '2' || sessionScope.user == null}">
                                    <ul class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                                        <c:forEach items="${sessionScope.listCC}" var="o">
                                            <li class="nav-item">
                                                <a href="CategoryController?cid=${o.categoryId}" class="nav-link">${o.name}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </div>
                        </nav>
                    </c:if>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="index.jsp" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1"></span>Fashion</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <c:if test="${sessionScope.user.getRole() == '2' || sessionScope.user == null}">
                                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                                    <a href="shopController" class="nav-item nav-link">Shop</a>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <c:if test="${sessionScope.user.getRole() == '2'}">
                                        <a href="./productManagerController" class="nav-item nav-link">Product Manager</a>
                                    </c:if>
                                    <c:if test="${sessionScope.user.getRole() == '2' || sessionScope.user.getRole() == '3'}">
                                        <a href="./OrderManagerController" class="nav-item nav-link">Order Manager</a>
                                    </c:if>
                                    <a href="./MessengerManagerController" class="nav-item nav-link">Messenger</a>
                                </c:if>
                            </div>

                            <c:if test="${sessionScope.user == null}">
                                <div class="navbar-nav ml-auto py-0">
                                    <a href="./Login.jsp" class="nav-item nav-link">Sign in</a>
                                    <a href="Register.jsp" class="nav-item nav-link">Sign up</a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.user != null && sessionScope.user.getRole()=='2'}">
                                <div class="col-lg-2 col-2 text-right">
                                    <a href="./cart.jsp" class="btn border">
                                        <!-- fix này -->
                                        <i class="fas fa-shopping-cart text-primary"></i> <span class="badge badge-light">${sessionScope.ShoppingCart.totalQuantity()}</span>
                                    </a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.user.getRole() == '1'}">
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Manager</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="AccountManagerController" class="dropdown-item">Accounts</a>
                                        <a href="CategoryManagerController" class="dropdown-item">Categories</a>
                                        <a href="productManagerController" class="dropdown-item">Products</a>
                                        <a href="DiscountManagerController" class="dropdown-item">Discounts</a>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${sessionScope.user != null}">
                                <div class="nav-item dropdown">
                                    <c:if test="${sessionScope.user.getRole() == '2'|| sessionScope.user.getRole() == '3'}">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${sessionScope.user.getName()}</a>
                                        <div class="dropdown-menu rounded-0 m-0">
                                            <a href="profileController" class="dropdown-item">Profile</a>
                                            <c:if test="${sessionScope.user.getRole() == '2'}">
                                                <a href="OrderForSellerController" class="dropdown-item">Shop's Orders</a>
                                            </c:if>
                                            <c:if test="${sessionScope.user.getRole() == '3'}">
                                                <a href="OrderForShipperController" class="dropdown-item">Shipper's Orders</a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${sessionScope.user.getRole() == '1'}">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${sessionScope.user.getName()}</a>
                                            <div class="dropdown-menu rounded-0 m-0">
                                            </c:if>
                                            <a href="changePassword.jsp" class="dropdown-item">Change password</a>
                                            <a href="logout" class="dropdown-item">Logout</a>
                                        </div>
                                    </div>
                                </c:if> 
                            </div>
                    </nav>
                    <c:if test="${sessionScope.user.getRole() == '2'} || ${sessionScope.user.getRole() == '3'}">
                        <div id="header-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active" style="height: 410px;">
                                    <img class="img-fluid" src="img/carousel-1.jpg" alt="Image">
                                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                            <h3 class="display-4 text-white font-weight-semi-bold mb-4">Fashionable Dress</h3>
                                            <a href="shopController" class="btn btn-light py-2 px-3">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item" style="height: 410px;">
                                    <img class="img-fluid" src="img/carousel-2.jpg" alt="Image">
                                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                            <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                            <a href="shopController" class="btn btn-light py-2 px-3">Shop Now</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="carousel-item" style="height: 410px;">
                                    <img class="img-fluid" src="img/carousel-3.jpg" alt="Image">
                                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h4 class="text-light text-uppercase font-weight-medium mb-3">Flexible With Luxury Colors</h4>
                                            <h3 class="display-4 text-white font-weight-semi-bold mb-4">Quality Put Up</h3>
                                            <a href="shopController" class="btn btn-light py-2 px-3">Shop Now</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="carousel-item" style="height: 410px;">
                                    <img class="img-fluid" src="img/carousel-4.jpg" alt="Image">
                                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h4 class="text-light text-uppercase font-weight-medium mb-3">75% Off All Products</h4>
                                            <h3 class="display-4 text-white font-weight-semi-bold mb-4">Highly Appreciate Your Feeling</h3>
                                            <a href="shopController" class="btn btn-light py-2 px-3">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                    <span class="carousel-control-prev-icon mb-n2"></span>
                                </div>
                            </a>
                            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                    <span class="carousel-control-next-icon mb-n2"></span>
                                </div>
                            </a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2"> - </p>
                    <p class="m-0 active"><a href="#"><strong>Shop</strong></a></p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Shop Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-12">
                    <!-- Price Start -->
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                        <form action="FilterByPriceController" method="POST">
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'all'}">checked</c:if> name="price" id="price-all" value="all">
                                    <label class="custom-control-label" for="price-all">All Price</label>
                                </div>
                                <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                    <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below100' }">checked</c:if>  name="price" id="price-1" value="below100">
                                    <label class="custom-control-label" for="price-1">$0 - $100</label>
                                </div>
                                <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                    <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below200' }">checked</c:if>  name="price" id="price-2" value="below200">
                                    <label class="custom-control-label" for="price-2">$100 - $200</label>
                                </div>
                                <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                    <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below300' }">checked</c:if>  name="price" id="price-3" value="below300">
                                    <label class="custom-control-label" for="price-3">$200 - $300</label>
                                </div>
                                <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                    <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below400' }">checked</c:if>  name="price" id="price-4" value="below400">
                                    <label class="custom-control-label" for="price-4">$300 - $400</label>
                                </div>
                                <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                                    <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below500' }">checked</c:if>  name="price" id="price-5" value="below500">
                                    <label class="custom-control-label" for="price-5">$400 - $500</label>
                                </div>
                                <div class="custom-control custom-radio d-flex align-items-center justify-content-end">
                                    <button style="background-color: #D19C97; border: none; padding: 10px 20px; border-radius: 5px;">Submit</button>
                                </div>
                            </form>

                        </div>
                        <!-- Price End -->
                    </div>
                    <!-- Shop Sidebar End -->


                    <!-- Shop Product Start -->
                    <div class="col-lg-9 col-md-12">
                        <div class="row pb-3">
                            <div class="col-12 pb-1">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <form action="shopController" method="GET">
                                        <div class="input-group">
                                            <input name="search" id="input-search" type="text" class="form-control" placeholder="Search for products">
                                            <button class="btn btn-outline-primary d-flex align-items-center" style="border: none; background: none;">
                                                <span class="input-group-text bg-transparent text-primary">
                                                    <i class="fa fa-search"></i>
                                                </span>
                                            </button>
                                        </div>

                                    </form>
                                    <div class="dropdown ml-4">
                                        <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                            Sort by
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                           <a class="dropdown-item" href="shopController?action=lowest">min to max</a>
                                        <a class="dropdown-item" href="shopController?action=highest">max to min</a>

                                        </div>
                                    </div>
                                </div>
                                <div style="
                                     display: flex;
                                     flex-wrap: wrap;
                                     ">
                                <c:forEach items="${listP}" var="o">

                                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                        <div class="card product-item border-0 mb-4">
                                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                                <img class="img-fluid w-100" src="data:image/jpeg;base64,${o.images[0].getImg()}" alt="">
                                            </div>
                                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                                <h5 class="text-truncate mb-3">${o.name}</h5>
                                                <div class="d-flex justify-content-center">
                                                    <h6>${o.price}00<u>đ</u></h6>
                                                </div>
                                                <div class="d-flex justify-content-center">
                                                    <a href="ShopDetailController?uid=${o.user.userId}" class="btn btn-sm text-dark p-0"><h6>${o.user.username}</h6></a>
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex justify-content-between bg-light border">
                                                <a href="DetailProductController?pid=${o.productId}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                                <a href="addtoCart?pid=${o.productId}" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                            <div class="col-12 pb-1">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center mb-3">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                        <!--
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        -->
                                        <c:forEach begin="1" end="${endPage}" var="o">
                                            <li class="page-item">
                                                <a href="shop?index=${o}" class="page-link ${tag==o?"active":""}">${o}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>

                        </div>
                    </div>
                    <!-- Shop Product End -->
                </div>
            </div>
            <!-- Shop End -->


            <!-- Footer Start -->
            <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
                <div class="row px-xl-5 pt-5">
                    <div class="col-lg-6 col-md-12 mb-5 pr-3 pr-xl-5">
                        <a href="" class="text-decoration-none">
                            <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                        </a>
                        <p>Chuyên cung cấp các mẫu hợp thời. Không ngại bạn là ai</p>
                        <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Quy Nhơn, Bình Định</p>
                        <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>Group2@gmail.com</p>
                        <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+84 8147 4189</p>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="row">
                            <div class="col-md-6 mb-5">
                                <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                                <div class="d-flex flex-column justify-content-start">
                                    <a class="text-dark mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                    <a class="text-dark mb-2" href="shop.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                    <a class="text-dark mb-2" href="cart.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                    <a class="text-dark mb-2" href="checkout.jsp"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                    <a class="text-dark" href="contact.jsp"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                                </div>
                            </div>
                            <div class="col-md-6 mb-5">
                                <h5 class="font-weight-bold text-dark mb-4">New Subcribe</h5>
                                <form action="">
                                    <div class="form-group">
                                        <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                               required="required" />
                                    </div>
                                    <div>
                                        <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row border-top border-light mx-xl-5 py-4">
                    <div class="col-md-6 px-xl-0">
                        <p class="mb-md-0 text-center text-md-left text-dark">
                            &copy; <a class="text-dark font-weight-semi-bold" href="#">fashion.com</a>
                            <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com"></a><br>
                            Distributed By <a href="https://www.facebook.com/hello.trungkien2711/" target="_blank">GROUP 2 SE17B02</a>
                        </p>
                    </div>
                    <div class="col-md-6 px-xl-0 text-center text-md-right">
                        <img class="img-fluid" src="img/payments.png" alt="">
                    </div>
                </div>
            </div>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>

            <!-- Contact Javascript File -->
            <script src="mail/jqBootstrapValidation.min.js"></script>
            <script src="mail/contact.js"></script>

            <!-- Template Javascript -->
            <script src="js/main.js"></script>
            <script src="js/addToCart.js"></script>
    </body>

</html>
