
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
      <%@ taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>
      
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

#logo {
  font-family:Audiowide;
  font-size:130px;
  color: white;
   margin:100px; 
   margin: auto; 
   margin-left: -30px; 
   margin-top: -200px; 
/*  position:absolute; */
/*     top:-5%; left:50%; */
/*     transform: translate(-50%, -50%); */
    
  -webkit-transition: all 1s ease-in-out;
  -moz-transition: all 1s ease-in-out;
  -o-transition: all 1s ease-in-out;
  -ms-transition: all 1s ease-in-out;
  transition: all 1s ease-in-out;

  text-shadow: 
  1px 1px 0 rgba(36,117,203,1),
  13px 3px 0 rgba(36,117,203,0.9),
  5px 5px 0 rgba(36,117,203,0.8),
  17px 7px 0 rgba(36,117,203,0.7),
  9px -15px 0 rgba(36,117,203,0.6),
  -11px 11px 0 rgba(36,117,203,0.5),
  7px -13px 0 rgba(36,117,203,0.4),
  15px 30px 0 rgba(36,117,203,0.3),
  -20px 17px 0 rgba(36,117,203,0.2),
  -19px 19px 0 rgba(36,117,203,0.1),
  30px -21px 0 rgba(36,117,203,0.08),
  23px 23px 0 rgba(36,117,203,0.06),
  -25px 40px 0 rgba(36,117,203,0.04),
  27px 27px 0 rgba(36,117,203,0.02),
  -29px 29px 0 rgba(36,117,203,0.0);
}

/* travelers 로고  */
 #logo:hover { */
   -webkit-transform: rotate(1deg) scale(1.02); 
   -moz-transform: rotate(1deg) scale(1.02); 
   -o-transform: rotate(1deg) scale(1.02); 
   -ms-transform: rotate(1deg) scale(1.02); 
   transform: rotate(1deg) scale(1.02); 
  
  text-shadow: 
  10px 1px 0 rgba(36,117,203,0.1),
  13px 23px 0 rgba(36,117,203,0.2),
  15px 5px 0 rgba(36,117,203,0.03),
  17px 7px 0 rgba(36,117,203,0.04),
  9px 15px 0 rgba(36,117,203,0.2),
  -11px -11px 0 rgba(36,117,203,0.06),
  17px -13px 0 rgba(36,117,203,0.07),
  15px 30px 0 rgba(36,117,203,0.1),
  -20px -17px 0 rgba(36,117,203,0.06),
  -19px 19px 0 rgba(36,117,203,0.08),
  5px 21px 0 rgba(36,117,203,0.02),
  23px -23px 0 rgba(36,117,203,0.1),
  25px 40px 0 rgba(36,117,203,0.2),
  27px 17px 0 rgba(36,117,203,0.1),
  -29px -29px 0 rgba(36,117,203,0.1);
}
.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
    margin-right: -170px;
}
.row {
    margin-top: 175px;
}

body { 
  background: url("/image/background.jpg" )no-repeat center center fixed ; 
   -webkit-background-size: cover; 
   -moz-background-size: cover; 
   -o-background-size: cover; 
  background-size: cover;
  
}
.col-md-4{
 position:absolute;
    top:50%; left:50%;
    transform: translate(-50%, -50%);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
         <div class="text-center" id="logo">TRAVELERS</div>
<!--             <h1 class="text-center login-title">T r a v e l e r s</h1> -->

            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt="">
                <form action="/member/login" method="post" class="form-signin">
                <input type="text" name="userid" class="form-control" placeholder="ID" required autofocus>
                <input type="password" name="userpw" class="form-control" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    LogIn</button>
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">기억하기
                </label>
<!--  도움말기능   <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span> -->
                
            
            <a href="/member/join" class="text-center new-account">회원가입 </a>
            </form>
            </div>
        </div>
        
    </div>
</div>

<%-- <c:if test="${login ne true }"> --%>
<!-- <form action="/member/login" method = "post"> -->
<!-- 	아이디<input type = "text" name = "userid" /><br> -->
<!-- 	비밀번호<input type = "password" name = "userpw" /><br> -->
<!-- 	<button>로그인</button> -->
	
<!-- </form> -->
<!-- <br> -->
<%-- </c:if> --%>

<%-- <c:if test="${login eq true }"><!-- 로그인상태 --> --%>
<!-- 	<a href="/member/logout"><button>로그아웃</button></a> -->
<%-- </c:if> --%>


</body>
</html>
