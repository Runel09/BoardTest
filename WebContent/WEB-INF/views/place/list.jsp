<%@page import="java.util.Date"%>
<%@page import="dto.place.PlaceDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% List<Board> bList = (List)request.getAttribute("list"); %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type ="text/css">
table, th{
	text-align:center;


}
tr td:nth-child(2){
	text-align:left;
}

tr td:not(:first-child), tr th:not(:first-child){

	border-left:3px solid white;
}




</style>
<script type="text/javascript">


$(document).ready(function(){
	$("#btnWrite").click(function(){
		var loginstatus ='<%= session.getAttribute("login")%>';
		if(loginstatus == "true")
			$(location).attr("href","/place/insert");
		else if(loginstatus != "true")
			$(location).attr("href","/main");
	});
	

	
	$("btnCateSearch").click(function(){
		
		$form = $("<form>").attr({
			action: "/place/list",
			method: "get"
		}).append(
			$("<input>")
				.attr("name","cate")
				.css("display","none")
				.attr("value",$("<form>").find("[name='cate']:checked").val() ));
		
		
		$(document.body).append($form);
		
		$form.submit();
		
		
		
	})
	
		
		
	
});

</script>


<div class ="container">

<h1>리스트</h1>
<hr>


<c:forEach var= "place"  items = "${list}">
	

	
<!-- 	<tr> -->
<%-- <%-- 		<td><input type = "checkbox" name = "check" value="${board.boardno }"/></td> --%>
<%-- 		<td>${place.place_number}</td> --%>
<%-- 		<td><a href ="/place/view?place_number=${place.place_number }">${place.place_name }</a></td> --%>
<%-- 		<td>${place.address}</td> --%>
<%-- 		<td>${place.place_cate }</td> --%>
<%-- 		<td>${place.favorite_count }</td> --%>
	
	
		
<!-- 	</tr>	 -->
	
  <div class="col-sm-6 col-md-3"  style="overflow-x:hidden; overflow-y:hidden; height:500px;">
    <div class="thumbnail">
      <img src="/image/${place.place_number}_1.jpg" style="height:180px;">
      <div class="caption" style="height: 620px;">
        <h3><a href ="/place/view?place_number=${place.place_number }">${place.place_name }</a></h3><br>
        <h4>${place.place_number}</h4><br>
        <p>주소:${place.address}</p><br>
        <p>카테고리:${place.place_cate }</p><br>
<%--         <p>조회수:${place.favorite_count }</p> --%>
      </div>
    </div>
  </div>
	
</c:forEach>

<hr style = "clear: both;">
</hr>

<%-- <c:choose> --%>
<%-- <c:when test="${not empty login }" > --%>
<!-- <button onclick= "location.href='/board/write'">글쓰기</button> -->
<%-- </c:when>  --%>

<%-- <c:otherwise> --%>

<!-- <button onclick ="location.href='/main' " >글쓰기</button> -->

<%-- </c:otherwise> --%>


<%-- </c:choose> --%>
<!-- <div class="text-center"> -->
<!-- <button id="btnDelete" class="btn btn-danger">글삭제</button> -->
<!-- </div> -->
<!-- </form> -->
<div class= "text-center">
<button id="btnWrite" class= "btn btn-info">글쓰기</button>
</div>



<!-- <div class ="text-right"> -->
<%-- <input type = "text" name ="search" value= "${board.boardno }"/> --%>
<!-- <button>검색</button> -->
<!-- </div> -->
<form action ="/place/list" method="get">
<table>
	<tr>
		<td><input type = "text" name ="search" /></td>
	</tr>
	<tr>
		<td><input type="radio" name="cate" value="음식점"/>음식점
		<input type="radio" name="cate" value="숙소"/>숙소
		<input type="radio" name="cate" value="관광명소"/>관광명소</td>
	</tr>
</table>
<button id="btnCateSearch" class="btn">검색</button>
</form>
<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>


