<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">


</script>

<script type="text/javascript">
$(document).ready(function () { 
	if("$(is)")
})
</script>
   <div class="container">
      <table class="table" style="margin: 0 auto;">
         <thead>
            <tr>
               <td>boardno</td>
               <td>title</td>
               <td>id</td>
               <td>hit</td>
               <td>writtendate</td>
            </tr>
         </thead>
         <tr>
            <td>${board.boardno }</td>
            <td>${board.title }</td>
            <td>${board.id }</td>
            <td>${board.hit }</td>
            <td>${board.writtendate }</td>
         </tr>
         <tr>
            <td colspan="6">
               <div class="col-md-12" style="border: 1px solid #CCC; height: 500px;">${board.content }</div>
            </td>
         </tr>
         <tr>
         	<td>
         		<c:if test="${!empty file}">
         			<div>${file.originname } (용량 : ${file.filesize })</div>
         		</c:if>
       
         	</td>
         </tr>
      </table>
   </div>
   
   <div class="text-center">
   
   <c:choose >
   <c:when test="${board.id eq userid }">
   <button  id="btnUpdate" class="btn btn-default" onclick="location.href='/supervisor/noticeupdate?boardno=${board.boardno}'">수정</button>
  
<%--    <button  id="btnDelete" class="btn btn-default" onclick="location.href='/supervisor/noticedelete?boardno=${board.boardno}'">삭제</button> --%>
 </c:when>
 </c:choose>
   
   
<%--    <button id="btnRecommend"  class="btn btn-default" onclick="location.href='/board/recommend?boardno=${board.boardno}'">추천</button> --%>
<!--    </div> -->
<!--    <br><br> -->
<!--    <div class="text-center"> -->
<!--    <form action="/comment/insert" method="post"> -->
<!--    <label> 댓글</label> -->
<%--    <input type="hidden" name="boardno" value="${board.boardno }"/> --%>
<!--    <input type="text" name="comment" size="30px"/> -->
   
<!--    <button>입력</button> -->
<!--    </form> -->
<!--    </div> -->
   
<!--    <form action="/comment/delete" method="get"> -->
<!--    <div> -->
<!--    <br><br> -->
<!--    <table class="table table-boarderd table-condenssed "> -->
<!-- <tr class="info"> -->
<!-- 	<th >댓글번호</th> -->
<!-- 	<th >아이디</th> -->
<!-- 	<th style="width: 30%">댓글내용</th>	 -->
<!-- 	<th style="width: 10%">작성일</th> -->
<!-- 	<th >삭제</th> -->
<!-- </tr> -->
<%-- <c:forEach items="${commentlist }" var="comment"> --%>

<!-- <tr> -->
	
<%-- 	<td>${comment.commentno}</td> --%>
<%-- 	<td>${comment.userid }</td> --%>
<%-- 	<td>${comment.content }</td> --%>
<%-- 	<td><fmt:formatDate value="${comment.writtendate }" pattern="yyyy-MM-dd"></fmt:formatDate></td> --%>
<%-- 	<c:if test="${userid eq comment.userid }"> --%>
<%-- 	<input type="hidden" name="boardno" value="${board.boardno }"/> --%>
<%-- 	<input type="hidden" name="commentno" value="${comment.commentno }"/> --%>
<!-- 	<td><button>삭제</button></td> -->
<%-- 	</c:if> --%>
<!-- </tr> -->
<%-- </c:forEach> --%>
<!-- </table> -->
<!--    </div> -->
<!--    </form> -->
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>