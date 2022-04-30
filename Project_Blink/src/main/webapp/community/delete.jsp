<%@page import="java.io.File"%>
<%@page import="data.dao.CommunityDao"%>
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
String bnum=request.getParameter("bnum");
String currentPage=request.getParameter("currentPage");
//System.out.println(currentPage);
CommunityDao dao=new CommunityDao();


dao.deleteCommunity(bnum);

response.sendRedirect("../index.jsp?container=community/communitylist.jsp?currentPage="+currentPage);

%>
</body>
</html>