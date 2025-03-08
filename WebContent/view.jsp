<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>

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
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'list.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>

	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a class="js-scroll-trigger"
				href="#page-top">Welcome!</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="index.html">홈</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#about">골드의 탄생</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#services">서비스</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="http://localhost:8080/BBS/writeAction.jsp">가게 등록하러 가기!</a></li>
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
</head>

<body>



	<!-- 게시판 -->

	<div class="container">
		<div class="row" style="padding-top: 50px;">
			<table class="table table-striped mt-5"
				style="text-align: center; border: 1px solid #ba9106">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: hsl(41, 100%, 80%); text-align: center;">가게소개</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">가게명</td>
						<td colspan="2"><%=bbs.getBbsTitle()%></td>
					</tr>
					<tr>
						<td style="width: 20%;">가게 분류</td>
						<td colspan="2"><%=bbs.getBbsDivide()%></td>
					</tr>
					<%
					String real = "C:/jsp/new_project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BBS/bbsUpload";
					File viewFile = new File(real+"/사진"+bbs.getFile_number()+".jpg");
					int num = bbs.getFile_number();
					String content = bbs.getBbsContent();
					//System.out.printf("num : %d, content = %s\n",num, content);
					if(viewFile.exists()){ 
						//System.out.println("viewFile아 잘있니?");
					%>
					<tr>
						<td style="width: 20%;">가게 소개</td>
						<td colspan="2"style="min-height: 200px; text-align: center;"><br><br>
						<img src = "bbsUpload/사진<%=num %>.jpg" style="width: 65%; height: auto;"><br><br>
							<%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")
						%></td>
						
					
					<% }
					
					else {%>
							<td style="width: 20%;">가게 소개</td>
							<td colspan="2" >
							<%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")
						%><br></br></td>
						<%} %>
					<tr>
						<td style="width: 20%;">가게 해시테그</td>
						<td colspan="2"><%=bbs.getBbsHashtag()%></td>
					</tr>
					<% String bbsAddress = bbs.getBbsAddress().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"); %>
					<tr>
						<td style="width: 20%;">가게주소</td><td colspan="2"><a href="https://map.naver.com/v5/search/<%=bbsAddress%>"><%=bbsAddress %></a></td>
					</tr>
					<tr>
						<td style="width: 20%;">전화번호</td><td colspan="2"><%=bbs.getBbsNumber()%></td>
					</tr>
				</tbody>
			</table>
			<a href="list.jsp" class="btn btn-primary">목록</a>

			<%
				//글작성자 본인일시 수정 삭제 가능 
			if (userID != null && userID.equals(bbs.getUserID())) {
			%>
			<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary pull-right" style="margin-left: 10px; margin-right: 10px;">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary	">삭제</a>
			<% 
				}
			%>
			
			
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
						class="icon-social-twitter"></i>
				</a></li>
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
