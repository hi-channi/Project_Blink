<%@page import="data.dao.ContestDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.ContestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
img{
	width: 300px;
	height: 300px;
	margin-left: 30px;
	margin-top: 30px;
	border-radius: 30px;
}
</style>
</head>
<body>

<%
ContestDao dao=new ContestDao();
List<ContestDto> list=dao.getAllConTest();
for(ContestDto dto:list){%>
	
	<img alt="" src="images/<%=dto.getImage() %>">
		
<%}


%>
 

</body>
</html>