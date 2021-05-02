<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <%@ include file="i-head.jsp" %>
  <title>Contact : Clean Blog - Start Bootstrap Theme</title>
  
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
            <h1>Login</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">

        <form name="login" id="loginForm" action="member-login.do" method="post" novalidate>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>Email</label>
              <input type="text" class="form-control" name="email" placeholder="Email" id="Email" required data-validation-required-message="Please enter your Email.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>password</label>
              <input type="password" class="form-control" name="pw" placeholder="Password" id="pw" required data-validation-required-message="Please enter your Password.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <br>
          <div class="form-group" align="center">
            <button type="submit" class="btn btn-primary" id="sendMessageButton">Login</button>
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
  <!-- Contact Form JavaScript -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>


</body>

</html>
