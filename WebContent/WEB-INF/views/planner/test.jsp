<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

var index = new Array();
var ploy;
var result = new Array();
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

<c:forEach items="${markers}" var="marker">
	
	var json  =new Object();
	json.place_number=${marker.place_number}
	json.place_name="${marker.place_name}"
	json.lat=${marker.coordinate_lat};
	json.lng=${marker.coordinate_lng};
	json.cate="${marker.place_cate}";
	json.detail="${marker.detail}";
	result.push(json);
</c:forEach>
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
      infowindow.setContent(result[i].place_name+"<br>"+result[i].detail+"<br><button type='button' id = 'insertBtn"+i+"' onclick='addIndex("+i+");'> 장소 추가 </button>");
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
	console.log(divInd.attr("data-place_no"))
	console.log(divBody)
	console.log(index)
	var opwin=window.open("../map/test?startNo="+divBody.children("div").eq(index-1).attr("data-place_no")+"&endNo="+divInd.attr("data-place_no")
			,"childForm", "width=900px, height=600px, resizable = no, scrollbars = no"); 
// 	$(opwin.document.getElementById("startIdx")).attr("data-location-lat")=
		
// 	$(opwin.doucument).ready(function(){
// 		$(opwin.document.getElementById("startIdx_lat")).val(result[(divBody.children("div").eq(index-1).attr("data-place_no"))].lat);
// 		$(opwin.document.getElementById("startIdx_lng")).val(result[(divBody.children("div").eq(index-1).attr("data-place_no"))].lng);
// 		$(opwin.document.getElementById("endIdx_lat")).val(result[(divBody.children("div").eq(index).attr("data-place_no"))].lat);
// 		$(opwin.document.getElementById("endIdx_lng")).val('Integer.parresult[(divBody.children("div").eq(index).attr("data-place_no"))-1].lng');
	
// 	})	
		
}

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
	
	
	
	
}
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
	 if (($(".selected_index").children().size()==0 || $(".selected_index").children().size()==6) && result[ind].cate!="숙소"){
        	alert("첫 장소와 마지막 장소는 숙소만 선택 가능 합니다.")
    		return false;
    	  }
//        console.log($("#indexBody").children().size());
        if($(".selected_index").children().size()==7){
        	alert("장소는 5개 까지만 선택 가능합니다")
        	return false;
        }
        if($(".selected_index").children().size()>=1){
        	var div = $(".selected_index").append("<div class='index_ele' data-index='"+$(".selected_index").children().size()+"' data-place_no='"+(ind+1)+"'><input name='place_cate' type='hidden' value='"+result[ind].cate+"'/><input type='hidden' name='place_no' value='"+result[ind].place_number+"'/>"+result[ind].place_name+"<br>"+result[ind].detail+"<button type='button'>경로검색</button><button type='button'>삭제</button></div>");
            var button = div.children().eq($(".selected_index").children().size()-1).children("button").eq(0);
//             console.log(button);
			button.on('click', openWindow);
			
            

        }else{
			var div = $(".selected_index").append("<div class='index_ele' data-index='"+$(".selected_index").children().size()+"' data-place_no='"+(ind+1)+"'><input type='hidden' name='place_cate' value='"+result[ind].cate+"'/><input type='hidden' name='place_no' value='"+result[ind].place_number+"'/>"+result[ind].place_name+"<br>"+result[ind].detail+"<button type='button'>삭제</button></div>");
        }
      var button = div.children().children().eq(-1);
      button.on('click', function(){
    	  var indexDiv=$(this.parentNode);
    	  var indexBody=$(this.parentNode.parentNode);
    	  var index = indexDiv.index();
    	  var data_index=indexDiv.attr("data-index"); 
//     	  console.log(indexDiv.find('input').eq(0).val());
//     	  console.log(indexBody.children().eq(1).children('input').eq(0).val());
    	  if (index==0){
    		  if(indexBody.children().eq(1).children('input').eq(0).val()!="숙소"){
    		  alert("첫번째 장소는 무조건 숙소여야만 합니다.")
    		  return false;
    		  }
    	  }
    		indexBody.children().eq(index).remove();
    		indexBody.children().eq(index).attr("data-index",data_index);
    		path.removeAt(index);
    		if(index==0){
    		indexBody.children().eq(0).children("button").eq(0).remove();
    		}
      })
      
      path.push(new google.maps.LatLng(result[ind].lat, result[ind].lng));
      path.getAt();
      var encodeString = google.maps.geometry.encoding.encodePath(path);
      var decodeString = google.maps.geometry.encoding.decodePath(encodeString);
		if (encodeString) {
			console.log(encodeString);
			console.log(decodeString);
			console.log(decodeString[0].lng[0]);
			console.log(decodeString[0].lat);
			for (var i = 1; i <= decodeString.length; ++i) {
// 					console.log(decodeString.length);
				   var index = i-1;
					if(decodeString.length==1){
						return false;
					}
				   console.log(decodeString[index].lat());
				   console.log(decodeString[index].lng());
			}	   
				   
		}
    
}



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

