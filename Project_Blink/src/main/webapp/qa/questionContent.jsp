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
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	
	//문의사항 입력 ...questionForm.jsp
	$("#btnquestion").click(function(){
		
		window.open("questionForm.jsp","","width=550px,height=500px,left=500px,top=100px");
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

</head>
<%
//콘텐츠를 불러오기 위해 몇번 콘텐츠인지를 불러온다.
String qnum = request.getParameter("qnum");

//DB선언
QuestionDao dao=new QuestionDao();

//데이터 가져오기
QuestionDto dto = dao.getData(qnum);

//날짜 형식
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String loginOk=(String)session.getAttribute("loginOk"); //세션가져오기
String loginId=(String)session.getAttribute("loginId"); //이메일 가져오기

MemberDao mdao = new MemberDao();
String id = mdao.getId(loginId);
String nickname = mdao.getNickname(id);

%>
<body>
<table class="table table-condensed" style="width:650px;">
	<caption><b>내용보기</b></caption>
		<tr>
			<td style="width:500px;">
				<b><%=dto.getSubject() %></b>
			</td>
			
			<td>
				<span style="color: gray; font-size: 9pt;">
				<%=sdf.format(dto.getWrite_day()) %></span>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<span style="color: gray; font-size: 9pz;">
				작성자 : <%=dto.getId() %></span>
				<br></br>
				<pre><%=dto.getContent() %></pre>
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
				  	<td width="480px;">
				  		<textarea width="470px;" height="70px;"
				  		name="content" required="required" class="form-control">
				  		</textarea>
				  	</td>
				  	<td>
				  	<button type="submit" class="btn btn-info"
				  	style="width:70px; height:70px;">등록</button>
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
						<span class="glyphicon glyphicon-user" style="font-size: 20pt;"></span>
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
						
						<%
						//댓글삭제는 로그인중이면서 로그인한 아이디와 같을 경우에만 삭제아이콘 보이게 코딩개별 #3 
	                    %>
	                    <span class="adel glyphicon glyphicon-remove" anum="<%=adto.getAnum() %>"
	                    style="cursor:pointer; margin-left:10px;"></span>
	                    
						<br>
						<span style="font-size:10pt;"><%=adto.getContent().replace("\n", "<br>") %></span>
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
<div style="margin-left: 400px;">
	<button type="button" class="btn btn-info" 	
	id="btnquestion">질문하기</button>
	<button type="button" class="btn btn-info" 
	onclick="location.href='index.jsp?container=qa/questionList.jsp'">목록</button>
	<button type="button" class="btn btn-info" 
	onclick="location.href='index.jsp?container=qa/questionUpdateForm.jsp?qnum=<%=qnum%>'">수정</button>
	<button type="button" class="btn btn-info" 
	onclick="location.href='index.jsp?container=qa/questionDeleteForm.jsp?qnum=<%=qnum%>'">삭제</button>
</div>



</body>
</html>