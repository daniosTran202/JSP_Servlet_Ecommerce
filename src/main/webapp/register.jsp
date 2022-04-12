<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<title>@Sign-up Techzone</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ClientPack/signUp/css/opensans-font.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ClientPack/signUp/fonts/line-awesome/css/line-awesome.min.css">
	<!-- Jquery -->
	<link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ClientPack/signUp/css/style.css"/>
</head>
<body class="form-v4">
	<div class="page-content">
		<div class="form-v4-content">
			<div class="form-left">
				<h2>INFOMATION</h2>
				<p class="text-1">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et molestie ac feugiat sed. Diam volutpat commodo.</p>
				<p class="text-2"><span>Eu ultrices:</span> Vitae auctor eu augue ut. Malesuada nunc vel risus commodo viverra. Praesent elementum facilisis leo vel.</p>
				<div class="form-left-last">
					<a  href="AccountLoginAction" class="account ">Have An Account</a>
				</div>
			</div>
			<form class="form-detail" action="AccRegister" method="POST" >
				<h2>REGISTER FORM</h2>
				<p class="alert alert-danger">${err}</p>
				<div class="form-group">
					<div class="form-row form-row-1">
						<label for="first_name">UserName</label>
						<input type="text" name="name" value="${ac.name}" id="first_name" class="input-text">
					</div>
					<div class="form-row form-row-1">
						<label for="your_email"> Email</label>
						<input type="text" name="email" value="${ac.email}" id="your_email" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">
						
					</div>
				</div>
				<div class="form-row">
						<label for="address">Address</label>
						<input type="text" name="address" value="${ac.address}" id="last_name" class="input-text">
				</div>
				<div class="form-row">
						<label for="">Created_at</label> 
						<input class="form-control" name="created_at" required="required" value="${ac.created_at}" type="date">
				</div>
				 
				<div class="form-group">
					<div class="form-row form-row-1 ">
						<label for="password">Password</label>
						<input type="password" name="password" id="password" value="${ac.password}" class="input-text" required>
					</div>
					<div class="ml-3 form-row-1" >
						<label for="">Role</label> 
						<select name="role" height="50px" width="100px">
							 <option value="1" >1</option>
							 <option value="2" >2</option>
							 <option value="3">3</option>
						 </select>
					</div>
				</div>
				<div class="form-checkbox">
					<label class="container"><p>I agree to the <a href="#" class="text">Terms and Conditions</a></p>
					</label>
				</div>
				<div class="form-row-last">
					<button type="submit" class="register" value="register">Register</button>
				</div>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script>
		// just for the demos, avoids form submit
		jQuery.validator.setDefaults({
		  	debug: true,
		  	success:  function(label){
        		label.attr('id', 'valid');
   		 	},
		});
		$( "#myform" ).validate({
		  	rules: {
			    password: "required",
		    	comfirm_password: {
		      		equalTo: "#password"
		    	}
		  	},
		  	messages: {
		  		first_name: {
		  			required: "Please enter a firstname"
		  		},
		  		last_name: {
		  			required: "Please enter a lastname"
		  		},
		  		your_email: {
		  			required: "Please provide an email"
		  		},
		  		password: {
	  				required: "Please enter a password"
		  		},
		  		comfirm_password: {
		  			required: "Please enter a password",
		      		equalTo: "Wrong Password"
		    	}
		  	}
		});
	</script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>