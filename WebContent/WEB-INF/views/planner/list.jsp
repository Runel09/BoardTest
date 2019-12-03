<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>

$(document).ready(function() {
	$.ajax({
		type: "get"
		, url: "/planner/placeInfo"
		, data: {}
		, dataType: "html"
		, success: function(data) {
			$("#indexList").append(data);
		}
		, error: function() {
			console.log("fail");
		}
	})
});

// var result = new Array();
// <c:forEach items="${markers}" var="marker">
// 	var json  =new Object();
// 	json.place_number=${marker.place_number}
// 	json.place_name="${marker.place_name}"
// 	json.lat=${marker.coordinate_lat};
// 	json.lng=${marker.coordinate_lng};
// 	json.cate="${marker.place_cate}";
// 	json.detail="${marker.detail}";
	
// 	result.push(json);
// </c:forEach>

// (function() {
//   var httpRequest;
//   document.getElementById("ajaxButton").addEventListener('click', makeRequest);

//   function makeRequest() {
//     httpRequest = new XMLHttpRequest();

//     if(!httpRequest) {
//       alert('XMLHTTP 인스턴스를 만들 수가 없어요 ㅠㅠ');
//       return false;
//     }
//     httpRequest.onreadystatechange = alertContents;
//     httpRequest.open('GET', '/map/view');
//     httpRequest.send();
//   }

//   function alertContents() {
//     if (httpRequest.readyState === XMLHttpRequest.DONE) {
//       if (httpRequest.status === 200) {
//         alert(httpRequest.responseText);
//       } else {
//         alert('request에 뭔가 문제가 있어요.');
//       }
//     }
//   }
// })();
</script>
<div id="indexList"></div>