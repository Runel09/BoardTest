<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/Layout/header.jsp" />
<script type="text/javascript"
	src="/resource/se2/js/service/HuskyEZCreator.js" charset="utf-8">
	
</script>


<script type="text/javascript">
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.

		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}
	$(document).ready(function() {
		console.log("#boardNo")
		//작성버튼 동작
		$("#btnUpdate").click(function() {
			//스마트 에디터의 내용을 <textarea>에 적용
			submitContents($("btnUpdate"))

			//form submit
			$("form").submit();
		});

		//취소버튼 동작
		$("#btnCancel").click(function() {
			history.go(-1);
		});
		
		$("#btnFileRe").click(function() {
			console.log($("#fileTr"));
			$("#fileTr").html("<td>파일<input name='originalFile' type='hidden' value=${fileInfo.originName }/> </td><td><input type='file' name='upfile' /></td>");
			
			return false;
		});
	});
</script>

<style type="text/css">
#content {
	width: 95%;
}
</style>

<div class="container">

	<h3>게시글 쓰기</h3>
	<hr>

	<div>
		<form action="/board/update" method="post"
			enctype="multipart/form-data">
			<input name = "boardno" type="hidden" value="${board.boardno}" />
			<table class="table table-bordered">
				<tr>
					<td class="info">아이디</td>
					<td>${board.getId() }</td>
				</tr>
				<tr>
					<td class="info">제목</td>
					<td><input type="text" name="title" style="width: 100%"
						value="${board.title }" /></td>
				</tr>
				<tr>
					<td class="info" colspan="2">본문</td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="content" id="content"
							rows="20" cols="130">${board.content }</textarea></td>
				</tr>
				<tr id="fileTr">
				<c:choose>
					<c:when test="${(fileInfo.originName ne null) }">
						
						<td>파일 <input name="originalFile" type="hidden" value=${fileInfo.originName }/></td>
						<td>${fileInfo.originName }<button type="button" id="btnFileRe">X</button></td>
						
					</c:when>
					<c:when test="${!(fileInfo.originName ne null) }">
						
							<td>파일<input name="originalFile" type="hidden" value=""/></td>
							<td><input type="file" name="upfile" /></td>
						
					</c:when>
				</c:choose>
				</tr>
			</table>

		</form>
	</div>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",
			sSkinURI : "/resource/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
	</script>
	<div class="text-center">
		<button id="btnUpdate" class="btn btn-info">수정</button>
		<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/Layout/footer.jsp" />

