<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- jquery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
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

<form action="/admin/memberdelete" method="get">
<table class="table table-hover table-condenssed table-striped ">
<tr class="info">
	<th style="width: 5%"><input type="checkbox" id="checkall"/></th>
	<th style="width: 10%">user_num</th>
	<th style="width: 10%">user_id</th>
	<th style="width: 10%">user_pw</th>
	<th style="width: 20%">user_phnum</th>
	<th style="width: 20%">user_name</th>
</tr>

<c:forEach items="${list }" var="member">

<tr>
	
	<td><input type="checkbox" name="check" value="${member.user_Num}" /></td>
	<td>${member.user_Num}</td>
<%-- 	<td><input type="checkbox" name="check" value="${member.User_Num}" /></td> --%>
<%-- 	<td>${member.User_Num}</td> --%>
	<td>${member.DB_Id }</td>
	<td>${member.DB_Pw }</td>
	<td>${member.DB_Phnum}</td>
	<td>${member.DB_Name}</td>
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

<form action="/admin/memberlist" method="get" class="text-right" style="float: right">
<input  type="search" name="search" id="search"/>
<button>검색</button>
</form>
<jsp:include page="/WEB-INF/layout/paging.jsp"/>
</div><!-- .container -->
</body>
</html>