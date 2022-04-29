<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String loginOk=(String)session.getAttribute("loginOk"); //세션가져오기
	
	if(loginOk==null||loginOk.equals("")) {		// 로그아웃 상태
	%>
		<jsp:include page="login.jsp"/>
	<% } else {		//로그인상태
	%>
		<jsp:include page="../member/memberSuccess.jsp"/>
	<% 
	response.sendRedirect("logout.jsp");
		/* response.sendRedirect("../index.jsp?container.jsp"); */
	}
%>
