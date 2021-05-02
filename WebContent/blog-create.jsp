<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<%@ include file="i-head.jsp"%>
<title>Blog Create : Clean Blog - Start Bootstrap Theme</title>

</head>

<body>

	<!-- Navigation   -->
	<jsp:include page="i-nav.jsp" />

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('img/contact-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>Write a Blog</h1>
						<span class="subheading">블로그에 글을 남기십시요</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<form action="blog-create.do" method="post" action="blog-create.do" enctype="multipart/form-data" id="contactForm" novalidate>
					<input type="hidden" name="reg_date_time" id="reg_date_time" value="">
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<input type="hidden" name="blogger" value="${sessionScope.email }">
							<label>Title</label> 
							<input type="text" class="form-control" name="title" 
							placeholder="Title" id="title" required data-validation-required-message="Please enter your name.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Content</label>
							<textarea rows="5" class="form-control" name="content"
								placeholder="Content" id="content" required
								data-validation-required-message="Please enter a message."></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>File</label> <input type="file" class="form-control"
								name="filepath" placeholder="File Path" id="filepath" required
								data-validation-required-message="Please enter your name.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div class="form-group" align="center">
						<a href="javascript:write();" class="btn btn-primary">Write</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="i-footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for this template -->
	<script src="js/clean-blog.min.js"></script>

	<script type="text/javascript">
	
		var d = new Date();

	    var date = leadingZeros(d.getFullYear(), 4) + '-' +
	
	        leadingZeros(d.getMonth() + 1, 2) + '-' +
	
	        leadingZeros(d.getDate(), 2) + ' ';
	
	    var time = leadingZeros(d.getHours(), 2) + ':' +
	
	        leadingZeros(d.getMinutes(), 2) + ':' +
	
	        leadingZeros(d.getSeconds(), 2);
	        
	    var reg_date_time = date+""+time;
 		
    	document.getElementById('reg_date_time').value = reg_date_time;

		function write() {
			
			if(!document.getElementById('title').value){
				document.getElementById('title').focus();
				return ;
			}
			if(!document.getElementById('content').value){
				document.getElementById('content').focus();
				return ;
			}
			document.getElementById('contactForm').submit();
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
