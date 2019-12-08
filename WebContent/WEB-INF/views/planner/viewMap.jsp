<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

var index = new Array();
var ploy;

var path;
var zoomVal=0;

function initMap() {
var placeNumber= ${centerPlace.place_number};	
if(placeNumber ==0){
	zoomVal=4.5;
}else{
	zoomVal=15;
}
 map = new google.maps.Map(document.getElementById('map'), {
center : new google.maps.LatLng(${centerPlace.coordinate_lat}, ${centerPlace.coordinate_lng}),
	zoom: zoomVal
			
});
var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
ploy = new google.maps.Polyline({
    strokeColor: '#3679e3',
    strokeOpacity: 1.0,
    strokeWeight: 3
  });

  ploy.setMap(map);


//	console.log("jsoninfo="+JSON.stringify(result));
			
var infowindow = new google.maps.InfoWindow();
var markers = new Array();
var marker, i;
for (i = 0; i < result.length; i++) {  
  marker = new google.maps.Marker({
    id:result[i].place_number,
    name:result[i].place_name,
    label:result[i].cate,
    position: new google.maps.LatLng(result[i].lat, result[i].lng),
    map: map
    
    
  });
  markers.push(marker);
//     console.log(result[i]);

  google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
      infowindow.setContent(result[i].place_name+"<br>"+result[i].detail+"<br><button type='button' id = 'viewBtn"+i+"' onclick='addIndex("+i+");'> 장소 정보 </button>");
      infowindow.open(map, marker);
      
    }
  })(marker, i));
  	
    marker.addListener('click', function() {
      path = ploy.getPath();
      map.setZoom(15);
      map.setCenter(this.getPosition());
      
    });

};

////-------------
var markerCluster = new MarkerClusterer(map, markers,
        {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m',gridSize:50} );
};
function openWindow(){
	var divInd = $(this.parentNode);
	var divBody=$(".index_body .selected_index")
	var index=divInd.index();
	var info ;
	var opwin=window.open("../map/test?startNo="+divBody.children("div").eq(index-1).attr("data-place_no")+"&endNo="+divInd.attr("data-place_no")
			,"childForm", "width=900px, height=600px, resizable = no, scrollbars = no"); 

		
};

function searchAll(){
	var divBody=$(".index_body")
	var info ;
	info = "../map/test?startNo="+divBody.children(".selected_index").children().eq(0).attr("data-place_no")+"&endNo="+divBody.children(".selected_index").children().eq(-1).attr("data-place_no");
	console.log($(".index_body").children(".selected_index").children().size())
	if ($(".index_body").children(".selected_index").children().size()>2){
		for(var i = 1 ; i<= $(".index_body").children(".selected_index").children().size()-2;i++){
			info+=("&index"+i+"="+divBody.children(".selected_index").children().eq(i).attr("data-place_no"));
			console.log(info);
			console.log(divBody.children(".selected_index").children().eq(i).attr("data-place_no"));
		}
	}
	var opwin=window.open(info,"childForm", "width=900px, height=600px, resizable = no, scrollbars = no"); 
};

function addIndex(ind){
	$.ajax({
		type: "get"
		, url: "/planner/placeInfo"
		, data: {"place_number":result[ind].place_number}
		, dataType: "html"
		, success: function(data) {
			$("#indexList").html(data);
		}
		, error: function() {
			console.log("fail");
		}
	})
	 		   
};
    




//	var markerCluster = new MarkerClusterer(map, markers,{imagePath: '/resource/img'});

// Change this depending on the name of your PHP or XML file


</script>

<div id="map"></div>
<c:set value="${centerplace }" var="center" />
<c:if test="${center.place_number ne 0}">
	<script
		src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZL82RRYpAr7GrwdJQ5S11-pDaZJs3n9c&callback=initMap">
	</script>
</c:if>

