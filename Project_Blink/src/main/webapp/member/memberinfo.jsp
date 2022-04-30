<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
</head>
<body>
<%//1. 한글설정 & 변수생성
String email = (String) session.getAttribute("email");//object이기에 형변환필수
//로그인이 되있으면
String loginOk=(String)session.getAttribute("loginOk"); //세션가져오기
String loginId=(String)session.getAttribute("loginId"); //이메일 가져오기


//2. 멤버DAO객체 생성 -> 회원정보 가져오는 메서드생성
MemberDao dao = new MemberDao();
MemberDto dto = dao.getMember(email);


//3. 데이터처리 : 테이블로 표현
if(dto != null){
%>
<h2>마이페이지</h2>
<table class="table table-condensed" style="width: 650px;">
	<tr>
		<td>이메일</td>
		<td><%=dto.getEmail() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=dto.getPw() %></td>
	</tr>
	<tr>
		<td>별명</td>
		<td><%=dto.getNickname() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=dto.getContact() %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=dto.getAddr() %></td>
	</tr>
	<tr>
		<td>소속</td>
		<td><%=dto.getCompany() %></td>
	</tr>
</table>
<% 
} 
%>
<hr>
<input type="button" value="뒤로가기" onclick="location.href='../index.jsp'">
</body>
</html>