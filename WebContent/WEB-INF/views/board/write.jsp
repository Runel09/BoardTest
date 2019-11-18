<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/Layout/header.jsp"/>

<div class="container text-center">
<form action="/board/write">
<div>
	<div style="height: 30px;width: 500px;">
		<div style="float: left;"><label for="inputId">글쓴이</label></div>
		<div><input type="text" id="inputId" name="inputId" readonly="readonly" value="${usernick }"/></div>
	</div>
	<div style="height: 30px;width: 500px;">
		<div style="float: left;"><label for="inputTitle">제목</label></div>
		<div><input type="text" id="inputTitle" name="inputTitle"/></div>
	</div>
	<div style="height: 200px;width: 500px;">
		<div style="float: left;"><label for="content"></label></div>
		<div><textarea id="content" name="content" rows="30" cols="10"></textarea></div>
	</div>




</div>
</form>
</div>

<jsp:include page="/WEB-INF/views/Layout/footer.jsp"/>