<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">

$(document).ready(function() {
   
	$("#btnWrite").click(function() {
      
		$(location).attr("href", "/board/write");
   })
   
	//글쓰기버튼 동작
	$("#emptylogin").click(function() {
		var result = confirm("로그인하실?");
		
		if(result==true){
			$(location).attr("href", "/member/login");
		}
	});
});
   
</script>
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

  <a href="/board/planner" class="menutab" style="font-size:38px;">플래너</a>
  <a href="/board/free" class="menutab" style="font-size:38px; ">자유</a>
  <a href="/board/tip" class="menutab" style="font-size:38px;">여행팁</a>
  <a href="/board/question" class="menutab" style="font-size:38px; color: white;">질문</a>
</div>

<div class="container">

<h1 style="float:left;">※공지사항을 알려드립니다</h1>
<br><br><br><br>
<table class="table table-hover table-condensed table-striped">

<tr class="info">
   <th style="width: 8%">구분</th>
   <th style="width: 36%;">제목</th>
   <th style="width: 13%">작성일</th>
   <th style="width: 8%">조회수</th>
</tr>
<c:forEach var="list" items="${list }">
<tr>
   <td>${list.checkboard }</td>
   <td style="text-align:left;"><a href="/board/view?boardno=${list.boardno }"  >${list.title }</a></td>
   <td>${list.hit }</td>
   <td>${list.writtendate }</td>
</tr>
</c:forEach>

</table>
</div>

<div class="container">

<h1 style="float:left;">질문 게시판</h1>
<br><br><br><br>

<table class="table table-hover table-condensed table-striped">

<tr class="info">

   <th style="width: 8%">구분</th>
   <th style="width: 7%">게시글번호</th>
   <th style="width: 48%;">제목</th>
   <th style="width: 11%">아이디</th>
   <th style="width: 8%">추천수</th>
   <th style="width: 8%">조회수</th>
   <th style="width: 10%">작성일</th>
</tr>


<c:forEach var="list" items="${queslist }">
<tr>
   <td>${list.checkboard }</td>
   <td style="text-align:center;">${list.boardno }</td>
   <td style="text-align:left;"><a href="/board/view?boardno=${list.boardno }"  >${list.title }</a></td>
   <td>${list.id }</td>
   <td>${list.recommend }</td>
   <td>${list.hit }</td>
   <td>${list.writtendate }</td>
</tr>
</c:forEach>
   
</table>

<c:if test="${!empty userid }">
<button id="btnWrite" style="float: right;">글쓰기</button>
</c:if>
<c:if test="${empty userid }">
<button id="emptylogin" style="float: right;">글쓰기</button>
</c:if>


	<form class="form-inline" action="/board/question" method="get">
		<div class="form-group">
			<select name="searchno">
				<option value="1" selected="selected">제목</option>
				<option value="2">내용</option>
				<option value="3">작성자</option>
			</select> <input type="text" class="form-control" name="search" id="exampleInputEmail2"
				placeholder="검색어 입력">
		</div>
		<button type="submit" class="btn btn-default">검색</button>
	</form>

	<jsp:include page="/WEB-INF/views/layout/question_paging.jsp" />

</div> <!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />