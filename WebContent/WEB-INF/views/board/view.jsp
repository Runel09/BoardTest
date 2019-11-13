<%@page import="board.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
    <%Board detailBoard = (Board) request.getAttribute("Board");%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>