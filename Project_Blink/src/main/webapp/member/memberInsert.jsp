<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String Member_type = request.getParameter("Member_type");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String pw = request.getParameter("pw");
	String contact = request.getParameter("contact");
	String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	String company = request.getParameter("company");
	
	System.out.println("----가입 신청 정보----");
	System.out.println(Member_type);
	System.out.println(name);
	System.out.println(nickname);
	System.out.println(pw);
	System.out.println(contact);
	System.out.println(addr);
	System.out.println(email);
	
	MemberDto dto=new MemberDto();
	
	dto.setMember_type(Member_type);
	dto.setName(name);
	dto.setNickname(nickname);
	dto.setEmail(email);
	dto.setPw(pw);
	dto.setContact(contact);
	dto.setAddr(addr);
	dto.setCompany(company);
	
	MemberDao dao=new MemberDao();
	dao.insertMember(dto);
	System.out.println("[회원가입 성공]");
	
	response.sendRedirect("../index.jsp?container=member/memberSuccess.jsp?name="+name);
%>
</body>
</html>