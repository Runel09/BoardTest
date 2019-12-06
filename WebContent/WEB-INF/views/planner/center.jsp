<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${placeno eq 0}">
		<div style="height: 40px; margin-top: 15px">
		<label for="search_no">장소 검색&nbsp;&nbsp; </label><input id="search_no" name="search_no" type="text"/>
		</div>
		<c:forEach items="${markers}" var="marker">
			<div style="border: 1px solid #ccc" class="marker"
				data-idx="${marker.place_number }" data-location-lat="${marker.coordinate_lat }" data-location-lng="${marker.coordinate_lng }">
				${marker.place_name } - ${marker.detail}
				<!-- <button id = 'insertBtn"+i+"' onclick='addIndex("+i+");'> 장소 추가 </button>"	 -->
			</div>
		</c:forEach>
	</c:when>
	<c:when test="${placeno ne 0}">
	<c:set value="${markers }" var="marker"/>
		<div style="border: 1px solid #ccc">
			<div><label>장소명</label>${marker.place_name}</div>
			<div><label>주소</label>${marker.address}</div>
			<div><label>카테고리</label>${marker.place_cate}</div>
			<div><label>상세 카테고리</label>${marker.detail}</div>
			<div><label>사이트</label>${marker.db_web_site}</div>
			<div><label>영업시간</label>${marker.business_hours}</div>
			<div><label>전화번호</label>${marker.tel_number}</div>
			<div><label>장소정보</label>${marker.place_information}</div>
			<button id="listSetbtn">리스트로</button>
		</div>
	</c:when>
</c:choose>
