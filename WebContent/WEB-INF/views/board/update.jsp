<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page ="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
//    $("#btnUpdate").click(function() {
//       $(location).attr("href", "/board/update");
//    });
   
   
   $("#btnCancel").click(function() {
      $(location).attr("href", "/board/list");
   });
   
   
   
   
   
   
});
</script>
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>


   <div class = "container">
   <div class="row">
<form action="/board/update" method="post" enctype = "multipart/form-data">
<input type="hidden" name="boardno" value="${board.boardno }" />   
   <table class="table table-bordered">
            <thead>
               <tr>
                  <th colspan="2"
                     style="background-color: #eeeeee; text-align: center;">글쓰기</th>
               </tr>
            </thead>
            <tr>
<td class="info">제목</td><td colspan="3">
<input type="text" placeholder="title" id="title"
                  name="title" value = "${board.title }" /></td>

<tr>
<td class="info">작성자 </td><td colspan="3">${writer}</td>
</tr>


<tr><td class="info"  colspan="4">내용</td></tr>

<tr><td colspan="4"><textarea name="content" id="content" rows="10" cols="80">
<%--             ${board.content } --%>
            </textarea>
            
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'content' );
            </script></td></tr>

<tr>
<td class="info">첨부파일</td><td colspan="3"><input type = "file" name = "upfile"/></td>
</tr>

</table>
<div class="text-center">   
   <button id="btnUpdate" class="btn btn-primary">수정완료</button>
</div>
</form>
   <button id="btnCancel" class="btn btn-danger">취소</button>
</div>
</div>
<jsp:include page ="/WEB-INF/views/layout/footer.jsp"/>