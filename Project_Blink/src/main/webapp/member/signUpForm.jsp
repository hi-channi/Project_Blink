<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

// 이메일 중복확인
function emailAuthentication(){
	if (!emailValCheck()){
    	return false;
    }
	var url = "Blink?email=" + document.signUpForm.email.value;
	open(url, "confirm",
			"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");

//이메일 검사
const form = document.signUpForm;

function emailValCheck(){
	var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = form.email.value;
	if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
		return false;
	}
    return true;
}

//이메일 패턴검사
function check(pattern, taget, message) {
	if(pattern.test(taget)) {
    	return true;
    }
    alert(message);
    taget.focus();
    return false;
}
</script>
</head>
<body>

<form name="signUpForm" action="signUpInput.Blink" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
<table class="table" style="margin-left: auto; margin-right: auto;">

<tr>
	<th>이메일</th>
	<td><input type="text" name="email" id="inputEmailForm"  maxlength="30">
	<button onclick="emailAuthentication()" id="eamilAuthBtn" type="button" class="btnChk">인증 메일 보내기</button></td>
</tr>
<tr>
	<th rowspan="2"><a>인증번호 입력</a></th>
	<td colspan="2"><input type="text" name="authCode" id="inputAuthCode"  maxlength="10" disabled="disabled">
	<button onclick="authCodeCheck()" id="authCodeCheckBtn" type="button" disabled="disabled" class="btnChk">인증</button>
	<input type="hidden" name="authPass" id="authPass" value="false">
</td>
</tr>	

</table>
</form>
</body>
</html>