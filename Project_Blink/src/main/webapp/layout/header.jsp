<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
html {
	height: 100%;
	background-image: linear-gradient(to right top, #8e44ad 0%, #3498db 100%);
}

.logoimg {
display: inline-block;
	padding: 15px 0 0 30px;
}

nav {
	float: right; max-width : 960px;
	mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #ffffff 25%, #ffffff 75%, rgba(255, 255, 255, 0) 100%);
	margin: 0 auto;
	padding: 8px 0;
	max-width: 960px;
}

nav ul {
	text-align: center;
	background: linear-gradient(90deg, rgba(255, 255, 255, 0.0) 0%, rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0.5) 100%);
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 0px rgba(255, 255, 255, 0.6);
}

nav ul li {
	display: inline-block;
}

nav ul li a {
	padding: 18px;
	font-family: 'Noto Sans KR';
	text-transform: uppercase;
	color: rgba(0, 35, 122, 0.7);
	font-size: 18px;
	text-decoration: none;
	display: block;
}

nav ul li a.main {
	padding: 18px;
	font-family: 'Noto Sans KR';
	text-transform: uppercase;
	color: rgba(255, 255, 255, 1);
	font-size: 18px;
	text-decoration: none;
	display: block;
}

nav ul li a:hover, a.login {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
	background: rgba(255, 255, 255, 0.1);
	color: rgba(0, 35, 122, 0.7);
	text-decoration: none;
}

a.login:hover {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), outset 0 0 1px rgba(255, 255, 255, 0.6);
	background: rgba(142, 68, 173, 0.15);
	color: rgba(0, 35, 122, 0.7);
	text-decoration: none;
}

a:link {text-decoration:none;
}
a:visited { 
text-decoration:none;
}
a:active {
text-decoration:none;
}
a:

</style>
</head>
<%
	String loginOk=(String)session.getAttribute("loginOk");
	String loginId=(String)session.getAttribute("loginId");
%>
<body>
<!-- 로고 영역 -->
<div class="logoimg">
<img alt="" src="images/title_logo.png" height="55" style="cursor: pointer;" onclick="location.href='index.jsp?container=layout/container.jsp'">
</div>

<!-- 메뉴 영역 -->
<nav>
  <ul>
    <li>
      <a href="index.jsp?container=layout/container.jsp" class="main">Home</a>
    </li>
    <li>
      <a href="index.jsp?container=gongmoa/gongmoaform.jsp">공모전</a>
    </li>
    <li>
      <a href="index.jsp?container=qa/qaMain.jsp">Q&A</a>
    </li>
    <li>
      <a href="index.jsp?container=community/communitylist.jsp">커뮤니티</a>
    </li>
    <li>
      <a href="index.jsp?container=review/reviewlist.jsp">공모전 후기</a>
    </li>
	<%
		// 로그인 상태: 마이페이지, 비로그인 상태: 회원가입
		if (loginOk == null || loginOk.equals("")) {
		%>
		<li>
			<a href="index.jsp?container=member/signup.jsp">회원가입</a>
		</li>
		<li>
      		<a href="login/login.jsp" class="login">로그인</a>
		</li>
		<% } else {
		%>
		<li>
      		<a href="login/logoutproc.jsp" class="login">로그아웃</a>
		</li>
		<% }
	%>
    <li>
    	<span style="padding: 7px;"></span>
    </li>
  </ul>
</nav>
</body>
</html>