<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="i-head.jsp" %>
  <title>Exception Occurred : Clean Blog - Start Bootstrap Theme</title>
</head>
<body>

  <!-- Navigation -->
  <%@ include file="i-nav.jsp" %>
  
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/about-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Exception Occurred</h1>
            <span class="subheading">check messages</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <p> Exception : ${requestScope.exceptionMsg }</p>
        
      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <%@ include file="i-footer.jsp" %>
  <!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="js/clean-blog.min.js"></script>

</body>

</html>
