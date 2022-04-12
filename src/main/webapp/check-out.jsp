 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../layouts/header.jsp" %> 
 
  <section class="tz-checkout-area section-content padding-y-t">
        <div class="container">
            <header class="section-heading tz-section-header-center">
                <h3 class="section-title">Check<span>out</span></h3>
                <p>Discover our selection of the best products of the year</p>
            </header>
            <div class="row">
                <div class="col-md-12">
                    <div class="tz-breadcumb mb-5">
                        <h2 class="title-page">TechZone-Headphone</h2>
                        <nav>
                            <ol class="breadcrumb text-white">
                                <li class="breadcrumb-item active" aria-current="page">Information</li>
                                <li class="breadcrumb-item">
                                    <a href="#">Shipping</a>
                                </li>
                                <li class="breadcrumb-item"><a href="#">Payment</a></li>
                            </ol>
                        </nav>
                    </div>  
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">                    
                    <div class="tz-contact-information form-group mb-5">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <span class="text-left">Contatct Information</span>
                            </div> <!-- form-group end.// -->
                            <div class="form-group col-md-6 text-right">
                                <span class="text-left">Already have an account?
                                    <a href="">Log in</a>
                                </span>
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row.// -->
                        <input type="email" class="form-control mb-4" placeholder="Email or phone number">
                        <label class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <div class="custom-control-label" for="customCheck1">Keep me up to date on news and exclusive offers</div>
                        </label>
                    </div>
                    
                    <div class="tz-shipping-information">
                        <header class="mb-4">
                            <h4 class="card-title">Shipping Address</h4>
                        </header>
                        <form>
                            <div class="form-row">
                                <div class="col form-group">
                                    <input type="text" class="form-control" placeholder="First name">
                                </div> <!-- form-group end.// -->
                                <div class="col form-group">
                                    <input type="text" class="form-control" placeholder="Last name">
                                </div> <!-- form-group end.// -->
                            </div> <!-- form-row end.// -->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Company (Optional)">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Address">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Apartment">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="City">
                            </div> <!-- form-group end.// -->
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <select id="inputState" class="form-control" aria-placeholder="Country">
                                        <option>Country</option>
                                        <option>Uzbekistan</option>
                                        <option>Russia</option>
                                        <option>United States</option>
                                        <option>India</option>
                                        <option>Afganistan</option>
                                    </select>
                                </div> <!-- form-group end.// -->
                                <div class="form-group col-md-6">
                                    <input type="text" class="form-control" placeholder="Postal Code">
                                </div> <!-- form-group end.// -->
                            </div> <!-- form-row.// -->                            
                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <div class="custom-control-label" for="customCheck1">Save this information for next time</div>
                            </label>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg"> Continue to shipping </button>
                            </div> <!-- form-group// -->
                        </form>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="tz-shopping-total card">
                        <div class="card-body">
                            <dl class="dlist-align align-items-end tz-shopping-items">
                                <dt class="d-flex align-items-center">
                                    <div class="checkout-product-image-wrap">
                                        <img src="images/checkout/checkout-headphone.png" alt="">    
                                    </div>
                                    <div>
                                        <h5>Camera Canon EOS</h5>
                                        <p>Matrix: 25 Mpx</p>
                                        <p>Brand: Canon</p>
                                    </div>
                                </dt>
                                <dd class="text-right">$568</dd>
                            </dl>
                            <dl class="dlist-align">
                                <dt>Total price:</dt>
                                <dd class="text-right">$568</dd>
                            </dl>
                            <dl class="dlist-align">
                                <dt>Discount:</dt>
                                <dd class="text-right text-danger">$68</dd>
                            </dl>
                            <hr>
                            <dl class="dlist-align text-primary">
                                <dt>Total:</dt>
                                <dd class="text-right"><strong>$5,00</strong></dd>
                            </dl>
                            
                        </div> <!-- card-body.// -->
                    </div>
                </div>
            </div>
        </div> <!-- container .//  -->
    </section>




    <section class="tz-feature-area section-content padding-y">
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
                                <img src="images/brand/brand-5.png" alt="">
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