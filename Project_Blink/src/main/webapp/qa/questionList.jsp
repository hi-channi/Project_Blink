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

<title>Insert title here</title>
<style type="text/css">
h1 {
   width: 200px;
   height: 120px;
   width: 100%;
   text-align : center !important;
   border: 0;	
   outline: none;
   background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec) !important;
   background-position: center;
   background-size: 200%;
   color: #FAFAFA !important;
   font-size: 1em;
   letter-spacing: 2px;
   transition: 0.4s;
   display: inline;
}

h2 {border-bottom: 2px solid #adadad; border-width: 33.5%;
   width: 33.5%;}
table {
   font-size: 12pt;
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
<div id="main" style="height:1000px; width:1100px;">
<div>


<br>

<div class="mt-3">
<h1> Q&A 게시판</h1>
<br>
  <h2>총<%=totalCount %>개의 질문이 있습니다.</h2>            
  <table class="table">
    <thead>
      <tr>
      <th style="text-align: center;">번호</th>
      <th style="text-align: center;">제목</th>
      <th style="text-align: center;">작성자</th>   
      <th style="text-align: center;">작성일</th>   
      </tr>
    </thead>
    <tbody>
      <%
    //출력할 날짜형식
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    
    for(QuestionDto dto:list)
    {
       %>
       <tr>
       
       <!-- 번호 -->
       <td align="center"><%=no-- %></td>
       
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
  <ul class="pagination">
     
     
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
</div>

</body>
</html>