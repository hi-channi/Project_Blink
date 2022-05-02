<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <script>
     $(function(){
    	 $('.post-wrapper').slick({
    		  slidesToShow: 3,
    		  slidesToScroll: 1,
    		  autoplay: true,
    		  autoplaySpeed: 2000,
    		  nextArrow:$('.next'),
    		  prevArrow:$('.prev'),
    		});
     });
    </script>
    <style>
     /*post slider*/
.post-slider{
  width:100%;
  margin:0px auto;
  position:relative;
}
.post-slider .silder-title{
  text-align:center;
  margin:30px auto;
}
.post-slider .next{
  position:absolute;
  top:50%;
  right:30px;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider .prev{
  position:absolute;
  top:50%;
  left:30px;
  font-size:2em;
  color:gray;
    cursor: pointer;
}
.post-slider .post-wrapper{

  width:84%;
  height:350px;
  margin:0px auto;
  overflow: hidden;
  padding:10px 0px 10px 0px;
}
.post-slider .post-wrapper .post{
  width:300px;
  height:300px;
  margin:0px 10px;
  display:inline-block;
  background:white;
  border-radius: 5px;
}
.post-slider .post-wrapper .post .post-info{
  font-size:15px;
  height:30%;
  padding-left:10px;
}
.post-slider .post-wrapper .post .slider-image{
  width:100%;
  height:350px;
  border-top-left-radius:5px;
  border-top-right-radius:5px;
}
    </style>
  </head>
  <body>
<div class="page-wrapper" style="position:relative;">
      <!--page slider -->
      <div class="post-slider">
        <h1 class="silder-title">Trending Posts</h1>
        <button class="fas fa-chevron-left prev">prev</button>  
        <button class="fas fa-chevron-right next">next</button>   
        <div class="post-wrapper">
          <div class="post">
            <img src="images/NFT프로젝트 피칭대회.jpg" class="slider-image">
            <div class="post-info">
            </div>
          </div>
          <div class="post">
            <img src="images/기후변화과학 통합 공모전.jpg" class="slider-image">
            <div class="post-info">
            </div>
          </div>
          <div class="post">
            <img src="images/날씨빅데이터 콘테스트.jpg" class="slider-image">
            <div class="post-info">
            </div>
          </div>
          <div class="post">
            <img src="images/럭스로보 경진대회.jpg" class="slider-image">
            <div class="post-info">
            </div>
          </div>
        </div>
      </div>
      <!--post slider-->
    </div>
  </body>
</html>