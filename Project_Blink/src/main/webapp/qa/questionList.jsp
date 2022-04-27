<%@page import="java.awt.Window"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.QuestionDto"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">
$(function(){

	
	//문의사항 입력 ...questionform.jsp
	$("#btnquestion").click(function(){
		
		window.open("questionForm.jsp","","width=550px,height=500px,left=500px,top=100px");
	});
	
});


</script>
</head>
<body>
<%
//DB선언후 List를 가져옴
QuestionDao db = new QuestionDao();
//List<QuestionDto> list = db.getAllDatas();

//페이징처리에 필요한 변수
int totalCount; //총글수
int totalPage; //총 페이지수
int startPage; //각블럭의 시작페이지
int endPage; //각블럭의 끝페이지
int start; //각페이지의 시작번호
int perPage=5; //한페이지에 보여질 글 갯수
int perBlock=5; //한블럭당 보여지는 페이지 개수
int currentPage; //현재페이지 번호

int no; //리스트 앞에 붙는 넘버값

//총갯수
totalCount=db.getTotalCount();

//현재 페이지번호 읽기(단 null일경우는 1로 설정)
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

//총페이지 개수 구하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각블럭의 시작페이지
//예:현재페이지가 3인경우 startpage=1,endpage= 5
//현재페이지가 6인경우 startpage=6,endpage= 10
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

//만약 총페이지가 8 -2번째블럭: 6-10 ..이럴경우는 endpage가 8로 수정되어야함
if(endPage>totalPage)
	endPage=totalPage;

//각페이지에서 불러올 시작번호
start=(currentPage-1)*perPage;

//각 페이지에서 필요한 게시글 가져오기
List<QuestionDto> list=db.getList(start, perPage);

//각 글앞에 붙일 시작번호 구하기
//총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩감소
no=totalCount-(currentPage-1)*perPage;
%>

<div class="container">

<div class="alert alert-info" style="width: 800px;">
<b>총<%=totalCount %>개의 질문이 있습니다.</b>
</div>

<br>
<table class="table table-bordered table-hover" style="width:800px;">
	<caption><b>게시판 목록 출력</b>
	<button type="button" class="btn btn-info btn-sm"
	id="btnquestion"
	style="margin-left: 600px;">질문하기</button>
	</caption>
	 <tr>
		<th style="width:70px;">번호</th>
		<th style="width:140px;">제목</th>
		<th style="width:100px;">작성자</th>	
		<th style="width:110px;">작성일</th>	
	 </tr>
	 
	 <%
	 //출력할 날짜형식
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 
	 for(QuestionDto dto:list)
	 {
		 %>
		 <tr>
		 
		 <!-- 번호 -->
		 <td align="center"><%=no-- %></td>
		 
		 <!-- 제목.. 내용보기로 연결 -->
		 <td>
		 <a href="questionContent.jsp?qnum=<%=dto.getQnum()%>"><%=dto.getSubject() %></a>
		 </td>
		 
		 <!-- 작성자 -->
		 <td align="center"><%=dto.getId() %></td>
		 
		 <!-- 작성일 -->
		 <td><%=sdf.format(dto.getWrite_day()) %></td>
		 </tr>
	 <%}
	 %>
	  	 
</table>
</div>

<!-- 페이징 처리 -->
<div style="width: 1000px; text-align: center;">
  <ul class="pagination">
  	
  	<%
  	//이전
  	if(startPage>1)
  	{%>
  		<li>
  		  <a href="questionList.jsp?currentPage=<%=startPage-1%>">이전</a>
  		</li>
  	<%}
  	
  	for(int pp=startPage;pp<=endPage;pp++)
  	{
  		if(pp==currentPage)
  		{%>
  			<li class="active">
  			  <a href="questionList.jsp?currentPage=<%=pp%>"><%=pp %></a>
  			</li>
  		<%}else{%>
  			<li >
  			  <a href="questionList.jsp?currentPage=<%=pp%>"><%=pp %></a>
  			</li>
  		<%}
  	}
  	
  	//다음
  	if(endPage<totalPage)
  	{%>
  		<li>
  		  <a href="questionList.jsp?currentPage=<%=endPage+1%>">다음</a>
  		</li>
  	<%}
  	%>
  	
  </ul>
</div>

</body>
</html>