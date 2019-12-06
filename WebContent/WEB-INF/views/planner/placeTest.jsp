<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
#right-panel {
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

​
  #right-panel select, #right-panel input {
	font-size: 15px;
}

​

  #right-panel i {
	font-size: 12px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

html {
	height: 600px;
}

#map {
	height: 100%;
	width: 100%;
	float: left;
}

#right-panel {
	height: 100%;
	width: 38%;
	float: left;
	overflow: auto;
}

#encoded-polyline {
	height: 100px;
	width: 100%;
}
</style>

<script type="text/javascript">
	var op = $(opener.document.getElementById("indexBody"));
	$(document).ready(function(){
	console.log(opener.result[0].lat);
	$("#startIdx_lat").val(opener.result[${startNo}].lat);
	$("#startIdx_lng").val(opener.result[${startNo}].lng);
	$("#endIdx_lat").val(opener.result[${endNo}].lat);
	$("#endIdx_lng").val(opener.result[${endNo}].lng);
	});
	
	
	function initMap() {

		var directionsService = new google.maps.DirectionsService;
		var directionsRenderer = new google.maps.DirectionsRenderer;
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 6,
			center : {
				lat : 41.85,
				lng : -87.65
			}
		});
		directionsRenderer.setMap(map);

		calculateAndDisplayRoute(directionsService, directionsRenderer);
				console.log(opener.result[0].lat)

	}
	var waypts = [];
	function calculateAndDisplayRoute(directionsService, directionsRenderer) {
		
		console.log(new google.maps.LatLng(opener.result[23].lat, opener.result[23].lng))
		console.log({
			location : new google.maps.LatLng(opener.result[23].lat, opener.result[23].lng)
		
	     })
		
		var checkboxArray = [];
		JSON.parse('${listIndx}', (key,value) =>{
			if(opener.result[value-1]!=null){
			console.log(value)
			console.log(opener.result[value-1].lat)
			console.log( opener.result[value-1].lng)
		     waypts.push({
				location : new google.maps.LatLng(opener.result[value-1].lat, opener.result[value-1].lng)
				
		     });
		}
		}
		);
		
		
		console.log(${cnt});		
// 		console.log(opener.result[${startNo}-1].lat, opener.result[${startNo}-1].lng);
// 		console.log(opener.result[${endNo}-1].lat, opener.result[${endNo}-1].lng);
		if(${cnt}==0){
		directionsService.route({
			origin : new google.maps.LatLng(opener.result[${startNo}-1].lat, opener.result[${startNo}-1].lng),
			destination : new google.maps.LatLng(opener.result[${endNo}-1].lat, opener.result[${endNo}-1].lng),
			travelMode : google.maps.TravelMode['DRIVING']
		}, function(response, status) {
			if (status === 'OK') {
				directionsRenderer.setDirections(response);
				var route = response.routes[0];
				var summaryPanel = document.getElementById('directions-panel');
				summaryPanel.innerHTML = '';
				$("#startLab").text("출발지 :"+route.legs[0].start_address )
				$("#endLab").text("출발지 :"+route.legs[0].end_address )
				// For each route, display summary information.
				for (var i = 0; i < route.legs.length; i++) {
					var routeSegment = i + 1;
					summaryPanel.innerHTML += '<b>구간 : '
							+ routeSegment + '</b><br>';
					summaryPanel.innerHTML += route.legs[i].distance.text
							+ '<br>';
					summaryPanel.innerHTML += route.legs[i].duration.text
							+ '<br><hr>';
				}
			} else {
				window.alert('Directions request failed due to ' + status);
			};
		});
			
		}else{
			directionsService.route({
				origin : new google.maps.LatLng(opener.result[${startNo}-1].lat, opener.result[${startNo}-1].lng),
				destination : new google.maps.LatLng(opener.result[${endNo}-1].lat, opener.result[${endNo}-1].lng),
				waypoints : waypts,
				travelMode : google.maps.TravelMode['DRIVING']
			}, function(response, status) {
				if (status === 'OK') {
					directionsRenderer.setDirections(response);
					var route = response.routes[0];
					var summaryPanel = document.getElementById('directions-panel');
					summaryPanel.innerHTML = '';
					$("#startLab").text("출발지 :"+route.legs[0].start_address )
					$("#endLab").text("도착지 :"+route.legs[${cnt}].end_address )
					// For each route, display summary information.
					for (var i = 0; i < route.legs.length; i++) {
						var routeSegment = i + 1;
						 summaryPanel.innerHTML += route.legs[i].start_address + ' 에서 ';
			              summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
						summaryPanel.innerHTML += route.legs[i].distance.text
								+ '<br>';
						summaryPanel.innerHTML += route.legs[i].duration.text
								+ '<br><hr>';
					}
				} else {
					window.alert('Directions request failed due to ' + status);
				};
			});
		}
	};
</script>
</head>
<body>
	<div style="width: 100%; height: 100%">
		<div id="left-panel" style="float: left; width: 60%; height: 100%">
			<div id="map"></div>
		</div>
		<div id="right-panel">
			<form action="#" method="get">
				<div>

					<div>
						<label id="startLab"></label> <input id="startIdx_lat"
							name="startIdx_lat" type="hidden" value=""> <input
							id="startIdx_lng" name="startIdx_lng" type="hidden" value="">
					</div>
					
					<c:forEach var="index" items="${Index }">
						<div>
							<label id="porint_${index}">경유지</label> <input id="wayPoint_${index }"
								name="wayPoint_${index }" type="hidden" value=""> <input
								id="wayPoint_${index }" name="wayPoint_${index }" type="hidden"
								value="">
						</div>
					</c:forEach>
					<div>
						<label id="endLab"></label> <input id="endIdx_lat"
							name="endIdx_lat" type="hidden" value=""> <input
							id="endIdx_lng" name="endIdx_lng" type="hidden" value="">
					</div>
<!-- 						<br> <b>교통수단:</b> -->
<!-- 					<select id="travalOption" name="travalOption"> -->
<!-- 						<option value="DRIVING">자동차</option> -->
<!-- 						<option value="WALKING">도보</option> -->
<!-- 					</select> <br> <input type="submit" id="submit"> -->
				</div>
				<hr>
				<div id="directions-panel"></div>
			</form>
		</div>
	</div>
	<!-- Replace the value of the key parameter with your own API key. -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZL82RRYpAr7GrwdJQ5S11-pDaZJs3n9c&callback=initMap">
		
	</script>
</body>
</html>
