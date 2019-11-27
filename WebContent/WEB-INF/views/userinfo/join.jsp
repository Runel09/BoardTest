<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body{
background:url("/페이지배경1.jpg") o-repeat center center fixed ; 
   -webkit-background-size: cover; 
   -moz-background-size: cover; 
   -o-background-size: cover; 
  background-size: cover;
}

#userid {
	width: 120px;
}

#nick {
	width: 120px;
}
</style>

</head>
<body>

<h1>회원 가입</h1>

<hr>

<form action="/member/join" method="post">
<table>
<tr>
   <td><label for="username">이름 : </label></td>
   <td><input type="text" name="username" id="username" required="required"/></td>
   
</tr>
<tr>
   <td><label for="userid">아이디 : </label></td>
   <td><input type="text" name="userid" id="userid" required="required" /></td>
</tr>
<tr>   

   <td><label for="usernick">닉네임 : </label></td>
   <td><input type="text" name="usernick" id="usernick" required="required" /></td>
     
</tr>
<tr>
   <td><label for="userpw">비밀번호 : </label> </td>
   <td><input type="password" name="userpw" id="userpw" required="required" /></td>
</tr>
<tr>  
   <td><label for="checkuserpw">비밀번호 확인 : </label></td>
   <td><input type="password" name="checkuserpw" id="checkuserpw" required="required" /></td>
</tr>

<tr>      
   <td><label for="userbirth">생년월일 : </label></td>
   <td><input type="date" name="userbirth" id="userbirth" required="required" /></td>
</tr>
<tr>      
   <td><label for="usergender">성별 : </label></td>
   <td><input type="radio" name="usergenderm" id="usergenderm" value="남" required="required" />남<br></td>
   <td><input type="radio" name="usergenderw" id="usergenderw" value="여" required="required" />여<br></td>

</tr>

<tr>   
   <td><label for="useraddr">주소 : </label></td>
   <td><input type="text" name="useraddr" id="useraddr" required="required" /></td>
</tr>
<tr>   
   <td><label for="email">이메일 : </label></td>
   <td><input type="email" name="useremail" id="useremail" required="required" /></td>
</tr>
<tr>
	<td><label for="userphnum">전화번호 : </label></td>
   <td><input type="number" name="userphnum" id="userphnum" required="required" /></td>
</tr>
  <tr>
   <td><br><button>회원 가입</button></td>
   </tr>
  </table> 
  <div class="form-group">
							<label for="phone1" class="col-md-4">
								<i class="fa fa-phone"></i>
								<span class="labeltext">휴대폰 번호</span>
							</label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<select class="form-control" name="phone1" id="phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<label class="col-md-1 text-center" for="phone2"><span class="labeltext">-</span></label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="phone2" id="phone2" class="form-control">
							</div>
							<label class="col-md-1 text-center" for="phone3"><span class="labeltext">-</span></label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="phone3" id="phone3" class="form-control">
							</div>
						</div>				
						<div class="form-group">
							<label for="m_addr1" class="col-md-4">
								<i class="fa fa-map-marker"></i>
								<span class="labeltext">주소</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="m_addr1" id="m_addr1" class="form-control" placeholder="주소"
								required="" data-parsley-error-message="정확한 주소를 입력하세요." data-parsley-errors-container="div[id='m_addr_error']">
							</div>
						</div>		
						<div class="form-group">
							<label for="m_addr2" class="col-md-4">
								<i class="fa fa-map-marker"></i>
								<span class="labeltext">상세주소</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="m_addr2" id="m_addr2" class="form-control" placeholder="상세주소"
								required="" data-parsley-error-message="정확한 상세주소를 입력하세요." data-parsley-errors-container="div[id='m_addr_error']">
							</div>
							<div id="m_addr_error" style="color:red;"></div>
						</div>	<div class="form-group">
							<label for="phone1" class="col-md-4">
								<i class="fa fa-phone"></i>
								<span class="labeltext">휴대폰 번호</span>
							</label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<select class="form-control" name="phone1" id="phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<label class="col-md-1 text-center" for="phone2"><span class="labeltext">-</span></label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="phone2" id="phone2" class="form-control">
							</div>
							<label class="col-md-1 text-center" for="phone3"><span class="labeltext">-</span></label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="phone3" id="phone3" class="form-control">
							</div>
						</div>				
						<div class="form-group">
							<label for="m_addr1" class="col-md-4">
								<i class="fa fa-map-marker"></i>
								<span class="labeltext">주소</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="m_addr1" id="m_addr1" class="form-control" placeholder="주소"
								required="" data-parsley-error-message="정확한 주소를 입력하세요." data-parsley-errors-container="div[id='m_addr_error']">
							</div>
						</div>		
						<div class="form-group">
							<label for="m_addr2" class="col-md-4">
								<i class="fa fa-map-marker"></i>
								<span class="labeltext">상세주소</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="m_addr2" id="m_addr2" class="form-control" placeholder="상세주소"
								required="" data-parsley-error-message="정확한 상세주소를 입력하세요." data-parsley-errors-container="div[id='m_addr_error']">
							</div>
							<div id="m_addr_error" style="color:red;"></div>
						</div>	
</form>


<form class="form-inline">
  <div class="form-group">
    <label class="sr-only" for="exampleInputEmail3">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label class="sr-only" for="exampleInputPassword3">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password">
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> 기억하기
    </label>
  </div>
  <button type="submit" class="btn btn-default">Sign in</button>
</form>

</body>
</html>
