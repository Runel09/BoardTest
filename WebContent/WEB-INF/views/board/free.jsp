<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <jsp:include page="/WEB-INF/views/layout/header.jsp"/> --%>

<style type="text/css">

table, th {
	text-align: center;
}

tr td:nth-child(2) {
	text-align: left;
}

tr td:not(:first-child), tr th:not(:first-child) {
	border-left: 1px solid white;
}

@import 'https://fonts.googleapis.com/css?family=Raleway';


div.container
{
    font-family: Raleway;
    margin: 0 auto;
	padding: 10em 3em;
	text-align: center;
}

div.container a
{
    color: #FFF;
    text-decoration: none;
    font: 20px Raleway;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    cursor: pointer;
}

.blue
{
    background: #2196f3;
    
}

/* Circle behind */
div.circleBehind a:before, div.circleBehind a:after
{
    position: absolute;
    top: 22px;
    left: 50%;
    width: 50px;
    height: 50px;
    border: 4px solid #0277bd;
    transform: translateX(-50%) translateY(-50%) scale(0.8);
    border-radius: 50%;
    background: transparent;
    content: "";
    opacity: 0;
    transition: all 0.3s;
    z-index: -1;
}

div.circleBehind a:after
{
    border-width: 2px;
    transition: all 0.4s;
}

div.circleBehind a:hover:before
{
    opacity: 1;
    transform: translateX(-50%) translateY(-50%) scale(1);
}

div.circleBehind a:hover:after
{
    opacity: 1;
    transform: translateX(-50%) translateY(-50%) scale(1.3);
}

.community {
	font-size: 48px;
	padding: 0px 793px 26px 0px;
}

</style>

<div class="container blue circleBehind" style="margin: -117px;">

<div class="community">
<span>커뮤니티</span>
</div>

  <a href="/board/planner" class="menutab" style="font-size:38px;">플래너</a>
  <a href="/board/free" class="menutab" style="font-size:38px; color: yellow;">자유</a>
  <a href="/board/tip" class="menutab" style="font-size:38px">여행팁</a>
  <a href="/board/question" class="menutab" style="font-size:38px">질문</a>
</div>

<div class="container">

<h1 style="float:left;">자유 게시판</h1>


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

<%-- <jsp:include page="/WEB-INF/views/layout/footer.jsp" /> --%>