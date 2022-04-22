<%@page import="data.dao.TestDao"%>
<%@page import="data.dto.TestDto"%>
<%@page import="java.util.List"%>

<%@page import="java.text.SimpleDateFormat"%>

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
<style type="text/css">
div.list {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}

tr>th {
	text-align: center;
}

</style>
</head>
<body>

<%
	TestDao dao=new TestDao();
	SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd HH:mm");
	
	// 각 페이지에서 필요한 게시글 가져오기
	List<TestDto> list=dao.getAllData();

%>

<div class="list">
<table class="table table-hover" style="width: 800px;">
	<caption>2조 팀원 목록 김효림 수정하기&nbsp;<span class="badge">총 <%=list.size() %>명</span>&nbsp;</caption>
	
	<tr align="center">
		<th width="75">No</th>
		<th width="120">이름</th>
		<th width="150">Github</th>
		<th width="75">등록일</th>
	</tr>
	<% if(list.size()==0) {
		%>
		<tr>
			<td colspan="8" align="center">
			<b>등록된 인원이 없습니다.</b>
			</td>
		</tr>
	<% } else {
			for(TestDto dto:list) {
		%>
		<tr>
			<td align="center"><%=dto.getNum() %></td>
			<td align="center"><%=dto.getName() %></td>
			<td align="center"><%=dto.getGitname() %></td>
			<td align="center"><%=sdf.format(dto.getStartday()) %></td>
		</tr>
		<% }
	}%>
	</table>
</div>

</body>
</html>