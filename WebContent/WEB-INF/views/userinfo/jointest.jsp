<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<html>
<head>
	<title>ȸ������ ȭ��</title>
<script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- Bootstrqp 3.3.2 �ؿ� 3��  -->
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
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
	
		// ȸ������ ȭ���� �Է°����� �˻��Ѵ�.
		function checkValue()
		{
			var form = document.userInfo;
		
			if(!form.userid.value){
				warningModal("���̵� �Է��ϼ���.");
				return false;
			}
			
			if(form.idDuplication.value != "idCheck"){
				warningModal("���̵� �ߺ�üũ�� ���ּ���.");
				return false;
			}
			
			if(!form.userpw.value){
				warningModal("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			
			// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
			if(form.password.value != form.passwordcheck.value ){
				warningModal("��й�ȣ�� �����ϰ� �Է��ϼ���.");
				return false;
			}	
			
			if(!form.username.value){
				warningModal("�̸��� �Է��ϼ���.");
				return false;
			}
			
			if(!form.userbirthyy.value){
				warningModal("�⵵�� �Է��ϼ���.");
				return false;
			}
			
			if(isNaN(form.userbirthyy.value)){
				warningModal("�⵵�� ���ڸ� �Է°����մϴ�.");
				return false;
			}
			
			if(form.userbirthmm.value == "00"){
				warningModal("���� �����ϼ���.");
				return false;
			}
			
			if(!form.userbirthdd.value){
				warningModal("��¥�� �Է��ϼ���.");
				return false;
			}
			
			if(isNaN(form.userbirthdd.value)){
				warningModal("��¥�� ���ڸ� �Է°����մϴ�.");
				return false;
			}
			
			if(!form.usermail.value){
				warningModal("���� �ּҸ� �Է��ϼ���.");
				return false;
			}
			
			if(!form.phone.value){
				warningModal("��ȭ��ȣ�� �Է��ϼ���.");
				return false;
			}
			
			if(isNaN(form.phone.value)){
				warningModal("��ȭ��ȣ�� - ������ ���ڸ� �Է����ּ���.");
				return false;
			}
			
			if(!form.address.value){
				warningModal("�ּҸ� �Է��ϼ���.");
				return false;
			}
		}
		
		// ��� ��ư Ŭ���� ùȭ������ �̵�
		function goFirstForm() {
			location.href="/main";
		}	
		
		// ���̵� �ߺ�üũ ȭ��open
		function openIdChk(){
		
			
			window.name = "parentForm";
			window.open("/Login/chk",
					"chkform", "width=500, height=300, resizable = no, scrollbars = no");	
		}

		// ���̵� �Է�â�� �� �Է½� hidden�� idUncheck�� �����Ѵ�.
		// �̷��� �ϴ� ������ �ߺ�üũ �� �ٽ� ���̵� â�� ���ο� ���̵� �Է����� ��
		// �ٽ� �ߺ�üũ�� �ϵ��� �Ѵ�.
		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUncheck";
		}
		//��� ��� ȣ�� �޼���
		   function warningModal(content) {
		      $(".modal-contents").text(content);
		      $("#defaultModal").modal('show');
		   }
		 
	</script>
	
</head>
<body>
		<br><br>
		<b><font size="6" color="gray">ȸ������</font></b>
		<br><br><br>
		
		<!-- ��� ���â -->
            <div class="modal fade" id="defaultModal">
               <div class="modal-dialog">
                    <div class="modal-content panel-danger">
                        <div class="modal-header panel-heading">
                            <h4 class="modal-title">���� �޽���</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-primary" data-dismiss="modal">Ȯ��</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
       
            <!--// ��� ���â -->
            
             
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
		<!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
		<form method="post" action="/member/join" 
				name="userInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td>
						<input type="text" name="userid" maxlength="50" onkeydown="inputIdChk()">
						<input type="button" value="�ߺ�Ȯ��" onclick="openIdChk()">	
						<input type="hidden" name="idDuplication" value="idUncheck" >
					</td>
				</tr>
						
				<tr>
					<td id="title">��й�ȣ</td>
					<td>
						<input type="password" name="userpw" maxlength="50">
					</td>
				</tr>
				
				<tr>
					<td id="title">��й�ȣ Ȯ��</td>
					<td>
						<input type="password" name="passwordcheck" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">�̸�</td>
					<td>
						<input type="text" name="username" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">����</td>
					<td>
						<input type="radio" name="gender" value="��" checked>��
						<input type="radio" name="gender" value="��" >��
					</td>
				</tr>
					
				<tr>
					<td id="title">����</td>
					<td>
						<input type="text" name="userbirth" maxlength="4" placeholder="��(4��)" size="6">
						<select name="userbirthmm">
							<option value="00">��</option>
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
						<input type="text" name="userbirthdd" maxlength="2" placeholder="��" size="4">
					</td>
				</tr>
					
				<tr>
					<td id="title">�̸���</td>
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
					<td id="title">�޴���ȭ</td>
					<td>
						<input type="text" name="userphone"/>
					</td>
				</tr>
				<tr>
					<td id="title">�ּ�</td>
					<td>
						<input type="text" size="50" name="useraddress"/>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="����"/>  
			<input type="button" value="���" onclick="goFirstForm()">
		</form>

</body>
</html>