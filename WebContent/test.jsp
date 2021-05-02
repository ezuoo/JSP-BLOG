<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*"%>  
<%
  	Connection conn = null;
	String str = "";

  try{
	 String url = "jdbc:mysql://localhost:3306/jsp?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
     String dbId = "root";
     String dbPw = "1234";
	
	 Class.forName("com.mysql.jdbc.Driver");
	 conn = DriverManager.getConnection(url,dbId ,dbPw );

	 str = "제대로 연결되었습니다.";
	 
  }catch(Exception e){
	  
	  str = "연결되지 않았습니다.";
	  
	 e.printStackTrace();
  }
%>  
<!DOCTYPE html>
<html>
<head>

  <%@ include file="i-head.jsp" %>
  <title>Index : Clean Blog - Start Bootstrap Theme</title>

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
          	<c:set var="test" value="<%=str %>"/>
            <h1>${test }</h1>
            
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <div class="post-preview">
        	test
        </div>
      </div>
    </div>
  </div>

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
