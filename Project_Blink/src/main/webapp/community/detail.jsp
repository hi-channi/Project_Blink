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
   
   
   //댓글삭제 이벤트..ajax로
   //새로고침..location.reload()
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
   //댓글수정 이벤트..ajax로
   //새로고침..location.reload()
   $("button.cup").click(function(){
      
      var cnum=$(this).attr("cnum");
      alert(cnum);
      
      $.ajax({
         
         type:"get",
         dataType:"html",
         url:"community/commentupdate.jsp",
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

String bnum=request.getParameter("bnum");

String currentPage=request.getParameter("currentPage");
//로그인아이디세션 선언
//로그인상태 확인후 입력폼 나타내기

//로그인한 아이디
String loginOk=(String)session.getAttribute("loginOk");
String loginId=(String)session.getAttribute("loginId");

System.out.println("로그인"+loginOk);

CommunityDao dao=new CommunityDao();



//조회수증가
dao.updateReadCount(bnum);
//데이터가져오기
CommunityDto dto=dao.getData(bnum);
// String subject=dto.getSubject();
//System.out.println(subject); 
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//데이터 가져오고 저장하기

MemberDao mdao=new MemberDao();
String id=mdao.getId(loginId);
String nickname = mdao.getNickname(id);
System.out.println(loginId);
System.out.println(id);

dto.setId(id);
%>
<body>
<table class="table table-condensed" style="width: 1000px;">
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
        <%=dto.getBnum() %></span>
        <br><br>
        <%=dto.getContent().replace("\n", "<br>") %>
        <br><br>
        
        
      </td>
    </tr>
</table>

<div style="margin-left: 660px;">
  <button type="button" class="btn btn-default"
  onclick="location.href='index.jsp?container=community/communitylist.jsp'">목록</button>
  <button type="button" class="btn btn-default"
  onclick="location.href='index.jsp?container=community/updateform.jsp?bnum=<%=bnum%>'">수정</button>
  <button type="button" class="btn btn-default"
  onclick="location.href='index.jsp?container=community/delete.jsp?bnum=<%=bnum%>&currentPage=<%=currentPage%>'">삭제</button>
     <button type="button" class="btn btn-default likes"
    bnum="<%=dto.getBnum()%>">추천하기</button>
   <span class="like_cnt"><%=dto.getLike_cnt() %></span>
   <span class="glyphicon glyphicon-heart" style="color: red; font-size: 0px;"></span>
</div>

<%
             //각방명록에 달린 댓글 목록 가져오기
           CommentDao cdao=new CommentDao();
            List<CommentDto> clist=cdao.getAllComment(dto.getBnum());
          
          %>

          <!-- 댓글들어갈곳 ..댓글입력폼,출력폼-->
          <div class="comment" >
                 <div class="commentform" >
                   <form action="community/commentinsert.jsp?bnum=<%=dto.getBnum()%>&currentPage=<%=currentPage%>&id=<%=dto.getId()%>" method="post">
                   <!-- hidden -->
                   <input type="hidden" name="cnum" value="<%=dto.getBnum()%>">
                   <input type="hidden" name="id" value="<%=dto.getId()%>">
                   <input type="hidden" name="currentPage" value="<%=currentPage%>">
                     <table>
                       <tr>
                         <td width="480">
                           <textarea style="width: 470px; height: 40px;"
                           name="content" required="required" class="form-control"></textarea>
                         </td>
                         <td>
                           <button type="submit" class="btn btn-info" 
                           style="width: 60px; height: 40px;">등록</button>
                         </td>
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
                           
                           String Id=cdto.getId();
                           System.out.println(Id);                        
                          String nickname2=mdao.getNickname(cdto.getId());
                        System.out.println(nickname2);
                        
                     
                          %>
                         <br>
                         <b><%=nickname2 %></b>&nbsp;
                         
                         <% //글작성자와 댓글쓴 작성자가 같을경우%>
                         <%if(cdto.getId().equals(id)){ %>

                            <span style="color: gray;">(작성자)</span>
                        <% 
                        
                         }
                         %>
                         <span style="font-size: 10pt;"><%=cdto.getContent().replace("\n", "<br>") %></span>
                         <span style="font-size: 9pt; color: gray; margin-left: 20px;"><%=sdf.format(dto.getWrite_day()) %></span>
                         
                         <%
                          //* 댓글삭제는 로그인중이면서 로그인한 아이디와 같을경우에만 삭제아이콘 보이게
                         if(loginOk!=null && cdto.getId().equals(id))
                         {%> 
                           <span class="cdel glyphicon glyphicon-remove" cnum="<%=cdto.getCnum()%>"
                           style="cursor: pointer; margin-left: 10px;"></span> 
                           <span class="cup glyphicon glyphicon-pencil" cnum="<%=cdto.getCnum()%>"
                           style="cursor: pointer; margin-left: 10px;"></span> 
                         
                           <%}
                           %>

                         <br>
                          </td>
                        </tr>
                        <%}
                        %>
                       
                        
                       
                    
                   </table>
                </div>
</div>


</body>
</html>