<%@page import="data.dao.MemberDao"%>
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
    <style type="text/css">
body {
		background-color:cyan;
	}    
    
input[id*="answer"]{
	display:none;
}

input[id*="answer"] + label{
	padding:20px;
	border: 1px solid cyan;
	border-bottom: 0;
	color:white;
	font-size:15px;
	background: #2cccc4;
	cursor:pointer;
	position:relative;
	height:60px;
	width:1100px;
	vertical-align: bottom;
}

input[id*="answer"] + label + div {
	max-height:0;
	transition: all .4s;
	overflow:hidden;
	background:white;
	font-size:13px;
}

input[id*="answer"] + label + div p{
	display:inline-block;
	padding:20px;
}

input[id*="answer"]:checked + label + div {max-height:100px;}
    </style>
<script type="text/javascript">
$(function(){

	
	//문의사항 입력 ...questionForm.jsp
	$("#btnquestion").click(function(){
		
		window.open("qa/questionForm.jsp","","width=550px,height=500px,left=500px,top=100px");
	});
	
});


</script>
</head>
<body>

<% //로그인 상태 확인 및 처리됬는지 확인
	String loginOk=(String)session.getAttribute("loginOk"); //세션가져오기
	String loginId=(String)session.getAttribute("loginId"); //이메일 가져오기
		
	MemberDao dao = new MemberDao();
	String id = dao.getId(loginId);
	String nickname = dao.getNickname(id);
	String membertype = dao.getMembertype(id);
%>

<div id="main" style="height: 100%; width:100%;" >

<div class="accordion">
<input type="checkbox" id="answer1">
<label for="answer1">Q&A 게시판의 사용 방법을 알려주세요<em></em></label>
<div><p>Q&A 게시판은 공모전에 대한 더 자세한 정보나 팁을 공유하기 위해 만들어졌습니다.<br>
커뮤니티 게시판은 누구나 자유롭게 글/댓글 작성을 할 수 있지만 Q&A 게시판은 일반 회원만 질문이 가능하며<br>
답변은 
</p></div>
<input type="checkbox" id="answer2">
<label for="answer2">주찬님은 누구인가요?<em></em></label>
<div><p>SQL이랑 Git잘알 이셔서 초반에 세팅하실때 도움을 정말 많이 주신분입니다. </p></div>
<input type="checkbox" id="answer3">
<label for="answer3">태호님은 누구인가요?<em></em></label>
<div><p>이번에 공모아를 만들면서 로고 디자인 작업을 잘해주시는 능력자이십니다.</p></div>
<input type="checkbox" id="answer4">
<label for="answer4">효림님은 누구인가요?<em></em></label>
<div><p>피피티 작업과 발표를 맡아 주셨는데 발표를 정말 잘해주신 분입니다.<br>
피피티 표 수정했는데 안써주셔서 가슴이 아팠읍니다 ㅜ
</p></div>
<input type="checkbox" id="answer5">
<label for="answer5">태민님은 누구인가요?<em></em></label>
<div><p>그러게요.. 얘는 할줄 아는게 뭐지</p></div>

<tr>
<button type="button" class="btn btn-info btn-md"
onclick="location.href='index.jsp?container=qa/questionList.jsp'">Q&A목록</button>
</tr>

<tr>
<%
	if(loginOk!=null && membertype.equals("일반회원")){%>
	<button type="button" class="btn btn-info btn-md"
	id="btnquestion">질문하기</button>
<%} 
%>
</tr>



</div>
</div>
</body>
</html>