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

hr {
    margin-top: 5px;
    margin-bottom: 5px;
    border: 10;
    border-top: 1px solid #0064FF;
    
}

a.menubar{
margin:83px;
font-size:25px;
font-family: 'Alatsi', sans-serif;
}



.container {
	width: auto;
}

#header{
	text-align:center;
/* 	background:#0064CD; */
	font-family: 'Indie Flower', cursive;
	
	
}

#header h1{
	margin:0;
	padding:30px 0;
	
#footer{
	text-align:center;
	background:#99FF99;
	margin:0;
	padding:20px 0;
}

div.container
{
    font-family: Raleway;
    margin: 0 auto;
	padding: 10em 3em;
	text-align: center;
}

div.container a
{
    color: #FFF;
    text-decoration: none;
    font: 20px Raleway;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    cursor: pointer;
}


.blue
{
    background: #2196f3;
}


div.circleBehind a:before, div.circleBehind a:after
{
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

div.circleBehind a:after
{
    border-width: 2px;
    transition: all 0.4s;
}

div.circleBehind a:hover:before
{
    opacity: 1;
    transform: translateX(-50%) translateY(-50%) scale(1);
}

div.circleBehind a:hover:after
{
    opacity: 1;
    transform: translateX(-50%) translateY(-50%) scale(1.3);
}



</style>

</head>
<body>

<div id="header" >


<div style="text-align: center;">
<!-- <div style="position: fixed;"> -->
<!-- <a href="/main"><img src="/image/logo.png"  style="width: 78px; margin: 29px; height: 71px;"/></a> -->
<!-- </div> -->
<span style="vertical-align: middle; -webkit-text-stroke-width: unset; font-size: 100px; line-height: 129px;  "><a href="/main">Travelers</a>
</span>
</div>

<div class="container blue circleBehind">
  <a class ="menubar">플래너</a>
  <a class ="menubar">장소정보</a>
  <a class ="menubar">게시판</a>
  <a class ="menubar">마이페이지</a>
  
</div>


</div>

<hr>
<hr>

<div id="wrapper">