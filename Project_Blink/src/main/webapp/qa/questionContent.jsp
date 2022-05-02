<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.AnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.QuestionDto"%>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

   
   //문의사항 입력 ...questionForm.jsp
   $("#btnquestion").click(function(){
      
      window.open("qa/questionForm.jsp","","width=550px,height=500px,left=500px,top=100px");
   });
   


//답글부분 안보이게 하는것

   $("div.answer").hide();
//클릭시 보였다 안보였다 하게 하기
   $("span.answer").click(function(){
      $("div.answer").toggle();
      //답글이 전체다 열리기떄문에 개별로 하려면 아래방법
      //현재 만든것은 게시판 방식이기 때문에 상관없지만 혹시몰라 주석
      //$(this).parent().find("div.answer").toggle();
   });
      
   //댓글삭제 이벤트..ajax
   //새로고침은 location.reload()
   $("span.adel").click(function(){
      
      var anum=$(this).attr("anum");
      //alert(anum);
      
      $.ajax({
         
         type:"get",
         dataType:"html",
         url:"qa/answerDelete.jsp",
         data:{"anum":anum},
         success:function(){
         
         //새로고침
         location.reload();
      }
         
      });
      
   });   
});
</script>
<style type="text/css">

span.gesipanname {
   width: 50px;
   height: 10px;
   width: 50%;
   text-align : center !important;
   border: 0;	
   outline: none;
   background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec) !important;
   background-position: center;
   background-size: 100%;
   color: #FAFAFA !important;
   font-size: 17pt;
   letter-spacing: 2px;
   transition: 0.4s;
   margin-left: 210px;
   margin-bottom: 10px;


}



table {
   font-size: 12pt;
   width: 100%;
   text-align: left;
   border-spacing: 30px;
}

.content {
   font-size: 20pt;
   text-align: left;
   background-color:#F2F2F2;
   text-align: left;
   width:630px;
   height: 200px;
   margin-left: auto;
   margin-right: auto;
}

.w-btn-outline {
    position: relative;
    padding: 6px 8px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-blue-outline {
    border: 3px solid #6aafe6;
    color: #6e6e6e;
}


.w-btn-blue-outline:hover {
    background-color: #6aafe6;
    color: #d4dfe6;
    overflow: hidden;
}


</style>

</head>
<%
//콘텐츠를 불러오기 위해 몇번 콘텐츠인지를 불러온다.
String qnum = request.getParameter("qnum");

//DB선언
QuestionDao dao=new QuestionDao();

//데이터 가져오기
QuestionDto dto = dao.getData(qnum);

//날짜 형식
SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");

String loginOk=(String)session.getAttribute("loginOk"); //세션가져오기
String loginId=(String)session.getAttribute("loginId"); //이메일 가져오기

MemberDao mdao = new MemberDao();
String id = mdao.getId(loginId);
String nickname = mdao.getNickname(id);
String membertype = mdao.getMembertype(id);


String nickname3 = mdao.getNickname(dto.getId());

%>
<body>

<div id="main" style="min-height: 1000px; max-height: 100%; width:1100px;">

<br>
<span class="gesipanname">Q&A 게시판</span>

<h3 style="margin-left: 230px;"><%=dto.getSubject() %></h3>
<span style="font-size: 10pt; margin-left: 230px;"> 작성자 : <%=nickname3 %> </span>
<span style="font-size: 10pt; margin-left: 440px;" >작성일 : <%=sdf.format(dto.getWrite_day()) %></span>
<table class="table table-condensed" style="width:650px; height:300px; margin-left: auto; margin-right: auto;">

      <tr>
         <td colspan="2">
            <pre class="content"><%=dto.getContent() %></pre>
            <h4></h4>
         </td>
      </tr>


           <!-- 답글 -->
     <tr>
        <td>
        <%
         //각 게시글에 달린 댓글 목록 가져오기
         AnswerDao adao = new AnswerDao();
         List<AnswerDto> alist = adao.getAllAnswer(dto.getQnum());
         
         %>
          <span class="answer" style="cursor: pointer;" qnum=<%=dto.getQnum() %>>답변 <%=alist.size() %></span>
         
         <!-- 답글들어갈곳 입력폼 출력폼 -->
         
         <div class="answer">
            <div class="answerform">
             <form action="qa/answerAction.jsp" method="post">
             <!-- hidden -->
             <input type="hidden" name="qnum" value="<%=dto.getQnum()%>">
             <%//현재로그인한 아이디 %>
             <input type="hidden" name="id" value="<%=id%>">      
              <table>
                 <tr>
                    <%
               if(loginOk!=null && membertype.equals("기업회원")){%>
                 <td width="480px;">
                    <textarea width="470px;" height="70px;"
                    name="content" required="required" class="form-control">
                    </textarea>   
                 </td>
                 <%} 
               %>
                 <td>
                 <%
               if(loginOk!=null && membertype.equals("기업회원")){%>
                 <button type="submit" class="btn btn-info"
                 style="width:70px; height:70px;">등록</button>
                 <%} 
               %>
                 </td>
                 </tr>
              </table>
              </form>
            </div>
         
            <div class="answerlist" style="background-color: #eee;">
               <table style="width:500px;">
               <%
               for(AnswerDto adto:alist)
               {%>
                  <tr>
                  <td width="60px;" align="left">
                  <span class="glyphicon glyphicon-user" style="font-size: 20pt; margin-left: 10px; margin-right: -5px; margin-top: 15px;"></span>
                  </td>
                  <td>
               <% //닉네임 출력
                   //String aname=dao.getNickname(id);
                  //작성자명 얻기
                   String Id=adto.getId();
                   //System.out.println(Id);                        
                   String nickname2=mdao.getNickname(adto.getId());
                   //System.out.println(nickname);
                   %>



                  <br>
                  <b><%=nickname2 %></b> &nbsp;
                  <span style="font-size: 9pt; color: gray; margin-left: 20px;"><%=sdf.format(adto.getWrite_day()) %></span>
                  
                  <% //댓글 지우기
                  if(loginOk!=null && adto.getId().equals(id))
                  {%>
                       <span class="adel glyphicon glyphicon-remove" anum="<%=adto.getAnum() %>"
                       style="cursor:pointer; margin-left:10px;"></span>
                       <%} 
                       %>
                  <br>
                  <span style="font-size:10pt;"><%=adto.getContent().replace("\n", "<br>") %></span><br>
                  <hr>
                  </td>
                  </tr>
               <%}
               %>
               </table>
            </div>
         </div>
        </td>
     </tr>
</table>
<div style="margin-left: 310px;">
   
   <% 
   if(loginOk!=null && dto.getId().equals(id))
   {%>
   <button type="button" class="w-btn-outline w-btn-blue-outline" 
   onclick="location.href='index.jsp?container=qa/questionUpdateForm.jsp?qnum=<%=qnum%>'">수정</button>
   <%} 
   %>
   <% 
   if(loginOk!=null && dto.getId().equals(id))
   {%>
   <button type="button" class="w-btn-outline w-btn-blue-outline" 
   onclick="location.href='index.jsp?container=qa/questionDeleteForm.jsp?qnum=<%=qnum%>'">삭제</button>
   <%} 
   %>
   <%
   if(loginOk!=null && membertype.equals("일반회원")){%>
   <button type="button" class="w-btn-outline w-btn-blue-outline"    
   id="btnquestion">질문하기</button>
   <%} 
   %>
   <button type="button" class="w-btn-outline w-btn-blue-outline" 
   onclick="location.href='index.jsp?container=qa/questionList.jsp'">목록</button>
</div>

</div>

</body>
</html>