<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/Layout/header.jsp" />
<style type="text/css">
#logForm .inputform label {
	width: 60px;
}
</style>
<div class="container text-center" style="width: 350px;">
	<h1>로그인</h1>
	<form action="/user/login" method="post" id="logForm">
		<div class="inputform" style="float: left;">
			<div>
				<label for="userId">아이디</label><input type="text" id="userId" name="userId" />
			</div>
			<div>
				<label for="userPw">비밀번호</label><input type="password" id="userPw" name="userPw" />
			</div>
		</div>
		<div style="float: right; height: 55px;">
			<input style="margin-top: 10px" type="submit" value="로그인">
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/Layout/footer.jsp" />