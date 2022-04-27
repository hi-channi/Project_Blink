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
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

.wrap {
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.1);
}

.login {
	width: 30%;
	height: 600px;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h2 {
	color: tomato;
	font-size: 2em;
}

.login_email {
	margin-top: 20px;
	width: 80%;
}

.login_email input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_pw {
	margin-top: 20px;
	width: 80%;
}

.login_pw input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_etc {
	padding: 10px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}

.submit {
	margin-top: 50px;
	width: 80%;
}

.submit input {
	width: 100%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
	background-position: left;
	background-size: 200%;
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
}

.submit:hover {
	background-position: right;
}
</style>
</head>
<body>
<%
	String idSaveChk=(String)session.getAttribute("idSaveChk");		// 세션 값: 
	String loginId=(String)session.getAttribute("loginId");		// 세션 아이디(이메일):
	System.out.println(idSaveChk+loginId);
%>
	<form action="loginproc.jsp" method="post">
		<div class="wrap">
			<div class="login">
				<h2>Log-in</h2>
				<div class="login_email">
					<h4>email</h4>
					<%	// 세션 반환값에 의해 이메일 입력 폼 value값 부여
						if(idSaveChk==null) {		// 이메일 저장에 체크하지 않았을 때
						%> 
							<input type="text" size="10" name="email" autofocus="autofocus"
								value="" required="required" placeholder="email">
						<%} else {
						%>
							<input type="text" size="10" name="email" autofocus="autofocus"
								value="<%=loginId %>" required="required" >
						<% }
					%>
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="password" size="10" name="pw"
						required="required" placeholder="password">
				</div>
				<div class="login_etc">
					<div class="checkbox">
						<%	// 세션 반환값 유무에 따른 체크박스 상태 기억
							if(idSaveChk==null) {		// 이메일 저장에 체크하지 않았을 때
							%> 
							<input type="checkbox" name="idSaveChk">이메일 저장
							<%} else {
							%>
							<input type="checkbox" name="idSaveChk" checked="checked">이메일 저장
							<% }
						%>
					</div>
					<div class="forgot_pw">
						<!-- 구현 예정 -->
						<a href="#">Forgot Password?</a>
					</div>
				</div>
				<div class="submit">
					<input type="submit" value="로그인">
				</div>
				<div class="submit">
					<input type="button" value="회원가입"
						onclick="location.href='../index.jsp?container=member/signup.jsp'">
				</div>
			</div>
		</div>
	</form>
</body>
</html>