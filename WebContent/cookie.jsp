<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <%@ include file="i-head.jsp" %>
  <title>Cookie : Clean Blog - Start Bootstrap Theme</title>
  
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
            <h1>Cookie</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
		<%
			Cookie[] cookies = request.getCookies();
			out.println("현재 설정된 쿠키의 개수 : " + cookies.length + "</br>");
			for (int i = 0; i < cookies.length; i++) {
				out.println(cookies[i].getName() + ":" + cookies[i].getValue() + "<br/>");
			}
		%>
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
