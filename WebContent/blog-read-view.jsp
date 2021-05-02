<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <%@ include file="i-head.jsp" %>
  <title>Post : Clean Blog - Start Bootstrap Theme</title>

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
          <div class="post-heading">
            <h2>Man must explore, and this is exploration at its greatest</h2>
            <h3 class="subheading"></h3>
            <span class="meta">Posted by
              <a href="#">Start Bootstrap</a>
              on August 24, 2019</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Post Content -->
  <article>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <h2 class="section-heading">${blog.title }</h2>
		  <p>${blog.content }</p>	
          <a href="#">
            <img class="img-fluid" src="./files/${blog.filepath}" alt="">
          </a>
          <span class="caption text-muted">To go places and do things that have never been done</span>
          
          <p> 
          	Written ${blog.reg_date_time } 
          	Photographs by 
          	<a href="#">${blog.blogger }</a>.
		  </p>
		  <br>
          <c:if test="${sessionScope.email eq blog.blogger }">
       		<div class="clearfix">
       		   <a class="btn btn-primary float-left" href="blog-delete-form.do?no=${blog.no }">&larr; 삭제 </a>
    		   <a class="btn btn-primary float-right" href="blog-update-form.do?no=${blog.no }">수정 &rarr;</a>
     		</div>
          </c:if>
          
        </div>
      </div>
    </div>
  </article>
   <br>     
  <hr>

  <!-- Footer -->
  <%@ include file="i-footer.jsp" %>
  
  	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for this template -->
	<script src="js/clean-blog.min.js"></script>
  
</body>

</html>
