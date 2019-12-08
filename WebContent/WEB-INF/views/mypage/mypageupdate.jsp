<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
</script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<h1>내 정보 수정</h1>

<style type="text/css">

.myPageContainer {
   width: 95%;
}

.box {
    width: 80%;
    min-height: 600px;
    backgorund: #49494A;
    text-align: center;
    border: 1px solid #ddd;
    border-radius: 80px;
}


</style>



<div class="container box">
<form action="/mypage/update" method="post">
<label for="name">이름:</label>
<input type="text" id="name" name="name" value="${member.user_name }"/>
<br><br>
<label for="pw">변경할 비밀번호:</label>
<input type="text" id="pw" name="pw"/>
<br><br>
<label for="nick">닉네임:</label>
<input type="text" id="nick" name="nick" value="${member.user_nick }"/>
<br><br>
<label for="email">이메일:</label>
<input type="text" id="email" name="email" value="${member.user_email }"/>
<br><br>
<label for="addr">주소:</label>
<input type="text" id="addr" name="addr" value="${member.user_addr }"/>
<br><br>
<label for="addr_detail">상세주소:</label>
<input type="text" id="addr_detail" name="addr_detail" value="${member.user_addr_detail }"/>
<br><br>
<label for="phnum">전화번호:</label>
<input type="text" id="phnum" name="phnum" value="${member.user_phnum }"/>
<br><br>
<button>수정</button>
<input type="reset" />
</form>

</div>










<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>