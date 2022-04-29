<%@page import="data.dao.CommentDao"%>
<%@page import="data.dto.CommentDto"%>
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
CommentDto dto=new CommentDto();

dto.setId(request.getParameter("id"));
String id=request.getParameter("id");
//System.out.println("dd"+id);
dto.setBnum(request.getParameter("bnum"));
String bnum=request.getParameter("bnum");
dto.setContent(request.getParameter("content"));

String currentPage=request.getParameter("currentPage");

CommentDao dao=new CommentDao();
dao.insertComment(dto);

//목록 보던페이지로 이동
response.sendRedirect("../index.jsp?container=commnunity/detail.jsp?bnum="+bnum+"&currentPage="+currentPage);
%>
</body>
</html>