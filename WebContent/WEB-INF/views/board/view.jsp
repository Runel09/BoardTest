
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
		var checkboard = '${board.checkboard}';
		
		if( checkboard == '여행팁') {
			location.href="/board/tip"
		} else if( checkboard == '질문') {
			location.href="/board/question"
		} else if( checkboard == '자유') {
			location.href="/board/free"
		} else if ( checkboadr == '공지') {
			location.href="/board/free"
		}
		
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
	
	
	$("#notloginbtn1").click(function() {
		var result = confirm("로그인 후 이용가능합니다.");
		
		if(result==true){
			$(location).attr("href", "/member/login");
		}
	})
	
		$("#notloginbtn2").click(function() {
		var result = confirm("로그인 후 이용가능합니다.");
		
		if(result==true){
			$(location).attr("href", "/member/login");
		}
	})
	
	
	//추천버튼 동작
	$("#emptylogin").click(function() {
		var result = confirm("로그인 후 이용가능합니다.");
		
		if(result==true){
			$(location).attr("href", "/member/login");
		}
	});
});
</script>

<script type="text/javascript">
$(document).ready(function() {

	if(${isRecommend}) {
		
	
		$("#btnRecommend")
			.addClass("btn-warning")
			.html('추천 취소');
		} else {
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
				console.log("성공");
				console.log(data);

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
	
});
</script>

<div class="container" style="width: 76%; margin-left: 16em;">

	<h1 style="float: left;">게시물 조회</h1>

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
			<td colspan="3">${board.user_id }</td>

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
	</table>

	<!-- 버튼을 통한 페이지 이동 -->
	<div class="text-center">
		<c:if test="${!empty userid }">
		<button id="btnRecommend" class="btn btn-primary"></button>
		</c:if>
		<c:if test="${empty userid }">
		<button id="emptylogin" class="btn btn-primary">추천</button>
		</c:if>
		<c:if test="${!empty userid }">
		<button id="btnReport" class="btn btn-primary">신고</button>
		</c:if>
		<c:if test="${empty userid }">
		<button id="notloginbtn2" class="btn btn-primary">신고</button>
		</c:if>
	</div>
	<div class="text-right">
		<button id="btnList" class="btn btn-primary">목록</button>
		<c:if test="${userid eq board.user_id}">
			<button id="btnUpdate" class="btn btn-info">수정</button>
			<button id="btnDelete" class="btn btn-danger">삭제</button>
		</c:if>
	


	</div>


	<table class="table table-bordered" >
		<tr>
			<td class="info" colspan="4">댓글</td>
		</tr>

		<tr>
			<td colspan="5">
				<form action="/comment/insert" method="get">
					<c:if test="${empty login }">
						<textarea class="form-control"
						style="resize: none; width: 82%;/* display: inline; */ float: left; height: 111px; margin-left: 5em;"
						name="content" placeholder="로그인 후 이용가능합니다."></textarea>
					</c:if>
					<c:if test="${!empty login }">
					<textarea class="form-control"
						style="resize: none; width: 82%;/* display: inline; */ float: left; height: 111px; margin-left: 5em;"
						name="content" required="required"></textarea>
					</c:if>
					<c:if test="${!empty login }">
					<button class="btn" style="height: 112px; width: 8%;">작성</button>
					</c:if>
					<c:if test="${empty login }">
					<button type="button" id="notloginbtn" class="btn" style="height: 112px; width: 8%;">작성</button>
					</c:if>
					<input type="hidden" value="${board.boardno }" name="boardno">
				</form>
			</td>
		</tr>
		<c:forEach items="${comment }" var="comment">
			<tr>
				<td style="width: 21%;">작성자 : ${comment.user_id }<br> 작성시간 : ${comment.writtendate }</td>
	
				<td colspan="2">
					<div style="height: 54px;" class="col-md-11 col-sm-11">${comment.content }</div>
					<div class="col-md-1 col-sm-1 text-right">
						<c:if test="${userid eq comment.user_id }">
							<a class="btn btn-info"
								href="/comment/delete?commentno=${comment.commentno }&boardno=${board.boardno}">삭제</a>
						</c:if>
					</div>
				</td>
			</tr>
		</c:forEach>

	</table>

</div>  <!-- container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />