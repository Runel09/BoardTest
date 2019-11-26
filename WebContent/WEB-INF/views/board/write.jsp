<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page ="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
   $("#btnWrite").click(function() {
      $(location).attr("href", "/board/write");
   });
   
   
   $("#btnCancel").click(function() {
      $(location).attr("href", "/board/list");
   });
   
});
</script>
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>


   <div class = "container">
   <div class="row">
<form action="/place/insert" method="post" enctype = "multipart/form-data">
   <table class="table table-bordered">
            <thead>
               <tr>
                  <th colspan="2"
                     style="background-color: #eeeeee; text-align: center;">장소정보입력</th>
               </tr>
            </thead>
            <tr>
<td class="info">장소이름</td><td colspan="3">
<input type="text" class="form-control" id="place_name"
                  name="place_name" /></td>
                  </tr>
            <tr>
                  
<td class="info">좌표</td><td colspan="3">
<input type="text" class="form-control" id="coordinate_lat"
                  name="coordinate_lat" /></td>
                  </tr>
            <tr>
<td class="info">좌표</td><td colspan="3">
<input type="text" class="form-control" id="coordinate_lng"
                  name="coordinate_lng" /></td>                  
</tr>
            <tr>
<td class="info">주소</td><td colspan="3">
<input type="text" class="form-control" id="address"
                  name="address" /></td>                  
</tr>
            <tr>
<td class="info">카테고리</td><td colspan="3">
<input type="text" class="form-control" id="place_cate"
                  name="place_cate" /></td>                  
</tr>
            <tr>
<td class="info">디테일</td><td colspan="3">
<input type="text" class="form-control" id="detail"
                  name="detail" /></td>                  
</tr>
            <tr>
<td class="info">웹사이트주소</td><td colspan="3">
<input type="text" class="form-control" id="db_web_site"
                  name="db_web_site" /></td>                  
</tr>
  			<tr>
<td class="info">영업시간</td><td colspan="3">
<input type="text" class="form-control" id="business_hours"
                  name="business_hours" /></td>                  
</tr>
  			<tr>
<td class="info">전화번호</td><td colspan="3">
<input type="text" class="form-control" id="tel_number"
                  name="tel_number" /></td>                  
</tr>

<tr>
<td class="info">작성자 </td><td colspan="3">${writer}</td>
</tr>


<tr><td class="info"  colspan="4">장소정보</td></tr>

<tr><td colspan="4"><textarea name="place_information" id="place_information" rows="10" cols="80">
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'place_information' );
            </script></td></tr>

<tr>
<td class="info">첨부파일</td><td colspan="3"><input type = "file" name = "upfile"/></td>
</tr>

</table>
<div class="text-center">   
   <button  class="btn btn-primary">글쓰기</button>
   <button  class="btn btn-danger">취소</button>
</div>
</form>
</div>
</div>
<jsp:include page ="/WEB-INF/views/layout/footer.jsp"/>