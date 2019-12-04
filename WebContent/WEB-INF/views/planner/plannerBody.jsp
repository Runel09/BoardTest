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
	border: 1px solid black;
	float: left;
	width: 20%;
	height: 80%;
	background: lavender;
	margin-bottom: 7%
}

.center {
	overflow: auto;
	border: 1px solid black;
	float: left;
	width: 20%;
	height: 80%;
	background: lavender;
	margin-left: 1%;
	margin-bottom: 7%
}

.right {
	float: right;
	width: 58%;
	height: 80%;
	background: #ffc;
	margin-bottom: 7%
}

.container {
	height: 800px;
	width: 100%;
}

.top {
	height: 120px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.tag_body {
	
}

.tag_body div div {
	float: left;
	width: 90px;
}

.tag_body div {
	float: left;
	width: 800px;
}
.selected{
	color: white;
	background: black;
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
				//전체 경로 초기화
				$("#reset_btn").on('click', function() {
					$("#indexBody").empty();
					// 					console.log(path);
					ploy.setMap(null);
					ploy = new google.maps.Polyline({
						strokeColor : '#3679e3',
						strokeOpacity : 1.0,
						strokeWeight : 3
					});

					ploy.setMap(map);

				});
				//전체 경로 검색
				$("#search_btn").on('click', searchAll);
				
				//테마 선택
				($("#tag_body").children().children()).on('click',function() {
					if(this==this.parentNode.firstElementChild){
						return false;
					}
					$(this.parentNode.firstElementChild).children("input").val(this.innerText)
					$(this.parentNode).children(".selected").removeClass('selected');
					$(this).addClass("selected");
					console.log($(this.parentNode.firstElementChild).children("input").val())
				})

				//플래너 정보 입력
				$("#submit_btn").on('click', function() {
					
					var $f = $("<form>").attr({method:"", action:""})
					//인덱스 추가
					for(var i =0; i<divBody.children("div").size();i++){
						$f.append( $("<input>").attr({name:"place_no", value:$("#divBody").children("div").eq(i).attr("data-place_no")}) )
						
						console.log($("#divBody").children("div").eq(i).attr("data-place_no"));
					}
					//타이틀 추가
						$f.append( $("<input>").attr({name:"title", value:$("#title_char").val()}) );
						
						
// 						.append( $("<input>").attr({name:"name", value:"value"}) )
// 						.append( $("<input>").attr({name:"name", value:"value"}) )
// 						.append( $("<input>").attr({name:"name", value:"value"}) )
// 						.append( $("<input>").attr({name:"name", value:"value"}) )
						$f.appendTo( $(document.body) );
					$f.submit();
					
					
// 					$("#index_form").submit();

				});
			});
</script>

</head>
<body>
	<div>
		<div class="container text-center">
			<div class="top col-md-12">
				<div class="col-md-3" style="border: 1px solid black; height: 100%;">
					<input id="title_char" name="title_char" type="text"
						readonly="readonly">
					<button type="button">편집</button>

				</div>
				<div class="col-md-3">
					<div class="tag_body" id="tag_body">
						<div class="place">
							<div id="place_head">
								여행지 <input type="hidden" id="travel_Place" value="" />
							</div>
							<div>국내</div>
							<div>일본</div>
							<div>홍콩</div>
							<div>싱가포르</div>
							<div>대만</div>
							<div>태국</div>
							<div>미국</div>
						</div>
						<div class="danger travel_date">
							<div id="travel_date_head">
								여행일<input type="hidden" id="travel_date" value="" />
							</div>
							<div>1-3일</div>
							<div>4-6일</div>
							<div>7-10일</div>
							<div>11-15일</div>
							<div>15일이상</div>
						</div>
						<div class="travel_season">
							<div id="travel_season_head">
								여행시기<input type="hidden" name="travel_season" value="">
							</div>
							<div>봄</div>
							<div>여름</div>
							<div>가을</div>
							<div>겨울</div>
						</div>
						<div class="success traval_thema">
							<div id ="traval_thema_head">
								여행테마<input type="hidden" id="traval_thema" value="" />
							</div>
							<div>가족여행</div>
							<div>나홀로여행</div>
							<div>커플여행</div>
							<div>친구와함께</div>
							<div>비지니스여행</div>
						</div>
					</div>

				</div>
				<div class="col-md-2 col-md-offset-2">
					<button id="submit_btn">플래너 입력</button>
				</div>
			</div>

			<div class="left">
				<form id="index_form" name="index_form" method="post"
					action="/planner/input" style="height: 100%">
					<div style="height: 86%;"><jsp:include
							page="/WEB-INF/views/planner/index.jsp" /></div>
					<hr style="border-top-color: black;">
					<div style="height: 5%;">
						<button id="reset_btn" type="button">목록 초기화</button>
						<button id="search_btn" type="button">전체 경로 검색</button>
					</div>
				</form>
			</div>
			<div class="center">
				<jsp:include page="/WEB-INF/views/planner/list.jsp" />
				<%-- 			<c:import url="/planner/placeInfo" /> --%>

			</div>

			<div class="right">
				<jsp:include page="/WEB-INF/views/planner/test.jsp" />

			</div>
		</div>
		<div id="footer">
			<small>다 싫어...</small>
		</div>


	</div>
</body>
</html>