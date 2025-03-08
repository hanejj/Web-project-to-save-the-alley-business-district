<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" /> 
<jsp:setProperty name="bbs" property="bbsAddress" />
<jsp:setProperty name="bbs" property="bbsNumber" />
<jsp:setProperty name="bbs" property="bbsHashtag" />
<jsp:setProperty name="bbs" property="bbsDivide" />


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>가게 등록</title>
</head>
<body>

	<%
		String userID = null;
		PrintWriter script = response.getWriter();

		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.

		}
		String realFolder="";
		String saveFolder = "bbsUpload";		//사진을 저장할 경로
		String encType = "utf-8";
	    int size = 5 * 2048 * 1024; // 저장가능한 파일 크기
	    
	    ServletContext context = this.getServletContext();		//절대경로를 얻는다
	    realFolder = context.getRealPath(saveFolder);			//saveFolder의 절대경로를 얻음
	    
		MultipartRequest multi = null;
		multi = new MultipartRequest(request,realFolder,size,encType,new DefaultFileRenamePolicy());	
	        
	    //form으로 전달받은
		String fileName = multi.getFilesystemName("fileName");
		String bbsTitle = multi.getParameter("bbsTitle");
		String bbsContent = multi.getParameter("bbsContent");
		String bbsDivide = multi.getParameter("bbsDivide");
		String bbsHashtag = multi.getParameter("bbsHashtag");
		String bbsAddress = multi.getParameter("bbsAddress");
		String bbsNumber = multi.getParameter("bbsNumber");

		bbs.setBbsTitle(bbsTitle);
		bbs.setBbsContent(bbsContent);
		bbs.setBbsDivide(bbsDivide);
		bbs.setBbsHashtag(bbsHashtag);
		bbs.setBbsAddress(bbsAddress);
		bbs.setBbsNumber(bbsNumber);

		
		if (userID == null) {

			//PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");

		} else {
			int number = 0;
			
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null || bbs.getBbsAddress() == null || bbs.getBbsNumber() == null 
					|| bbs.getBbsHashtag() == null) {
			
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");

			} else {
				
				number = 0;
				if(fileName != null){
					final String PICTURE_PATH = realFolder;
					File[] fList = new File(PICTURE_PATH).listFiles();
					number = fList.length - 1;
					
					File oldFile = new File(realFolder+"\\"+fileName);
					File newFile = new File(realFolder+"\\사진"+(number + 1)+".jpg");
					boolean flag = oldFile.renameTo(newFile);
					//if(flag) System.out.println("성공");
					//else System.out.println("실패");
				}
			
				BbsDAO bbsDAO = new BbsDAO();
				
				int result = bbsDAO.write(bbs.getBbsTitle(), bbs.getBbsContent(), bbs.getBbsAddress(), bbs.getBbsNumber(), 
						userID, bbs.getBbsHashtag(), bbs.getBbsDivide(), number + 1);
				
				if (result == -1) {
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");

				} else {
					script.println("<script>");
					script.println("alert('가게등록이 완료되었습니다.')");
					script.println("location.href='list.jsp'");
					script.println("</script>");

				}

			}
		}

	%>
</body>
</html>