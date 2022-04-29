<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String name=request.getParameter("name");
String nickname=request.getParameter("nickname");
String pw=request.getParameter("pw");
String contact=request.getParameter("contact");
String addr=request.getParameter("addr");
String email=request.getParameter("email");
String company=request.getParameter("company");

//DTO에 데이터 넘겨줄 것:세팅
MemberDto dto=new MemberDto();


//DAO에 DTO데이터를 넘겨주어 update호출
MemberDao dao=new MemberDao();
dao.memberUpdate(dto);

//목록으로 다시 이동
response.sendRedirect("memberlist.jsp");
%>
</body>
</html>