<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="org.apache.catalina.tribes.membership.MemberImpl"%>
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
<title>현재 유저정보 출력화면</title>
    
<style type="text/css">
table{
	margin-left:auto; 
	margin-right:auto;
	border:3px solid skyblue;
}

td{
	border:1px solid skyblue
	}
        
#title{
	background-color:skyblue
}
</style>
    
<script type="text/javascript">
    
        
</script>
    
</head>
<body>
    <%
    String id = session.getAttribute("sessionID").toString();
    // 세션에 저장된 아이디를 가져와서
    // 그 아이디 해당하는 회원정보를 가져온다.
    MemberDao dao=MemberDao.getInstance();
    MemberDto dto=dao.getUserInfo(email);
    %>
 
        <br><br>
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                
        <table>
            <tr>
                <td id="title">이메일</td>
                <td><%= %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%= %></td>
            </tr>
                    
            <tr>
                <td id="title">별명</td>
                <td><%= %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%= %></td>
            </tr>
                    
            <tr>
                <td id="title">전화번호</td>
                <td><%= %></td>
            </tr>
                    
            <tr>
                <td id="title">주소</td>
                <td><%= %></td>
            </tr>
                    
            <tr>
                <td id="title">소속</td>
                <td><%= %></td>
            </tr>
            <tr>
                <td id="title">가입일</td>
                <td><%= %></td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(0)">
        <input type="button" value="회원탈퇴" onclick="changeForm(1)">
</body>
</html>
