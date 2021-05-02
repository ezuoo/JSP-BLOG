<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="i-head.jsp" %>
  <title>Address Table : Clean Blog - Start Bootstrap Theme</title>
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
            <h1>Address Table</h1>
<%
	String email = new String();
	if(session.getAttribute("email") != null){
		email = session.getAttribute("email").toString();
		Cookie cookie = new Cookie("email",email);
		response.addCookie(cookie);
	}
	else{
		email = "No Session Value, No Cookie";
	}
%>
            <span class="subheading"><%= email %></span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <table class="table table-striped table-sm">
      <thead>
        <tr>
          <th>사용자 이름</th>
          <th>이메일</th>
          <th>우편번호</th>
          <th>시도</th>          
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>${requestScope.member.name }</td>
          <td>${member.email }</td>          
          <td>${member['address'].zipcode}</td>        
          <td>${member.address.sido }</td>
        </tr>                 
      </tbody>
    </table>
      </div>
    </div>
  </div>
  
  <hr>

  <!-- Footer -->
  <%@ include file="i-footer.jsp" %>

</body>

</html>
