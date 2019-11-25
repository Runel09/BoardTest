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

		//작성버튼 동작
		$("#btnWrite").click(function() {
			//스마트 에디터의 내용을 <textarea>에 적용
			submitContents($("btnWrite"))
			
			//form submit
			$("form").submit();
		});

		//취소버튼 동작
		$("#btnCancel").click(function() {
			history.go(-1);
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
		<form action="/board/write" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<td class="info">아이디</td>
					<td>${userid }</td>
				</tr>
				<tr>
					<td class="info">닉네임</td>
					<td>${usernick }</td>
				</tr>
				<tr>
					<td class="info">제목</td>
					<td><input type="text" name="title" style="width: 100%" /></td>
				</tr>
				<tr>
					<td class="info" colspan="2">본문</td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="content" id="content"
							rows="20" cols="130"></textarea></td>
				</tr>
				<tr>
					<td>파일 :</td>
				 	<td><input type="file" name="upfile"/></td>
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
		<button type="button" id="btnWrite" class="btn btn-info">작성</button>
		<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/Layout/footer.jsp" />

