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

<script type="text/javascript">

	
function id_overlap_check() {

    $('.username_input').change(function () {
      $('#id_check_sucess').hide();
      $('.id_overlap_button').show();
      $('.username_input').attr("check_result", "fail");
    })


    if ($('.username_input').val() == '') {
      alert('이메일을 입력해주세요.')
      return;
    }

    id_overlap_input = document.querySelector('input[name="username"]');

    $.ajax({
      url: "{% url '/WEB-INF/views/userinfo/idcheckform' %}",//클릭시 정보가 전달되는 컨트롤러
      data: {
        'username': id_overlap_input.value// 전달 파라미터
      },
      datatype: 'html',
      success: function (data) {

        if (data == 0) {
          alert("이미 존재하는 아이디 입니다.");
          id_overlap_input.focus();
          return;
        } else {
          alert("사용가능한 아이디 입니다.");
          $('.username_input').attr("check_result", "success");
          $('#id_check_sucess').show();
          $('.id_overlap_button').hide();
          return;
        }
      }
    });
  }

</script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body{
background:url("/image/joinbackground.jpg") o-repeat center center fixed ; 
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

 
  
  <input type="text" class="username_input" name="username" check_result="fail" required />
<button type="button" class="id_overlap_button" onclick="id_overlap_check()">중복검사</button><br><br>
<img id="id_check_sucess" style="display: none;">

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
						</div>	
</form>


<form class="form-inline">
  <div class="form-group">
    <label class="sr-only" for="exampleInputEmail3">Email address</label>
    <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Enter email">

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
