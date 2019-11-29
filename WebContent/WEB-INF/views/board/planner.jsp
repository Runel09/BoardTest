<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

/* 게시판board style */
table, th {
	text-align: center;
}

tr td:nth-child(2) {
	text-align: left;
}

tr td:not(:first-child), tr th:not(:first-child) {
	border-left: 1px solid white;
}


/* 게시판tab style */
@import 'https://fonts.googleapis.com/css?family=Raleway';

div.container
{
    font-family: Raleway;
    margin: 0 auto;
	padding: 1em 7em;
	text-align: center;
}

div.container a
{
    color: #6f6565;
    text-decoration: none;
    font: 20px Raleway;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    cursor: pointer;
}

.yellow
{
    background: #f7bcbc;
    
}

/* Pull right  */
div.pullRight a:before
{
    position: absolute;
    width: 2px;
    height: 100%;
    left: 0px;
    top: 0px;
    content: '';
    background: #FFF;
    opacity: 0.3;
    transition: all 0.3s;
}

div.pullRight a:hover:before
{
    width: 100%;
}

.community {
	font-size: 48px;
	padding: 0px 793px 26px 0px;
	color: white;
}

</style>

<div class="container yellow pullRight"  style="margin-bottom: 45px; margin-top: 50px;">

<div class="community">
<span>커뮤니티</span>
</div>

  <a href="/board/planner" class="menutab" style="font-size:38px; color: white;">플래너</a>
  <a href="/board/free" class="menutab" style="font-size:38px; ">자유</a>
  <a href="/board/tip" class="menutab" style="font-size:38px;">여행팁</a>
  <a href="/board/question" class="menutab" style="font-size:38px;">질문</a>
</div>

<h2 style="text-align:center;">여행자들의 일정보기</h2>

<div class="container">

<h1 style="float:left;">플래너 게시판</h1>

<table class="table table-hover table-condensed table-striped">

<tr class="info">

   <th style="width: 8%">구분</th>
   <th style="width: 7%">게시글번호</th>
   <th style="width: 40%">제목</th>
   <th style="width: 20%">아이디</th>
   <th style="width: 10%">조회수</th>
   <th style="width: 15%">작성일</th>
</tr>

<c:forEach var="list" items="${list }">
<tr>
   <td>${list.checkboard }</td>
   <td>${list.boardno }</td>
   <td><a href="/board/view?boardno=${list.boardno }">${list.title }</a></td>
   <td>${list.id }</td>
   <td>${list.hit }</td>
   <td>${list.writtendate }</td>
</tr>
</c:forEach>
   
</table>

<a href="/board/write" style="float: right;"><button>글쓰기</button></a>

<form action="/board/planner" method="get">
검색어 : <input type="text" name="search">
<button>검색</button>
</form>

<jsp:include page="/WEB-INF/views/layout/planner_paging.jsp" />

</div> <!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />