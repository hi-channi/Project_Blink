<%@page import="data.dao.LoginDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.CommentDao"%>
<%@page import="data.dto.CommunityDto"%>
<%@page import="data.dao.CommunityDao"%>
<%@page import="java.text.SimpleDateFormat"%>

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
   
   //추천누르면 1증가
   $("button.likes").click(function(){
      
      var bnum=$(this).attr("bnum");
      var tag=$(this);
      
      $.ajax({
         
         type:"get",
         dataType:"json",
         url:"community/like_cnt.jsp",
         data:{"bnum":bnum},
         success:function(data){
            //alert(data.chu);
            tag.next().text(data.like_cnt);
            
            tag.next().next().animate({"font-size":"10px"},500,function(){
               
               //애니메이션이 끝난후 다시 글꼴 0px로 변경
               $(this).css("font-size","0px");
            });
            
         }
      });
   });
   
   
   $("span.cdel").click(function(){
      
      var cnum=$(this).attr("cnum");
      
      $.ajax({
         
         type:"get",
         dataType:"html",
         url:"community/commentdelete.jsp",
         data:{"cnum":cnum},
         success:function(){
            
            //새로고침
            location.reload();
         }
      });
   });
  
});

</script>
</head>
<%
//게시판번호 받아오기
String bnum=request.getParameter("bnum");
//현재페이지
String currentPage=request.getParameter("currentPage");
//로그인한 상태
String loginOk=(String)session.getAttribute("loginOk");
//로그인한 아이디
String loginId=(String)session.getAttribute("loginId");
//로그인상태인지 확인
//System.out.println("로그인"+loginOk);
//db선언
CommunityDao dao=new CommunityDao();
//조회수증가
dao.updateReadCount(bnum);
//데이터 가져오기
CommunityDto dto=dao.getData(bnum);
//날짜 선언
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
//member테이블 데이터 가져오고 mdao에 저장하기
MemberDao mdao=new MemberDao();

String myid=mdao.getId(loginId);
String Id=dto.getId();
String nickname=mdao.getNickname(dto.getId());
dto.setId(myid);
%>
<body>
<div id="main" style="height: 100%;">
<table class="table table-condensed" style="width: 1000px;">
<input type="hidden" name="bnum" value="<%=bnum%>">
<input type="hidden" name="currentPage" value="<%=currentPage%>">
  <caption><b>내용보기</b></caption>
    <tr>
      <td style="width: 700px;">
         <b><%=dto.getSubject() %></b>
      </td>
      <td>
          <span style="color: gray; font-size: 11pt;">
         <%=sdf.format(dto.getWrite_day()) %>
         &nbsp;&nbsp; 조회<%=dto.getRead_cnt() %>  
         </span>
        <b style="color:gray; font-size: 9pt;">추천 <%=dto.getLike_cnt() %></b>
      </td>
    </tr>
    
    <tr>
      <td colspan="2">
        <span style="color: gray; font-size: 9pt;">
       작성자: <%=nickname%></span>
        <br><br>
        <%=dto.getContent().replace("\n", "<br>") %>
        <br><br>
        
        
      </td>
    </tr>
</table>
<%
             //각방명록에 달린 댓글 목록 가져오기
           CommentDao cdao=new CommentDao();
            List<CommentDto> clist=cdao.getAllComment(dto.getBnum());

			
             //작성자명
              String nickname1=mdao.getNickname(dto.getId());
              //System.out.println(nickname1);         
			
              //System.out.println(loginId);
              System.out.println(dto.getId());//로그인한 id
              System.out.println(myid);//로그인한 id
              System.out.println(nickname); //글작성자nickname
              System.out.println(nickname1); //로그인한 작성자nickname
          %>
           <span class="answer" style="cursor: pointer;" bnum=<%=dto.getBnum() %>>답변 <%=clist.size() %></span>
          
<div style="margin-left: 660px;">

  <button type="button" class="btn btn-default"
  onclick="location.href='index.jsp?container=community/communitylist.jsp'">목록</button>
  <% 
   if(loginOk!=null && nickname.equals(nickname1))
   {%>
  
  <button type="button" class="btn btn-default"
  onclick="location.href='index.jsp?container=community/updateform.jsp?bnum=<%=bnum%>'">수정</button>
  <%} 
   %>
  <% 
   if(loginOk!=null && nickname.equals(nickname1))
   {%>
  <button type="button" class="btn btn-default"
  onclick="location.href='index.jsp?container=community/communityDeleteForm.jsp?bnum=<%=bnum%>'">삭제</button>
    <%} 
   %>
      <% 
   if(loginOk!=null && !nickname.equals(nickname1))
   {%>
   
     <button type="button" class="btn btn-default likes"
    bnum="<%=dto.getBnum()%>">추천하기</button>
   <span class="like_cnt"><%=dto.getLike_cnt() %></span>
   <span class="glyphicon glyphicon-heart" style="color: red; font-size: 0px;"></span>
   <%} 
   %>
</div>


         			<!-- 댓글 -->
           <div class="comment" >

          <!-- 댓글들어갈곳 ..댓글입력폼,출력폼-->
         
                 <div class="commentform" >
                   <form action="community/commentinsert.jsp" method="post">
                   <!-- hidden -->
                   <input type="hidden" name="bnum" value="<%=dto.getBnum()%>">
                   <input type="hidden" name="id" value="<%=dto.getId()%>">
                   <input type="hidden" name="currentPage" value="<%=currentPage%>">
                     <table>
                       <tr>
                        <% 
   if(loginOk!=null)
   {%>
                         <td width="480">
                           <textarea style="width: 470px; height: 40px;"
                           name="content" required="required" class="form-control"></textarea>
                         </td>
                         <td>
                           <button type="submit" class="btn btn-info" 
                           style="width: 60px; height: 40px;">등록</button>
                         </td>
                         <%} 
					%>
                       </tr>
                     </table>
                   </form>
                 </div>

             
                <div class="commentlist" style="background-color: #eee;">
                   <table style="width: 500px;">
                     <% if(clist.size()==0) {
                     %>
                       <b>인원이없습니다.</b> 
                    <%} else
                     for(CommentDto cdto:clist)
                     {%>
                        <tr>
                          <td width="60" align="left">
                           <span class="glyphicon glyphicon-user" style="font-size: 20pt;"></span>
                          </td>
                          <td>
                          <%
                            //작성자명 얻기   
                          
                        String nickname2=mdao.getNickname(cdto.getId());
                         %>
                         <br>
                         <b><%=nickname2 %></b>&nbsp;
                         
                         
                         <%//로그인한 사람이 댓글달았을경우
                         if(dto.getId().equals(cdto.getId())){ %>

                            <span style="color: gray;">(나)</span>
                        <% }
                         %>
                         <span style="font-size: 9pt; color: gray; margin-left: 20px;"><%=sdf.format(cdto.getWrite_day()) %></span>
                         
                         <%
                          //* 댓글삭제는 로그인중이면서 로그인한 아이디와 같을경우에만 삭제아이콘 보이게
                         if(loginOk!=null && cdto.getId().equals(myid))
                         {%> 
                           <span class="cdel glyphicon glyphicon-remove" cnum="<%=cdto.getCnum()%>"
                           style="cursor: pointer; margin-left: 10px;"></span> 
                           <%}
                           %>
                         <br>
                            <span style="font-size: 10pt;"><%=cdto.getContent().replace("\n", "<br>") %></span>
                          </td>
                        </tr>
                        <%}
                        %>
                       
                        
                       
                    
                   </table>
                </div>
</div>
</div>

</body>
</html>