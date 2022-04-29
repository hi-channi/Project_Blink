
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
String email=request.getParameter("email");

MemberDao dao=new MemberDao();
MemberDto dto=dao.getMember(email);
%>
<body>
<form action="updateformproc.jsp" method="post">
  <table class="table table-bordered" style="width: 350px;">
    <tr>
      <th>이메일</th>
      <td>
        <input type="text" name="email" size="7"
        value="<%= dto.getEmail() %>">
      </td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td>
        <input type="text" name="pw" size="20"
        value="<%= dto.getPw() %>">
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
      	<!-- hidden으로 email을 넘겨준다..위치는 폼 안에만 있으면 됨 -->
      	<input type="hidden" name="email" value="<%= email %>">
        <input type="submit" value="수정" class="btn btn-info">
        <input type="button" value="홈으로"
        onclick="location.href='index.jsp'"
        class="btn btn-danger">
      </td>
    </tr>
  </table>