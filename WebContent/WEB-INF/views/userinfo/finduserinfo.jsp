<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- Bootstrqp 3.3.2 밑에 3개  -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">

#findidform{
margin-top:50px;

}

#findpwform{
maigin-top:30px;

}
</style>
<script type="text/javascript">
function openIdChk(){
	
	//새창으로 띄우기
	window.name = "parentForms";
	//새창으로띄우고 url형식으로  직접 정보를입력해서 보내주기
	window.open("/find/id?inputEmail="+$("#inputEmail").val()+"&inputName="+$("#inputName").val(),
			"chkforms", "width=500, height=300, resizable = no, scrollbars = no");
	
	$("#inputEmail").val("")
	$("#inputName").val("")
}
</script>
<meta charset="UTF-8">
<title>FindUserInfo</title>
</head>
<body>
<h2>아이디 찾기</h2>

<form class="form-horizontal" id ="findidform" action="/find/id" method = "post">
 <div class="form-group" id="inputemail" >
    <label for="inputEmail" class="col-sm-2 control-label" >이메일</label>
    <div class="col-sm-3">
      <input type="email" class="form-control" id="inputEmail"  name = "inputEmail" placeholder="Email" required>
    </div>
  </div>
  <div class="form-group" id="inputname ">
    <label for="inputName" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="inputName" name = "inputName"placeholder="Name" required>
    </div><br>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-10">
      <button type="button" class="btn btn-default" name ="findidbutton" onclick="openIdChk()">아이디 찾기</button>
     
    </div>
  </div>
</form>

<br><br><br><br>
<h2>비밀번호 찾기</h2>
<form class="form-horizontal" id ="findpwform" action="/find/userinfo" method = "post">
  <div class="form-group" id="inputId" >
    <label for="inputId" class="col-sm-2 control-label" >아이디</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="inputId" name="inputid" placeholder="ID" required>
    </div>
  </div>
  <div class="form-group" id="inputname ">
    <label for="inputName" class="col-sm-2 control-label">휴대폰 번호</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="inputphnum" name="inputphnum" placeholder="휴대폰 번호" required>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-10">
      <button type="submit" class="btn btn-default" name = "findpwbutton">비밀번호 찾기</button>
     </div>
  </div>
  </form>
</body>
</html>