<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- -- -->
<title>: : :Runel : : :</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#header{
	text-align: center;
	background: #1DDB16;
	color: white;
}
#header h1{
	margin: 0;
	padding: 30px 0;
}
#footer{
	text-align: center;
	background: #1DDB16;
}
</style>



<style type="text/css">
/* Always set the map height explicitly to define the size of the div
			* element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.index {
	border: 1px solid black;
}

.left {
	border:1px solid black;
	float: left;
	width: 20%;
	height: 80%;
	background: lavender;
	margin-top: 7%;
	margin-bottom: 7%
}

.center {
	overflow: auto;

	border:1px solid black;
	float: left;
	width: 20%;
	height: 80%;
	background: lavender;
	margin-left:1%;
	margin-top: 7%;
	margin-bottom: 7%
}

.right {
	float: right;
	width: 58%;
	height: 80%;
	background: #ffc;
	margin-top: 7%;
	margin-bottom: 7%
}

.container {
	height: 800px;
	width: 100%;
}
</style>


<script type="text/javascript">
	var map;
	$(document).ready(function() {
		$(".center").on("click", ".marker", function() {
			console.log($(this).attr("data-idx"));
			var placeno =$(this).attr("data-idx");
// 			console.log(placeno);
			$.ajax({
				type: "get"
				, url: "/planner/placeInfo"
				, data: {"place_number":placeno}
				, dataType: "html"
				, success: function(data) {
					$("#indexList").html(data);
				}
				, error: function() {
					console.log("fail");
				}
			})
			map.setZoom(15);
// 			console.log($(this).attr("location-lat"));
// 			console.log($(this).attr("location-lng"));
			
		    map.setCenter(new google.maps.LatLng($(this).attr("data-location-lat"), $(this).attr("data-location-lng")));
		});
		$(".center").on("click", "#listSetbtn", function() {
			$.ajax({
				type: "get"
				, url: "/planner/placeInfo"
				, data: {"place_number":0}
				, dataType: "html"
				, success: function(data) {
					$("#indexList").html(data);
				}
				, error: function() {
					console.log("fail");
				}
			})
			
// 			console.log($(this).attr("location-lat"));
// 			console.log($(this).attr("location-lng"));
			
		    
		})
	});	
</script>

</head>
<body>
<div>
	<div class="container text-center">


		<div class="left">
			<jsp:include page="/WEB-INF/views/planner/index.jsp" />

		</div>
		<div class="center">
			<jsp:include page="/WEB-INF/views/planner/list.jsp" />
<%-- 			<c:import url="/planner/placeInfo" /> --%>

		</div>

		<div class="right">
			<jsp:include page="/WEB-INF/views/planner/test.jsp" />

		</div>
	</div>
	

</div>
<div id="footer">
<small>다 싫어...</small>
</div>
</body>
</html>
