<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#map {
	width: 50%;
	height: 400px;
	background-color: grey;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>

	<div class = "container text-center">
		<h3>지도 데모창</h3>
		<!--The div element for the map -->
		<div id="map"></div>
	</div>

	<script>
		// Initialize and add the map 
		function initMap() {
			// The location of Uluru 
			var mainSpot = {
				lat : ${centerPlace.coordinate_lat},
				lng : ${centerPlace.coordinate_lng}
			};
			var tokyoTower ={
				lat : 35.6585804,
				lng : 139.7454326
			};
			
			 
			// The map, centered at Uluru 
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 4,
				center : mainSpot
			});
			// The marker, positioned at Uluru -->
// 			for (var i =1 ; i<2 ;i++){
			var marker = new google.maps.Marker({
				position : tokyoTower,
				map : map
			});
				
// 			}
		};
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZL82RRYpAr7GrwdJQ5S11-pDaZJs3n9c&callback=initMap">
		
	</script>

</body>
</html>

