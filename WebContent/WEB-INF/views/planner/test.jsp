<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >


<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Using MySQL and PHP with Google Maps</title>
<style>
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
</style>
</head>
<body>
	<div id="map"></div>

	<script>
			var customLabel = {
			restaurant : {
			label : 'R'
			},
			bar : {
			label : 'B'
			}
			};
			var ploy;
			var result = new Array();
			var path;
			function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
			center : new google.maps.LatLng(${centerPlace.coordinate_lat}, ${centerPlace.coordinate_lng}),
			zoom : 4.5

			});
			var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
			ploy = new google.maps.Polyline({
			    strokeColor: '#3679e3',
			    strokeOpacity: 1.0,
			    strokeWeight: 3
			  });

			  ploy.setMap(map);
			
			
			<c:forEach items="${markers }" var="marker">
				
				var json  =new Object();
				json.place_number=${marker.place_number}
				json.place_name="${marker.place_name}"
				json.lat=${marker.coordinate_lat};
				json.lng=${marker.coordinate_lng};
				json.cate="${marker.place_cate}";
				json.detail="${marker.detail}";
				result.push(json);
			</c:forEach>
// 			console.log("jsoninfo="+JSON.stringify(result));
						
			var infowindow = new google.maps.InfoWindow();

		    var marker, i;
		    for (i = 0; i < result.length; i++) {  
		      marker = new google.maps.Marker({
		        id:result[i].place_number,
		        name:result[i].place_name,
		        position: new google.maps.LatLng(result[i].lat, result[i].lng),
		        map: map
		        
		        
		      });
// 		        console.log(result[i]);

		      google.maps.event.addListener(marker, 'click', (function(marker, i) {
		        return function() {
		          infowindow.setContent(result[i].place_name+"<br>"+result[i].detail+"<br><button id = 'insertBtn"+i+"' onclick='addIndex("+i+");'> 장소 추가 </button>");
		          infowindow.open(map, marker);
		          
		        }
		      })(marker, i));
		      	
		        marker.addListener('click', function() {
		          path = ploy.getPath();
		          map.setZoom(15);
		          map.setCenter(this.getPosition());
// 		            if (($("#indexBody").children().size()==0 || $("#indexBody").children().size()==6) && result[this.id].cate!="숙소"){
// 		            	alert("첫 장소와 마지막 장소는 숙소만 선택 가능 합니다.")
// 		        		return false;
// 		        	  }
// // 		            console.log($("#indexBody").children().size());
// 		            if($("#indexBody").children().size()==7){
// 		            	alert("장소는 5개 까지만 선택 가능합니다")
// 		            	return false;
// 		            }
		            
// 		          $("#indexBody").append("<div class='index' id='"+this.name+"'>"+this.name+"<hr>"+result[this.id].detail+"<button onclick='deleteIndex(this);'>삭제</button></div>");
// 		          path.push(marker.position);
// 		          path.getAt();
		        });
		        
		        
		    };
		    
			};
			function addIndex(ind){
	        	console.log(ind);
				 if (($("#indexBody").children().size()==0 || $("#indexBody").children().size()==6) && result[ind].cate!="숙소"){
		            	alert("첫 장소와 마지막 장소는 숙소만 선택 가능 합니다.")
		        		return false;
		        	  }
//		            console.log($("#indexBody").children().size());
		            if($("#indexBody").children().size()==7){
		            	alert("장소는 5개 까지만 선택 가능합니다")
		            	return false;
		            }
		            
		          $("#indexBody").append("<div class='index' id='"+result[ind].place_name+"'><input type='hidden'/>"+result[ind].place_name+"<hr>"+result[ind].detail+"<button onclick='deleteIndex("+$("#indexBody").children().size()+");'>삭제</button></div>");
		          path.push(new google.maps.LatLng(result[ind].lat, result[ind].lng));
		          path.getAt();
			};
			
			function deleteIndex(e){
				var parentDiv=$("#indexBody");
				path.removeAt(e);
				parentDiv.childent().eq(e).remove;
				console.log(parentDiv);
				
			};
			
			
			
			
			
// 			var markerCluster = new MarkerClusterer(map, markers,{imagePath: '/resource/img'});

			// Change this depending on the name of your PHP or XML file

		</script>
	<script
		src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZL82RRYpAr7GrwdJQ5S11-pDaZJs3n9c&callback=initMap">

			</script>
</body>
</html>