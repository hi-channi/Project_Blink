<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dokdo&family=East+Sea+Dokdo&family=Gugi&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<%
String rnum = request.getParameter("rnum");
%>
<form action="review/reviewDeleteAction.jsp" method="post">
	<table class="table table-bordered" style="width:200px;">
	<caption><b>정말로 삭제하시겠습니까?</b></caption>
	<tr>
	<th>
	<!-- hidden으로 qnum넘기는건 기본이라고 생각 -->
	<input type="hidden" name="rnum" value="<%=rnum %>">
	<br><br>
	<button type="submit" class="btn btn-danger">예</button>
	<button type="button" onclick="history.back()"
	class="btn btn-success">아니요</button>	
	</th>
	</tr>
	</table>
</body>
</html>