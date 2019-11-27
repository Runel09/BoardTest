<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${markers}" var="marker">
<div style="border: 1px solid #ccc" class="marker" data-idx="${marker.place_number }">
${marker.place_name } - ${marker.detail}
<!-- <button id = 'insertBtn"+i+"' onclick='addIndex("+i+");'> 장소 추가 </button>"	 -->
</div>
</c:forEach>
