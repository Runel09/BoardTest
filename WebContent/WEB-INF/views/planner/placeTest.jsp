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
  #right-panel select {
	width: 100%;
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

#map {
	height: 100%;
	width: 50%;
	float: left;
}

#right-panel {
	width: 46%;
	float: left;
}

#encoded-polyline {
	height: 100px;
	width: 100%;
}
</style>

<script type="text/javascript">
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 14,
			center : {
				lat : 34.366,
				lng : -89.519
			}
		});
		var poly = new google.maps.Polyline({
			strokeColor : '#000000',
			strokeOpacity : 1,
			strokeWeight : 3,
			map : map
		});

		// Add a listener for the click event
		google.maps.event.addListener(map, 'click', function(event) {
			addLatLngToPoly(event.latLng, poly);
		});
	}

	/**
	 * Handles click events on a map, and adds a new point to the Polyline.
	 * Updates the encoding text area with the path's encoded values.
	 */
	function addLatLngToPoly(latLng, poly) {
		var path = poly.getPath();
		// Because path is an MVCArray, we can simply append a new coordinate
		// and it will automatically appear
		path.push(latLng);

		// Update the text field to display the polyline encodings
		var encodeString = google.maps.geometry.encoding.encodePath(path);
		if (encodeString) {
			document.getElementById('encoded-polyline').value = encodeString;
		}
	}
</script>
</head>
<body>
	<div id="map"></div>
	<div id="right-panel">
		<div>Encoding:</div>
		<textarea id="encoded-polyline"></textarea>
	</div>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZL82RRYpAr7GrwdJQ5S11-pDaZJs3n9c&callback=initMap">
		
	</script>
</body>
</html>
