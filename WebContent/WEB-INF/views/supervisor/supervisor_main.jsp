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

.btnMenu {
	margin: 34px;
    height: 137px;
    width: 15%;
	background-color: #337ab7;
	color:white;
}

img { display: block; margin: 0px auto; }

hr {
    margin-top: 5px;
    margin-bottom: 5px;
    border: 10;
    border-top: 1px solid #0064FF;
    
}





/* a.menubar{ */
/* 	margin:83px; */
/* 	font-size:25px; */
/* 	font-family: 'Alatsi', sans-serif; */
/* } */
h1.name{
	font-size:25px;
	font-family: 'Alatsi', sans-serif;
	color:#337ab7;
	text-align:center;
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
}
	
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


.title
{

/* background-color:#2372B8; */
color:#2372B8;;
width: 70%;
margin: 0 auto;
}
</style>

</head>
<body>

<div id="header" >


<div style="text-align: center;">
<!-- <div style="position: fixed;"> -->
<!-- <a href="/main"><img src="/image/logo.png"  style="width: 78px; margin: 29px; height: 71px;"/></a> -->
<!-- </div> -->
<span style="vertical-align: middle; -webkit-text-stroke-width: unset; font-size: 100px; line-height: 129px;  "><a href="/supervisor/main">Travelers</a>
</span>
</div>

</div>

<hr>
<hr>

<div class="title text-center ">
<h1 style="padding: .67em ;">
    <Strong>관리자 페이지</Strong></h1>
</div>

<hr>
<br>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5de76b36d96992700fcaa8ab/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
<div style="text-align: center">
<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/memberlist'"  >회원관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/boardmanage'"  >게시판관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/place/list'" >장소정보 관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/place/insert'" >장소정보 입력</button>
<br><br>
<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/noticelist'" >공지사항 관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/insertnotice'" >공지사항 입력</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/reportlist'" >신고글 관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='https://dashboard.tawk.to/#/chat'"  >1:1 문의 채팅</button>
<Br><br>
<button class="btn btn-warning "  onclick="location.href='/supervisor/logout'" >로그아웃</button>

</div>
</body>
</html>