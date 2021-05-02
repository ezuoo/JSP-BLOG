<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>

<head>

  <%@ include file="i-head.jsp" %>
  <title>Member List : Clean Blog - Start Bootstrap Theme</title>

</head>

<body>

  <!-- Navigation -->
  <jsp:include page="i-nav.jsp" />
  
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>Memeber List</h1>
            <span class="subheading">회원 목록</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
      	<c:forEach items="${requestScope.memberlist }" var="member">      	
	        <div class="post-preview">
	          <a href="member-read.do?email=${member.email }">
	            <h2 class="post-title">E-mail : ${member.email }</h2>
	            <h3 class="post-subtitle">Name : ${member.name }</h3>
	          </a>
	          <p class="post-meta">
	          	PH : 
	          	<a href="#">${member.phone }</a>
	           signed up on ${member.regdate }
			  </p>
	        </div>
	        <hr>
        </c:forEach>
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

</body>

</html>
