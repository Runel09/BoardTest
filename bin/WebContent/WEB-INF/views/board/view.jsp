<%@page import="board.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/Layout/header.jsp"/>
 <%Board detailBoard = (Board) request.getAttribute("Board");%>
<div class="container">
<div id = boardBody>
	<div >
	<div id="" style="float: left;"><label>글번호</label><%=detailBoard.getBoardno() %></div>
	<div id=""><label>제목 </label><%=detailBoard.getTitle() %></div>
	</div>
	<div>
	<div id=""style="float: left;"><label>아이디</label><%=detailBoard.getId() %></div>
	<div id=""style="float: left;"><label>조회수</label><%=detailBoard.getHit() %></div>
	<div id=""><label>작성일</label><%=detailBoard.getWrittendate() %></div>
	</div>
	<div>
	<%=detailBoard.getContent() %>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/Layout/footer.jsp"/>