<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ContestDto"%>
<%@page import="data.dao.ContestDao"%>
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
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">
button{
	width: 100px;
	height: 50px;
}
table td{
	text-align: center;
	background-color: #e0ffff;
	font-size: 14pt;
	cursor: pointer;
}
table th{
	text-align: center;
	font-size: 16pt;
}
@import 'https://fonts.googleapis.com/css?family=Montserrat:400,700|Raleway:300,400';

html {
  width: 100%;
  height: 100%;
}
body {
  font-family: "Raleway";
	background: transparent;
  height: 100%;
}
body h1 {
  text-align: center;
  color: #428BFF;
  font-weight: 300;
  padding: 40px 0 20px 0;
  margin: 0;
}
.tabs {
  left: 50%;
  transform: translateX(-50%);
  position: relative;
  background: white;
  padding: 50px;
  padding-bottom: 80px;
  width: 90%;
  height: 120px;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  border-radius: 5px;
  min-width: 240px;
}
.tabs input[name=tab-control] {
  display: none;
}
.tabs .content section h2,
.tabs ul li label {
  font-family: "Montserrat";
  font-weight: bold;
  font-size: 18px;
  color: #428BFF;
}
.tabs ul {
  list-style-type: none;
  padding-left: 0;
  display: flex;
  flex-direction: row;
  margin-bottom: 10px;
  justify-content: space-between;
  align-items: flex-end;
  flex-wrap: wrap;
}
.tabs ul li {
  box-sizing: border-box;
  flex: 1;
  width: 25%;
  padding: 0 10px;
  text-align: center;
}
.tabs ul li label {
  transition: all 0.3s ease-in-out;
  color: #929daf;
  padding: 5px auto;
  overflow: hidden;
  text-overflow: ellipsis;
  display: block;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
  white-space: nowrap;
  -webkit-touch-callout: none;
}
.tabs ul li label br {
  display: none;
}
.tabs ul li label svg {
  fill: #929daf;
  height: 1.2em;
  vertical-align: bottom;
  margin-right: 0.2em;
  transition: all 0.2s ease-in-out;
}
.tabs ul li label:hover, .tabs ul li label:focus, .tabs ul li label:active {
  outline: 0;
  color: #bec5cf;
}
.tabs ul li label:hover svg, .tabs ul li label:focus svg, .tabs ul li label:active svg {
  fill: #bec5cf;
}
.tabs .slider {
  position: relative;
  width: 25%;
  transition: all 0.33s cubic-bezier(0.38, 0.8, 0.32, 1.07);
}
.tabs .slider .indicator {
  position: relative;
  width: 50px;
  max-width: 100%;
  margin: 0 auto;
  height: 4px;
  background: #428BFF;
  border-radius: 1px;
}
.tabs .content {
  margin-top: 80px;
}
.tabs .content section {
  display: none;
  animation-name: content;
  animation-direction: normal;
  animation-duration: 0.3s;
  animation-timing-function: ease-in-out;
  animation-iteration-count: 1;
  line-height: 1.4;
}
.tabs .content section h2 {
  color: #428BFF;
  display: none;
}
.tabs .content section h2::after {
  content: "";
  position: relative;
  display: block;
  width: 30px;
  height: 3px;
  background: #428BFF;
  margin-top: 5px;
  left: 1px;
}
.tabs input[name=tab-control]:nth-of-type(1):checked ~ ul > li:nth-child(1) > label {
  cursor: default;
  color: #428BFF;
}
.tabs input[name=tab-control]:nth-of-type(1):checked ~ ul > li:nth-child(1) > label svg {
  fill: #428BFF;
}
@media (max-width: 600px) {
  .tabs input[name=tab-control]:nth-of-type(1):checked ~ ul > li:nth-child(1) > label {
    background: rgba(0, 0, 0, 0.08);
  }
}
.tabs input[name=tab-control]:nth-of-type(1):checked ~ .slider {
  transform: translateX(0%);
}
.tabs input[name=tab-control]:nth-of-type(1):checked ~ .content > section:nth-child(1) {
  display: block;
}
.tabs input[name=tab-control]:nth-of-type(2):checked ~ ul > li:nth-child(2) > label {
  cursor: default;
  color: #428BFF;
}
.tabs input[name=tab-control]:nth-of-type(2):checked ~ ul > li:nth-child(2) > label svg {
  fill: #428BFF;
}
@media (max-width: 600px) {
  .tabs input[name=tab-control]:nth-of-type(2):checked ~ ul > li:nth-child(2) > label {
    background: rgba(0, 0, 0, 0.08);
  }
}
.tabs input[name=tab-control]:nth-of-type(2):checked ~ .slider {
  transform: translateX(100%);
}
.tabs input[name=tab-control]:nth-of-type(2):checked ~ .content > section:nth-child(2) {
  display: block;
}
.tabs input[name=tab-control]:nth-of-type(3):checked ~ ul > li:nth-child(3) > label {
  cursor: default;
  color: #428BFF;
}
.tabs input[name=tab-control]:nth-of-type(3):checked ~ ul > li:nth-child(3) > label svg {
  fill: #428BFF;
}
@media (max-width: 600px) {
  .tabs input[name=tab-control]:nth-of-type(3):checked ~ ul > li:nth-child(3) > label {
    background: rgba(0, 0, 0, 0.08);
  }
}
.tabs input[name=tab-control]:nth-of-type(3):checked ~ .slider {
  transform: translateX(200%);
}
.tabs input[name=tab-control]:nth-of-type(3):checked ~ .content > section:nth-child(3) {
  display: block;
}
.tabs input[name=tab-control]:nth-of-type(4):checked ~ ul > li:nth-child(4) > label {
  cursor: default;
  color: #428BFF;
}
.tabs input[name=tab-control]:nth-of-type(4):checked ~ ul > li:nth-child(4) > label svg {
  fill: #428BFF;
}
@media (max-width: 600px) {
  .tabs input[name=tab-control]:nth-of-type(4):checked ~ ul > li:nth-child(4) > label {
    background: rgba(0, 0, 0, 0.08);
  }
}
.tabs input[name=tab-control]:nth-of-type(4):checked ~ .slider {
  transform: translateX(300%);
}
.tabs input[name=tab-control]:nth-of-type(4):checked ~ .content > section:nth-child(4) {
  display: block;
}
@keyframes content {
  from {
    opacity: 0;
    transform: translateY(5%);
  }
  to {
    opacity: 1;
    transform: translateY(0%);
  }
}
@media (max-width: 1000px) {
  .tabs ul li label {
    white-space: initial;
  }
  .tabs ul li label br {
    display: initial;
  }
  .tabs ul li label svg {
    height: 1.5em;
  }
}
@media (max-width: 600px) {
  .tabs ul li label {
    padding: 5px;
    border-radius: 5px;
  }
  .tabs ul li label span {
    display: none;
  }
  .tabs .slider {
    display: none;
  }
  .tabs .content {
    margin-top: 20px;
  }
  .tabs .content section h2 {
    display: block;
  }
}
</style>

</head>
<body>

<h1>공모전 찾아보기</h1>
<div class="tabs">
  
  <input type="radio" id="tab1" name="tab-control" checked>
  <input type="radio" id="tab2" name="tab-control">
  <input type="radio" id="tab3" name="tab-control">  
  <input type="radio" id="tab4" name="tab-control">
  <ul>
  	<li title="Features"><label for="tab1" role="button"><svg viewBox="0 0 24 24"><path d="M14,2A8,8 0 0,0 6,10A8,8 0 0,0 14,18A8,8 0 0,0 22,10H20C20,13.32 17.32,16 14,16A6,6 0 0,1 8,10A6,6 0 0,1 14,4C14.43,4 14.86,4.05 15.27,4.14L16.88,2.54C15.96,2.18 15,2 14,2M20.59,3.58L14,10.17L11.62,7.79L10.21,9.21L14,13L22,5M4.93,5.82C3.08,7.34 2,9.61 2,12A8,8 0 0,0 10,20C10.64,20 11.27,19.92 11.88,19.77C10.12,19.38 8.5,18.5 7.17,17.29C5.22,16.25 4,14.21 4,12C4,11.7 4.03,11.41 4.07,11.11C4.03,10.74 4,10.37 4,10C4,8.56 4.32,7.13 4.93,5.82Z"/>
</svg><br><span>전체</span></label></li>
    <li title="Features"><label for="tab2" role="button"><svg viewBox="0 0 24 24"><path d="M14,2A8,8 0 0,0 6,10A8,8 0 0,0 14,18A8,8 0 0,0 22,10H20C20,13.32 17.32,16 14,16A6,6 0 0,1 8,10A6,6 0 0,1 14,4C14.43,4 14.86,4.05 15.27,4.14L16.88,2.54C15.96,2.18 15,2 14,2M20.59,3.58L14,10.17L11.62,7.79L10.21,9.21L14,13L22,5M4.93,5.82C3.08,7.34 2,9.61 2,12A8,8 0 0,0 10,20C10.64,20 11.27,19.92 11.88,19.77C10.12,19.38 8.5,18.5 7.17,17.29C5.22,16.25 4,14.21 4,12C4,11.7 4.03,11.41 4.07,11.11C4.03,10.74 4,10.37 4,10C4,8.56 4.32,7.13 4.93,5.82Z"/>
</svg><br><span>아이디어/마케팅</span></label></li>
    <li title="Delivery Contents"><label for="tab3" role="button"><svg viewBox="0 0 24 24"><path d="M2,10.96C1.5,10.68 1.35,10.07 1.63,9.59L3.13,7C3.24,6.8 3.41,6.66 3.6,6.58L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.66,6.72 20.82,6.88 20.91,7.08L22.36,9.6C22.64,10.08 22.47,10.69 22,10.96L21,11.54V16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V10.96C2.7,11.13 2.32,11.14 2,10.96M12,4.15V4.15L12,10.85V10.85L17.96,7.5L12,4.15M5,15.91L11,19.29V12.58L5,9.21V15.91M19,15.91V12.69L14,15.59C13.67,15.77 13.3,15.76 13,15.6V19.29L19,15.91M13.85,13.36L20.13,9.73L19.55,8.72L13.27,12.35L13.85,13.36Z" />
</svg><br><span>디자인/웹툰/UCC</span></label></li>
    <li title="Shipping"><label for="tab4" role="button"><svg viewBox="0 0 24 24">
    <path d="M3,4A2,2 0 0,0 1,6V17H3A3,3 0 0,0 6,20A3,3 0 0,0 9,17H15A3,3 0 0,0 18,20A3,3 0 0,0 21,17H23V12L20,8H17V4M10,6L14,10L10,14V11H4V9H10M17,9.5H19.5L21.47,12H17M6,15.5A1.5,1.5 0 0,1 7.5,17A1.5,1.5 0 0,1 6,18.5A1.5,1.5 0 0,1 4.5,17A1.5,1.5 0 0,1 6,15.5M18,15.5A1.5,1.5 0 0,1 19.5,17A1.5,1.5 0 0,1 18,18.5A1.5,1.5 0 0,1 16.5,17A1.5,1.5 0 0,1 18,15.5Z" />
</svg><br><span>문학/예술/과학</span></label></li>    
  </ul>
  
<%
ContestDao dao=new ContestDao();
List<ContestDto> list=dao.getAllConTest();
String connum=request.getParameter("connum");

Map<ContestDto,Integer> dDayMap=new HashMap<ContestDto,Integer>();
      Date date2 = new Date();
      SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
      String strdate = simpleDate.format(date2);
      
   %>

  <div class="slider"><div class="indicator"></div></div>
  <div id="main" style="height: 1000px;" class="content">
  	  <section>
      <h2>전체</h2>
      <table class="table table-bordered" id="전체">
<caption style="font-size: 22pt;">전체 공모전</caption>
	<tr class="all">
		<th>회원번호</th>
		<th>아이디</th>
		<th>공모명</th>
		<th>원서접수</th>
		<th>마감일</th>
		<th>조회수</th>
		<th>D-day</th>
	</tr>
	<%
	for(ContestDto dto:list){
	String strDate=dto.getFinally_day();
	String todayFm=strdate;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	String loginid=(String)session.getAttribute("loginId");
	MemberDao mdao=new MemberDao();
	MemberDto mdto=new MemberDto();
	
	Date date=new Date(sdf.parse(strDate).getTime());
	Date today=new Date(sdf.parse(todayFm).getTime());
	
	long calculate=date.getTime() - today.getTime();
	
	int Ddays=(int)(calculate/(24*60*60*1000));
	
	dto.setDdays(Ddays);
	dDayMap.put(dto, Ddays);
	
	{%> 
		<tr>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getId() %></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getNickname() %></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getSubject()%> </td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getStart_day()%></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getFinally_day()%></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getRead_cnt() %></td>
		<%
		if(Ddays<0)
		{%> <td>마감</td><%}
		else
		{%> <td>D-<%=dto.getDdays() %></td><%}
		 %>
	</tr>
	<%}
	}
	%>
</table>
      </section>
      
   	  <section>
      <h2>아이디어/마케팅</h2>
      <table class="table table-bordered" id="아이디어/마케팅">
	<caption style="font-size: 22pt;">아이디어/마케팅</caption>
	<tr class="all">
		<th>회원번호</th>
		<th>아이디</th>
		<th>공모명</th>
		<th>원서접수</th>
		<th>마감일</th>
		<th>조회수</th>
		<th>D-day</th>
	</tr>
     <%
	for(ContestDto dto:list){
	String strDate=dto.getFinally_day();
	String todayFm=strdate;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	String loginid=(String)session.getAttribute("loginId");
	MemberDao mdao=new MemberDao();
	MemberDto mdto=new MemberDto();
	
	Date date=new Date(sdf.parse(strDate).getTime());
	Date today=new Date(sdf.parse(todayFm).getTime());
	
	long calculate=date.getTime() - today.getTime();
	
	int Ddays=(int)(calculate/(24*60*60*1000));
	
	dto.setDdays(Ddays);
	dDayMap.put(dto, Ddays);
	
	if(dto.getCategory().equals("아이디어/마케팅"))
	
	{%> 
		<tr>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getId() %></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getNickname() %></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getSubject()%> </td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getStart_day()%></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getFinally_day()%></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getRead_cnt() %></td>
		<%
		if(Ddays<0)
		{%> <td>마감</td><%}
		else
		{%> <td>D-<%=dto.getDdays() %></td><%}
		 %>
	</tr>
	<%}
	}
	%>
</table>
      </section>
      
   	  <section>
      <h2>아이디어/마케팅</h2>
      <table class="table table-bordered" id="디자인/웹툰/UCC">
	<caption style="font-size: 22pt;">디자인/웹툰/UCC</caption>
	<tr class="all">
		<th>회원번호</th>
		<th>아이디</th>
		<th>공모명</th>
		<th>원서접수</th>
		<th>마감일</th>
		<th>조회수</th>
		<th>D-day</th>
	</tr>
     <%
	for(ContestDto dto:list){
	String strDate=dto.getFinally_day();
	String todayFm=strdate;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	String loginid=(String)session.getAttribute("loginId");
	MemberDao mdao=new MemberDao();
	MemberDto mdto=new MemberDto();
	
	Date date=new Date(sdf.parse(strDate).getTime());
	Date today=new Date(sdf.parse(todayFm).getTime());
	
	long calculate=date.getTime() - today.getTime();
	
	int Ddays=(int)(calculate/(24*60*60*1000));
	
	dto.setDdays(Ddays);
	dDayMap.put(dto, Ddays);
	
	
	
	if(dto.getCategory().equals("디자인/웹툰/UCC"))
	
	{%> 
		<tr>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getId() %></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getNickname() %></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getSubject()%> </td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getStart_day()%></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getFinally_day()%></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getRead_cnt() %></td>
		<%
		if(Ddays<0)
		{%> <td>마감</td><%}
		else
		{%> <td>D-<%=dto.getDdays() %></td><%}
		 %>
	</tr>
	<%}
	}
	%>
</table>
      </section>
      
      
      <section>
      <h2>아이디어/마케팅</h2>
      <table class="table table-bordered" id="문학/예술/과학">
	<caption style="font-size: 22pt;">문학/예술/과학</caption>
	<tr class="all">
		<th>회원번호</th>
		<th>아이디</th>
		<th>공모명</th>
		<th>원서접수</th>
		<th>마감일</th>
		<th>조회수</th>
		<th>D-day</th>
	</tr>
     <%
	for(ContestDto dto:list){
	String strDate=dto.getFinally_day();
	String todayFm=strdate;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	String loginid=(String)session.getAttribute("loginId");
	MemberDao mdao=new MemberDao();
	MemberDto mdto=new MemberDto();
	
	Date date=new Date(sdf.parse(strDate).getTime());
	Date today=new Date(sdf.parse(todayFm).getTime());
	
	long calculate=date.getTime() - today.getTime();
	
	int Ddays=(int)(calculate/(24*60*60*1000));
	
	dto.setDdays(Ddays);
	dDayMap.put(dto, Ddays);
	
	if(dto.getCategory().equals("문학/예술/과학"))
	
	{%> 
		<tr>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getId() %></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getNickname() %></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getSubject()%> </td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getStart_day()%></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum()%>'"><%=dto.getFinally_day()%></td>
		<td onclick="location.href='index.jsp?container=gongmoa/detailpage.jsp?connum=<%=dto.getConnum() %>'"><%=dto.getRead_cnt() %></td>
		<%
		if(Ddays<0)
		{%> <td>마감</td><%}
		else
		{%> <td>D-<%=dto.getDdays() %></td><%}
		 %>
	</tr>
	<%}
	}
	%>
</table>
      </section>
      
      <%
      String loginId=(String)session.getAttribute("loginId");
      String loginOk=(String)session.getAttribute("loginOk");
      MemberDao mdao=new MemberDao();
      String myid=mdao.getId(loginId);
      String myMember_type=mdao.getMembertype(myid);
      if(loginOk!=null && myMember_type.equals("기업회원")){%>
    	  
    	<button type="button" class="btn btn-info"
onclick="location.href='index.jsp?container=gongmoa/insertgong.jsp'">공모전 등록</button>
<button type="button" class="btn btn-danger"
onclick="location.href='index.jsp?container=gongmoa/test.jsp'">test</button>  
      <%}else{%>
    	  
    	  <button type="button" class="btn btn-danger"
onclick="location.href='index.jsp?container=gongmoa/test.jsp'">test</button>
      <%}
      %>
  </div>
  </div>

</body>
</html>