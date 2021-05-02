<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <%@ include file="i-head.jsp" %>
  <title>Blog Update : Clean Blog - Start Bootstrap Theme</title>
  
</head>

<body>

  <!-- Navigation -->
  <%@ include file="i-nav.jsp" %>
  
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Update a Blog </h1>
            <span class="subheading">블로그에 글을 수정하십시요</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <form action="blog-update.do" method="post" enctype="multipart/form-data" id="contactForm" novalidate>
        	<input type="hidden" name="no" value="${blog.no }" />
        	<input type="hidden" name="reg_date_time" id="reg_date_time" value="" />
	        <div class="control-group">
	          <div class="form-group floating-label-form-group controls">
	            <label>Title</label>
	            <input type="text" class="form-control" name="title" value="${blog.title }" placeholder="Title" id="title">
	            <p class="help-block text-danger"></p>
	          </div>
			</div>
	        <div class="control-group">
	          <div class="form-group floating-label-form-group controls">
	            <label>Content</label>
	            <textarea rows="5" class="form-control" name="content" placeholder="Content" id="content">${blog.content }</textarea>
	          </div>
	        </div>
	        
          	<div class="control-group">
            	<div class="form-group floating-label-form-group controls">
	              	<label>File</label>
	              	<input type="file" class="form-control" name="filepath" placeholder="File Path" id="filepath">
            	</div>
         	 </div>          
          	<br>
			<div class="form-group" align="center">
				<a href="javascript:write();" class="btn btn-primary">Update</a>
			</div>
		
        </form>
      </div>
    </div>
  </div>


  <!-- Footer -->
  <%@ include file="i-footer.jsp" %>

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
