<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
<title>모아 모아 공모아</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="default.css" media="screen">
<script class="u-script" type="text/javascript" src="script.js" defer=""></script>

<style type="text/css">
html, body {
	height: 100%
}

div.layout {
	border: 0px solid gray;
	position: absolute;
}

div.title {
	width: 55%;
	left: 425px;
	height: 100px;
	margin: 50px 0px;
	align-content: center;
}

div.info {
	height: 0px;
	width: 100%;
	position: absolute;
	bottom: -50;
}

div.main {
	width: 55%;
	background-color: #fff;
	left: 400px;
	top: 150px;
	position: relative;
	min-height: 120%;
	padding-bottom: 250px;
}
</style>
<%
String root = request.getContextPath();
String mainPage = "layout/main.jsp";

// url을 통해 main값을 읽어 mainPage에 출력
if (request.getParameter("main") != null) {
	mainPage = request.getParameter("main");
}
%>
</head>
<body style="background-color: #B4FFFF;">
	<div class="layout title">
		<jsp:include page="layout/title.jsp" />
	</div>	
	<div class="layout main">
		<jsp:include page="<%=mainPage%>" />
	</div>
	<div class="layout info">
		<jsp:include page="layout/info.jsp" />
	</div>
</body>
</html>