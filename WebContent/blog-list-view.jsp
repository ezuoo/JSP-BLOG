<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
  <%@ include file="i-head.jsp" %>
  <title>Blog List : Clean Blog - Start Bootstrap Theme</title>
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
            <h1>Blog List</h1>
            <span class="subheading">블로그 목록</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
      	<c:forEach items="${requestScope.bloglist }" var="blog">      	
	        <div class="post-preview">
	          <a href="blog-read.do?no=${blog.no }">
	            <h2 class="post-title">${blog.title }</h2>
	            <h3 class="post-subtitle">${blog.content }</h3>
	          </a>
	          <p class="post-meta">
	          	Posted by
	          	<a href="#">${blog.blogger }</a>
	            on ${blog.reg_date_time }
			  </p>
	        </div>
	        <hr>
        </c:forEach>
        <!-- Pager -->
        <br>
        <div class="clearfix">
          <c:if test="${page < pageMax  }">
          	<a class="btn btn-primary float-right" href="blog-list.do?page=${page + 1 }">Next &rarr;</a>
          </c:if>
          
          <c:if test="${page ne 1 }">
          	<a class="btn btn-primary float-left" href="blog-list.do?page=${page - 1 }">&larr; Prev </a>
          </c:if>
          
        </div>
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
