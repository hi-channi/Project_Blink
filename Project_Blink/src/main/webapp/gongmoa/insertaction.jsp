<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.ContestDao"%>
<%@page import="data.dto.ContestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String realPath=getServletContext().getRealPath("/images");

int uploadSize=1024*1024*2;
MultipartRequest multi=null;

try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
			new DefaultFileRenamePolicy());
	 
	//request아니고 multi로 폼데이터 읽어오기
	String subject=multi.getParameter("subject");
	String category=multi.getParameter("category");
	String image=multi.getFilesystemName("image");
	String content=multi.getParameter("content");
	String start_day=multi.getParameter("start_day");
	String finally_day=multi.getParameter("finally_day");
	
	//dto에 저장하기
	ContestDto dto=new ContestDto();
	dto.setSubject(subject);
	dto.setCategory(category);
	dto.setImage(image); 
	dto.setContent(content);
	dto.setStart_day(start_day);
	dto.setFinally_day(finally_day);
	
	String loginId=(String)session.getAttribute("loginId");
	MemberDao mdao=new MemberDao();
	String myid=mdao.getId(loginId);
	dto.setId(myid);
	
	dto.setNickname(loginId);
	
	//dao선언
	ContestDao dao=new ContestDao();
	//dao insert
	dao.insertContest(dto);
	//리스트로 이동
	response.sendRedirect("../index.jsp?container=gongmoa/gongmoaform.jsp");

}catch(Exception e){
	
}



%>

</body>
</html>