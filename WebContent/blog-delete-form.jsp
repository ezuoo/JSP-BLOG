<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="i-head.jsp" %>
  <title>Blog Delete : Clean Blog - Start Bootstrap Theme</title>
</head>

<body>

  <!-- Navigation -->
  <%@ include file="i-nav.jsp" %>
  
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/post-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Blog Delete</h1>
            <span class="subheading">삭제하시려면 비밀번호를 입력해주세요</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        	<form action="blog-delete.do" method="post" id="form">
        		<input type="hidden" name="no" value="${no }">
        		<input type="hidden" name="email" value="${sessionScope.email }">
				<div class="control-group">
					<div class="form-group floating-label-form-group controls">
						<label>password</label>
						<input type="password" class="form-control" name="pw" placeholder="Input Your Password" id="pw">
					</div>
				</div>
				<br>
				<div class="clearfix">
    		  		 <a class="btn btn-primary float-right" href="javascript:checkValue();">삭제 &rarr;</a>
     			</div>
			</form>
      </div>
    </div>
  </div>
  <!-- Footer -->
  <%@ include file="i-footer.jsp" %>
	<script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Custom scripts for this template -->
  <script src="js/clean-blog.min.js"></script>
	<script type="text/javascript">
		function checkValue() {
			if(!document.getElementById('pw').val){
				document.getElementById('pw').focus();
			}
			document.getElementById('form').submit();
		}
	</script>

</body>
</html>
