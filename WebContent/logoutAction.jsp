<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃 페이지</title>
</head>
<body>
	<%
		session.invalidate(); // 접속한 회원의 세션을 빼앗음
	%>

	<script>	//메인으로 이동
		location.href = 'index.html';
	</script>
	
</body>
</body>
</html>