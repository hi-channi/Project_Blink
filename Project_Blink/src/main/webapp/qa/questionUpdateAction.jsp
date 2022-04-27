<%@page import="java.awt.Window"%>
<%@page import="data.dao.QuestionDao"%>
<%@page import="data.dto.QuestionDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Hi+Melody&family=Titillium+Web:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

//톰캣 업로드 경로
String realFolder = getServletContext().getRealPath("/save");
System.out.println(realFolder);

//사이즈
int uploadSize=1024*1024; //1mb

MultipartRequest multi=null;

try{
multi = new MultipartRequest(request,realFolder,uploadSize,"utf-8",
		new DefaultFileRenamePolicy());


	//입력값 읽기
	
	String qnum = multi.getParameter("qnum");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	
	//dto에 담아서 insert
	QuestionDto dto = new QuestionDto();
	
	dto.setQnum(qnum);
	dto.setSubject(subject);
	dto.setContent(content);
	
	//db선언
	QuestionDao dao = new QuestionDao();
	
	//update호출
	dao.updateQuestion(dto);
	
	//창닫기
 	
	


	
}catch(Exception e){

}

%>

</body>
</html>