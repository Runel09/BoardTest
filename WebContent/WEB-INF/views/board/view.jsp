<%@page import="dto.board.BoardFile"%>
<%@page import="dto.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/js/httpRequest.js"></script>

<script type="text/javascript">

$(document).ready(function(){

// check();

	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/board/free");
	});
	
	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/board/update?boardno=${board.boardno }");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		$(location).attr("href", "/board/delete?boardno=${board.boardno }");
	});

	//신고버튼 동작
	$("#btnReport").click(function() {
		$(location).attr("href", "/board/report?boardno=${board.boardno }");
	});
});
</script>

<script type="text/javascript">
$(document).ready(function() {
	if(${isRecommend}) {
		$("#btnRecommend")
			.addClass("btn-warning")
			.html('추천 취소');
		} 
	else {
		$("#btnRecommend")
			.addClass("btn-primary")
			.html('추천');
	}

	$("#btnRecommend").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/board/recommend"
			, data: { "boardno": '${board.boardno }' }
			, dataType: "json"
			, success: function( data ) {
// 				console.log("성공");
// 				console.log(data);

				if( data.result ) { //추천 성공
					$("#btnRecommend")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$("#btnRecommend")
					.removeClass("btn-warning")
					.addClass("btn-primary")
					.html('추천');
				
				}
				
				//추천수 적용
				$("#recommend").html(data.cnt);
		
			}
			, error: function() {
				console.log("실패");
				
			}
		});
});
</script>

<div class="container">

	<h1>게시물 조회</h1>
	<hr>

	<table class="table table-bordered">

		<tr>
			<td class="info">글번호</td>
			<td colspan="3">${board.boardno }</td>
		</tr>

		<tr>
			<td class="info">제목</td>
			<td colspan="3">${board.title }</td>
		</tr>

		<tr>
			<td class="info">아이디</td>
			<td>${board.id }</td>
			<td class="info">닉네임</td>
			<td>[ 회원가입완료되면 추가 ]</td>
		</tr>

		<tr>
			<td class="info">조회수</td>
			<td>${board.hit }</td>
			<td class="info">추천수</td>
			<td id="recommend">${board.recommend }</td>
		</tr>

		<tr>
			<td class="info">작성일</td>
			<td colspan="3">${board.writtendate }</td>
		</tr>

		<tr>
			<td class="info" colspan="4">본문</td>
		</tr>
		<tr>
			<td colspan="4">${board.content }</td>
		</tr>

		<c:if test="${not empty file.originname }">
			<tr>
				<td class="info" colspan="4">첨부파일</td>
			</tr>
			<tr>
				<td colspan="4"
					onclick="location.href='/board/download?fileno=${file.fileno }';">${file.originname }</td>
			</tr>
		</c:if>

		<tr>
			<td class="info" colspan="4">댓글</td>
		</tr>

		<tr>
			<td colspan="5">
				<form action="/comment/insert" method="get">
					<textarea class="form-control"
						style="resize: none; width: 95%; display: inline; float: left;"
						name="content" required="required"></textarea>
					<button class="btn" style="height: 54px; width: 5%; padding: 0;">작성</button>
					<input type="hidden" value="${board.boardno }" name="boardno">
				</form>
			</td>
		</tr>
		<c:forEach items="${comment }" var="com">
			<tr>
				<td>작성자 : ${com.userid }</td>
				<td colspan="4">
					<div style="height: 54px;" class="col-md-11 col-sm-11">${com.content }</div>
					<div class="col-md-1 col-sm-1 text-right">
						<c:if test="${userid eq com.userid }">
							<a class="btn btn-info"
								href="/comment/delete?commentno=${com.commentno }&boardno=${board.boardno}">삭제</a>
						</c:if>
					</div>
				</td>
			</tr>
		</c:forEach>

	</table>



	<!-- 목록 페이지로 요청을 발생시키는 링크 -->
	<!-- <a href="/emp/list">목록</a> -->

	<!-- 버튼을 통한 페이지 이동 -->
	<div class="text-center">
		<button id="btnList" class="btn btn-primary">목록</button>		
		<button id="btnRecommend" class="btn btn-primary"></button>
		<button id="btnReport" class="btn btn-primary">신고</button>
	
		<c:if test="${userid eq board.id }">
			<button id="btnUpdate" class="btn btn-info">수정</button>
			<button id="btnDelete" class="btn btn-danger">삭제</button>
			<button id="btnRecommend" style="margin-top: 30px;"></button>
		</c:if>

	</div>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />