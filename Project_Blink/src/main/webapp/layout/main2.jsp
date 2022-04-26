<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>CAROUSEL</title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/main2.css" />
    
</head>

<body>
	<div id="slider-wrap">
		<ul id="slider">
			<li><img src="image_main/slide3.PNG" /></li>

			<li><img src="image_main/slide1.PNG" /></li>

			<li><img src="image_main/slide2.PNG" /></li>

			<li><img src="image_main/slide3.PNG" /></li>

			<li><img src="image_main/slide4.PNG" /></li>
		</ul>

		<div class="slider-btns" id="next">
			<span>▶</span>
		</div>
		<div class="slider-btns" id="previous">
			<span>◀</span>
		</div>

		<div id="slider-pagination-wrap">
			<ul>
			</ul>
		</div>
	</div>

	<script src="layout/main.js"></script>
</body>

</html>