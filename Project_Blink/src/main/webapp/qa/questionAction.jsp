
<%@page import="data.dao.MemberDao"%>
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

String loginOk=(String)session.getAttribute("loginOk"); //세션가져오기
String loginId=(String)session.getAttribute("loginId"); //이메일 가져오기

//멤버dao가져오기
MemberDao dao = new MemberDao();

//로긴 아이디 값을 스트링 아이디로 변환? 가져오기?
String id = dao.getId(loginId);


//정수값으로 넣어야하는데 스트링으로 넣어서 못불러오는게 아닌가?
//dao 처음부터 싹다 작성 해봄 안됨...
//db랑 연결이 안된건가 로그인 자체는 됬고 리스트에서는 잘 받아짐
//로긴아이디로 하니까 잘 받아짐
//


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
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	
	//dto에 담아서 insert
	QuestionDto dto = new QuestionDto();
	
	dto.setId(id);
	dto.setSubject(subject);
	dto.setContent(content);
	
	//db선언
	QuestionDao qdao = new QuestionDao();
	
	//insert호출
	qdao.insertQuestion(dto);
	
	//창닫기
 	
	


	
}catch(Exception e){

}

%>
</body>
</html>