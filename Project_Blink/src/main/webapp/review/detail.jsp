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
				tag.next().text(data.like_cnt);
				
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
String loginid=(String)session.getAttribute("loginId");

String rnum=request.getParameter("rnum");
ReviewDao dao=new ReviewDao();
//조회수증가
dao.updateReadCount(rnum);
//데이터 가져오기
ReviewDto dto=dao.getData(rnum);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//각방명록에 달린 댓글 목록 가져오기
MemberDao mdao=new MemberDao();
String myid=mdao.getId(loginid);
//System.out.println(loginid);
//System.out.println(myid);
dto.setId(myid);
%>
<body>
<table class="table table-condensed" style="width: 650px;">
	<caption><b>공모전 후기 내용보기</b></caption>
		<tr>
			<td style="width: 500px;">
			<b><%=dto.getSubject() %></b>
			</td>
			<td>
				<span style="color:gray; font-size: 9pt;">
				<%=sdf.format(dto.getWrite_day()) %></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<b style="color:gray; font-size: 9pt;">조회 <%=dto.getRead_cnt() %></b>
				<b style="color:gray; font-size: 9pt;">추천 <%=dto.getLike_cnt() %></b>
				<span style="color:gray; font-size:9pt;">
				<%
	       		    //작성자명 얻기
	       		    String Id=dto.getId();
	       		   	//System.out.println(Id);	       		    	 
	       		    String nickname=mdao.getNickname(dto.getId());
	       		   //System.out.println(nickname);
	       		    	 
	       		     
	       		    %><br>
	       		   <b><%=nickname %></b>&nbsp;</span>
		</tr>
		<tr>
		<td colspan="2">
				<span> <%=dto.getLink() %></span>
		</td>
		</tr>
		<tr>
		<td colspan="2">
				<br><br>
				<!-- 이미지 클릭하면 새창에 원래 사이즈로 보기 -->
				<img alt="" src="save/<%=dto.getImage()%>"
				style="max-width: 200px;">
				<br><br>
				<%=dto.getContent().replace("\n","<br>") %>
				<br><br>
			</td>
			
		</tr>
		</table>
		
		<div style="margin-left: 300px;">
			<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?container=review/insertform.jsp'">글쓰기</button>
			<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?container=review/reviewlist.jsp'">목록</button>
			<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?container=review/updateform.jsp?rnum=<%=rnum%>'">수정</button>
			<button type="button" class="btn btn-default"
			onclick="location.href='index.jsp?container=review/deleteaction.jsp?rnum=<%=rnum%>'">삭제</button>
			<button type="button" class="btn btn-default likes"
			 rnum="<%=dto.getRnum()%>">추천하기</button>
			 <span class="like_cnt"><%=dto.getLike_cnt() %></span>
			 <span class="glyphicon glyphicon-heart" style="color: red; font-size: 0px;"></span>
		</div>
</body>
</html>