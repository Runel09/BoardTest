<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<style type="text/css">

	table, th{
		text-align: center;
	}
	tr td:nth-child(2){
		text-align:left;
	}
	tr td:not(:first-child), tr th:not(:first-child) { 
		border-left: 3px solid white;
	}
</style>

<div class="container text-center">
<h1>게시글 목록</h1>
<hr>

<table class="table">
	<thead>
	<tr>
		<th style="width: 10%">글번호</th>
		<th style="width: 55%">제목</th>
		<th style="width: 10%">아이디</th>
		<th style="width: 10%">조회수</th>
		<th style="width: 15%">작성일</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${list }" var="board">
		<tr>
			<td>${board.boardno }</td>
			<td><a href="/board/view?boardno=${board.boardno}">${board.title }</a></td>
			<td>${board.id }</td>
			<td>${board.hit }</td>
			<td><fmt:formatDate value="${board.writtendate }" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
	<tr><td><ul><li><a href="/board/write">글쓰기</a></li></ul></td></tr>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
