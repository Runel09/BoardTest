<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- <script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script> -->
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript"
src="/resource/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
// <form>이 submit되면
// 스마트 에디터 내용을 <textarea> 반영해주는 함수

function submitContents(elClickedObj) {
   // 에디터의 내용이 textarea에 적용된다
   oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
   
   try {
      elClickedObj.form.submit(); // <form> submit 수행
   } catch(e) {}
   
}
</script>

<script type="text/javascript">

$(document).ready(function() {
   
	$("#btnWrite").click(function() {
      
      // 스마트에디터의 내용을 <textarea>에 적용
      submitContents( $("#btnWrite") );
      
      // form submit
      $("form").submit();
   })
   
   $("#btnCancel").click(function() {
      
      history.back(-1);
   })

});




</script>

<style type="text/css">
table, th {
   text-align: center;
}

tr td:nth-child(2) {
   text-align:left;
}

tr td:not(:first-child), tr th:not(:first-child) {
   border-left: 1px solid white;
}

#smart_editor2 {
   width: 98%;
}

</style>

<div class="container">

<h1>신고</h1>
<hr>

<form action="/board/report" method="post" encType="multipart/form-data">
		<input type="hidden" name="boardno" value="${boardno }"/>
		<table class="table table-bordered">

			<tr>
				<td class="info">아이디</td>
				<td>${board.db_id }</td>
			</tr>
			<tr>
				<td class="info">신고사유</td>
				<td>
					<input type="radio" name="reason" value="영리/홍보" id="r0" /><label for="r0">영리/홍보</label>
					<input type="radio" name="reason" value="음란" id="r1" /><label for="r1">음란</label>
					<input type="radio" name="reason" value="욕설" id="r2" /><label for="r2">욕설</label>
					<input type="radio" name="reason" value="신상노출" id="r3" /><label for="r3">신상노출</label>
					<input type="radio" name="reason" value="도배" id="r4" /><label for="r4">도배</label>
					<input type="radio" name="reason" value="기타" id="r5" /><label for="r5">기타</label>
				</td>
			</tr>

			<tr>
				<th class="info">내용</th>
				<td>
					<textarea name="content" id="content" rows="30" cols="140"></textarea>
				</td>
			</tr>

		</table>
		<button type="button" id="btnCancel" style="float: right">취소</button>
      <button id="btnWrite" style="float: right">작성</button>
</form>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<!-- 스마트 에디터 적용 코드 -->
<!-- <textarea>태그에 스마트 에디터의 스킨을 입히는 코드 -->   
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
   oAppRef: oEditors,
   elPlaceHolder: "content",
   sSkinURI: "/resource/se2/SmartEditor2Skin.html",
   fCreator: "createSEditor2"
});
</script>