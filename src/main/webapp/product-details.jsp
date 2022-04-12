 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../layouts/header.jsp" %> 
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <!-- ========================= Feature product start ==================== -->
    <section class="tz-feature-product-section section-content padding-y">
        <div class="container">
            <header class="section-heading tz-section-header-center">
                <h3 class="section-title">Product <span>Details</span></h3>
                <p>Discover our selection of the best products of the year</p>
            </header><!-- sect-heading -->
            <div class="card">
                <div class="row no-gutters align-items-center">
                    <aside class="col-sm-6">
                        <div class="featured-product-images-wrap">
                            <div class="product-sync-init mb-20">
                                <div class="single-product">
                                    <div class="product-thumb">
                                        <img src='<c:url value="./admin_pack/images/${details.image}"/>' alt="product-thumb">
                                    </div>
                                </div>
                                <!-- single-product end -->
                                <div class="single-product">
                                    <div class="product-thumb">
                                        <img src="${pageContext.request.contextPath}/ClientPack/images/features/feature-sm-1.png" alt="product-thumb">
                                    </div>
                                </div>
                                <!-- single-product end -->
                                <div class="single-product">
                                    <div class="product-thumb">
                                        <img src="${pageContext.request.contextPath}/ClientPack/images/features/feature-sm-2.png" alt="product-thumb">
                                    </div>
                                </div>
                                <!-- single-product end -->
                                <div class="single-product">
                                    <div class="product-thumb">
                                        <img src="${pageContext.request.contextPath}/ClientPack/images/features/feature-sm-3.png" alt="product-thumb">
                                    </div>
                                </div>
                                <!-- single-product end -->
                            </div>

                            <div class="product-sync-nav single-product">
                                <div class="single-product">
                                    <div class="product-thumb">
                                        <a href="javascript:void(0)"> <img src='<c:url value="./admin_pack/images/${details.image}"/>' alt="product-thumb"></a>
                                    </div>
                                </div>
                                <!-- single-product end -->
                                <div class="single-product">
                                    <div class="product-thumb">
                                        <a href="javascript:void(0)"> <img src="${pageContext.request.contextPath}/ClientPack/images/features/feature-sm-1.png" alt="product-thumb"></a>
                                    </div>
                                </div>
                                <!-- single-product end -->
                                <div class="single-product">
                                    <div class="product-thumb">
                                        <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/ClientPack/images/features/feature-sm-2.png" alt="product-thumb"></a>
                                    </div>
                                </div>
                                <!-- single-product end -->
                                <div class="single-product">
                                    <div class="product-thumb">
                                        <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/ClientPack/images/features/feature-sm-3.png" alt="product-thumb"></a>
                                    </div>
                                </div>
                                <!-- single-product end -->
                            </div>
                        </div>
                    </aside>
                    <main class="col-sm-6">
                        <article class="content-body featured-product-content-wrap">
                            <h3 class="title">${details.name}</h3>
                            <p>${details.description}</p>

                            <ul class="list-check mb-4">
                                <li>Best performance of battery</li>
                                <li>5 years warranty for this product</li>
                                <li>Best performance of battery</li>
                            </ul>

                            <div class="item-option-select mb-4">
                                <h6>Model</h6>
                                <div class="btn-group btn-group-sm btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-primary active">
                                        <input type="radio" name="radio_size" checked=""> Xs
                                    </label>
                                    <label class="btn btn-outline-primary">
                                        <input type="radio" name="radio_size"> Xs Max
                                    </label>
                                </div>
                            </div>

                            <div class="item-option-select mb-4 color-option">
                                <h6>Color</h6>
                                <div class="btn-group btn-group-sm btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-light">
                                        <input type="radio" name="radio_color"> Silver
                                    </label>
                                    <label class="btn btn-light active">
                                        <input type="radio" name="radio_color" checked=""> Gray
                                    </label>
                                    <label class="btn btn-light">
                                        <input type="radio" name="radio_color"> Gold
                                    </label>
                                </div>
                            </div>

                            <div class="mb-4">
                                <var class="price h4">$ ${details.price}<br>
                            </div>
                            <div class="mb-4">
                                <a href="#" class="btn btn-primary btn-lg mb-2">Buy now</a>
                                <a href="#" class="btn btn-outline-primary btn-lg mb-2">Add to card</a>
                            </div>

                        </article> <!-- product-info-aside .// -->
                    </main> <!-- col.// -->
                </div> <!-- row.// -->
            </div>
        </div>
    </section>
    <!-- ========================= Feature Product end ==================== -->
    
    
     <!-- ========================= Products-area start ============== -->
    <section class="products-section section-content padding-y-b">
        <div class="container">

            <header class="section-heading tz-section-header-center">
                <h3 class="section-title">Related <span>Products</span></h3>
                <p>Discover our selection of the best products of the year</p>
            </header><!-- sect-heading -->


            <div class="row">
                <div class="col-md-4">
                    <figure class="tz-product card card-product-grid card-lg">
                        <div class="img-wrap"><img src="${pageContext.request.contextPath}/ClientPack/images/products/headphone-01.png"></div>
                        <div class="quick-view-wrap">
                            <a href="#" class="quick-view" data-toggle="modal" data-target="#quick-view-item">Quick View</a>
                        </div>
                        <figcaption class="info-wrap">
                            <a href="product-details.html" class="title">Headset for gaming</a>
                            <p class="text-muted">Logitec</p>
                        </figcaption>
                        <div class="bottom-wrap">
                            <a href="" class="btn btn-outline-primary float-right">Order Now</a>
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <div class="price-wrap">
                                <span class="price">$19.00</span>
                            </div> <!-- price-wrap.// -->
                        </div> <!-- bottom-wrap.// -->
                    </figure>
                </div> <!-- col.// -->

                <div class="col-md-4">
                    <figure class="tz-product card card-product-grid card-lg">
                        <div class="img-wrap"><img src="${pageContext.request.contextPath}/ClientPack/images/products/headphone-02.png"></div>
                        <div class="quick-view-wrap">
                            <a href="#" class="quick-view" data-toggle="modal" data-target="#quick-view-item">Quick View</a>
                        </div>
                        <figcaption class="info-wrap">
                            <a href="product-details.html" class="title">Headset for gaming</a>
                            <p class="text-muted">Logitec</p>
                        </figcaption>
                        <div class="bottom-wrap">
                            <a href="" class="btn btn-outline-primary float-right">Order Now</a>
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <div class="price-wrap">
                                <span class="price">$19.00</span>
                            </div> <!-- price-wrap.// -->
                        </div> <!-- bottom-wrap.// -->
                    </figure>
                </div> <!-- col.// -->

                <div class="col-md-4">
                    <figure class="tz-product card card-product-grid card-lg">
                        <div class="img-wrap"><img src="${pageContext.request.contextPath}/ClientPack/images/products/headphone-03.png"></div>
                        <div class="quick-view-wrap">
                            <a href="#" class="quick-view" data-toggle="modal" data-target="#quick-view-item">Quick View</a>
                        </div>
                        <figcaption class="info-wrap">
                            <a href="product-details.html" class="title">Headset for gaming</a>
                            <p class="text-muted">Logitec</p>
                        </figcaption>
                        <div class="bottom-wrap">
                            <a href="" class="btn btn-outline-primary float-right">Order Now</a>
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <div class="price-wrap">
                                <span class="price">$19.00</span>
                            </div> <!-- price-wrap.// -->
                        </div> <!-- bottom-wrap.// -->
                    </figure>
                </div> <!-- col.// -->

            </div> <!-- row .//  -->

        </div> <!-- container .//  -->
    </section>
    <!-- ========================= Products-area end ==================== -->


    <section class="tz-brand-area section-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="tz-brand-wrap">
                        <header class="section-heading tz-section-header-center">
                            <h3 class="section-title">Brands <span>We Distribute</span></h3>
                        </header><!-- sect-heading -->

                        <div class="tz-brand-carousel owl-carousel">
                            <div class="single-brand">
                                <img src="${pageContext.request.contextPath}/ClientPack/images/brand/brand-1.png" alt="">
                            </div>
                            <div class="single-brand">
                                <img src="${pageContext.request.contextPath}/ClientPack/images/brand/brand-5.png" alt="">
                            </div>
                            <div class="single-brand">
                                <img src="${pageContext.request.contextPath}/ClientPack/images/brand/brand-2.png" alt="">
                            </div>
                            <div class="single-brand">
                                <img src="${pageContext.request.contextPath}/ClientPack/images/brand/brand-4.png" alt="">
                            </div>
                            <div class="single-brand">
                                <img src="${pageContext.request.contextPath}/ClientPack/images/brand/brand-5.png" alt="">
                            </div>
                            <div class="single-brand">
                                <img src="${pageContext.request.contextPath}/ClientPack/images/brand/brand-1.png" alt="">
                            </div>
                            <div class="single-brand">
                                <img src="${pageContext.request.contextPath}/ClientPack/images/brand/brand-2.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="tz-subscription-area section-content padding-y">
        <div class="container">
            <header class="section-heading tz-section-header-center">
                <h3 class="section-title">Get Discount <br>And <span>Product Updates</span></h3>
            </header><!-- sect-heading -->
            <div class="row justify-content-md-center">
                <div class="col-lg-5 col-md-6">
                    <form class="form-row">
                        <div class="col-md-8 col-7">
                            <input class="form-control" placeholder="Email" type="email">
                        </div> <!-- col.// -->
                        <div class="col-md-4 col-5">
                            <button type="submit" class="btn btn-block btn-primary btn-lg"> Subscribe </button>
                        </div> <!-- col.// -->
                    </form>
                </div>
            </div>
        </div>
    </section>


 
  <%@include file="../layouts/footer.jsp" %> 