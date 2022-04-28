<%@page import="data.dao.ReviewDao"%>
<%@page import="java.io.File"%>

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

</head>
<body>
<%
//num,pass
String rnum=request.getParameter("rnum");

ReviewDao dao=new ReviewDao();

//게시글 지우기 전에 업로드 이미지 지우기
	String image=dao.getData(rnum).getImage();
	//System.out.println(rnum);
	//업로드된 경로 구하기
	String uploadPath=getServletContext().getRealPath("/save");
	//System.out.println(uploadPath);
	
	
		//파일 생성
		File file=new File(uploadPath+"\\"+image);
		//System.out.println(file);
		
		//파일 삭제
		if(file.exists()) {//파일존재하면 
			file.delete();
			dao.deleteReview(rnum); //삭제
		}else{
			dao.deleteReview(rnum); //삭제
		}
		
			
	//리스트로 이동
	response.sendRedirect("../index.jsp?container=review/reviewlist.jsp");
	


%>
</body>
</html>