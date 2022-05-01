<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
</head>
<body>
<div>
	<form action="index.jsp?container=gongmoa/insertaction.jsp" method="post" enctype="multipart/form-data"
	class="form-inline">
	<table class="table table-bordered" style="width: 1100px;">
		<caption><b>공모전 등록</b></caption> 
		
		<tr>
			<td style="width: 150px;">
				<b>공모전 제목</b></td>
			<td>	
			<input type="text" name="subject" style="width: 400px;" placeholder="공모전 제목 입력"
			required="required" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td style="width: 150px;">
			<b>카테고리</b>
			</td>
			
			<td>
				<select style="width: 200px;" name="category"
				class="form-control" required="required">
				<option value="아이디어/마케팅" selected="selected">아이디어/마케팅</option>
				<option value="디자인/웹툰/UCC" >디자인/웹툰/UCC</option>
				<option value="문학/예술/과학">문학/예술/과학</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td style="width: 150px;">
				<b>공모전 포스터</b></td>
			<td>	
			<input type="file" name="image" style="width: 300px;" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td style="width: 150px;">
				<b>공모전 설명</b></td>
			<td>	
			<textarea rows="30px;" cols="125px;" name="content" class="form-control"
			placeholder="&#10;&#10;제목 &#10;-&#10;&#10;●응모 자격 &#10;-&#10;&#10;●응모 주제 &#10;-&#10;&#10;●시상 내역 &#10;-&#10;&#10;●제출 방법 &#10;-&#10;&#10;●접수 방법 &#10;-&#10;&#10;●심사 방법 &#10;-&#10;&#10;●유의 사항" required="required""></textarea>
			</td> 
		</tr>
		
		<tr>
			<td style="width: 150px;"><b>시작일</b></td>
			<td>
			<%
			//시작일
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String start_day=sdf.format(new Date());
			%> 
			<input type="date" name="start_day" required="required">
			</td>
		</tr>
		
		<tr>
			<td style="width: 150px;"><b>마감일</b></td>
			<td>
			<%
			//마감일
			String finally_day=sdf.format(new Date());
			%>  
			<input type="date" name="finally_day" required="required">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-info">공모전 등록</button>
			<button type="button" class="btn btn-info" 
			onclick="location.href='index.jsp?container=gongmoa/gongmoaform.jsp'">목록</button>
			</td>
		</tr>
	</table>
	</form>
</div> 

</body>
</html>


