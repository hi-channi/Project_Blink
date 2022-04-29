<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
#blah{
   position: absolute;
   left: 600px;
   top: 100px;
}

</style>

<title>Insert title here</title>
</head>
<body>
<div id="main" style="height:1000px;">
<form action="review/insertaction.jsp" method="post"
enctype="multipart/form-data">
   <table class="table table-bordered" style="width: 1000px; border-radius: 7px 10px 7px 20px; ">
      
      <tr>
         <th style="width: 150px;" bgcolor="#ddd">공모전 이름</th>
            <td>
               <input type="text" name="subject" class="form-control"
               placeholder="subject" required="required">
            </td>
      </tr>
      
      <tr>
         <th style="width: 70px;" bgcolor="#ddd">포스터 업로드</th>
            <td>
                <input type="file" name="image" style="width: 850px;" class="form-control" required="required">
              	
            </td>
      </tr>
      
      <tr>
         <th style="width: 150px;" bgcolor="#ddd">사이트링크</th>
            <td>
               <input type="text" name="link" class="form-control"
               placeholder="link" required="required">
            </td>
      </tr>

      
      <tr>
         <td colspan="2"> 
            <textarea style="width: 1000px; height: 500px;"
            class="form-control" name="content" required="required"></textarea>
         </td>
      </tr>
      
      <tr>
         <td colspan="2" align="center">
            <button type="submit" class="btn btn-info btn-md">저장하기</button>
            <button type="button" class="btn btn-danger btn-md"
           onclick="location.href='index.jsp?conteiner=review/reviewlist.jsp'">목록보기</button>
         </td>
      </tr>
   </table>
</form>
</div>
</body>
</html>

