<%@page import="data.dao.LoginDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

.btn {
	border: solid 1px gray;
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:150px;
  height:60px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;

  cursor:pointer;
  transition: 0.4s;
  display:inline;
  align-items: center;
}

b{text-align: center;}
</style>
</head>
<body>
<div id="main" style="height: 700px;">
<%
	String loginId=request.getParameter("email");
	LoginDao dao=new LoginDao();
	// 세션에 저장된 아이디 얻기
	String name=dao.getName(loginId);
%>
	<div class="intro">
		<b><%=name %>님,</b>
		회원가입을 축하합니다.
		<br>
		<br>
		<button type="button" class="btn" style="width: 120px; margin-left: 30px;" onclick="location.href='login/login.jsp'">로그인</button>
	</div>


</div>
<!-- <div style="margin: 0 auto; width: 100%">
	<img alt="" src="..img/logo2.png" style="width: 500px;">
	<br>
	<b>님의 회원가입을 축하합니다</b>
	<br><br>
	<button type="button" class="btn"
	onclick="location.href='../login/loginform.jsp'">로그인</button>
	<button type="button" class="btn"
	onclick="location.href='../index.jsp'">메인페이지</button>
</div> -->
</body>
</html>