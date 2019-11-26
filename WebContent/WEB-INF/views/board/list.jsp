<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	 
	})

</script>

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



ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}
 
ul.tabs li.current{
  background: #ededed;
  color: #222;
}
 
.tab-content{
  display: none;
  background: #ededed;
  padding: 15px;
}
 
.tab-content.current{
  display: inherit;
}
</style>

  <div class="container">
 
  <ul class="tabs">
    <li class="tab-link current" data-tab="tab-1">메뉴_하나</li>
    <li class="tab-link" data-tab="tab-2">메뉴_둘</li>
    <li class="tab-link" data-tab="tab-3">메뉴_셋</li>
  </ul>
 
  <div id="tab-1" class="tab-content current">
---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ----
  </div>
  <div id="tab-2" class="tab-content">
---- ---- ★------ ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- ★------ ---- ---- ---- ----
  </div>
  <div id="tab-3" class="tab-content">
---- ★-- -------- ---- ---- ---- -★- ---- ---- -------- ---- -★- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- --★ -------- ★-- ---- ---- ---- ---- ---- -------- ---- ---- --★ ---- ---- ---- -------- ---- ---- ---- --★
  </div>
 
</div>


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