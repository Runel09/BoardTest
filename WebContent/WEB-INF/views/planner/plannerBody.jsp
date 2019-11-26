<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<style type="text/css">
.left {
	float: left;
	width: 20%;
	height: 80%;
	background: lavender;
	margin-top: 7%;
	margin-bottom:7%
}
.center {
	float: left;
	width: 20%;
	height: 80%;
	background: lavender;
	margin-top: 7%;
	margin-bottom:7%
}

.right {
	float: right;
	width: 58%;
	height: 80%;
	background: #ffc;
	margin-top: 7%;
	margin-bottom: 7%
}
.container{
height: 800px;
width: 100%;
}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("a").click(function() {
			// 클릭이벤트가 발생한 <a>태그의 href 속성의 url값을 이용하여 .load() 수행
			$(".right").load($(this).attr("href"));
			// 웹페이지의 동적 수행을 멈추는 코드 - <a> 태그의 페이지 이동을 막는다
			return false;
		})
	})
</script>

	<div class="container text-center">
	

	<div class="left">
		<jsp:include page="/WEB-INF/views/planner/index.jsp" />
		
	</div>
	<div class="center">
		<jsp:include page="/WEB-INF/views/planner/list.jsp" />
		
	</div>
	
	<div class="right">
		<jsp:include page="/WEB-INF/views/planner/test.jsp" />

	</div>
	</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
