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
AnswerDto dto =new AnswerDto();
dto.setQnum(request.getParameter("qnum"));
//현재 벨류가 눌이라 이거 하면 반환이 안됨dto.setId(request.getParameter("id"));
dto.setContent(request.getParameter("content"));

String qnum2 = request.getParameter("qnum");

AnswerDao dao=new AnswerDao();
dao.insertAnswer(dto);

//보던페이지로 이동
response.sendRedirect("questionContent.jsp?qnum="+qnum2);
%>


</body>
</html>