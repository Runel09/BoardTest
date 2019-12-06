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
	height: 90px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.tag_body {
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
	width: 800px;
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
	width:255.83px;
	z-index: 1;
	position: absolute;
	background: white;
}
.index_body > .selected_index{
	height:580px;
	width:255.83px;
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
				//전체 경로 초기화
				$("#reset_btn").on('click', function() {
					$(".selected_index").empty();
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
					if($(this).hasClass("selected")){
						$(this).removeClass("selected")
						console.log($(this).parent().children().eq(0).children("input"))
						$(this).parent().children().eq(0).children("input").val("")
					}else{
						$(this.parentNode).children(".selected").removeClass('selected');
						$(this).addClass("selected");
					}
					console.log($(this.parentNode.firstElementChild).children("input").val())
				})

				//플래너 정보 입력
				$("#submit_btn").on('click', function() {
					
					var $f = $("<form>").attr({method:"post", action:"/planner/input"})
					//인덱스 추가
					
					for (var j = 0 ; j<=$(".index_body").children("div").size();j++)
					for(var i =0; i<$(".index_body").children("div").eq(j).children().size();i++){
						$f.append( $("<input>").attr({name: (j+1)+"day_place_no", value:$(".index_body").children("div").eq(j).children("div").eq(i).attr("data-place_no")}) )
						console.log($(".index_body").children("div").eq(j).children("div").eq(i).attr("data-place_no"));
					}
					//타이틀 추가
						$f.append( $("<input>").attr({name:"title", value:$("#title_char").val()}) );
					//테마 추가
						$f.append($("<input>").attr({name:"travel_Place", value:$("#travel_Place").val()}))
						$f.append($("<input>").attr({name:"travel_date", value:$("#travel_date").val()}))
						$f.append($("<input>").attr({name:"travel_season", value:$("#travel_season").val()}))
						$f.append($("<input>").attr({name:"traval_thema", value:$("#traval_thema").val()}))
						$f.appendTo( $(document.body) );
					$f.submit();

				});
				//타이틀 편집 버튼
				$("#title_set").on('click',function(){
					if($("#title_char").prop("readonly")){
						$("#title_char").prop("readonly", false)
						$("#title_set").text("적용")
					}else{
						$("#title_char").prop("readonly", true)
						$("#title_set").text("편집")
					}
				});
				
				//인덱스 추가버튼
				$(".day_bar .plus").on("click", function() {
					//인덱스 추가 처리
					var index = $(this).index()+1;
					console.log(index);
					var insert=$("<div class='day_con'>").append($("<p>"+index+"일차</p>")).insertBefore($(this));
					insert.addClass(index+"day");
					$(".index_body > .selected_index").removeClass("selected_index")
					$(".index_body").append($("<div class='"+index+"day index selected_index'>"));
					$(".day_bar > .selected_con").removeClass("selected_con");
					insert.addClass("selected_con");
					
					//맵 초기화
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
					
					//인덱스 변경 버튼 클릭
					insert.on('click',function(){
						var index= $(this).index()+1;
						if ($(this).index()==$(this).parent().children().eq(-1).index()){
							return false;	
						}
						$(".index_body > .selected_index").removeClass("selected_index")
						$(".index_body > ."+index+"day").addClass("selected_index")
						$(".day_bar > .selected_con").removeClass("selected_con");
						$(".day_bar").children().eq(index-1).addClass("selected_con");
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
				});
				
					
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
				
				
			});
</script>

</head>
<body>
	<div>
		<div class="container text-center">
			<div class="top col-md-12">
				<div class="col-md-3" style="border: 2px solid #337ab7; height: 100%;padding: 9px">
					<p style="color:#337ab7;font-size: 20px; font-weight: 900;">플래너 이름&nbsp;</p> <input id="title_char" name="title_char" type="text"
						readonly="readonly">
					<button type="button" id = "title_set">편집</button>

				</div>
				<div class="col-md-6">
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
								여행시기<input type="hidden" id="travel_season" value="">
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
				<div class="col-md-1 col-md-offset-1">
					<button id="submit_btn">플래너 입력</button>
				</div>
			</div>
			
			
			<div class="left">
			<div class="day_bar">
			<div class="day_con 1day selected_con">
			<p>1일차</p>
			</div>
			<div class="day_con plus">
			<p>+</p>
			</div>
			</div>
				<div class="index_body">
					<div class="1day index selected_index">
					</div>
					
				</div>
					<div style="height: 55px; width:255.83px; border-top:  2px solid #337ab7; padding: 12px; float: left;">
						<button id="reset_btn" type="button">목록 초기화</button>
						<button id="search_btn" type="button">전체 경로 검색</button>
					</div>
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
<%-- 			<c:forEach var="" items=""> --%>
				
			
<%-- 			</c:forEach> --%>
		</div>


	</div>
</body>
</html>
