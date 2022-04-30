<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
String id = (String) session.getAttribute("id");//object이기에 형변환필수
//1-1.id값확인 -없으면 로그인페이지로 이동
if(id == null){
	response.sendRedirect("loginForm.jsp");
}
//2. 멤버DAO객체 생성 -> 회원정보 가져오는 메서드생성
MemberDao dao = new MemberDao();
MemberDto dto = dao.getMember(email);

//3. 데이터처리 : 테이블로 표현
if(dto != null){
%>
<h2>마이페이지</h2>
<table border="1">
	<tr>
		<td>이메일</td>
		<td><%= %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%= %></td>
	</tr>
	<tr>
		<td>별명</td>
		<td><%= %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%= %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%= %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%= %></td>
	</tr>
	<tr>
		<td>소속</td>
		<td><%= %></td>
	</tr>
</table>
<% 
} 
%>
<hr>
<input type="button" value="뒤로가기" onclick="location.href='main.jsp'">
</body>
</html>