<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">

div {
/* 레이아웃 구역 테스트 시 1px 지정 */
border: solid 0px gray;
}

div.cont {
	width: 1000px;
    position: absolute;
    
    padding: 30px;
}

div.head {
	position: relative;
	width: 1000px;
}

div.introTitle{
	display: flex;
	justify-content : center;
	width: 1000px;
	height: 100px;
	margin-top: 30px;
	padding-top: 40px;
	font-family: 'Noto Sans KR';
	font-size: 20pt;
	font-weight: 700;
	text-align: center;
}

div.intro {
	display: flex;
	justify-content : center;
	position: relative;
	width: 1000px;
	height: 300px;
	background-image: linear-gradient(to left top, #8e44ad 0%, #3498db 100%);
	background-size : cover;
	margin-top: 30px;
}

div.center {
	display: flex;
	justify-content : center;
	position: relative;
	width: 1000px;
	height: 200px;
	background-image: linear-gradient(to left top, #8e44ad 0%, #3498db 100%);
	background-size : cover;
	margin-top: 30px;
}

div.sq1 {
	display: inline-block;
	font-family: 'Noto Sans KR';
	background-color: rgba(255, 255, 255, 0.5);
	text-align: center;
	float: left;
	width: 200px;
	height: 250px;
	padding: 35px 20px 0 20px;
	margin: 25px 20px;
	cursor: pointer;
	
}

.introText {
    font-size: 50px;
    font-weight: 900;
    letter-spacing :1%;
    background: linear-gradient(to left top, #8e44ad 0%, #3498db 100%);
    color: transparent;
    -webkit-background-clip: text;
}

img {
	opacity: 0.7; 
	margin-bottom: 10px;
}

</style>
</head>
<body>
<!-- 전체 영역 -->
	<div class="cont" id="main" style="height: 1200px;'">
<!-- 상단 구역 -->
		<div class="head">
			<table style="width: 1000px; ">
				<tr>
					<td width="550" style="vertical-align:middle; ">
					<jsp:include page="main2.jsp" />
					</td>
					<td style="vertical-align:middle; padding-left: 50px; text-align: right;">
					<h2 class="introText">
					당신이 원하는<br>
					공모전<br>팀원<br>
					</h2>
					<br>
					<h2 class="introText">
					공모아에서<br>
					</h2>
					<br>
					</td>
				</tr>
			</table>
		</div>
<!-- 중단 구역 -->
		<div class="center" style="color: white;">
		<br>임시 영역
		</div>
<!-- 하단 구역 -->
		<div class="introTitle">
			공모아는 당신의 멋진 경험을 도와요
		</div>
		<div class="intro">
			<div class="sq1" onclick="location.href='index.jsp?container=gongmoa/gongmoaform.jsp'">
				<img alt="" src="images/icon_preview.png" width="60"><br>
				<span style="font-weight: bold; font-size: 1.5em">공모전 모아보기</span> <br>
				<br> <span> 지금 진행되는<br> 모든 공모전을<br>모아볼 수 있어요
				</span>
			</div>
			<div class="sq1" onclick="location.href='index.jsp?container=qa/qaMain.jsp'">
				<img alt="" src="images/icon_qna.png" width="60"><br>
				<span style="font-weight: bold; font-size: 1.5em">Q&A</span> <br>
				<br> <span> 공모전 담당자가 직접<br> 자세하게 답변해<br>알 수 있어요
				</span>
			</div>
			<div class="sq1" onclick="location.href='index.jsp?container=community/communitylist.jsp'">
				<img alt="" src="images/icon_community.png" width="60"><br>
				<span style="font-weight: bold; font-size: 1.5em">커뮤니티</span> <br>
				<br> <span> 자유로운 정보 공유 및<br> 함께 공모전에 참여할<br>팀원을 구할 수 있어요
				</span>
			</div>
			<div class="sq1" onclick="location.href='index.jsp?container=review/reviewlist.jsp'">
				<img alt="" src="images/icon_review.png" width="60"><br>
				<span style="font-weight: bold; font-size: 1.5em">우수후기</span> <br>
				<br> <span> 지난 공모전에서 수상한<br> 후기를 통해<br>노하우를 얻을 수 있어요
				</span>
			</div>
		</div>
	</div>
</body>
</html>