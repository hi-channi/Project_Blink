<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.CommentDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<script type="text/javascript">
$(function(){
	
	//추천누르면 1증가
	$("button.likes").click(function(){
		
		var rnum=$(this).attr("rnum");
		var tag=$(this);
		
		$.ajax({
			
			type:"get",
			dataType:"json",
			url:"review/like_cnt.jsp",
			data:{"rnum":rnum},
			success:function(data){
				//alert(data.chu);
				tag.next().text(data.like_cnt).animate({"font-size":"10px"},500,function(){
					
					//애니메이션이 끝난후 다시 글꼴 0px로 변경
					$(this).css("font-size","0px");
					
				});
				
				tag.next().next().animate({"font-size":"10px"},500,function(){
					
					//애니메이션이 끝난후 다시 글꼴 0px로 변경
					$(this).css("font-size","0px");
					
				});
				
			}
		});
	});
	
});

</script>
</head>
<%
String loginId=(String)session.getAttribute("loginId");
//로그인한 상태
String loginOk=(String)session.getAttribute("loginOk");
String rnum=request.getParameter("rnum");
ReviewDao dao=new ReviewDao();
//조회수증가
dao.updateReadCount(rnum);
//데이터 가져오기
ReviewDto dto=dao.getData(rnum);
String currentPage=request.getParameter("currentPage");
System.out.println(currentPage); 
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//각방명록에 달린 댓글 목록 가져오기
MemberDao mdao=new MemberDao();
String myid=mdao.getId(loginId);
String Id=dto.getId();
String nickname=mdao.getNickname(dto.getId());
dto.setId(myid);

//작성자명
String nickname1=mdao.getNickname(dto.getId());
System.out.println(dto.getId());//로그인한 id
System.out.println(myid);//로그인한 id
System.out.println(nickname); //글작성자nickname
System.out.println(nickname1); //로그인한 작성자nickname
%>
<body>
<div id="main" style="height: 100%;">
<table class="table table-condensed" style="font-size: 18pt;">
	<caption><b>공모전 후기<br><br></b></caption>
		<tr style="font-size:10pt;">
			<td>
			<b><%=dto.getSubject() %></b><br>
			</td>
			
		</tr>
		<tr>
			<td>
			<span style="color:gray; font-size:10pt;">작성자:
			
	       		   <b><%=nickname%></b>&nbsp;</span>
	       		   
	       	</td>
	       
	       	
	       	<td>
	       		  
			<b style="color:gray; font-size: 9pt;">조회 <%=dto.getRead_cnt() %></b>
				<b style="color:gray; font-size: 9pt;">추천 <%=dto.getLike_cnt() %></b>
				&nbsp;&nbsp;
				<span style="color:gray; font-size: 9pt;">
				<%=sdf.format(dto.getWrite_day()) %></span>	 
				</td>
		</tr>
		<tr>
		<td colspan="2">
		 	<button type="button" class="btn btn-info btn-md" 
           onclick="window.open('<%=dto.getLink() %>')" target="_new">공모전 사이트 보러가기</button>
		</td>
		</tr>
		<tr>
		<td colspan="2">
			
				<br><br>
				<!-- 이미지 클릭하면 새창에 원래 사이즈로 보기 -->
				<img alt="" src="save/<%=dto.getImage()%>"
				style="max-width: 400px; margin-left: auto; margin-right: auto; display: block;">
				<br><br>
					<%=dto.getContent().replace("\n","<br>") %>
			</td> 
			
		</tr>
		</table>
		
		<div style="margin-left: 660px;">
		<% 
   if(loginOk!=null)
   {%>
			<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?container=review/insertform.jsp'">글쓰기</button>
			<%} 
   %>
			<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?container=review/reviewlist.jsp'">목록</button>
			 <% 
   if(loginOk!=null && nickname.equals(nickname1))
   {%>
			<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?container=review/updateform.jsp?rnum=<%=rnum%>'">수정</button>
			<%} 
   %>
   	 <% 
   if(loginOk!=null && nickname.equals(nickname1))
   {%>
			<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?container=review/deleteaction.jsp?rnum=<%=rnum%>&currentPage=<%=currentPage%>'">삭제</button>
				<%} 
   %>
      <% 
   if(loginOk!=null && !nickname.equals(nickname1))
   {%>
			<button type="button" class="btn btn-default likes"
			 rnum="<%=dto.getRnum()%>">추천하기</button>
			 <span class="like_cnt"></span>
			 <span class="glyphicon glyphicon-heart" style="color: red; font-size: 0px;"></span>
	<%} 
   %>
	
		</div>
		</div>
</body>
</html>