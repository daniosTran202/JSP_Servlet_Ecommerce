 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
  	<title>Login </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ClientPack/login/css/style.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(${pageContext.request.contextPath}/ClientPack/login/images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Login TechZone</h2>
				</div>
			</div>
			<div class="row justify-content-center">
			
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Have an account?</h3>
		      	<h4 class="text-center alert-danger" style="color: red">${msgerr}</h4>
		      	<form action="Accounts" method="POST" class="signin-form">
		      		<div class="form-group">
		      			<input type="text" name="txtEmail" value="${email}" class="form-control" placeholder="Email" required>
		      		</div>
	            <div class="form-group">
	              <input id="password-field" name="txtPassword" value="${password}" type="password" class="form-control" placeholder="Password" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	<label class="checkbox-wrap checkbox-primary">Remember Me
									  <input type="checkbox" name="chkRemember" value="1" checked="${remember != null? 'checked' : ''}">
									  <span class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
	            </div>
	          </form>
	          <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
	          <div class="social d-flex text-center">
	          	<a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
	          	<a href="viewRegister" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Register</a>
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="${pageContext.request.contextPath}/ClientPack/login/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/ClientPack/login/js/popper.js"></script>
  <script src="${pageContext.request.contextPath}/ClientPack/login/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/ClientPack/login/js/main.js"></script>

	</body>
</html>