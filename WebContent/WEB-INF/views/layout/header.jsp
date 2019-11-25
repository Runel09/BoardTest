<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travelers</title>

<!-- 부트스트랩 사용하기 위해서 jQuery가 필요하므로 먼저 적어준다 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

.container {
	width: auto;
}

#header{

	background: #0e6ac7;
}

#header h1 {
	margin: 0; /* background를 전체에 적용하기 위한 설정 */
	padding: 30px 0; /* h1태그의 높이 지정 */
}

#footer {
	text-align: center;
	background: #0e6ac7;
	
	margin : 0; /* background를 전체에 적용하기 위한 설정 */
	padding: 20px 0; /* h1태그의 높이 지정 */
}

</style>

</head>
<body>

<div id="header" >


<div style="text-align: center;">
<div style="position: fixed;">
<a href="/main"><img src="/image/logo.png"  style="width: 78px; margin: 29px; height: 71px;"/></a>
</div>
<span style="vertical-align: middle; -webkit-text-stroke-width: unset; font-size: 49px; line-height: 129px;">Travelers</span>
</div>


</div>

<hr>

<div id="wrapper">