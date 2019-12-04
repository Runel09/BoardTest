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

</script>
<div id="indexList"></div>