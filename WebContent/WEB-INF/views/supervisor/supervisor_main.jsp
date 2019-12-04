<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<h1>관리자 페이지</h1>
<hr>


<a href="/supervisor/memberlist">회원관리</a>
<br><br>
<a href="/supervisor/boardlist">게시판관리</a>
<br><br>
<a href="/place/list">장소정보 관리</a>
<br><br>
<a href="/place/insert">장소정보 입력</a>
<br><br>
<a href="/supervisor/noticelist">공지사항 관리</a>
<br><br>
<a href="/supervisor/insertnotice">공지사항 입력</a>
<br><br>
<a href="/supervisor/reportlist">신고글 관리</a>
<br><br>
<a href="/supervisor/logout">로그아웃</a>
<br>
</body>
</html>