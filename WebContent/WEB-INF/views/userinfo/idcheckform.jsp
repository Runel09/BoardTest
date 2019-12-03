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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>아이디 중복 체크</title>
	
	<style type="text/css">
		#wrap {
			width: 490px;
			text-align :center;
			margin: 0 auto 0 auto;
		}
		
		#chk{
			text-align :center;
		}
		
		#cancelBtn{
			visibility:visible;
		}
		
		#useBtn{
			 visibility:hidden;
		}

	</style>
		
	<script type="text/javascript">
	
	//경고 모달 호출 메서드
	   function warningModal(content) {
	      $(".modal-contents").text(content);
	      $("#defaultModal").modal('show');
	   }
	
		var httpRequest = null;
		
		// httpRequest 객체 생성
		function getXMLHttpRequest(){
			var httpRequest = null;
		
			if(window.ActiveXObject){
				try{
					httpRequest = new ActiveXObject("Msxml2.XMLHTTP");	
				} catch(e) {
					try{
						httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e2) { httpRequest = null; }
				}
			}
			else if(window.XMLHttpRequest){
				httpRequest = new window.XMLHttpRequest();
			}
			return httpRequest;	
		}
		
		
		// 회원가입창의 아이디 입력란의 값을 가져온다.
		function pValue(){
			document.getElementById("userId").value = opener.document.userInfo.userid.value;
		}
		
		// 아이디 중복체크
		function idCheck(){

			var id = document.getElementById("userId").value;

			if (!id) {
				warningModal("아이디를 입력하지 않았습니다.");
				return false;
			} 
			else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
				warningModal("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
				return false;
			}
			//제대로된 아이디를 입력했을때
			else
			{
			        $.ajax({
			           type:'post',
			           url: '/Login/chk', 
			           data: {id: id},
			           dataType: "json",
			           success: function(data) {
			              console.log(data.result); 
			              
			              if(data.result) {
			                 //true : 아이디가 중복
			              warningModal("중복된 아이디 입니다.");
			              document.getElementById("cancelBtn").style.visibility='visible';
		                    document.getElementById("useBtn").style.visibility='hidden';
		                    document.getElementById("msg").innerHTML ="";
			                  return false;
			              }
			              else{
			            	  warningModal("사용 가능한 아이디 입니다!");
			                  document.getElementById("cancelBtn").style.visibility='hidden';
			                    document.getElementById("useBtn").style.visibility='visible';
						  				return false;
			              }
			           }
			        });
			}
			
			
		}
		
	   
		

		
		// 사용하기 클릭 시 부모창으로 값 전달 
		function sendCheckValue(){
			// 중복체크 결과인 idCheck 값을 전달한다.
			opener.document.userInfo.idDuplication.value ="idCheck";
			// 회원가입 화면의 ID입력란에 값을 전달
			opener.document.userInfo.id.value = document.getElementById("userId").value;
			
			if (opener != null) {
            	opener.chkForm = null;
            	self.close();
			}	
		}	
	</script>
	
</head>
<body onload="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form id="checkForm">
			<input type="text" name="idinput" id="userId">
			<input type="button" value="중복확인" onclick="idCheck()">
		</form>
		<div id="msg"></div>
		<br>
		<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
	</div>
</div>	


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
                    </div>
                </div>
            </div>
       
<!--             // 경고 모달창 -->

</body>
</html>