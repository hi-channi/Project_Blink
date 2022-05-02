<%@page import="data.dao.LoginDao"%>
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
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}
.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:60%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
.btn:hover {
  background-position: right;
}
</style>
<title>Insert title here</title>
</head>
<body>
<%
	//세션으로부터 id얻기
	String email=(String)session.getAttribute("emailok");
	
	//id에 해당하는 이름 얻기
	LoginDao dao=new LoginDao();
	String name=dao.getName(email);
	response.sendRedirect("../index.jsp?container.jsp");
%>

<br>
<br>
<b style="color: gray"><%=name %></b>님 회원가입을 축하합니다.
<hr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-success" style="width: 120px; margin-left: 30px;" onclick="location.href='login/login.jsp'">로그인 하기</button>
<button type="button" class="btn btn-success" style="width: 120px; margin-left: 30px;" onclick="location.href='../index.jsp?container.jsp'">홈으로 이동</button>
<br>
<br>
</body>
</html>