<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>

<!-- 자바 클래스 사용 -->
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="bbs.Bbs"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>가게 등록</title>
</head>
<body>

	<%
		String userID = null;

	if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
		userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.

	}

	if (userID == null) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");

	}
	
	int bbsID = 0;

	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	
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

	if (!userID.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	} else {

		if (
			bbs.getBbsTitle().equals("") || bbs.getBbsContent().equals("") || 
			bbs.getBbsAddress().equals("") || bbs.getBbsNumber().equals("") || bbs.getBbsHashtag().equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");

		} else {
			
			int number = 0;
			if(fileName != null){
				
				String real = "C:/jsp/new_project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BBS/bbsUpload";
				final String PICTURE_PATH = realFolder;
				File[] fList = new File(PICTURE_PATH).listFiles();
				number = fList.length - 1;
				
				File delFile = new File(real+"/사진"+bbs.getFile_number()+".jpg");
				if(delFile.exists()){
					delFile.delete();
				}
				
				File oldFile = new File(realFolder+"\\"+fileName);
				File newFile = new File(realFolder+"\\사진"+(number + 1)+".jpg");
				boolean flag = oldFile.renameTo(newFile);
				//if(flag) System.out.println("성공");
				//else System.out.println("실패");
			}

			BbsDAO bbsDAO = new BbsDAO();

			int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"), request.getParameter("bbsAddress"),
					request.getParameter("bbsNumber"), request.getParameter("bbsHashtag"), request.getParameter("bbsDivide"), number + 1);

			if (result == -1) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");

			} else {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가게수정이 완료되었습니다.')");
				script.println("location.href='list.jsp'");
				script.println("</script>");

			}

		}
	}
	%>
</body>
</html>