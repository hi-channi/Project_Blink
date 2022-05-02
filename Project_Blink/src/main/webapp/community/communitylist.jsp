<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.CommunityDao"%>
<%@page import="data.dto.CommunityDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
display: flex;
justify-content:center;
   
}
*, *:before, *:after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

table {
  border-radius: 0.25em;
  border-collapse: collapse;
  margin: 1em;
  width: 90%;
  margin: auto;
  font-size: 20px;
}
th {
  border-bottom: 1px solid #364043;
  color: #3498db;
  font-size: 0.8em;
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
   margin: auto;
   width: 100px;
   background: #B4C3FF;
}

.comulist {
   width: 100%;
   text-align : center;
   border: 0;   
   outline: none;
   background-position: center;
   background-size: 200%;
   color: #3498db;
   font-size:40px;
}

a{
   text-decoration-line: none !important;
}


</style>

</head>
<%
CommunityDao dao=new CommunityDao();
MemberDao mdao=new MemberDao();



//페이징처리에 필요한 변수
int totalCount; //총글수
int totalPage; //총 페이지수
int startPage; //각블럭의 시작페이지
int endPage; //각블럭의 끝페이지
int start; //각페이지의 시작번호
int perPage = 15; //한페이지에 보여질 글 갯수
int perBlock = 5; //한블럭당 보여지는 페이지 개수
int currentPage; //현재페이지

int no;

//총갯수
totalCount = dao.getTotalCount();

//현재 페이지번호 읽기(단 null일경우는 1페이지로 설정)
if (request.getParameter("currentPage") == null)
   currentPage = 1;
else
   currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총페이지 개수구하기
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각블럭의 시작페이지
//예:현재페이지가 3인경우 startpage=1,endpage= 5
//현재페이지가 6인경우 startpage=6,endpage= 10
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

//만약 총페이지가 8 -2번째블럭: 6-10 ..이럴경우는 endpage가 8로 수정되어야함
if (endPage > totalPage)
   endPage = totalPage;

//각페이지에서 불러올 시작번호
start = (currentPage - 1) * perPage;

//각페이지에서 필요한 게시글 가져오기
List<CommunityDto> list = dao.getList(start, perPage);

//각 글앞에 붙일 시작번호 구하기
//총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
no = totalCount - (currentPage - 1) * perPage;
SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
%>
<body>
<!--게시판 출력  -->
<div id="main" style="min-height: 1000px; max-height:100%; width:100%;" >
<table style="width: 90%; margin:0 auto; font-size: 20px;">

<caption><b class="comulist">팀원모집 커뮤니티</b>
  <br>
  <button type="button"
onclick="location.href='index.jsp?container=community/insertform.jsp'"><span class="glyphicon glyphicon-pencil">
</span>글추가</button> 
</caption>
  <thead>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>조회</th>
      <th>추천수</th>
    </tr>
  </thead>
  <tbody>
    <%
    if(totalCount==0)
    {%>
       <tr height="40">
         <td colspan="5" align="center">
           <b>등록된 게시글이 없습니다</b>
         </td>
       </tr>
    <%}else{
       for(CommunityDto dto:list)
       {%>
          <tr>
            <td align="center" ><%=no-- %></td>
            <td>
            <a href="index.jsp?container=community/detail.jsp?bnum=<%=dto.getBnum()%>&currentPage=<%=currentPage%>">
            <%=dto.getSubject()%></a>
            
            </td>
            <td>
            <%
            String getid=dto.getId();
            String nickname=mdao.getNickname(getid);            
            %>
            <%=nickname%></td>
            
            <td><%=sdf.format(dto.getWrite_day()) %></td>
            <td><%=dto.getRead_cnt() %></td>
            <td><%=dto.getLike_cnt() %></td>
          </tr>
          
          
       <%}
                     %>
                     
                     
                     
<%     }
    %>
   
  </tbody>
</table>
<!-- 페이징처리 -->

<div style="text-align: center; margin:0 center;" >
  <ul class="pagination">
     
     <%
     //이전
     if(startPage>1)
     {%>
        <li>
          <a href="index.jsp?container=community/communitylist.jsp?currentPage=<%=startPage-1%>">이전</a>
        </li>
     <%}
     
     for(int pp=startPage;pp<=endPage;pp++)
     {
        if(pp==currentPage)
        {%>
           <li class="active" style="background-color: black;">
             <a href="index.jsp?container=community/communitylist.jsp?currentPage=<%=pp%>"><%=pp %></a>
           </li>
        <%}else{%>
           <li >
             <a href="index.jsp?container=community/communitylist.jsp?currentPage=<%=pp%>"><%=pp %></a>
           </li>
        <%}
     }
     
     //다음
     if(endPage<totalPage)
     {%>
        <li>
          <a href="index.jsp?container=community/communitylist.jsp?currentPage=<%=endPage+1%>">다음</a>
        </li>
     <%}
     %>
     
  </ul>
</div>

</div>
</body>
</html>