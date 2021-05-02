<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="i-head.jsp"%>
<title>Register : Clean Blog - Start Bootstrap Theme</title>	
</head>

<body>
	<!-- Navigation -->
	<%@ include file="i-nav.jsp"%>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('img/about-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>Register</h1>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="row" style="padding-left: 300px;">
			<div class="col-lg-8 col-md-10 mx-auto">
				<form class="needs-validation" id="form" method="POST" action="member-create.do" novalidate="">
					<input type="hidden" id="regdate" name="regdate" value="">
					<div class="col-md-6 mb-3">
						<label for="firstName">Name</label> 
						<input type="text" class="form-control" id="name" name="name" placeholder="your name" required="">
						<div class="invalid-feedback">Valid name is required.
						</div>
					</div>

					<div class="col-md-6 mb-3">
						<label for="email">Email</label> 
						<input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required="">
						<div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
					</div>

					<div class="col-md-6 mb-3">
						<label for="password">Password</label> 
						<input type="password" class="form-control" id="pw" name="pw" placeholder="your password">
						<div class="invalid-feedback">Please enter a valid password for shipping updates.</div>
					</div>
					<div class="form-group col-md-6 mb-3">
						<label for="phone">phone</label> 
						<input type="text" class="form-control" id="phone" name="phone" placeholder="XXX-XXXX-XXXX" size="13">
						<div class="invalid-feedback">Please enter a valid phone number for shipping updates.</div>
					</div>

					<div class="col-md-6 mb-3">
						<label for="address">Address</label> 
						<input type="text" class="form-control" id="address" name="address" placeholder="XX시  XX구  XX동 XXXXX" required="">
						<div class="invalid-feedback">Please enter your shipping
							address.</div>
					</div>

				

					<div class="col-md-6 mb-3">
						<a href="javascript:submit();" class="btn btn-primary btn-md btn-block">Sign Up</a>
					</div>
				</form>
			</div>

		</div>
		<!-- Footer -->
		<%@ include file="i-footer.jsp"%>

	</div>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="js/clean-blog.min.js"></script>
	
<script type="text/javascript">
	var d = new Date();
	
	var date = leadingZeros(d.getFullYear(), 4) + '-' +
	
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	
	    leadingZeros(d.getDate(), 2) + ' ';

	document.getElementById('regdate').value = date;
	
	function submit() {
		if(!document.getElementById('name').value){
			document.getElementById('name').focus();
			return ;
		}
		if(!document.getElementById('email').value){
			document.getElementById('email').focus();
			return ;
		}
		if(!document.getElementById('pw').value){
			document.getElementById('pw').focus();
			return ;
		}
		if(!document.getElementById('phone').value){
			document.getElementById('phone').focus();
			return ;
		}
		if(!document.getElementById('address').value){
			document.getElementById('address').focus();
			return ;
		}
		
		document.getElementById('form').submit();
		
	}
	function leadingZeros(n, digits) {
	    var zero = '';
	    n = n.toString();
	    if (n.length < digits) {
	        for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	    }
	    return zero + n;
	}
</script>
	
</body>
</html>
