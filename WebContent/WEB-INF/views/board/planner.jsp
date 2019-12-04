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

 <h2 style="text-align:center; ">여행자들의 일정보기</h2>
 <table class="table" style="    width: 57%; margin-left: 18em; font-size: 22px;">
     
        <tr >
          <th>여행지 <input type="hidden" name="travel_Place" value=""/></th>
          <td>국내</td>
		  <td>일본</td>
		  <td>홍콩</td>
		  <td>싱가포르</td>
		  <td>대만</td>
		  <td>태국</td>
		  <td>미국</td>
        </tr>
        <tr class="danger">
          <th>여행일</th>
          <td>1-3일</td>
		  <td>4-6일</td>
		  <td>7-10일</td>
		  <td>11-15일</td>
		  <td>15일이상</td>
        </tr>
        <tr>
          <th>여행시기</th>
          <td>봄</td>
		  <td>여름</td>
		  <td>가을</td>
		  <td>겨울</td>
        </tr>
        <tr class="success">
          <th>여행테마</th>
          <td>가족여행</td>
          <td>나홀로여행</td>
          <td>커플여행</td>
          <td>친구와함께</td>
          <td>비지니스여행</td>
        </tr>
       
 </table>
    
<div class="container">

<h1 style="float:left;">플래너 게시판</h1><br><br><br><br><br>
<div style="text-align: left;">인기 | 신규</div>

<jsp:include page="/WEB-INF/views/layout/planner_paging.jsp" />

</div> <!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />