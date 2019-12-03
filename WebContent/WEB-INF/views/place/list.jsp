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
// $(document).ready(function(){
// 	$("#btnLogout").click(function(){
// 		$(location).attr("href","/member/logout");
// 	})

$(document).ready(function(){
	$("#btnWrite").click(function(){
		var loginstatus ='<%= session.getAttribute("login")%>';
		if(loginstatus == "true")
			$(location).attr("href","/place/insert");
		else if(loginstatus != "true")
			$(location).attr("href","/main");
	});
	
// 	$("#checkAll").click(function(){
// 		  //클릭되었으면
//         if($("#checkAll").prop("checked")){
//             //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
//             $("input[name=check]").prop("checked",true);
//             //클릭이 안되있으면
//         }else{
//             //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
//             $("input[name=check]").prop("checked",false);
//         }

		
// 		})
// 	$("#serch").click(function(){
		
	
// 	})
	
		
		
	
});

</script>


<div class ="container">

<h1>리스트</h1>
<hr>

<!-- <form action="/select/delete" method="post" > -->
<!-- 	<tr class ="info"> -->
<!-- 		<th >장소번호</th> -->
<!-- 		<th>장소이름</th> -->
<!-- 		<th>주소</th> -->
<!-- 		<th>카테고리</th> -->
<!-- 		<th>조회수</th> -->
<!-- 	</tr> -->
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
</table>
<button>검색</button>
</form>
<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>


