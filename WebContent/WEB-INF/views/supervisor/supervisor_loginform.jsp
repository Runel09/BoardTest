<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/layout/supervisor_header.jsp"/>
<script type= "text/javascript">
$(document).ready(function(){
   //로그인 버튼 클릭 시 form submit
   $("#btnLogin").click(function() {
      $(this).parents("form").submit();
   })
   

});


</script>

<body>

<div class ="container" style="center">

<%

if(session.getAttribute("super_login")!=null&&(boolean)session.getAttribute("super_login")){
%>

	<form action="/supervisor/logout" method="get">
		<button>로그아웃</button>
	</form>
<%
}else{%>
<form action ="/supervisor/login" method="post" class="form-horizontal">
   <fieldset style='margin:-67px auto;width:300px'>
      <legend>관리자 로그인</legend><br>
         <div class="form-group">
            <input type="text" name="supervisor_id" id="supervisor_id"class="form-control" placeholder="아이디">
         </div>
         <div class="form-group">         
            <input type="password" name ="supervisor_pw" id="supervisor_pw" class="form-control" placeholder="비밀번호">
         </div>      
         <div class="form-group">
            <button type="button" id="btnLogin" class="btn btn-success" >로그인</button>
            <button type="reset" id="btnCancel" class="btn btn-danger">취소</button>
         </div>   
   </fieldset>
</form>
<%} %>	
</div>


</body>
</html>