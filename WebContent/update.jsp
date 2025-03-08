<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>

<!DOCTYPE html>

<html>

<head>
<title>글 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
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

<body id="page-top">

	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		if(userID==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int bbsID=0;
		if(request.getParameter("bbsID")!=null)
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		if(bbsID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		//작성자가 본인인지?
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
	%>
	
	
	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a class="js-scroll-trigger"
				href="#page-top">Welcome!</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="index.jsp">홈</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#about">골드의 탄생</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#services">서비스</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="http://localhost:8080/BBS/writeAction.jsp">가게 등록하러 가기!</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#contact">연락</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="logoutAction.jsp">로그아웃</a></li>
		</ul>
	</nav>
</head>

<body>


	<!-- 게시판 -->

	<div class="container">
		<div class="row" style="padding-top: 50px;">
			<form method="post" encType = "multipart/form-data" action="updateAction.jsp?bbsID=<%= bbsID %>" style="width: 1080px;">
				<table class="table table-striped mt-5"
					style="text-align: center; border: 1px solid #ba9106">
					<thead>
						<tr>
							<th colspan="4" style="background-color: hsl(41, 100%, 80%); text-align: center;">가게등록 수정 양식</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="가게명을 입력하세요" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
						</tr>
						<tr>
							<td><select class="form-control" name="bbsDivide" <%= bbs.getBbsDivide() %>>
								<option value="제목">제목</option>
								<option value="음식점">음식점</option>
               		    		 <option value="미용실">미용실</option>
                 			     <option value="병원">병원</option>
                 			     <option value="마트">마트</option>
                 			     <option value="네일">네일</option>
                 			     <option value="약국">약국</option>
                 			     <option value="편의점">편의점</option>
                 			     <option value="카페">카페</option>
                 			     <option value="제과점">제과점</option>
                 			     <option value="공방">공방</option>
                 			     <option value="숙박">숙박</option>
                 			     <option value="건강관리">건강관리</option>
                 			     <option value="서점">서점</option>
                 			     <option value="문구">문구</option>
                 			     <option value="기타">기타</option>
                 			     
                 			     
                 			     </select>
						 	</td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="가게를 자유롭게 소개해 보세요" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="가게 해시테그를 입력해주세요 (최대 3개, 한개당 6자 이내)"
									name="bbsHashtag" maxlength="20"><%= bbs.getBbsHashtag() %></textarea></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="가게주소를 입력하세요" name="bbsAddress" maxlength="50" ><%= bbs.getBbsAddress() %></textarea></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="전화번호를 입력하세요" name="bbsNumber"  maxlength="15"><%= bbs.getBbsNumber() %></textarea></td>
						</tr>
						<tr>
							<td colspan="5" ><input type="file" name="fileName"></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right"
					value="수정하기!" style="border-left-width: 0px;" />
			</form>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<ul class="list-inline mb-5">
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#!"> <i
						class="icon-social-facebook"></i>
				</a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#!"> <i
						class="icon-social-twitter"></i></a></li>
			</ul>
			<p class="text-muted small mb-0">Copyright &copy; 골목으로 드루와!
				2020</p>
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
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>
