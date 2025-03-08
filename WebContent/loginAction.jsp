 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8로 인코딩 시키기 -->

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("'이미 로그인이 되어있습니다.");
			script.println("<script>");
			script.println("location.href = 'index.html'");
			script.println("<script>");
		}
		
		UserDAO userDAO = new UserDAO(); //인스턴스생성
		int result = userDAO.login(user.getUserID(), user.getUserPassword()); //result안에 -1~1까지 담기게 됨

		//로그인 성공
		if(result == 1){
			session.setAttribute("userID", user.getUserID()); 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공!')");
			script.println("location.href = 'index.html'");
			script.println("</script>");

		}

		//로그인 실패

		else if(result == 0){

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디 또는 비밀번호가 맞지 않습니다.')");
			script.println("history.back()"); //전단계로 이동
			script.println("</script>");

		}

		//아이디 없음

		else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 또는 비밀번호가 맞지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}

		//DB오류

		else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");

		}		

	%>

</body>

</body>

</html>