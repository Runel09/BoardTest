<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<script type= "text/javascript">
$(document).ready(function(){
   //로그인 버튼 클릭 시 form submit
   $("#btnLogin").click(function() {
      $(this).parents("form").submit();
   })
   
   //취소 버튼 누르면 뒤로가기
   $("#btnCancel").click(function() {
      history.go(-1);
   })

});


</script>

<body>

<div class ="container" style="center">

<form action ="/supervisor/login" method="post" class="form-horizontal">
   <fieldset style='margin: 0 auto;width:300px'>
      <legend>관리자 로그인</legend><br>
         <div class="form-group">
            <input type="text" name="supervisor_id" id="supervisor_id"class="form-control" placeholder="아이디">
         </div>
         <div class="form-group">         
            <input type="text" name ="supervisor_pw" id="supervisor_pw" class="form-control" placeholder="비밀번호">
         </div>      
         <div class="form-group">
            <button type="button" id="btnLogin" class="btn btn-success" >로그인</button>
            <button type="button" id="btnCancel" class="btn btn-danger">취소</button>
         </div>   
   </fieldset>
</form>
</div>


</body>
</html>