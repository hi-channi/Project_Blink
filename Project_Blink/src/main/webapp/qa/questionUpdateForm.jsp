<%@page import="data.dto.QuestionDto"%>
<%@page import="data.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Hi+Melody&family=Titillium+Web:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>

</head>

<%
//수정이므로 넘값을 받아온다
String qnum=request.getParameter("qnum");
//디비 선언
QuestionDao dao = new QuestionDao();
//넘에 해당하는 디티오 가져오기
QuestionDto dto = dao.getData(qnum);

%>

<body>

<form action="questionUpdateAction.jsp" method="post"
enctype="multipart/form-data">
	<table class="table table-bordered" style="width:500px;">

		<tr>
		<th style="width:100px;" bgcolor="#ddd">제목</th>
		<td>
		<input type="text" name="subject" class="form-control"
		value="<%=dto.getSubject() %>">
		</td>
		</tr>

		<tr>
		<td colspan="2" align="center">
		문의내용
		</td>
		</tr>

		<tr>
		<td colspan="2">
		<textarea style="width:500px; height:200px;"
		class="form-control" name="content" required="required">
		<%=dto.getContent()%>
		</textarea>
		</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
		<!-- hidden -->
		<input type="hidden" name="qnum" value="<%=qnum%>">		
		<button type="submit" class="btn btn-info btn-md">수정하기</button>
		<button type="button" class="btn btn-info btn-md"
		onclick='window.close()'>창 닫기</button>
		</td>
		</tr>
		
	</table>
</form>

</body>
</html>