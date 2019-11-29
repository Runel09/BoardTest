<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<ul class="pagination pagination-sm">
		<!-- 	처음으로 가기 -->
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/board/free">&larr;처음</a></li>
		</c:if>
		<!-- 	이전 페이징 리스트로 가기 -->
		<c:if test="${paging.startPage gt paging.pageCount }">
			<li><a
				href="/board/free?curPage=${paging.startPage-paging.pageCount }">&laquo;</a></li>
		</c:if>
		<!-- 		이전 페이지로 가기 -->
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/board/free?curPage=${paging.curPage-1 }">&lt;</a></li>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="i">
			<c:choose>
				<c:when test="${paging.curPage eq i }">
					<li class="active"><a href="/board/free?curPage=${i }">${i }</a>
				</c:when>
				<c:otherwise>
					<li><a href="/board/free?curPage=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 		다음 페이지로 가기 -->
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/board/free?curPage=${paging.curPage+1 }">&gt;</a></li>
		</c:if>
		
		<c:if test="${paging.endPage ne paging.totalPage }">
			<li><a href="/board/free?curPage=${paging.startPage+paging.pageCount }">&raquo;</a></li>
		</c:if>



	</ul>
</div>
<!-- ======= -->
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%--    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!-- <div class="text-center"> -->
<!-- 	<ul class ="pagination pagination-sm"> -->
	  
<!-- 	<!-- 처음으로 가기 -->
<%-- 	<c:if test = "${paging.curPage ne 1 }"> --%>
<%-- 	<li><a href="/board/free?search=${Search }">&larr;처음</a></li> --%>
<%-- 	</c:if> --%>
<!-- 	<!-- 이전페이징가기 -->
<%-- 	<c:if test="${paging.startPage gt paging.pageCount }"> --%>
<%-- 	<li><a href="/board/free?curPage=${paging.startPage - paging.pageCount }&search=${Search }">&laquo;</a></li> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${paging.startPage gt paging.pageCount }"> --%>
<!-- 	<li class="disabled"><a>&laquo;</a></li> -->
<%-- 	</c:if> --%>
<!-- 	<!-- 이전 페이지로 가기 -->
<%-- 	<c:if test="${paging.curPage ne paging.startPage }"> --%>
<%-- 	<li><a href ="/board/free?curPage=${paging.curPage -1 }&search=${Search }">&laquo;</a></li> --%>
<%-- 	</c:if> --%>
<!-- 	<!-- 페이징 리스트 --> 
<%-- 	<c:forEach begin="${paging.startPage }" end ="${paging.endPage }" var ="i"> --%>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${paging.curPage eq i }"> --%>
<%-- 				<li class ="active"><a href="/board/free?curPage=${i }&search=${Search }">${i }</a></li> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<li ><a href="/board/free?curPage=${i }&search=${Search }">${i }</a></li> --%>
<%-- 			</c:otherwise> --%>
			
<%-- 		</c:choose> --%>
<%-- 	</c:forEach> --%>
<!-- 	<!-- 다음페이지로 가기 --> 
<%-- 	<c:if test="${paging.curPage ne paging.endPage }"> --%>
<%-- 	<li><a href="/board/free?curPage=${paging.curPage+1 }&search=${Search }">&gt;</a></li> --%>
<%-- 	</c:if> --%>
	
<!-- 	<!-- 다음페이징 리스트로 가기 --> 
<%-- 	<c:if test="${paging.endPage ne paging.totalPage }"> --%>
<%-- 	<li><a href="/board/free?curPage=${paging.startPage+paging.pageCount }&search=${Search }">&raquo;</a></li> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${paging.endPage eq paging.totalPage }"> --%>
<!-- 	<li class="disabled"><a>&raquo;</a></li> -->
<%-- 	</c:if> --%>
<!-- 	<!-- 끝페이지 가기 --> 
<%-- 	<c:if test="${paging.curPage ne paging.totalPage }"> --%>
<%-- 	<li><a href="/board/free?curPage=${paging.totalPage }&search=${Search }">&rarr;끝</a></li> --%>
<%-- 	</c:if> --%>
	
	
	
<!-- 	</ul> -->

<!-- </div> -->