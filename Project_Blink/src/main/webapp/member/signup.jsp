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
<script type="text/javascript">
$(function() {
	//아이디입력 버튼 이벤트...idsearch.jsp(팝업창)
	$("#btnidcheck").click(function(){
		window.open("member/idsearch.jsp", "", "width=600px, height=200px, left=500px, top=100px")
	});
});

//두번 입력한 비밀번호 확인
function doOpenCheck(chk){
    var obj = document.getElementsByName("member");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

//체크박스 하나만
function clickCheck(target) {
    document.querySelectorAll(`input[type=checkbox]`)
        .forEach(el => el.checked = false);

    target.checked = true;
}
</script>
<style type="text/css">
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:25%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:20px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:20px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:20px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:20px;
  height:25px;
  background: none;
}

.addr {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:20px;
  height:25px;
  background: none;
}

.company {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:20px;
  height:25px;
  background: none;
}

.contact {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:20px;
  height:20px;
  background: none;
}

.Member_type {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:20px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
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
.container > img {
  position: absolute;
  width: 100%;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.btn:hover {
  background-position: right;
}

</style>
</head>
<body>

<div>
<!-- <img src="../img/logo2.png" > -->
</div>
<!-- 입력 form -->
<div id="main" style="height: 1000px;'">
	<form action="member/memberInsert.jsp" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">

		<h2>회원가입</h2>

		<div class="textForm">
			<input type="radio" value="일반회원" name="Member_type" checked="checked">일반회원 
			<input type="radio" value="기업회원" name="Member_type">기업회원
		</div>
		<div class="textForm">
			<input name="email" type="text" class="email" placeholder="이메일">
		</div>
		<div class="textForm">
			<input name="pw" type="password" class="pw" placeholder="비밀번호">
		</div>
		<div class="textForm">
			<input name="pwconfirm" type="password" class="pw"
				placeholder="비밀번호 확인">
		</div>
		<div class="textForm">
			<input name="name" type="text" class="name" placeholder="이름">
		</div>
		<div class="textForm">
			<input name="nickname" type="text" class="nickname"
				placeholder="닉네임">
		</div>
		<div class="textForm">
			<input name="contact" type="number" class="contact"
				placeholder="전화번호">
		</div>
		<div class="textForm">
			<input name="addr" type="text" class="addr" placeholder="주소">
		</div>
		<div class="textForm">
			<input name="company" type="text" class="company" placeholder="소속">
		</div>
		<input type="submit" class="btn" value="J O I N" />
	</form>
</div>
</body>
</html>