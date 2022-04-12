 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../layouts/header.jsp" %> 
 
   <section class="tz-address-area section-content padding-y">
        <div class="container">
            <header class="section-heading tz-section-header-center">
                <h3 class="section-title">Our <span>Stores</span></h3>
                <p>Discover our selection of the best products of the week</p>
            </header><!-- sect-heading -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="contact-info-area">
                        <h4>Contact Us</h4>
                        <ul>
                            <li><span><i class="fa fa-map-marker"></i></span> 121 King St, Melbourne <br>VIC 3000, Australia</li>
                            <li><span><i class="fa fa-envelope"></i></span> hello.techzone@gamil.com</li>
                            <li><span><i class="fab fa-skype"></i></span> @techzone</li>
                            <li><span><i class="fa fa-phone"></i></span> +01900220033</li>
                        </ul>
                        <a href="" class="btn btn-primary btn-lg">GetDirection</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="map-area">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3652.553209187985!2d90.40837811498092!3d23.727644184600564!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8f784eeb7c3%3A0x34c146ea8a78c06!2sShohid%20Noor%20Hossain%20Square%2C%20Dhaka%201000!5e0!3m2!1sen!2sbd!4v1602138863166!5m2!1sen!2sbd" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>

    
    
    <section class="tz-contact-form-area section-content padding-y">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="contact-form-image">
                        <img src="${pageContext.request.contextPath}/ClientPack/images/contact/contact-form-image.png" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <header class="section-heading tz-section-header-center">
                        <h3 class="section-title">Contact <span>Us</span></h3>
                    </header><!-- sect-heading -->
                    <form action="">
                        <div class="form-group">
                            <input type="text" placeholder="Your Name" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="email" placeholder="Your Email" class="form-control">
                        </div>
                        <div class="form-group">
                            <textarea placeholder="Your Message" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <a href="" class="btn btn-primary btn-lg">Send Message</a>
                        </div>
                    </form>
                    
                </div>
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