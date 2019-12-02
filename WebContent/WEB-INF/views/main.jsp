<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>메인</h1>


<c:if test="${empty login }">
<a href="/member/login"><button type="button" class="btn btn-primary">로그인</button></a>
<a href="/member/join"><button type="button" class="btn btn-success">회원가입</button></a>

</c:if>

<c:if test="${login eq true }">
<a href="/member/logout"><button type="button" class="btn btn-danger">로그아웃</button></a>

</c:if>
</body>
</html>