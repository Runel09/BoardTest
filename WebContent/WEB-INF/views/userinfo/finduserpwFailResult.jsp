<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- Bootstrqp 3.3.2 밑에 3개  -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
		#wrap {
			width: 490px;
			text-align :center;
			margin: 0 auto 0 auto;
		}
		
		
		
		#closeBtn{
			visibility:visible;
		}
		
	

	</style>
<script type="text/javascript">
// function goBack(){
// 	window.histroy.back();
// }
</script>
<meta charset="UTF-8">
<title>TRAVERS 정보조회 결과</title>
</head>
<body>

<body onload="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">비밀번호 찾기 결과</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form id="checkForm">
			일치하는 정보가 없습니다.
		</form>
		<div id="msg"></div>
		<br>
		<a href="/find/userinfo"><input id="backBtn" name= "closeBtn" type="button" value="돌아가기" ></a> <br>
	
		
	</div>
</div>	
</body>
</html>