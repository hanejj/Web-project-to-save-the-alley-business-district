<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>골드(Goldu): 골목으로 드루와!</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/fontawesome-free/css/all.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="css/stylish-portfolio.css" rel="stylesheet">

</head>

<body id="page-top" background="img/login.png" style="background-position: center center ;  background-size: cover; background-repeat: no-repeat;">

	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {

		userID = (String) session.getAttribute("userID");
	}
	%>

	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a class="js-scroll-trigger"
				class="active" href="index.jsp">Welcome!</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="index.html">홈</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#about">골드의 탄생</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#services">서비스</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#register">가게 등록하러 가기!</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#contact">연락</a></li>
			<%
				if (userID == null) {
			%>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="login.jsp">로그인</a></li>
			<%
				} else {
			%>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="logoutAction.jsp">로그아웃</a></li>
			<%
				}
			%>


		</ul>
	</nav>
	<div class="container" style="margin-top: 100px;padding-top: 0px;border-left-width: 25%;padding-left: 20%;">
        <div class="col-lg-8"></div>
        <div class="col-lg-8">
		<div class="jumbotron" style="padding-top: 30px;padding-bottom: 40px;">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align: center;" >골드 로그인 화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="로그인">
			</form>
			<div class="col-lg-4"></div>
			<input type="submit" class="btn btn-primary form-control" value="회원가입 하기!" onClick="location.href='join.jsp';" style="margin-top: 15px;">
		</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<ul class="list-inline mb-5">
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="https://web.facebook.com/profile.php?id=100008798975481"> <i
						class="icon-social-facebook"></i>
				</a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3"
					href="https://www.instagram.com/yuri_ss9656/"> <i
						class="icon-social-instagram"></i>
				</a></li>
			</ul>
			<p class="text-muted small mb-0" text="F8F8F8">Copyright &copy; 골목으로 드루와! 2020</p>
		</div>
	</footer>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/stylish-portfolio.min.js"></script>
	<div class="half bg"></div>
	
</body>
</html>