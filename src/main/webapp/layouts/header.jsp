<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="max-age=604800" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!--Site Title-->
    <title>TechZone@Official</title>
    
    <!--Site Icon-->
    <link href="${pageContext.request.contextPath}/ClientPack/images/" rel="shortcut icon" type="image/x-icon">

    <!-- Bootstrap4 files-->
    <link href="${pageContext.request.contextPath}/ClientPack/css/bootstrap.css" rel="stylesheet" type="text/css" />

    <!-- Font Awesome 5 -->
    <link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">

    <!-- Owl Caropusel -->
    <link href="${pageContext.request.contextPath}/ClientPack/css/owl.carousel.min.css" rel="stylesheet" type="text/css" />
    
     <link rel="stylesheet" href="${pageContext.request.contextPath}/admin_pack/plugins/fontawesome-free/css/all.min.css">
    
    <!-- Slick Caropusel -->
    <link href="${pageContext.request.contextPath}/ClientPack/css/slick.css" rel="stylesheet" type="text/css" />
    
    <!-- Slick Caropusel Theme -->
    <link href="${pageContext.request.contextPath}/ClientPack/css/slick-theme.css" rel="stylesheet" type="text/css" />
    
    <link href="${pageContext.request.contextPath}/ClientPack/css/magnific-popup.css" rel="stylesheet" type="text/css" />

    <!-- UI Style -->
    <link href="${pageContext.request.contextPath}/ClientPack/css/ui.css" rel="stylesheet" type="text/css" />

    <!-- style.css -->
    <link href="${pageContext.request.contextPath}/ClientPack/css/style.css" rel="stylesheet" type="text/css" />

    <!-- responsive.css -->
    <link href="${pageContext.request.contextPath}/ClientPack/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
</head>

<body class="home-page">

    <!-- ========================= Header start ========================= -->
    <header class="section-header">
        <nav class="tz-header-top navbar p-md-0 navbar-expand-lg navbar-light">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTop3" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTop3">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#"> <i class="fa fa-phone"></i> Call us: 01900220033 </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> USD </a>
                            <ul class="dropdown-menu small">
                                <li><a class="dropdown-item" href="#">EUR</a></li>
                                <li><a class="dropdown-item" href="#">AED</a></li>
                                <li><a class="dropdown-item" href="#">RUBL </a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> Language </a>
                            <ul class="dropdown-menu small">
                                <li><a class="dropdown-item" href="#">English</a></li>
                                <li><a class="dropdown-item" href="#">Arabic</a></li>
                                <li><a class="dropdown-item" href="#">Russian </a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item"><a href="#" class="nav-link"> My Account </a></li>
                        <li class="nav-item"><a href="#" class="nav-link"> Wishlist </a></li>
                        <li class="nav-item"><a href="#" class="nav-link"> Checkout </a></li>
                    </ul> <!-- list-inline //  -->
                </div> <!-- navbar-collapse .// -->
            </div> <!-- container //  -->
        </nav>
        <section class="tz-header-middle header-main bg-light">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-6">
                        <a href="index.html" class="brand-wrap">
                            <img class="logo" src="${pageContext.request.contextPath}/ClientPack/images/logo.png">
                        </a> <!-- brand-wrap.// -->
                    </div>
                    <div class="col-lg-6 col-sm-12 order-3 order-lg-2">
                        <form action="#" class="search">
                            <div class="input-group w-100">
                                <select class="custom-select" name="category_name">
                                    <option value="">All type</option>
                                    <option value="codex">Special</option>
                                    <option value="comments">Only best</option>
                                    <option value="content">Latest</option>
                                </select>
                                <input type="text" class="form-control" style="width:60%;" placeholder="Search">

                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form> <!-- search-wrap .end// -->
                    </div> <!-- col.// -->
                    <div class="col-lg-3 col-sm-6 col-6 order-2 order-lg-3">
                        <div class="d-flex align-items-center justify-content-end mb-3 mb-lg-0">
                            <div class="widget-header">
                                <div>
                                    <c:choose>
									<c:when test="${acc == null}">
										<a style="float: right;" href="AccountLoginAction">Sign-in</a>
									</c:when>
									<c:otherwise>
										${acc.getName()} | 
										<a href="AccLogout">Logout</a>
									</c:otherwise>
								</c:choose>
                                    <a href="viewRegister">Register</a>
                                </div>
                            </div>
                            <a href="#" class="widget-header pl-3 ml-3">
                                <div class="icon icon-sm rounded-circle bg-primary"><i class="fa fa-shopping-cart"></i></div>
                                <span class="badge badge-pill badge-danger notify">04</span>
                            </a>
                        </div> <!-- widgets-wrap.// -->
                    </div> <!-- col.// -->
                </div> <!-- row.// -->
            </div> <!-- container.// -->
        </section> <!-- header-main .// -->
        <nav class="tz-header-main navbar navbar-main navbar-expand-lg bg-primary">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav3" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="main_nav3">
                    <ul class="navbar-nav navbar-center">
                        <li class="nav-item">
                            <a class="nav-link pl-0" href="home.jsp"> <strong>Home</strong></a>
                        </li>
<!--
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">New Arrivals</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Foods and Drink</a>
                                <a class="dropdown-item" href="#">Home interior</a>
                            </div>
                        </li>
-->
                        <li class="nav-item ">
                            <a class="nav-link" href="ShopClient?action=paginate">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.jsp">Contact</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="cart.jsp">Cart</a>
                                <a class="dropdown-item" href="check-out.jsp">Checkout</a>
                                <a class="dropdown-item" href="product-details.jsp">Product Details</a>
                            </div>
                        </li>
                    </ul>
                </div> <!-- collapse .// -->
            </div> <!-- container .// -->
        </nav> <!-- navbar main end.// -->
    </header> <!-- header-end -->
    <!-- ========================= Header end ========================= -->