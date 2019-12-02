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
   

   $("#free").click(function() {
   
   $("#cate").html("자유");

});
	
   $("#tip").click(function() {
		   
   $("#cate").html("여행팁");

});
	   
	$("#question").click(function() {
		   
	$("#cate").html("질문");

});
	
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

<h1>글쓰기</h1>
<hr>

<form action="/board/write" method="post" encType="multipart/form-data">
<table class="table table-bordered">

   <tr>
   		<td>  
		<input id="free" type="radio" name="checkboard" value="자유">자유
		<input id="tip" type="radio" name="checkboard" value="여행팁">여행팁
		<input id="question" type="radio" name="checkboard" value="질문">질문
   		</td>
   		<td><div id="cate"></div></td>
   </tr>

   <tr>
      <td class="info">아이디</td><td>${userid }</td>
   <tr>

   
   <tr>
      <th class="info" >제목</th>
      <td><input type="text" placeholder="제목을 입력하세요." name="title" required="required" style="width: 650px;"/></td>
   </tr>

   <tr>
      <th class="info">내용</th>
      <td><textarea name="content" id="content" rows="30" cols="140">
</textarea>
<!-- <script> -->
<!-- //    CKEDITOR.replace( 'content' ); -->
<!-- </script> -->
</td>
   </tr>

   <tr>
      <th class="info">첨부파일:</th>
      <td><input type="file" placeholder="파일을 선택하세요. " name="file" /></td>
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