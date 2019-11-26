<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- <h2>정보</h2> -->
<!-- <hr> -->
<!-- <table> -->
<!-- 	<tr> -->
<%-- 		<td>${board.boardno}</td> --%>
<%-- 		<td>${board.title }</td> --%>
<%-- 		<td>${board.id}</td> --%>
<%-- 		<td>${board.content }</td> --%>
<%-- 		<td>${board.hit }</td> --%>
<%-- 		<td>${board.writtendate }</td> --%>
<!-- 	</tr>	 -->

<!-- </table> -->
<!-- 	<button onclick="location.href='/board/list';">목록 </button> -->
<!-- 	<button onclick="location.href='/board/update';">수정 </button> -->
<!-- </body> -->
<!-- </html> -->







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
   //목록버튼 동작
   $("#btnList").click(function() {
      $(location).attr("href", "/board/list");
   });
   
   //수정버튼 동작
   $("#btnUpdate").click(function() {
      $(location).attr("href", "/board/update?boardno=${board.boardno }");
   });

   //삭제버튼 동작
   $("#btnDelete").click(function() {
	   $(location).attr("href", "/board/delete?boardno=${board.boardno }");
   });
   

});
</script>

<script type="text/javascript">
$(document).ready(function() {
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		// 게시글 번호.... ${viewBoard.boardno }
	//		console.log($("#commentWriter").val());
	//		console.log($("#commentContent").val());
		
		$form = $("<form>").attr({
			action: "/comment/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"boardNo",
				value:"${viewBoard.boardno }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"userid",
				value:"${sessionScope.userid }"
			})
		).append(
			$("<textarea>")
				.attr("name", "content")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	});
	
});

//댓글 삭제
function deleteComment(commentNo) {
	$.ajax({
		type: "post"
		, url: "/comment/delete"
		, dataType: "json"
		, data: {
			commentNo: commentNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+commentNo+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}
</script>








<div class="container">

<h1>게시판 - 장소정보 상세보기</h1>
<img src="/image/${viewplace.place_number}.PNG">

<div class="text-right">   
   <button id="btnList" class="btn btn-primary">목록</button>
   <button id="btnUpdate" class="btn btn-info">수정</button>
   <button id="btnDelete" class="btn btn-danger">삭제</button>
</div>




<table class="table table-bordered">
<tr>
<td class="info">장소정보</td><td colspan="3">${viewplace.place_number }</td>
<td class="info">장소이름</td><td colspan="3">${viewplace.place_name }</td>
</tr>

<tr>
<td class="info">좌표lat</td><td colspan="3">${viewplace.coordinate_lat }</td>
<td class="info">좌표lng</td><td colspan="3">${viewplace.coordinate_lng }</td>
</tr>

<tr>
<td class="info">주소</td><td colspan="3">${viewplace.address }</td>
<td class="info">카테고리</td><td colspan="3">${viewplace.place_cate }</td>
</tr>

<tr>
<td class="info">디테일</td><td colspan="3">${viewplace.detail }</td>
<td class="info">웹사이트주소</td><td colspan="3">${viewplace.db_web_site }</td>
</tr>

<tr>
<td class="info">영업시간</td><td colspan="3">${viewplace.business_hours }</td>
<td class="info">전화번호</td><td colspan="3">${viewplace.tel_number }</td>
</tr>

<!-- <tr> -->
<%-- <td class="info">장소정보</td><td colspan="3">${viewplace.place_information }</td> --%>
<!-- </tr> -->







<tr><td class="info"  colspan="7">장소정보내용</td></tr>

<tr><td colspan="7">${viewplace.place_information }</td></tr>

<c:if test="${viewplace.place_number eq viewfile.place_number}">
<tr><td class="info"  colspan="7">첨부파일</td></tr>
<tr><td colspan="4">${viewfile.originname }</td></tr>
</c:if>




<!-- 댓글 처리 -->
<div>




<!-- 로그인상태 -->
<c:if test="${login }">
<!-- 댓글 입력 -->
<div class="form-inline text-center">
	<input type="text" size="10" class="form-control" id="commentWriter" value="${usernick }" readonly="readonly"/>
	<textarea rows="2" cols="60" class="form-control" id="commentContent"></textarea>
	<button id="btnCommInsert" class="btn">입력</button>
</div>	<!-- 댓글 입력 end -->
</c:if>

<!-- 비로그인상태 -->
<c:if test="${not login }">
<div class= "text-right">
<strong>댓글 작성시 로그인이 필요합니다</strong><br>
<button onclick='location.href="/member/login";'>로그인</button>
<button onclick='location.href="/member/join";'>회원가입</button>
</div>
</c:if>
<!-- 댓글 리스트 -->
<table class="table table-striped table-hover table-condensed">
<thead>
<tr>
	<th style="width: 10%;">유저번호</th>
	
	<th style="width: 65%;">댓글</th>
	<th style="width: 20%;">작성일</th>
	<th style="width: 5%;"></th>
</tr>
</thead>
<tbody id="commentBody">
<c:forEach items="${commentList }" var="comment">
<tr data-commentno="${comment.commentNo }">
	<td>${comment.userno }</td>
	
	<td>${comment.content }</td>
	<td><fmt:formatDate value="${comment.writtenDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
	<td>
		<c:if test="${sessionScope.userid eq comment.userid }">
		<button class="btn btn-default btn-xs"
			onclick="deleteComment(${comment.commentNo });">삭제</button>
		</c:if>
	</td>
	
</tr>
</c:forEach>
</tbody>
</table>	<!-- 댓글 리스트 end -->

</div>	<!-- 댓글 처리 end -->








<!------------------------------------------------------------->

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

