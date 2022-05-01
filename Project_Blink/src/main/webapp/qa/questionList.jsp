<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
display: flex;
justify-content:center;
	
}
*, *:before, *:after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Noto Sans KR';

}

table {
  border-radius: 0.25em;
  border-collapse: collapse;
  margin: 1em;
  width: 90%;
  margin: auto;
  font-size: 20px;
  font-family: 'Noto Sans KR';
}
th {
  border-bottom: 1px solid #364043;
  color: #3498db;
  letter-spacing:7px;
  text-indent:7px;
  font-size: 0.9em;
  font-weight: 600;
  padding: 0.5em 1em;
  text-align: center !important;
  padding-top: 5px !important;
  padding-bottom: 5px !important;
}
td {
  color: black;
  font-weight: 400;
  font-size: 0.8em;
  padding: 0.65em 1em;
  text-align: center;
  border-bottom: 1px solid #E6E6E6;
  padding-top: 5px !important;
  padding-bottom: 5px !important;
}
tbody tr {
  transition: background 0.25s ease;
}
tbody tr:hover {
  background: #DEBDFA;
  color: white;
}

button {
	width: 100px;
	background: #B4C3FF;
	float: right;
}

.comulist {
   width: 100%;
   text-align : center;
   border: 0;   
   outline: none;
   background-position: center;
   background-size: 200%;
   color: #3498db;
   letter-spacing:7px;
   text-indent:7px;
   font-size:40px;
}

a{
	text-decoration-line: none !important;
}

.my.pagination > .active > a,
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
  background: #8e44ad;
  border-color: #8e44ad;
  color: white !important;
}
</style>
<script type="text/javascript">
$(function(){

   
   //문의사항 입력 ...questionform.jsp
   $("#btnquestion").click(function(){
      
      window.open("qa/questionForm.jsp","","width=550px,height=500px,left=500px,top=100px");
   });
   
});
</script>
</head>
<body>


<%
//로그인 상태 확인 및 처리됬는지 확인
String loginOk=(String)session.getAttribute("loginOk"); //세션가져오기
String loginId=(String)session.getAttribute("loginId"); //이메일 가져오기
   
MemberDao dao = new MemberDao();
String id = dao.getId(loginId);
String nickname = dao.getNickname(id);
String membertype = dao.getMembertype(id);


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

<div>
<br>
<div>
<b class="comulist">Q&A 게시판</b>
<br>
  <h2>총<%=totalCount %>개의 질문이 있습니다.</h2>
  <table>
  <thead>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
  </thead>
  <tbody>
    <%
    //출력할 날짜형식
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    
    for(QuestionDto dto:list)
    {
       %>
       <tr  style="text-align: center;">
       
       <!-- 번호 -->
       <td  style="text-align: center;"><%=no-- %></td>
       
        <!-- 제목.. 내용보기로 연결 -->
       <td style="text-align: center;">
       <a href="index.jsp?container=qa/questionContent.jsp?qnum=<%=dto.getQnum()%>"><%=dto.getSubject() %></a>
       </td>
       <% //닉네임 출력
       //String aname=dao.getNickname(id);
      //작성자명 얻기
       String Id=dto.getId();
       //System.out.println(Id);                        
       String nickname2=dao.getNickname(dto.getId());
       //System.out.println(nickname);
       %>
       


       <!-- 작성자 -->
       <td style="text-align: center;"><%=nickname2 %></td>
       
       <!-- 작성일 -->
       <td style="text-align: center;"><%=sd.format(dto.getWrite_day()) %></td>
       </tr>
    <%}
    %>
  </tbody>
</table>            

</div>




<!-- 페이징 처리 -->
<div style="margin:0 center; text-align: center;">
  <ul class="pagination my">
     
     
     <%
     //이전
     if(startPage>1)
     {%>
        <li>
          <a href="index.jsp?container=qa/questionList.jsp?currentPage=<%=startPage-1%>">이전</a>
        </li>
     <%}
     
     for(int pp=startPage;pp<=endPage;pp++)
     {
        if(pp==currentPage)
        {%>
           <li class="active">
             <a href="index.jsp?container=qa/questionList.jsp?currentPage=<%=pp%>"><%=pp %></a>
           </li>
        <%}else{%>
           <li >
             <a href="index.jsp?container=qa/questionList.jsp?currentPage=<%=pp%>"><%=pp %></a>
           </li>
        <%}
     }
     
     //다음
     if(endPage<totalPage)
     {%>
        <li>
          <a href="index.jsp?container=qa/questionList.jsp?currentPage=<%=endPage+1%>">다음</a>
        </li>
     <%}
     %>
     
  </ul>
  </div>
</div>

</body>
</html>