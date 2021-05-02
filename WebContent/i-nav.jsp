<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">Blog 1712007</a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
			<c:if test="${sessionScope.email ne null }">
				<li class="nav-item">
					<a class="nav-link" href="blog-create.jsp">writeblog</a>
				</li>
			</c:if>
				<li class="nav-item">
					<a class="nav-link" href="blog-list.do">showblogs</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="post.jsp">SamplePost</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Test</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="test.jsp">DB Connection Test</a>
						<a class="dropdown-item" href="cookie.jsp">Cookie Test</a>
					</div>
				</li>
				<c:choose>
					<c:when test="${sessionScope.email eq null}">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Member</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="member-create.jsp">Sign Up</a> 
								<a class="dropdown-item" href="member-login.jsp">Login</a>
							</div>
						</li>
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Blog</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="blog-list.do">Read Blog List</a>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</li>
					</c:when>
					<c:when test="${sessionScope.email ne null}">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Member</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
							<c:if test="${sessionScope.email eq 'root@induk.ac.kr' }">
								<a class='dropdown-item' href='member-list-view.do'>Member List</a>
							</c:if>
							<c:if test="${sessionScope.email ne 'root@induk.ac.kr' }">
								<a class='dropdown-item' href='member-read.do'>My page</a>
							</c:if>
								<a class='dropdown-item' href='member-logout.do'>Logout</a>
							</div>
						</li>
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Blog</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="blog-create.jsp">Create Blog</a>
								<a class="dropdown-item" href="blog-list.do">Read Blog List</a>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
