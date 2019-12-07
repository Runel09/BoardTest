<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travelers</title>

<link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway">
<link href="https://fonts.googleapis.com/css?family=Alatsi&display=swap" rel="stylesheet">
<!-- JQuery -->
<script type="text/javascript"  src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- bootstrap -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<style type="text/css">
img {
	display: block;
	margin: 0px auto;
}

hr {
	margin-top: 5px;
	margin-bottom: 5px;
	border: 10;
	border-top: 1px solid #0064FF;
}

@font-face { font-family: 'NIXGONL-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONL-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
a.menubar {
	margin: 7%;
	font-size: 25px;
	font-family: 'NIXGONL-Vb';
	color: #282c37;
	text-decoration: none;
}

h1.name {
	font-size: 25px;
	font-family: 'Alatsi', sans-serif;
	color: #282c37;
	text-align: center;
}

.loginbtngroup {
	position: absolute;
	right: 0px;
	display: inline-block;
	width: 180px
}

.container {
	min-width: 800px;
	width: 72%;
}

#header {
	text-align: center;
	/* 	background:#0064CD; */
	
}

#header h1 {
	margin: 0;
	padding: 30px 0; # footer { text-align : center;
	background: #99FF99;
	margin: 0;
	padding: 20px 0;
}

p.container {
	font-family: Raleway;
	margin: 0 auto;
	padding: 10em 3em;
	text-align: center;
}

p.container a {
	color: #FFF;
	text-decoration: none;
	font: 20px Raleway;
	margin: 0px 10px;
	padding: 10px 10px;
	position: relative;
	z-index: 0;
	cursor: pointer;
}

.blue {
	background: #2196f3;
}

div.circleBehind a:before, div.circleBehind a:after {
	position: absolute;
	top: 22px;
	left: 50%;
	width: 50px;
	height: 50px;
	border: 4px solid #0277bd;
	transform: translateX(-50%) translateY(-50%) scale(0.8);
	border-radius: 50%;
	background: transparent;
	content: "";
	opacity: 0;
	transition: all 0.3s;
	z-index: -1;
}

div.circleBehind a:after {
	border-width: 2px;
	transition: all 0.4s;
}

div.circleBehind a:hover:before {
	opacity: 1;
	transform: translateX(-50%) translateY(-50%) scale(1);
}

div.circleBehind a:hover:after {
	opacity: 1;
	transform: translateX(-50%) translateY(-50%) scale(1.3);
}


</style>

</head>
<body>

<div id="header" >


<div style="margin-bottom: 26px;">
<!-- <div style="position: fixed;"> -->
<!-- <a href="/main"><img src="/image/logo.png"  style="width: 78px; margin: 29px; height: 71px;"/></a> -->
<!-- </div> -->




<span style="vertical-align: middle; -webkit-text-stroke-width: unset; font-size: 100px; line-height: 129px; " ><a href="/main" style="color:#282c37; text-decoration:none; font-family: 'NIXGONL-Vb';">Travelers</a>
</span>

<div class="loginbtngroup">
<span>
<c:if test="${empty login }">
<a href="/member/login"><button type="button" class="btn btn-primary" style="margin-right: 1%; font-family: auto;
}">로그인</button></a>
<a href="/member/join"><button type="button" class="btn btn-success" style="font-family: auto;
}">회원가입</button></a>
</c:if>
<c:if test="${login eq true }">
<a href="/member/logout"><button type="button" class="btn btn-danger" style="font-family: auto;
}">로그아웃</button></a>
</c:if>
</span>
</div>

<p class="container" style="margin-top: 20px;">
  <a class ="menubar" href="/board/plannernew">플래너</a>
  <a class ="menubar" href="/place/list">장소정보</a>
  <a class ="menubar" href="/board/free">게시판</a>
  <a class ="menubar" href="/search/air">항공권/호텔</a>
  
</p>


<!-- <div> -->
<!-- <ul class="nav nav-pills"> -->
  
<!--   <li role="presentation" class="dropdown"> -->
<!--     <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false"> -->
<!--       Dropdown <span class="caret"></span> -->
<!--     </a> -->
<!--     <ul class="dropdown-menu" role="menu"> -->
<!--       <li>로그인</li> -->
<!--       <li>마이페이지</li> -->
      
      
<!--     </ul> -->
<!--   </li> -->
  
<!-- </ul> -->
<!-- </div> -->

</div>


<div id="wrapper" style="font-family: 'NIXGONL-Vb';">