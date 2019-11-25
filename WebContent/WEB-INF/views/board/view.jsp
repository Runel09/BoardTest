<%@page import="board.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.dto.Board"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
 <%Board detailBoard = (Board) request.getAttribute("Board");%>

<style type="text/css">
#content {
	width: 95%;
}
</style>

<div class="container">

	<h3>게시글</h3>
	<hr>

	<div>
			<table class="table table-bordered">
				<tr>
					<td class="info">아이디</td>
					<td><%=detailBoard.getId() %></td>
				</tr>
				<tr>
					<td class="info">제목</td>
					<td><%=detailBoard.getTitle() %></td>
				</tr>
				<tr>
					<td class="info" colspan="2">본문</td>
				</tr>
				<tr>
					<td colspan="2"><%=detailBoard.getContent() %></td>
				</tr>
				<tr>
				
				<c:if test="${(fileInfo.originName ne null) }">
					<td><a href="/file/download?fileno=${fileInfo.fileNo }"><button>${fileInfo.originName }</button></a></td>
				</c:if>
				 </tr>
			</table>

	</div>

	<div class="text-center">
	
		<a href="/board/update?boardno=<%=detailBoard.getBoardno()%>">
		<button id="btnUpdate" class="btn btn-info">수정</button></a>
		<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>