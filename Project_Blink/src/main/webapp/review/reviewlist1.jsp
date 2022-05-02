<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
	display: flex;
	justify-content:center;
	
	
	

</style>

</head>
<body>
<%
ReviewDao dao=new ReviewDao();
//로그인한 상태
String loginOk=(String)session.getAttribute("loginOk");
//로그인한 아이디
String loginId=(String)session.getAttribute("loginId");

// 페이징처리에 필요한 변수
int totalCount; //총 글수
int totalPage; //총 페이지수
int startPage; //각 블럭의 시작페이지
int endPage; //각 블럭의 끝페이지
int start; //각 페이지의 시작 번호
int perPage=15; //한페이지당 보여질 5개 게시글 갯수
int perBlock=5; //12345다음 한블럭당 보여지는 페이지 갯수
int currentPage; //현재페이지 

int no;
//총갯수
totalCount=dao.getTotalCount();

//현재 페이지번호 읽기(단 null일 경우는 1page로 설정)
if(request.getParameter("cuttentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
//총 페이지 개수 구하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭의 시작페이지 구하기
//예를 들어 현재페이지가 3인 경우 startpage:1, endpage:5
//현재페이지가 6인경우 start:6, end:10
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

//만약 총페이지가 8이면 2번째 블럭은 스타트6 엔드가 10
//이럴경우는 endpage를 8로 수정
if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 불러올 시작번호
start=(currentPage-1)*perPage;

//각 페이지에서 필요한 게시글 가져오기
List<ReviewDto> list=dao.getList(start, perPage);

//각 글앞에 붙일 시작번호 구하기
//총 글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
no=totalCount-(currentPage-1)*perPage;


%>
<div id="main" style="height: 1000px;">

<div class="alert alert-info" style="weight: 700px;">
<b>총<%=totalCount%>개의 공모전 후기들이 있습니다</b>
</div>
<br>
<table style="width: 90%; margin:0 auto; font-size: 18px; border: 1px solid black;" >
	<tr><b>공모전 후기</b>
	<% 
   if(loginOk!=null)
   {%>
		<button type="button" class="btn btn-success btn-sm"
		onclick="location.href='index.jsp?container=review/insertform.jsp'"
		style="margin-left: 900px; background:  #B4C3FF;" ><span class="glyphicon glyphicon-pencil">
	</span>글쓰기</button>
	 <%} 
   %>
	</tr>
		
		<%
		//출력할 날짜 형식
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String loginid=(String)session.getAttribute("loginId");
		
		
		MemberDao mdao=new MemberDao();		
		
		String myid=mdao.getId(loginid);
		//System.out.println(loginid);
		//System.out.println(myid);
		
		
		for(ReviewDto dto:list)
		{
			//이름얻기
			String id=dto.getId();
			String rnum=dto.getRnum();
			%>
			<tr>
			<img alt="" src="save/<%=dto.getImage()%>"
				style="width:350px; height: 350px;"a href="index.jsp?container=review/detail.jsp?rnum=<%=dto.getRnum()%>" >
			</tr>
				
			<!--번호 1씩 줄어들게하기-->
			<tr style="width:400px;" ><%=no-- %>
			<!-- 제목..내용보기로 연결 -->
			
			<a href="index.jsp?container=review/detail.jsp?rnum=<%=dto.getRnum()%>">
			
				<%=dto.getSubject() %></a>
			
			<!-- 작성자 -->
			 <%
    		  String getid=dto.getId();
    		  String nickname=mdao.getNickname(getid);    		  
    		  %>
    		  <%=nickname%><br>
			<!-- 작성일 -->
			<%=sdf.format(dto.getWrite_day()) %>
			<!-- 조회수 -->
			<br align="center"><%=dto.getRead_cnt() %>
			<!-- 추천수 -->
			<%=dto.getLike_cnt()%></tr>
			
		<%}
		%>
</table>
</div>

	
	
	

<!-- 페이징처리 -->
<div style="width: 500px; text-align: center;" class="container">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1)
		{%>
			<li>
				<a href="index.jsp?container=review/reviewlist.jsp?currentPage=<%=startPage-1%>">이전</a>
			</li>
		<%}
		
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<li class="active">
					<a href="index.jsp?container=review/reviewlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}else{%>
				<li >
				<a href="index.jsp?container=review/reviewlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
			</li>
			<%}
		}
		//다음
		if(endPage<totalPage)
		{%>
			<li>
				<a href="index.jsp?container=review/reviewlist.jsp?currentPage=<%=startPage+1%>">다음</a>
			</li>
		<%}
		%>
	</ul>

</div>

</body>
</html>