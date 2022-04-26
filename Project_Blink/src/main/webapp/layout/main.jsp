<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

<ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
    <div class="slide">
      <img src="image_main/semislide1.png" />
        </div>
    <div class="nav">
      <label for="img-5" class="prev">&#x2039;</label>
      <label for="img-2" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="image_main/semislide2.png" />
        </div>
    <div class="nav">
      <label for="img-1" class="prev">&#x2039;</label>
      <label for="img-3" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="image_main/semislide3.png" />
        </div>
    <div class="nav">
      <label for="img-2" class="prev">&#x2039;</label>
      <label for="img-4" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="image_main/semislide4.png" />
        </div>
    <div class="nav">
      <label for="img-3" class="prev">&#x2039;</label>
      <label for="img-5" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide">
          <img src="image_main/semislide5.png" />
        </div>
    <div class="nav">
      <label for="img-4" class="prev">&#x2039;</label>
      <label for="img-1" class="next">&#x203a;</label>
    </div>
    </li>

</ul>
</body>
</html>