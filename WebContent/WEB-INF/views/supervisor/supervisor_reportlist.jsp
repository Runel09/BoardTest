<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
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

<form action="/supervisor/reportdelete" method="post">
<table class="table table-hover table-condenssed table-striped ">
<tr class="info">
	<th style="width: 5%"><input type="checkbox" id="checkall"/></th>
	<th style="width: 10%">user_id</th>
	<th style="width: 10%">board_no</th>
	<th style="width: 10%">reason</th>
	<th style="width: 20%">content</th>
</tr>

<c:forEach var="report" items="${list }">

<tr>
	
	<td><input type="checkbox" name="check" value="${report.reportno}" /></td>
	
	<td>${report.db_id }</td>
	<td><a href="/board/view?boardno=${report.boardno }">${report.boardno }</a></td>
	<td>${report.reason}</td>
	<td>${report.content}</td>
</tr>
</c:forEach>
</table>

<button type="submit">삭제</button>
</form>

<form action="/supervisor/reportlist" method="get" class="text-right" style="float: right">
<input  type="text" name="search" id="search"/>
<button>검색</button>
</form>
<jsp:include page="/WEB-INF/views/layout/supervisor_memberlistpaging.jsp"/>
</div><!-- .container -->
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>