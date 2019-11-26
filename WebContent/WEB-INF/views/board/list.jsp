<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
table, th {
   text-align: center;
}

tr td:nth-child(2) {
   text-align:left;
}

tr td:not(:first-child), tr th:not(:first-child) {
   border-left: 1px solid white;
}

</style>

<div class="container">

<h1>게시글 목록</h1>
<hr>

<table class="table table-hover table-condensed table-striped">

<tr class="info">
   <th style="width: 15%">게시글번호</th>
   <th style="width: 40%">제목</th>
   <th style="width: 20%">아이디</th>
   <th style="width: 10%">조회수</th>
   <th style="width: 15%">작성일</th>
</tr>

<c:forEach var="list" items="${list }">
<tr>
   <td>${list.boardno }</td>
   <td><a href="/board/view?boardno=${list.boardno }">${list.title }</a></td>
   <td>${list.id }</td>
   <td>${list.hit }</td>
   <td>${list.writtendate }</td>
</tr>
</c:forEach>
   
</table>

<a href="/board/write" style="float: right;"><button>글쓰기</button></a>

<jsp:include page="/WEB-INF/views/layout/paging.jsp" />

</div> <!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />