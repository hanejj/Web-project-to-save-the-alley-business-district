<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>골드(Goldu): 골목으로 드루와!</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/fontawesome-free/css/all.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap"
	rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="css/stylish-portfolio.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>

</head>

<body id="page-top">

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
				href="#page-top">홈</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#about">골드의 탄생</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#services">서비스</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="list.jsp">가게 목록</a></li>
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

	<!-- Header -->
	<header class="masthead d-flex">
		<div class="container text-center my-auto">
			<h1 class="mb-1">
				골드(Goldu):<br> 골목으로 드루와!
			</h1>
			&nbsp;
			<h3 class="mb-5">
				<em>지역상권 살리기 프로젝트</em>
			</h3>
			<a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">더
				알아보기</a>
		</div>
		<div class="overlay"></div>
	</header>

	<!-- About -->
	<section class="content-section bg-light" id="about">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h2>사이트 방문을 환영합니다.</h2>
					&nbsp;&nbsp;
					<p class="lead mb-5">
						“창업 5년내 폐업률이 72.5%”.<br>기사를 통해 골목상권을 유지하는 자영업자의 어려움을 알게 됐고, 이
						사회문제를 해결하기 위해 <br> 골목상권을 살리는 소프트웨어를 고안해 보기로 했습니다.<br>
						&nbsp;&nbsp;<a class="btn btn-dark btn-xl js-scroll-trigger"
							style="margin-top: 30px;" href="#services">우리가 준비한 것들</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Services -->
	<section class="content-section bg-primary text-white text-center"
		id="services">
		<div class="container">
			<div class="content-section-heading">
				<h3 class="text-secondary mb-0">서비스</h3>
				&nbsp;&nbsp;
				<h2 class="mb-5">우리가 준비한 것들은...</h2>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3"> <i
						class="icon-screen-smartphone"></i>
					</span>
					<h4>
						<strong>가게 등록</strong>
					</h4>
					<p class="text-faded mb-0">가게를 등록해서 위치와 가게를 소개해 보세요!</p>
				</div>
				<div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3"> <i
						class="icon-location-pin"></i>
					</span>
					<h4>
						<strong>내 주변 맛집을 한눈에!</strong>
					</h4>
					<p class="text-faded mb-0">입소문 난 가게들, 백종원의 골목식당에서 나온 맛집들을 한눈에 볼
						수 있어요!</p>
				</div>
				<div class="col-lg-3 col-md-6 mb-5 mb-md-0">
					<span class="service-icon rounded-circle mx-auto mb-3"> <i
						class="icon-organization"></i>
					</span>
					<h4>
						<strong>다양한 카테고리</strong>
					</h4>
					<p class="text-faded mb-0">
						음식점만 다루지 않아요! <i class=> </i> 동네 서점, 잡화점 등 다양하답니다.
					</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<span class="service-icon rounded-circle mx-auto mb-3"> <i
						class="icon-tag"></i>
					</span>
					<h4>
						<strong>차별화</strong>
					</h4>
					<p class="text-faded mb-0">우리는 프랜차이즈를 취급하지 않습니다. 지역마다 있는 소규모
						마트, 시장, 가게에 타겟을 맞췄습니다!</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Register -->
	<section class="content-section" id="register">
		<div class="container">
			<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">가게 등록하기</h3>
				<h2 class="mb-5">현재 등록된 가게들</h2>
			</div>
			<div class="row no-gutters">
				<div class="col-lg-6">
					<a class="portfolio-item"
						href="http://daisy20217.cafe24.com/view.jsp?bbsID=2">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">선매 떡볶이</div>
								<p class="mb-0">[생활의 달인]광명 선매 떡볶이 광명 맛집~</p>
							</div>
						</div> <img class="img-fluid" src="img/store1.jpg" alt="">
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item"
						href="http://daisy20217.cafe24.com/view.jsp?bbsID=1">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">광명 본갈비</div>
								<p class="mb-0">광명에서 소문난 갈비집</p>
							</div>
						</div> <img class="img-fluid" src="img/store2.jpg" alt="">
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item"
						href="http://daisy20217.cafe24.com/view.jsp?bbsID=3">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">광명 농민 식자재 마트</div>
								<p class="mb-0">농민 식자재 마트에서 저렴하게 알뜰살뜰 쇼핑!</p>
							</div>
						</div> <img class="img-fluid" src="img/store3.jpg" alt="">
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item"
						href="http://daisy20217.cafe24.com/view.jsp?bbsID=4">
						<div class="caption">
							<div class="caption-content">
								<div class="h2">데굴데굴 도자기공방</div>
								<p class="mb-0">아들과 가볼만한 도자기 체험</p>
							</div>
						</div> <img class="img-fluid" src="img/store4.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Call to Action -->
	<section class="content-section bg-primary text-white">
		<div class="container text-center">
			<h2 class="mb-4">더 많은 가게들을 보고 싶다면 여기를 누르세요!</h2>
			<a href="list.jsp" class="btn btn-xl btn-light mr-4">Click Me!</a>
		</div>
	</section>
    <!-- Naver Map API -->
    
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=q6ovzyp1o1&submodules=geocoder"></script>
    <div id="map" style="width:100%;height:75vh; margin: 0 auto; float : left"></div>
  
</body>
<script type="text/javascript">
$(function() {
	
	initMap();
	
});

function initMap() {
	
	var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.552758094502494, 126.98732600494576),
        zoom: 15
    });
	
    var marker = new naver.maps.Marker({
        map: map,
        title: "남산서울타워",
        position: new naver.maps.LatLng(37.552758094502494, 126.98732600494576),
        icon: {
            content: '<img src="<c:url value="/resources/img/chu.png"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 32px; height: 32px; left: 0px; top: 0px;">',
            size: new naver.maps.Size(32, 32),
            anchor: new naver.maps.Point(16, 32)
        }
    });
}
	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<ul class="list-inline mb-5">
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3"
					href="https://web.facebook.com/profile.php?id=100008798975481">
						<i class="icon-social-facebook"></i>
				</a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3"
					href="https://www.instagram.com/yuri_ss9656/"> <i
						class="icon-social-instagram"></i>
				</a></li>
			</ul>
			<p class="text-muted small mb-0">Copyright &copy; 골목으로 드루와!
		</div>
	</footer>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/stylish-portfolio.js"></script>

</body>

</html>
