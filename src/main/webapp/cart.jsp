 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../layouts/header.jsp" %> 
 
  <!-- ========================= SECTION CONTENT ========================= -->
    <section class="section-content padding-y">
        <div class="container">
            <header class="section-heading tz-section-header-center">
                <h3 class="section-title">My <span>Cart</span></h3>
                <p>Discover our selection of the best products of the year</p>
            </header>
            <!-- sect-heading -->
            <div class="row">
                <main class="col-md-12 col-lg-9">
                    <div class="card cart-card">

                        <table class="table table-borderless table-shopping-cart">
                            <thead class="text-muted">
                                <tr class="small text-uppercase">
                                    <th scope="col">Product</th>
                                    <th scope="col" width="120">Quantity</th>
                                    <th scope="col" width="120">Price</th>
                                    <th scope="col" class="text-right" width="200"> </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ carts}" var="cart">
                                <tr>
                                    <td>
                                        <figure class="itemside">
                                            <div class="aside"><img src='<c:url value="./admin_pack/images/${cart.product.image}"/>' class="img-sm"></div>
                                            <figcaption class="info">
                                                <a href="<% out.print(request.getContextPath()); %>/ProDetail?id=${ cart.product.id }" class="title text-dark">${cart.product.name}</a>
                                                <p class="text-muted small">Size: XL, Color: blue, <br> Brand: Gucci</p>
                                            </figcaption>
                                        </figure>
                                    </td>
                                    <td>
                                        <input type="number" class="cart_quantity" name="quantity" min="1" max="100" step="1" value="${cart.quantity}" style="border:1px solid #40CBFF;padding-left:15px;color:#40CBFF;" >
                                    </td>
                                    <td>
                                        <div class="price-wrap">
                                            <var class="price">$ ${cart.product.price}</var>
                                        </div> <!-- price-wrap .// -->
                                    </td>
                                    <td class="text-right">
                                        <a data-original-title="Edit" title="" class="editQt btn btn-light mr-2" href="<% out.print(request.getContextPath()); %>/Carts?action=edit&id=${ cart.product.id }&qty=${ cart.quantity }"  data-toggle="tooltip"> Edit</a>
                                        <a href="<% out.print(request.getContextPath()); %>/Carts?action=remove&id=${ cart.product.id }" class="btn btn-danger btn-round"> Remove</a>
                                    </td>
                                </tr>
							</c:forEach>
                            </tbody>
                        </table>

                    </div> <!-- card.// -->

                </main> <!-- col.// -->
                <aside class="col-md-12 col-lg-3">
                    <div class="card Coupon-card mb-3">
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label>Have coupon?</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="" placeholder="Coupon code">
                                        <span class="input-group-append">
                                            <button class="btn btn-primary">Apply</button>
                                        </span>
                                    </div>
                                </div>
                            </form>
                        </div> <!-- card-body.// -->
                    </div> <!-- card .// -->
                    <div class="card payment-card">
                        <div class="card-body">
                            <dl class="dlist-align">
                                <dt>Total price:</dt>
                                <dd class="text-right">USD 568</dd>
                            </dl>
                            <dl class="dlist-align">
                                <dt>Discount:</dt>
                                <dd class="text-right">USD 658</dd>
                            </dl>
                            <dl class="dlist-align">
                                <dt>Total:</dt>
                                <dd class="text-right  h5"><strong>$1,650</strong></dd>
                            </dl>
                            <hr>
                            <p class="text-center mb-3">
                                <img src="${pageContext.request.contextPath}/ClientPack/images/cart/payments.png" height="26">
                            </p>
                            <a href="ShopClient?action=paginate" type="button" class="btn btn-primary btn-block">Continue Shopping</a>
                            <button type="button" class="btn btn-outline-primary btn-block">Make Purchase</button>
                        </div> <!-- card-body.// -->
                    </div> <!-- card .// -->
                </aside> <!-- col.// -->
            </div>

        </div> <!-- container .//  -->
    </section>
    <!-- ========================= SECTION CONTENT END//===================== -->


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









    <section class="tz-feature-area section-content padding-y-b">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <article class="tz-feature card card-body">
                        <figure class="text-center">
                            <span class="rounded-circle icon-md bg-primary"><i class="fa fa-user white"></i></span>
                            <figcaption class="pt-4">
                                <h5 class="title">Creative Strategy &amp; solution</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod </p>
                            </figcaption>
                        </figure> <!-- iconbox // -->
                    </article> <!-- panel-lg.// -->
                </div><!-- col // -->
                <div class="col-md-4">
                    <article class="tz-feature card card-body">
                        <figure class="text-center">
                            <span class="rounded-circle icon-md bg-primary"><i class="fa fa-truck white"></i></span>
                            <figcaption class="pt-4">
                                <h5 class="title">Creative Strategy &amp; solution</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod </p>
                            </figcaption>
                        </figure> <!-- iconbox // -->
                    </article> <!-- panel-lg.// -->
                </div> <!-- col // -->
                <div class="col-md-4">
                    <article class="tz-feature card card-body">
                        <figure class="text-center">
                            <span class="rounded-circle icon-md bg-primary"><i class="fa fa-star white"></i></span>
                            <figcaption class="pt-4">
                                <h5 class="title">Creative Strategy &amp; solution</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod </p>
                            </figcaption>
                        </figure> <!-- iconbox // -->
                    </article> <!-- panel-lg.// -->
                </div> <!-- col // -->
            </div>
        </div>
    </section>
    
    
    <section class="tz-brand-area section-content padding-y-b">
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
 
 
  <%@include file="../layouts/footer.jsp" %> 
  
 <script>
 	$(function () {
 		$('.cart_quantity').keyup(function (){
 			let tr = $(this).parents('tr');
 			let tag = tr.find('.editQt');
 			let href = tag.attr('href');
 			href = href.replace(/([\w\/\?\=\&].*?qty)=(\d*)/gm, '$1='+$(this).val());
 		
 			tag.attr('href',href);
 			
 		})
 	});
 </script>