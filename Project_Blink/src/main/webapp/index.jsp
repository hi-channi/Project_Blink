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
}
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

</style>
<%
	String root = request.getContextPath();
	String mainPage = "layout/container.jsp";
	
	if (request.getParameter("container") != null) {
		mainPage = request.getParameter("container");
	}
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
</body>
</html>