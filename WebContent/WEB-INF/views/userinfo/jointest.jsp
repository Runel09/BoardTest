<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<html>
<head>
	<title>회원가입 화면</title>
<script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- Bootstrqp 3.3.2 밑에 3개  -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<style type="text/css">
/* 		table{ */
/* 			margin-left:auto;  */
/* 			margin-right:auto; */
/* 			border:3px solid skyblue; */
/* 		} */
		
/* 		td{ */
/* 			border:1px solid skyblue */
/* 		} */
		
/* 		#title{ */
/* 			background-color:skyblue */
/* 		} */


	</style>

	<script type="text/javascript">
	
		// 회원가입 화면의 입력값들을 검사한다.
		function checkValue()
		{
			var form = document.userInfo;
		
			if(!form.userid.value){
				warningModal("아이디를 입력하세요.");
				return false;
			}
			
			if(form.idDuplication.value != "idCheck"){
				warningModal("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(!form.userpw.value){
				warningModal("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(form.password.value != form.passwordcheck.value ){
				warningModal("비밀번호를 동일하게 입력하세요.");
				return false;
			}	
			
			if(!form.username.value){
				warningModal("이름을 입력하세요.");
				return false;
			}
			
			if(!form.userbirthyy.value){
				warningModal("년도를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.userbirthyy.value)){
				warningModal("년도는 숫자만 입력가능합니다.");
				return false;
			}
			
			if(form.userbirthmm.value == "00"){
				warningModal("월을 선택하세요.");
				return false;
			}
			
			if(!form.userbirthdd.value){
				warningModal("날짜를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.userbirthdd.value)){
				warningModal("날짜는 숫자만 입력가능합니다.");
				return false;
			}
			
			if(!form.usermail.value){
				warningModal("메일 주소를 입력하세요.");
				return false;
			}
			
			if(!form.phone.value){
				warningModal("전화번호를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.phone.value)){
				warningModal("전화번호는 - 제외한 숫자만 입력해주세요.");
				return false;
			}
			
			if(!form.address.value){
				warningModal("주소를 입력하세요.");
				return false;
			}
		}
		
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm() {
			location.href="/main";
		}	
		
		// 아이디 중복체크 화면open
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
		//경고 모달 호출 메서드
		   function warningModal(content) {
		      $(".modal-contents").text(content);
		      $("#defaultModal").modal('show');
		   }
		 
	</script>
	
</head>
<body>
		<br><br>
		<b><font size="6" color="gray">회원가입</font></b>
		<br><br><br>
		
		<!-- 경고 모달창 -->
            <div class="modal fade" id="defaultModal">
               <div class="modal-dialog">
                    <div class="modal-content panel-danger">
                        <div class="modal-header panel-heading">
                            <h4 class="modal-title">오류 메시지</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
       
            <!--// 경고 모달창 -->
            
             
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="/member/join" 
				name="userInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td>
						<input type="text" name="userid" maxlength="50" onkeydown="inputIdChk()">
						<input type="button" value="중복확인" onclick="openIdChk()">	
						<input type="hidden" name="idDuplication" value="idUncheck" >
					</td>
				</tr>
						
				<tr>
					<td id="title">비밀번호</td>
					<td>
						<input type="password" name="userpw" maxlength="50">
					</td>
				</tr>
				
				<tr>
					<td id="title">비밀번호 확인</td>
					<td>
						<input type="password" name="passwordcheck" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">이름</td>
					<td>
						<input type="text" name="username" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">성별</td>
					<td>
						<input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여" >여
					</td>
				</tr>
					
				<tr>
					<td id="title">생일</td>
					<td>
						<input type="text" name="userbirth" maxlength="4" placeholder="년(4자)" size="6">
						<select name="userbirthmm">
							<option value="00">월</option>
							<option value="01" >1</option>
							<option value="02" >2</option>
							<option value="03" >3</option>
							<option value="04" >4</option>
							<option value="05" >5</option>
							<option value="06" >6</option>
							<option value="07" >7</option>
							<option value="08" >8</option>
							<option value="09" >9</option>
							<option value="10" >10</option>
							<option value="11" >11</option>
							<option value="12" >12</option>
						</select>
						<input type="text" name="userbirthdd" maxlength="2" placeholder="일" size="4">
					</td>
				</tr>
					
				<tr>
					<td id="title">이메일</td>
					<td>
						<input type="text" name="usermail" maxlength="50">@
						<select name="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option></option>						
						</select>
					</td>
				</tr>
					
				<tr>
					<td id="title">휴대전화</td>
					<td>
						<input type="text" name="userphone"/>
					</td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td>
						<input type="text" size="50" name="useraddress"/>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="가입"/>  
			<input type="button" value="취소" onclick="goFirstForm()">
		</form>

</body>
</html>