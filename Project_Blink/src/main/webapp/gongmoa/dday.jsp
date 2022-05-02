<%@page import="data.dto.ContestDto"%>
<%@page import="data.dao.ContestDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
<%
ContestDao dao=new ContestDao();
List<ContestDto> list=dao.getAllConTest();
Map<ContestDto,Integer> dDayMap=new HashMap<ContestDto,Integer>();

for(ContestDto dto:list){
	String strDate=dto.getFinally_day();
	String todayFm=dto.getStart_day();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	Date date=new Date(sdf.parse(strDate).getTime());
	Date today=new Date(sdf.parse(todayFm).getTime());
	
	long calculate=date.getTime() - today.getTime();
	
	int Ddays=(int)(calculate/(24*60*60*1000));
	dto.setDdays(Ddays);
	System.out.println("두 날짜 차이일: "+Ddays);
	dDayMap.put(dto, Ddays);
}
%>

</body>
</html>