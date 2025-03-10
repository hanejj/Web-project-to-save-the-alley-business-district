<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 자바 클래스 사용 -->
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>골드 회원가입 페이지</title>
</head>
<body>

	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("'이미 로그인이 되어있습니다.");
		script.println("<script>");
		script.println("location.href = 'index.html'");
		script.println("<script>");
	}

	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null) { // 사용자가 입력을 안해서 null값이 들어감

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");

	} else {
		UserDAO userDAO = new UserDAO(); //인스턴스생성
		int result = userDAO.join(user);
		if (result == -1) { // 아이디가 기본키기. 중복되면 오류.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}

		//가입성공

		else {

			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter(); //script 사용
			script.println("<script>");
			script.println("alert('골드에 가입해주셔서 감사합니다!')");
			script.println("location.href = 'index.html'");
			script.println("</script>");
		}
	}
	%>
</body>
</body>
</html>