
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:150px;
  height:60px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display: block; 
}

table{
	margin-left:auto; 
	margin-right:auto;
    border:3px solid #2cccc4
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

//null값이 넘어와도 페이지가 나오게끔 임의로 준 것!
String key = request.getParameter("key");

if(key==null){%>
	<form action="idsearch.jsp" method="post" class="form-inline">
		<input type="hidden" name="key" value="result">
		<table>
			<tr height="500">
				<td width="500">
					<br>
					<b>아이디를 입력해주세요</b>
					<input type="text" name="id" class="form-control" style="width: 300px;"
					required="required">
					<br>
					<button type="submit" class="btn">중복체크</button>
				</td>
			</tr>
		</table>
	</form>
<%
} else {
	//nickname있는지 DB에 있는지 체크
	String nickname = request.getParameter("nickname");
	MemberDao dao=new MemberDao();
	boolean b = dao.isIdCheck(nickname);
	
	if(b) {%>
		<script type="text/javascript">
			alert("이미 등록된 아이디입니다.");
			location.href = 'idsearch.jsp';
		</script>
	<%
	} else {%>
		<h3 class="alert alert-success"><%= nickname %>는 사용가능한 아이디입니다.</h3>
		<button type="button" class="btn" id="btnuse"
		style="margin-left: 200px;" myid="<%= nickname %>" onclick="goBack('<%= nickname %>')">사용하기</button>
		<button type="button" class="btn"
		onclick="location.href='idsearch.jsp'">다시하기</button>
	<%
	}
}
%>
<script type="text/javascript">
function goBack(nickname)
{
	opener.mfrm.id.value = nickname;
	window.close();
}
</script>
</body>
</html>