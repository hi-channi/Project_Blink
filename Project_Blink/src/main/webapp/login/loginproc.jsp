<%@page import="data.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String email=request.getParameter("email");
	String pw=request.getParameter("pw");
	System.out.println("----로그인 정보----");
	System.out.println("ID: "+email);
	System.out.println("PW: "+pw);
	
	String idSaveChk=request.getParameter("idSaveChk");

	// 이메일, 비밀번호 일치 여부 확인
	LoginDao db=new LoginDao();
	boolean flag=db.isLogin(email,pw);

	// 일치: 세션 저장 후 HOME 이동
	if(flag) {
		// 로그인 세션 저장
		session.setAttribute("loginOk", "SUCCESS");
		// 아이디,체크값 저장
		session.setAttribute("loginId", email);
		// 체크하면 on 체크안하면 null
		session.setAttribute("idSaveChk", idSaveChk);
		// 세션 유지시간
		session.setMaxInactiveInterval(60*60*8); // 8시간 유지
		// HOME 이동
		response.sendRedirect("loginmain.jsp");
	// 불일치: 경고창 팝업 후 back
	} else {
	%>
		<script type="text/javascript">
			alert("이메일과 비밀번호가 일치하지 않습니다");
			history.back();
		</script>
	<% }
%>
