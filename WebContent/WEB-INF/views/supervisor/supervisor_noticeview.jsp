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
   
   

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>