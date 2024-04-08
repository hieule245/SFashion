<%@page import="DAO.DAO"%>
<%@page import="dto.Category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
// Check for success message and display alert
    String Message =(String) session.getAttribute("Message");
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
        <title>Fashion web | Buy and sell online </title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <link href="img/favicon.ico" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <style>
            .container-img, .img-category {
                display: grid;
                grid-template-columns: repeat(auto-fill);
                grid-gap: 10px;
                align-items: center;
                justify-content: center;
                max-width: 100%;
                height: 400px;
                object-fit: contain;
            }
            .scrollable-list {
                overflow-y: auto;
                max-height: 100%;
            }
        </style>
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
                <div class="col-lg-5 col-5 text-left">
                    <form action="SearchController" method="GET">
                        <div class="input-group">
                            <input name="search" id="input-search" type="text" class="form-control" placeholder="Search for products">
                            <button class="btn btn-outline-primary d-flex align-items-center" style="border: none; background: none;">
                                <span class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </span>r
                            </button>
                        </div>

                    </form>
                </div>
                <c:if test="${sessionScope.user != null && sessionScope.user.getRole()=='2'}">
                <div class="col-lg-1 col-2 text-right">
                    <a href="./cart.jsp" class="btn border">
                        <i class="fas fa-shopping-cart text-primary"></i>
                    </a>
                </div>
                </c:if>
            </div>
            
        </div>
       
