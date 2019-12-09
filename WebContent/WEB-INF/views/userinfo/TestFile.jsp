<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
 
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>



<style type ="http://fonts.googleapis.com/css?family=Open+Sans:600"></style>
<style type = text/css>
body{
	margin:0;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:525px;
	min-height:670px;
	position:relative;
	background:url(https://raw.githubusercontent.com/khadkamhn/day-01-login-form/master/img/bg.jpg) no-repeat center;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:180%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(40,57,101,.9);
}

/* .login-htmls{ */
/* 	width:100%; */
/* 	height:150%; */
/* 	position:absolute; */
/* 	padding:90px 70px 50px 70px; */
/* 	background:rgba(40,57,101,.9); */
/* } */
.login-html .sign-in-htm,
.login-html .sign-up-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	transform:rotateY(180deg);
	backface-visibility:hidden;
	transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .groups .labels
.login-form .groups .input,
.login-form .groups .button{
	width:25%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
}

.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}
</style>
<script type ="text/javascript">
// if(!document.updateForm.onsubmit.call(document.updateForm)) {

// 	 return;

// 	}

// 	document.updateForm.submit();

//회원가입 화면의 입력값들을 검사한다.
function checkValue()	
{
	var form = document.userInfo;

	if(!form.userid.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if(form.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	if(!form.userpw.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if(form.userpw.value != form.passwordcheck.value ){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}	
	
	if(!form.usernick.value){
		alert("닉네임을 입력하세요.");
		return false;
	}
	
	if(!form.username.value){
		alert("이름을 입력하세요.");
		return false;
	}
	
	if(!form.userbirth.value){
		alert("년도를 입력하세요.");
		return false;
	}
	
	
	if(!form.userbirth.value){
		alert("날짜를 입력하세요.");
		return false;
	}
	
	if(form.userbirth.value){
		alert("날짜는 숫자만 입력가능합니다.");
		return false;
	}
	
	if(!form.usermail.value){
		alert("메일 주소를 입력하세요.");
		return false;
	}
	
	if(!form.userphnum.value){
		alert("전화번호를 입력하세요.");
		return false;
	}
	
	if(form.userphnum.value){
		alert("전화번호는 - 제외한 숫자만 입력해주세요.");
		return false;
	}
	
	if(!form.useraddr.value){
		alert("주소를 입력하세요.");
		return false;
	}
	
	if(!form.useraddrdetail.value){
		alert("자세한 주소를 입력하세요.");
		return false;
	}
	
}

// //문자 입력시 오류
// < ***이구문 입력하면 중복검사 구문이 실행이 안됨 왜그런지는모르겠음******>

// 	function checkNum(e) {
//         var keyVal = event.keyCode;
 
//         if(((keyVal >= 48) && (keyVal <= 57))){
//             return true;
//         }
//         else{
//         	alert("숫자만 입력가능합니다");
//             return false;
//         }
    


      //아이디 중복체크 화면open
        function openIdChk(){

        	
        	window.name = "parentForm";
        	window.open("/Login/chk",
        			"chkform", "width=500, height=300, resizable = no, scrollbars = no");	
        }


// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
// 다시 중복체크를 하도록 한다.
function inputIdChk(){
	document.userInfo.idDuplication.value ="idUncheck";
}
$(document).ready(function() {
	$("input[name=userbirth]").keyup(function(e) {
        var keyVal = e.keyCode;
//         console.log(keyVal)
 
        if(((keyVal >= 48) && (keyVal <= 57))){
            return true;
        }
        else{
//         	console.log("숫자 아님")
        	alert("숫자만 입력가능합니다");
            return false;
        }
	})
});
</script>
<meta charset="UTF-8">
<title>WELCOME TRAVELERS!!</title>
</head>
<body>
<div class="login-wrap">
	<div class="login-html">
	<form action="/member/login" method="post" class="form-signin">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="userid" class="label" >User Id<label>
					<input id="userid"name="userid" type="text" class="input" required>
				</div>
				<div class="group">
					<label for="userpw" class="label">Password</label>
					<input id="userpw" name="userpw" type="password" class="input" data-type="password" required>
				</div>
				
				
				<!--  -->
<!-- 				<div class="group"> -->
<!-- 					<input id="check" type="checkbox" class="check" checked> -->
<!-- 					<label for="check"><span class="icon"></span> Keep me Signed in</label> -->
<!-- 				</div> -->
				<div class="group">
					<input type="submit" class="button" value="LogIn">
				</div>
				</form>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href= "/find/userinfo">Forgot ID or Password?</a>
				</div>
			</div>
			
			
			
			<form method="post" action="/member/join" 
				name="userInfo" onsubmit="return checkValue()">
			<div class="sign-up-htm">
				<div class="group">
					<label for="userid" class="label">UserID</label>
					<input id="userid" name="userid"type="text" class="input" maxlength="50" onkeydown="inputIdChk()">
				</div>
				<div class="group">
					
					<input class="button" type="button" value="중복확인" onclick="openIdChk()">	
						<input type="hidden" name="idDuplication" value="idUncheck" >
						
				</div>
<!-- 				<input class = "input" type="button" value="중복확인" >	 -->
<!-- 						<input type="hidden" name="idDuplication" value="idUncheck"onclick="openIdChk()" > -->
<!-- 						 -->
				
				<div class="group">
					<label for="userpw" class="label">Password</label>
					<input id="userpw" name="userpw" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<label for="passwordcheck" class="label">Confirm Password</label>
					<input id="passwordcheck" name ="passwordcheck" type="password" class="input" data-type="password">
				</div>
				
				<div class="group">
					<label for="username" class="label">Name</label>
					<input id="username" name ="username" type="text" class="input" maxlength="50">
				</div>
				
				<div class="group">
					<label for="gender" class="label">Gender</label>
					<input id="gender" name ="gender" type="radio" class="input"  value="1" checked>남
					<input id="gender" name ="gender" type="radio" class="input"  value="0" checked>여					
				</div>
				
				<div class="group">
					<label for="userbirth" class="label">Birth</label>
					<input id="userbirth" name ="userbirth" type="text" class="input" style="width:160px;"maxlength="8" placeholder="년월일(8자)" >
				</div>
				<br>
				<div class="group">
					<label for="usermail" class="label">Email Address</label>
					<input id="usermail" name="usermail" type="email" class="input" maxlength="50">
				</div>
				<div class="group">
					<label for="userphnum" class="label">Phome Number</label>
					<input id="userphnum" name="userphnum" type="text" class="input" maxlength="11">
				</div>
				<div class="group">
					<label for="usermailnum" class="label">우편번호</label>
					<input id="usermailnum" name="usermailnum" type="text" class="input" size="8" name="usermailnum" onKeyPress="return checkNum(event)" >
				</div>
				<div class="group">
					<label for="useraddr" class="label">Address</label>
					<input id="useraddr" name="useraddr" type="text" class="input" >
				</div>
				<div class="group">
					<label for="useraddrdetail" class="label">Detail Address</label>
					<input id="useraddrdetail" name="useraddrdetail" type="text" class="input" >
				</div>
				<div class="group">
					<input type="submit" class="button" value="회원가입">
				</div>
			
				<div class="hr"></div>
					</form>
					
				<div class="foot-lnk">
					<label for="tab-1">이미 아이디가 있으신가요?</a>
				</div>
			</div>
		</div>
	</div>
</div>	
</body>
</html>