<%@page import="data.dao.ScrapDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
img.photo {
	width: 70px;
	height: 80px;
	border: 2px solid gray;
}

div.item{
	cursor: pointer;
}

tr>th {
	text-align: center;
}
</style>
<script type="text/javascript">
$(function () {
	// 체크박스 전체 체크/해제
	$("#allcheck").click(function () {
		var a=$(this).is(":checked");
		if(a) {
			$(".idx").attr("checked", true);
		} else {
			$(".idx").attr("checked", false);
		}
	});
	// 개별 상품 삭제 이벤트
	$("span.del").click(function () {
		var idx=$(this).attr("idx");
		var delmsg=confirm("장바구니에서 삭제하시겠습니까?");
		if(delmsg) {
			$.ajax({
				type:"get",
				url:"shop/cartdelete.jsp",
				dateType:"html",
				data: {"idx":idx},
				success: function () {
					alert("삭제되었습니다.");
					location.reload();		// 현재 페이지 새로고침
				}
			});
		}
	});
	// 체크된 항목 삭제 이벤트
	$("#btncartdel").click(function() {
		var ccnt=$(".idx:checked").length;
		alert(ccnt);
		if(ccnt==0) {
			alert("삭제할 상품을 선택하세요.")
			return;
		} else {
			$(".idx:checked").each(function(i, elt) {
				var idx=$(this).attr("idx");
				console.log(idx);
				$.ajax({
					type:"get",
					url:"shop/cartdelete.jsp",
					dateType:"html",
					data: {"idx":idx},
					success: function () {
						alert("선택한 상품이 삭제되었습니다.");
						location.reload();		// 현재 페이지 새로고침
					}
				});
			});
		}
	});
});
</script>
</head>

<%
	// 로그인 한 아이디 or 이메일 얻기
	//String loginid=(String)session.getAttribute("email");
	
	// dao선언
	//MemberDao mdao=new MemberDao();
	//String name=mdao.getName(loginid);
	//ScrapDao dao=new ScrapDao();
	//List<HashMap<String, String>> list=dao.getScrapbook(loginid);
	
	NumberFormat nf = NumberFormat.getInstance();
%>

<body>

<h4 class="alert alert-warning" style="width: 1000px;">
<%=name %>님의 장바구니
</h4>
<table class="table table-striped" style="width: 1000px;">
	<tr>
		<th style="width: 30px;">
			<input type="checkbox" id="allcheck">
		</th>
		<th style="width: 400px;">상품정보</th>
		<th style="width: 200px;">상품금액</th>
		<th style="width: 100px;">삭제</th>
	</tr>

	<%
	// 장바구니 총 금액
	int totalprice=0;
	int totalcnt=0;
	
	if(list.size()==0) {
		%>
		<tr>
		<td colspan="4" align="center">
		<br>
		<b>스크랩한 공모전이 없습니다.</b>
		<br>
		</td>
	</tr>
	<%
	} else {
		for(int i=0;i<list.size();i++) {
			HashMap<String, String> map=list.get(i);
			%>
			<tr>
				<td align="center">
					<input type="checkbox" name="idx" idx="<%=map.get("snum") %>" class="idx" checked="checked">
				</td>
				<td style="vertical-align: middle;">
					<div class="scarpinfo" connum="<%=map.get("connum") %>">
					<img alt="" src="images/poster/<%=map.get("image") %>" class="photo" align="left" hspace="20">
					<a href="index.jsp?main=contest/detailpage.jsp?connum=<%=map.get("connum") %>"><%=map.get("subject") %></a>
					<br>추가일자: <%=map.get("sday") %>
					</div>
				</td>
				<td>
				<span class="glyphicon glyphicon-trash del" snum="<%=map.get("snum") %>"></span>
				</td>
			</tr>
		<% }
		%>
	<tr>
		<td colspan="4" align="right">
		<button type="button" class="btn btn-danger" style="margin-left: 100px;" id="btncartdel">선택한 공모전 삭제</button>
		</td>
	</tr>
	<% } 
	%>
</table>
<hr>
	
</body>
</html>