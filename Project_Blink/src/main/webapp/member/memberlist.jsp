<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>회원가입 처리 JSP</title>

</head>
<body>
<%
MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllDatas();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>
<table class="table table-borderd" style="width: 900px;">
	<caption><b>전체회원목록</b></caption>
	<tr bgcolor="#ccf">
		<th width="50">이름</th>
		<th width="70">닉네임</th>
		<th width="70">비밀번호</th>
		<th width="140">전화번호</th>
		<th width="150">주소</th>
		<th width="150">이메일</th>
		<th width="100">수정/삭제</th>
	</tr>
	<%
	for(MemberDto dto:list)
	{%>
		<tr>
			<td><%= dto.getName() %></td>
			<td><%= dto.getNickname() %></td>
			<td><%= dto.getPw() %></td>
			<td><%= dto.getContact() %></td>
			<td><%= dto.getAddr() %></td>
			<td><%= dto.getEmail() %></td>
			<td>
				<!-- 수정경로: 현재경로 index.jsp이기 때문에 ../ 올라갈 필요가 없음 -->
				<button type="button" class="btn btn-info btn-xs"
				onclick="location.href='index.jsp?main=member/updatepassform.jsp?num=<%= dto.getEmail() %>'">수정</button>
				<button type="button" class="btn btn-danger btn-xs"
				onclick="funcdel(<%= dto.getEmail() %>)">삭제</button>		
			</td>
		</tr>
	<%
	}
	%>
</table>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">삭제확인</h4>
        </div>
        <div class="modal-body">
          <input type="hidden" id="delnum">
          <b>삭제비밀번호: </b>
          <input type="password" id="delpass" class="form-control" style="width: 120px;">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default delbtn" data-dismiss="modal">삭제</button>
        </div>
      </div>
      
    </div>
  </div>
  
<script type="text/javascript">
function funcdel(n) {
	//alert(n)
	$("#delnum").val(n);
	$("#myModal").modal(); //모달창을 띄우겠다
	
	//모달창 삭제버튼이벤트
	$("button.delbtn").click(function() {
		//num,pass 읽기
		var num = $("#delnum").val();
		var pass = $("#delpass").val();
		
		//삭제파일로 이동(num,pass파라미터로 전달)
		location.href = "member/memberdelete.jsp?num="+num+"&pass="+pass;
	});
}
</script>
</body>
</html>