<<<<<<< HEAD
<jsp:include page="/WEB-INF/layout/header.jsp"/>



<jsp:include page="/WEB-INF/layout/footer.jsp"/>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<h1>메인창</h1>

<div>
<ul>
	<c:choose>
	<c:when test="${loginfo }">
		<li><a href="/board/list">게시판</a></li>
		<li><a href="/user/logout">로그아웃</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="/user/sign">회원가입</a></li>	
		<li><a href="/user/login">로그인</a></li>
	</c:otherwise>
	</c:choose>
</ul>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
>>>>>>> refs/heads/board
