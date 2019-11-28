<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${placeno eq 0}">
<c:forEach items="${markers}" var="marker">
<div style="border: 1px solid #ccc" class="marker" data-idx="${marker.place_number }">
${marker.place_name } - ${marker.detail}
<!-- <button id = 'insertBtn"+i+"' onclick='addIndex("+i+");'> 장소 추가 </button>"	 -->
</div>
</c:forEach>
</c:when>
<c:when test="${placeno ne 0}">
<div style="border: 1px solid #ccc">
	${marker.place_number}
	${marker.place_name}
	${marker.coordinate_lat}
	${marker.coordinate_lng}
	${marker.address}
	${marker.place_cate}
	${marker.detail}
	${marker.db_web_site}
	private String business_hours;
	private String tel_number;
	private String place_information;

</div>
</c:when>
</c:choose>
