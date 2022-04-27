<%@page import="data.dao.LoginDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
<title>공모전을 모아 모아, 공모아</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
/* container의 내용의 높이에 따라 div.container 높이 자동 조절 */
function funLoad(){
	var childHeight = $("#main").height()+100;
	//alert(childHeight);		// (영역 높이+100) 값 출력
    $('div.container').css({'height':childHeight+'px'});
	
/* 플로팅 배너 */
	//기본 위치(top)값
	var floatPosition = parseInt($(".sideBanner").css('top'))
	// scroll 인식
	$(window).scroll(function() {
		// 현재 스크롤 위치
		var currentTop = $(window).scrollTop();
		var bannerTop = currentTop + floatPosition + "px";
		//이동 애니메이션
		$(".sideBanner").stop().animate({
			"top" : bannerTop
		}, 800);
	}).scroll();
};
window.onload = funLoad;
window.onresize = funLoad;
</script>
<style type="text/css">
html, body {
	height: 100%;
	background-image: linear-gradient(to right top, #8e44ad 0%, #3498db 100%);
	background-attachment: fixed;
	font-family: 'Noto Sans KR';
}

div.layout {
	border: 0px solid gray;
}

div.header {
	position: relative;
	width: 1100px;
	height: 87px;
	margin: 0 auto;
	top: 2%;
}

div.container {
	overflow: visible;
	position: relative;
	background-color: #fff;
	width: 1100px;
	margin: 0 auto;
	top: 3%;
	padding-left: 50px;
}

div.footer {
	position: absolute;
	background-color: #333333;
	height: 150px;
	margin-top: 80px;
	width: 100%;
}

.sideBanner {
	position: absolute;
	width: 130px;
	height: 200px;
	top: 205px;
	left: 1580px;
	text-align: center;
	color: rgba(0, 35, 122, 0.7);
	background: linear-gradient(0deg, rgba(255, 255, 255, 0.0) 0%,
		rgba(255, 255, 255, 0.2) 30%, rgba(255, 255, 255, 0.5) 100%);
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 0px
		rgba(255, 255, 255, 0.6);
}

div.bannermenu {
	position: relative;
	height: 27px;
	margin: 0 auto;
	width:70%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
	background: rgba(255, 255, 255, 0.1);
	color: rgba(0, 35, 122, 0.7);
	text-decoration: none;
	vertical-align: middle;
	font-family: 'Noto Sans KR'; 
	font-weight: 400;
}

div.bannermenu:hover {
	cursor: pointer;
	background: rgba(142, 68, 173, 0.15);
}
</style>
<%
	String root = request.getContextPath();
	String mainPage = "layout/container.jsp";
	
	if (request.getParameter("container") != null) {
		mainPage = request.getParameter("container");
	}
	
	String loginOk=(String)session.getAttribute("loginOk");
	String loginId=(String)session.getAttribute("loginId");
	
	LoginDao dao=new LoginDao();
	String name=dao.getName(loginId);
%>
</head>

<body>
<!-- header: logo, menu -->
	<div class="layout header">
		<jsp:include page="layout/header.jsp" />
	</div>	
<!-- container -->
<!-- CAUTION: body에 표현되는 모든 콘텐츠는 반드시 <div id="main"></div> 내에 포함시켜 적정 height 값 부여할 것 -->
	<div class="layout container">
		<jsp:include page="<%=mainPage%>" />
	</div>
<!-- footer -->
	<div class="layout footer">
		<jsp:include page="layout/footer.jsp" />
	</div>
	<%
	// 로그인 상태일 경우 플로팅 배너 노출
	if (loginOk == null || loginOk.equals("")) {
	} else {
	%>
		<div class="sideBanner">
			<br>
			<b style="font-size: 1.3em;"><%=name %></b>님
			<br>
			<br>
			<div>
				<div class="bannermenu" onclick="location.href='#'">정보수정</div><br>
				<div class="bannermenu" onclick="location.href='#'">스크랩북</div><br>
				<div class="bannermenu" onclick="location.href='#'">캘린더</div>
			</div>
		</div>
	<% }
	%>
</body>
</html>