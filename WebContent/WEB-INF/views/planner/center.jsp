<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${placeno eq 0}">
		<c:forEach items="${markers}" var="marker">
			<div style="border: 1px solid #ccc" class="marker"
				data-idx="${marker.place_number }" location-lat="${marker.coordinate_lat }" location-lng="${marker.coordinate_lng }">
				${marker.place_name } - ${marker.detail}
				<!-- <button id = 'insertBtn"+i+"' onclick='addIndex("+i+");'> 장소 추가 </button>"	 -->
			</div>
		</c:forEach>
	</c:when>
	<c:when test="${placeno ne 0}">
	<c:set value="${markers }" var="marker"/>
		<div style="border: 1px solid #ccc">
			<div>${marker.place_name}</div>
			<div>${marker.address}</div>
			<div>${marker.place_cate}</div>
			<div>${marker.detail}</div>
			<div>${marker.db_web_site}</div>
			<div>${marker.business_hours}</div>
			<div>${marker.tel_number}</div>
			<div>${marker.place_information}</div>
			<button id="listSetbtn">리스트로</button>
		</div>
	</c:when>
</c:choose>
