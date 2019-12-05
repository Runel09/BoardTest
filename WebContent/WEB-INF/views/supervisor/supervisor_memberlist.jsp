<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/layout/supervisor_header.jsp"/>
<style type="text/css">
table, th{
	text-align: center;
}
tr td:nth-child(2){
	text-align: left;
}

tr td:not(:first-child),tr th:not(:first-child){
	border-left: 3px solid white;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	$("#checkall").click(function() {
		//클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }

	});
});
</script>

<div class="container">
<h1>user 리스트</h1>
<hr>

<form action="/supervisor/memberdelete" method="get">
<table class="table table-hover table-condenssed table-striped ">
<tr class="info">
	<th style="width: 5%"><input type="checkbox" id="checkall"/></th>
	<th style="width: 10%">user_num</th>
	<th style="width: 10%">user_id</th>
	<th style="width: 10%">user_pw</th>
	<th style="width: 20%">user_phnum</th>
	<th style="width: 20%">user_name</th>
</tr>

<c:forEach var="member" items="${list }">

<tr>
	
	<td><input type="checkbox" name="check" value="${member.user_number}" /></td>
	<td>${member.user_number}</td>
<%-- 	<td><input type="checkbox" name="check" value="${member.User_Num}" /></td> --%>
<%-- 	<td>${member.User_Num}</td> --%>
	<td>${member.user_id }</td>
	<td>${member.user_pw }</td>
	<td>${member.user_phnum}</td>
	<td>${member.user_name}</td>
</tr>
</c:forEach>
</table>
<!-- <div class="text-right"> -->
<%-- <c:choose> --%>

<%-- 	<c:when test="${login }"> --%>
<!-- 		 <a class="btn btn-success" href="/board/write" role="button">글쓰기</a> -->
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<!-- 		 <a class="btn btn-success" href="/member/login" role="button">글쓰기</a> -->
<%-- 	</c:otherwise> --%>

<%-- </c:choose> --%>
<!-- </div> -->
<button>삭제</button>
</form>

<form action="/supervisor/memberlist" method="get" class="text-right" style="float: right">
<input  type="text" name="search" id="search"/>
<button>검색</button>
</form>
<jsp:include page="/WEB-INF/views/layout/supervisor_memberlistpaging.jsp"/>
</div><!-- .container -->
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>