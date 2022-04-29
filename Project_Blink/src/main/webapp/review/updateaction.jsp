<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dokdo&family=East+Sea+Dokdo&family=Gugi&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
String loginId=(String)session.getAttribute("loginId");
//톰캣 업로드 경로
String realFolder=getServletContext().getRealPath("/save");
//System.out.println(realFolder);


//사이즈
int uploadSize=1024*1024; /* 1mb */

MultipartRequest multi=null;

try{
multi=new MultipartRequest(request,realFolder,uploadSize,"utf-8",
		new DefaultFileRenamePolicy());

	//입력값 읽기
	String rnum=multi.getParameter("rnum");
	//db선언
	ReviewDao dao=new ReviewDao();
	MemberDao mdao=new MemberDao();
	String myid=mdao.getId(loginId);
	
	String old_image=dao.getData(rnum).getImage();
	System.out.println(old_image);	
	
	String subject=multi.getParameter("subject");
	String content=multi.getParameter("content");
	String link=multi.getParameter("link");
	String currentPage=multi.getParameter("currentPage");

	//실제 업로드 이미지 이름 읽어오기
	String image=multi.getFilesystemName("image");
	//System.out.println(image);

	//dto에 담기
	ReviewDto dto=new ReviewDto();
	
	dto.setRnum(rnum);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setLink(link);	
	//사진선택 안했을경우 기존사진 으로 저장
	dto.setImage(image==null?old_image:image);
	
	//로그인
	//System.out.println(loginId);
	//System.out.println(myid);
	dto.setId(myid);
	
	//update
	dao.updateReview(dto); 
	//이동
	response.sendRedirect("../index.jsp?container=review/reviewlist.jsp?rnum="+rnum+"&currentPage="+currentPage);

}catch(Exception e){
	
}

%>
</body>
</html>