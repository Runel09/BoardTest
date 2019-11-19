<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/Layout/header.jsp"/>
 
<div class="container">
<div id = boardBody>
	<div >
	<div id=""><label>제목 </label><input type="text" id="title" name="title"></div>
	</div>
	<div>
	<div id=""style="float: left;"><label>글쓴이</label>${userNick }</div>
	</div>
	<div>
	<textarea id="content" rows="30" cols="10"></textarea>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/Layout/footer.jsp"/>