<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
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


AnswerDto dto =new AnswerDto();


dto.setQnum(request.getParameter("qnum"));
dto.setId(id);
dto.setContent(request.getParameter("content"));

String qnum2 = request.getParameter("qnum");

AnswerDao adao=new AnswerDao();
adao.insertAnswer(dto);

//보던페이지로 이동
response.sendRedirect("../index.jsp?container=qa/questionContent.jsp?qnum="+qnum2);
%>


</body>
</html>