<%@page import="board.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Board> bList = (List<Board>) request.getAttribute("list");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
<style type="text/css">
table {
	border-collapse: collapse;
	border: 1px solid #ccc;
}

td {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 5px 10px;
}

td:hover {
	background: #ff0;
}
</style>
</head>
<body>

	<h1>EMP 리스트</h1>
	<hr>
	<table>
		<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자 아이디</th>
		<th>조회수</th>
		<th>작성일</th>
		</tr>
<%-- 		<c:set var="p" value="<%=session.getAttribute("page") %>"> --%>
<%-- 	<c:forEach var="i" begin="${0-p }" end="<%=bList.size() %>"> --%>
		<%for (int i = 0; i < 11; i++) {%>
		<tr>
			<td><%=bList.get(i).getBoardno()%></td>
			<td><a href="/board/view?boardno=<%=bList.get(i).getBoardno()%>">
			<%=bList.get(i).getTitle()%></a></td>
			<td><%=bList.get(i).getId()%></td>
			<td><%=bList.get(i).getHit()%></td>
			<td><%=bList.get(i).getWrittendate()%></td>
		</tr>
		<%}%>
<%-- 			<c:set var="sum" value="0" /> --%>
<%-- 		</c:set> --%>
<%-- 	</c:forEach> --%>
		
	</table>
</body>
</html>
