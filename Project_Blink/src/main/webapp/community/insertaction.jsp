<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.CommunityDao"%>
<%@page import="data.dto.CommunityDto"%>
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

String loginId=(String)session.getAttribute("loginId");

CommunityDto dto=new CommunityDto();

dto.setId(request.getParameter("id"));
dto.setSubject(request.getParameter("subject"));
dto.setContent(request.getParameter("content"));

MemberDao mdao=new MemberDao();
String myid=mdao.getId(loginId);
//System.out.println(loginId);
//System.out.println(myid);
dto.setId(myid);

CommunityDao dao=new CommunityDao();
dao.insertCommunity(dto);

//목록
response.sendRedirect("../index.jsp?container=community/communitylist.jsp");
%>
</body>
</html>