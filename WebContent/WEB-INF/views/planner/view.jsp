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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#header {
	text-align: center;
	background: #1DDB16;
	color: white;
}

#header h1 {
	margin: 0;
	padding: 30px 0;
}

#footer {
	text-align: center;
	background: #337ab7;
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
	border: 2px solid #337ab7;
}

.left {
	border: 2px solid #337ab7;
	float: left;
	width: 20%;
	height: 80%;
	background: white;
	margin-bottom: 7%;
	z-index: 10;
}

.center {
	overflow: auto;
	border: 2px solid #337ab7;
	float: left;
	width: 20%;
	height: 80%;
	background: white;
	margin-left: 1%;
	margin-bottom: 7%;
	color: #337ab7;
	z-index: 10;
}

.right {
	float: right;
	width: 58%;
	height: 80%;
	background: #ffc;
	margin-bottom: 7%;
	z-index: 1;
}

.container {
	height: 800px;
	width: 100%;
}

.top {
	text-align:center;
	height: 90px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.tag_body {
	width:200px;
	border: 2px solid #337ab7;
	height: 90px;
	
}

.tag_body div div {
	float: left;
	width: 90px;
	margin-top: 2px;
	margin-right: 2px;
	color: #337ab7;
}
.tag_body > div > div:first-child{
	font-weight: 900;
}


.tag_body div {
	float: left;
	width: 200px;
}
div div > .selected{
	color: white;
	background: #337ab7;
}

.day_bar{
	height: 100%;
	width: 20%;
	border-right: 2px solid #337ab7;
	margin: 0;
	float: left;
}
.index_body{
	height: 580px;
	width: 80%;
	margin: 0;
	float: left;
}

.day_con{
	height: 10%;
	float: left;
	width: 100%;
	height: 40px;
	padding: 9px;
	border-bottom: 2px solid #337ab7 ;
}
.index{
	height:580px;
	width:15.6%;
	z-index: 1;
	position: absolute;
	background: white;
}
.index_body > .selected_index{
	height:580px;
	width:15.6%;
	z-index: 10;
	position: absolute;
	background: white;
}
.index_ele{
	hieght:50px;
	width: 100%;
	border-bottom: 1px solid #337ab7 ;
	
}
.selected_con{
	background: #337ab7;
	color: white;
}
</style>


<script type="text/javascript">
	var map;
	
	$(document).ready(
			function() {
				$(".center").on(
						"click",
						".marker",
						function() {
							console.log($(this).attr("data-idx"));
							var placeno = $(this).attr("data-idx");
							var trval_place = $()
							// 			console.log(placeno);
							$.ajax({
								type : "get",
								url : "/planner/placeInfo",
								data : {
									"place_number" : placeno
								},
								dataType : "html",
								success : function(data) {
									$("#indexList").html(data);
								},
								error : function() {
									console.log("fail");
								}
							})
							map.setZoom(15);
							// 			console.log($(this).attr("location-lat"));
							// 			console.log($(this).attr("location-lng"));

							map.setCenter(new google.maps.LatLng($(this).attr(
									"data-location-lat"), $(this).attr(
									"data-location-lng")));
						});

				//center 리스트 반환
				$(".center").on("click", "#listSetbtn", function() {
					$.ajax({
						type : "get",
						url : "/planner/placeInfo",
						data : {
							"place_number" : 0
						},
						dataType : "html",
						success : function(data) {
							$("#indexList").html(data);
						},
						error : function() {
							console.log("fail");
						}
					})

					// 			console.log($(this).attr("location-lat"));
					// 			console.log($(this).attr("location-lng"));

				})

				//전체 경로 검색
				$("#search_btn").on('click', searchAll);
				
				var index= new Array();
				<c:forEach items="${index}" var="indexes">
				
				</c:forEach>
				
				var days=0;

				<c:forEach items="${day_size}" var="size">
					var num=0;
					$(".day_bar").append("<div class='day_con "+(days+1)+"day'><p>"+(days+1)+"일차</p></div>")
					console.log(${size})
					console.log(${index[0].index_num})
					for(var i =0 ; i<${size};i++){
						$(".index_body").append("<div class='index_ele' data-index='"+i+"' data-place_no='"+${index[num].place_num}+"'><input name='place_cate' type='hidden' value='"+result[${index[num].place_num}].cate+"'/><input type='hidden' name='place_no' value='"+${index[num].place_num}+"'/>"+result[${index[num].place_num}].place_name+"<br>"+result[${index[num].place_num}].detail+"<button type='button'>경로검색</button><button type='button'>삭제</button></div>"))
						num=+1;
						
						
					}
					days++;
				</c:forEach>
				
				$(".day_bar > .1day").addClass("selected_con");
				
				//인덱스 선택 버튼 동작
				$(".day_bar .day_con").on('click',function(){
					var index= $(this).index()+1;
					if ($(this).index()==$(this).parent().children().eq(-1).index()){
						return false;	
					}
					$(".index_body > .selected_index").removeClass("selected_index")
					$(".index_body > ."+index+"day").addClass("selected_index")
					$(".day_bar > .selected_con").removeClass("selected_con");
					$(".day_bar").children("div").eq(index-1).addClass("selected_con");
					ploy.setMap(null);
					ploy = new google.maps.Polyline({
						strokeColor : '#3679e3',
						strokeOpacity : 1.0,
						strokeWeight : 3
					});

					ploy.setMap(map);
					path = ploy.getPath();
					for(var i =0; i<=$(".selected_index").children().size()-1;i++){
						var place_num=$(".selected_index").children("div").eq(i).attr("data-place_no")
						path.push(new google.maps.LatLng(result[place_num-1].lat, result[place_num-1].lng))
					}
					path.getAt();
				})
				$(".place").children("div").eq(1).text("${planner.trip_nation}");
				$(".travel_date").children("div").eq(1).text("${planner.trip_date}");
				$(".travel_season").children("div").eq(1).text("${planner.trip_season}");
				$(".traval_thema").children("div").eq(1).text("${planner.trip_theme}");
				$(".top").children().children("p").eq(1).text("${planner.PLANNER_NAME}");
				
			});
</script>

</head>
<body>
	<div>
		<div class="container text-center">
			<div class="top col-md-12">
				<div class="col-md-offset-4 col-md-3" style="border: 2px solid #337ab7; height: 100%;padding: 9px">
					<p style="color:#337ab7;font-size: 20px; font-weight: 900;">플래너 이름&nbsp;</p>
					<p style="color:#337ab7;font-size: 20px; font-weight: 900;"></p>
				</div>
				<div class="col-md-2">
					<div class="tag_body" id="tag_body">
						<div class="place">
							<div id="place_head">
								여행지 <input type="hidden" id="travel_Place" value="" />
							</div>
							<div>국내</div>
						</div>
						<div class="danger travel_date">
							<div id="travel_date_head">
								여행일<input type="hidden" id="travel_date" value="" />
							</div>
							<div>1-3일</div>
						</div>
						<div class="travel_season">
							<div id="travel_season_head">
								여행시기<input type="hidden" id="travel_season" value="">
							</div>
							<div>봄</div>
						</div>
						<div class="success traval_thema">
							<div id ="traval_thema_head">
								여행테마<input type="hidden" id="traval_thema" value="" />
							</div>
							<div>가족여행</div>
						</div>
					</div>

				</div>
			</div>
			
			
			<div class="left">
			<div class="day_bar">
			</div>
				<div class="index_body">
					<div class="1day index selected_index">
					</div>
					
				</div>
					<div style="height: 55px; width:80%; border-top:  2px solid #337ab7; padding: 12px; float: left;">
						
						<button id="search_btn" type="button">전체 경로 검색</button>
					</div>
			</div>
			<div class="center">
				<jsp:include page="/WEB-INF/views/planner/list.jsp" />
				<%-- 			<c:import url="/planner/placeInfo" /> --%>

			</div>

			<div class="right">
				<jsp:include page="/WEB-INF/views/planner/viewMap.jsp" />

			</div>
		</div>
		<div id="footer">
<%-- 			<c:forEach var="" items=""> --%>
				
			
<%-- 			</c:forEach> --%>
		</div>


	</div>
</body>
</html>
