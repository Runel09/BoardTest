<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/js/httpRequest.js"></script>

<script type="text/javascript" 
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<table>
<c:forEach items="${list }" var="plan">
<tr>
	<td>${plan.travel_place }</td>
	<td>${plan.travel_season }</td>
	<td>${plan.travel_date }</td>
	<td>${plan.travel_thema }</td>
	<td>${plan.review_score }</td>
</tr>
</c:forEach>
</table>
