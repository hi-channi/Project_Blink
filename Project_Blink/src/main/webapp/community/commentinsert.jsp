<%@page import="data.dto.CommunityDto"%>
<%@page import="data.dao.MemberDao"%>
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
//로그인 상태 가져오기
String loginOk=(String)session.getAttribute("loginOk"); 
//로그인한 아이디 가져오기
String loginId=(String)session.getAttribute("loginId");
//멤버 dao불러오기
MemberDao dao = new MemberDao();
//로그인 아이디(이메일)값을 아이디로 바꿔서 id라는 변수에 넣기
String id = dao.getId(loginId);
//dto에 저장
CommentDto cdto =new CommentDto();
//bnum,id,content 넣기
cdto.setBnum(request.getParameter("bnum"));
//bnum불러와서 변수선언
String bnum2 = request.getParameter("bnum");
cdto.setId(id);
cdto.setContent(request.getParameter("content"));
//comment dao불러오기
CommentDao cdao=new CommentDao();
//cdao의 insercomment메소드 호출
cdao.insertComment(cdto);
//디테일 페이지로 이동
response.sendRedirect("../index.jsp?container=community/detail.jsp?bnum="+bnum2);
%>
</body>
</html>