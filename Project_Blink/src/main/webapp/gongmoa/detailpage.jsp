<%@page import="data.dto.ContestDto"%>
<%@page import="data.dao.ContestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
.image{
	width: 600px;
	height: 700px;
}
table{
	margin-left: 5px;
	font-family: "hi melody";
	font-size: 14pt;
}

</style>

<title>Insert title here</title>
</head>
<%
String connum=request.getParameter("connum");

String loginOk=(String)session.getAttribute("loginOk");
String loginid=(String)session.getAttribute("loginId");

ContestDao dao=new ContestDao();
ContestDto dto=dao.getData(connum);

dto.setId(loginid);

dao.upReadCount(connum);
%>
<body>
	<table style="width: 1060px; height: 700px;" class="table table-bordered">
	<tr>
		<td style="width: 500px;">
		<div>
		<img alt="" class="image" src="images/<%=dto.getImage()%>">
		</div>
		</td>
		<td style="width: 600px;">
		<h3>공모분야: &nbsp;<%=dto.getCategory() %></h3>	
		<h3>공모전 개요: 포스터 참조</h3>
		<h3>공모전 주제: &nbsp;<%=dto.getSubject()%></h3>
		<h3>접수 기간: &nbsp;<%=dto.getStart_day() %> ~ <%=dto.getFinally_day() %>
		</h3>
		<h3>공모전 내용: 포스터 참조</h3>
		<h3>신청 방법: 포스터 참조 </h3>
		<h3>신청 양식: 포스터 참조</h3>
		<h3>자격 요건: 누구나 가능</h3>
		<h3>시상 내역: 포스터 참조</h3>
		<h3>문의사항: 010-0000-0000</h3>
		<h3>이메일: example@gongmoa.com</h3>
		<div>
		<br>
		<button type="button" class="btn btn-success"
		onclick="location.href='index.jsp?container=gongmoa/gongmoaform.jsp'">목록
		<button type="button" class="btn btn-danger"
		onclick="location.href='#'">찜하기
		</button>
		
		</div> 
		</td>
		</tr>
	</table>
</body>
</html>