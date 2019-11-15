<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/Layout/header.jsp" />

<style type="text/css">
#logForm .inputform label {
	width: 60px;
}
</style>
<html lang="ko">

  <style type="text/css">
    .center1{
      align:center;
            }
    .rounded {
      width:400;
      height:1000;
      border:0;
      background-color: white;
      align:center;
      border-radius:5em;
     }
    .int {
      height: 25px; border: #1DDB16 1.5px solid;
      background-color: white; color: #8C8C8C;
      text-align: center; font-weight: 1000;
     }
    .buttonSt{
      height: 25px; font-size: 11pt;
      border: #5ADCF3 0px solid;
      background-color: #1DDB16;
      color: white; font-weight: 600;
     }
    .errorText{
      height: 20px; font-size: 11pt;
      border: #FFFFFF 0px solid;
      text-align: center;
      background-color: #FFFFFF;
      color: red; font-weight: 500;
    }
    .norText1{
      height: 20px; font-size: 11pt;
      border: #FFFFFF 0px solid;
      text-align: center;
      background-color: #FFFFFF;
      color: #000000; font-weight: 600;
    }

  </style>


   <script type="text/javascript">
   function check_phon(){
     if (document.frm_signup.phon_mid.value.length ==4) {
       document.frm_signup.phon_end.focus();
     }
   }
  ////주소창 직접 입력 방지
   function zip_alert(){
     alert("주소검색을 통해서만 입력 가능합니다.")
   }
   //이메일 콤보박스
  function email_Fun()
  {
   var frm_signup = document.frm_signup;
   var sel_eaddress = frm_signup.cb_email.value;

   if (sel_eaddress == "google.com")
   {
    frm_signup.email2.value = "gmail.com";
    frm_signup.email2.readOnly = true;
   }
   else if (sel_eaddress == "naver.com")
   {
    frm_signup.email2.value = "naver.com";
    frm_signup.email2.readOnly = true;
   }
   else if (sel_eaddress == "daum.net")
   {
    frm_signup.email2.value = "daum.net";
    frm_signup.email2.readOnly = true;
   }
   else if (sel_eaddress == "직접입력")
   {
    frm_signup.email2.value = "";
    frm_signup.email2.readOnly = false;
   }
   else
   {
    frm_signup.email2.value = "";
    frm_signup.email2.readOnly = true;
   }
 }

   function zipopen(){
     window.open('search_postNum.asp','overlap','width=400 height=200')

   }
    function checkSpace(str) {
    if (str.search(/\s/) != -1) {
        return true;
    } else {
        return false;
    }
    }

   function isValidPasswd(str) {
    var cnt = 0;
    if (str == "") {
        return false;
    }

	/* 공백 체크 */
    var retVal = checkSpace(str);
    if (retVal) {
        return false;
    }
    if (str.length < 6) {
        return false;
    }
    for (var i = 0; i < str.length; ++i) {
        if (str.charAt(0) == str.substring(i, i + 1))
            ++cnt;
    }
    if (cnt == str.length) {
        return false;
    }

    var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,16}$/;
    if (!isPW.test(str)) {
        return false;
    }

    return true;
}

    function toggleLabel(labelId, inputId, mode)
   {

    var oLabel = document.getElementById(labelId);
    var oInput = document.getElementById(inputId);


    if (mode == "in")
    {
        oLabel.className = "lbl focus";
    }
       else
      {
        if (oInput.value != "") {
            oLabel.className = "lbl focus";
        }
        else {
            oLabel.className = "lbl";
        }
      }
    }


  function checkId(event) {
    toggleLabel('idLb', 'id', 'out');

    var id = document.getElementById("id").value;
    var canId= document.getElementById("can_id");
    var oMsg = document.getElementById("idMsg");
    if (id == "") {
        oMsg.style.display = "block";
        oMsg.className = "errorText";
        oMsg.innerHTML = "필수 정보입니다.";
        canId.value="0"

        return false;
    }

    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    if (!isID.test(id)) {
        oMsg.style.display = "block";
        oMsg.style.color = "red";
        oMsg.className = "errorText";
        oMsg.innerHTML = "5~20자의 영문 소문자, 숫자만 사용 가능합니다.";
        canId.value="0"
       return false;
    }
    else {
       oMsg.style.display = "block";
       oMsg.className ="norText1";
       oMsg.innerHTML = "멋진 아이디네요!";
       oMsg.style.color = "black"
       canId.value="1"
                    }


    }


   function checkPswd1(event) {
    checkPswd2("check");


    var id = document.getElementById("id").value;
    var pw = document.getElementById("pswd1").value;
    var oMsg = document.getElementById("pswd1Msg");

    if (pw == "") {
        oMsg.style.display = "block";
        oMsg.className = "errorText";
        oMsg.innerHTML = "필수 정보입니다.";
        return false;
    }
    if (isValidPasswd(pw) != true) {
        oMsg.style.display = "block";
        oMsg.className = "errorText";
        oMsg.innerHTML = "6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        return false;
    }
     else {
        oMsg.style.display = "none";
       oMsg.className = "errorText";
       oMsg.innerHTML = "비밀번호";

                    }


    pwFlag = false;


    return true;
}

function checkPswd2(event) {
    var pswd1 = document.getElementById("pswd1").value;
    var pswd2 = document.getElementById("pswd2").value;
    var oMsg = document.getElementById("pswd2Msg");

    if (pswd2 == "") {
        oMsg.style.display = "block";
        oMsg.className = "errorText";
        oMsg.innerHTML = "필수 정보입니다.  ";
        return false;
    }
    if (pswd1 != pswd2) {
        oMsg.style.display = "block";
        oMsg.className="errorText";
        oMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
        document.getElementById("pswd2").value = "";
        return false;
    } else {
        oMsg.style.display = "none";
        oMsg.className="norText1";
        oMsg.innerHTML = "비밀번호가 일치합니다!";
        document.frm_signup.same_pw.value = "1"

        return true;
    }

    return true;
}







  //중복확인
   function check_id()
   {
    if(frm_signup.can_id.value==0)
    {
     alert("아이디를 다시 입력하세요.");
     document.frm_signup.id.focus();
    }
    else
    {
     str_id = document.frm_signup.id.value;
     window.open("check_overlap.asp?check_id=" + str_id, "overlap", 'width=300, height=150');
    }
   }

     //이름체크
     function checkName(event) {
    toggleLabel('userNameLb', 'userName', 'out');

    var nm = document.getElementById("userName").value;
    var oMsg = document.getElementById("userNameMsg");

    if (nm == "") {
        oMsg.style.display = "block";
        oMsg.className="errorText";
        oMsg.innerHTML = "필수 정보입니다.";
        return false;
    }

    var nonchar = /[^가-힣a-zA-Z0-9]/gi;
    if (nonchar.test(nm)) {
        oMsg.style.display = "block";
        oMsg.className="errorText";
        oMsg.innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        return false;
    }

    if (true) {
        oMsg.style.display = "none";
        return true;
    }

    return true;
}
  //--------------------펑션------------------------------//


     //필수입력사항 확인
   function on_signup()
   {
    var check_id = document.frm_signup.check_on.value;
    var check_pw = document.frm_signup.pswd1.value.length;
    var check_rpw = document.frm_signup.pswd2.value;
    var check_name = document.frm_signup.userName.value;
    var check_birth = document.frm_signup.birth.value;
    var check_same = document.frm_signup.same_pw.value;

    var check_cnt = 0
    //아이디 중복체크여부
    if (check_id == 1)
    {
     check_cnt = check_cnt + 1;
    }
    else
    {
     alert("중복확인을 해주세요.");
     document.frm_signup.txt_id.focus();
     return;
    }
    //비밀번호가 8자리 이상이면서 동일한지 여부
    if (check_pw > 7)
    {
     if (check_same == 1)
     {
      check_cnt = check_cnt + 1;
     }
     else
     {
      alert("비밀번호가 일치하지 않습니다.");
      document.frm_signup.pswd2.focus();
      return;
     }
    }
    else
    {
     alert("비밀번호를 8자리 이상 입력해주세요.");
     document.frm_signup.pswd1.focus();
     return;
    }
    //이름이 입력되있는지 여부
    if (check_name != "")
    {
     check_cnt = check_cnt + 1;
    }
    else
    {
     alert("이름을 입력해주세요.");
     document.frm_signup.userName.focus();
     return;
    }

    if (check_birth=="")
    {
    alert("생년월일을 선택해주세요");    }
    else
    {
     check_cnt = check_cnt + 1;
    }

    if (check_cnt == 4)
    {
     frm_signup.submit();
    }
   }

</script>


   <title> 회원가입 </title>
<div class="container">

  <H1 style="color:#47C83E">회원가입</H1>

 <form name="frm_signup" method="post" action="/member/join" class="rounded">

     <table style="border:0;">
     <tr>
      <td align="right">
      <label id="idLb" for="id">*아이디</label>
      </td>
      <td>
      <input type="text" id="id" name="id" maxlength="20" autocomplete="off" onfocus="toggleLabel('idLb','id','in');" onblur="toggleLabel('idLb','id','out'); checkId('first')" placeholder="아이디" class="int">
      <input type=button name="button_check" value="중복확인" class="buttonSt" onclick="check_id();">
      <input type=hidden name="check_on" value="0">
      <input type=hidden id="can_id" name="can_id" value="0">
      </td>
      </tr>
    <tr>
     <td colspan="3">
     <div id="idMsg" class="error" style="display: none; color:red">필수 정보입니다.</div>
     </td>
    </tr>

    <tr>
    <td align="right">
      <label id="pswd1Lb" for="pswd1">*비밀번호</label>
       </td>
       <td>
      <input type="password" id="pswd1" name="pswd1" maxlength="20" onfocus="toggleLabel('pswd1Lb','pswd1','in');" onblur="toggleLabel('pswd1Lb','pswd1','out');checkPswd1('check')"  onkeyup="checkShiftUp(event);" onkeypress="checkCapslock(event)" onkeydown="checkShiftDownJoin(event);" placeholder="비밀번호" class="int">
      <button type="button"  style="visibility:hidden" title="delete" class="wrg">삭제  </button>
      <input type=hidden name="same_pw" value="0">

       </td>
       </tr>

      <tr>
     <td colspan="3">
      <div id="pswd1Msg" class="error" style="display: none; color:red">필수 정보입니다.</div>
         </td>
       </tr>

    <tr>
       <td align="right"><label id="pswd2Lb" for="pswd2" >*비밀번호 확인</label></td>
       <td>
     <input type="password" id="pswd2" name="pswd2" maxlength="20" onfocus="toggleLabel('pswd2Lb','pswd2','in');" onblur="toggleLabel('pswd2Lb','pswd2','out');checkPswd2('check')" onkeyup="checkShiftUp(event);" onkeypress="checkCapslock2(event)" onkeydown="checkShiftDown(event);" placeholder="비밀번호 재확인" class="int">
       <button type="button"  style="visibility:hidden" title="delete" class="wrg">삭제   </button>
       </td>
      </tr>
       <tr>
       <td colspan="3">
       <label id="pswd2Msg" class="error" style="display: none; color:red">필수 정보입니다.</label>
         </td>
       </tr>

       <tr>
          <td align="right"><label id="userNameLb" for="userName" >*이름</label></td>
       <td>
     <input type="text" id="userName" name="userName" maxlength="6" onfocus="toggleLabel('userNameLb','userName','in');" onblur="toggleLabel('userNameLb','userName','out');checkName('check')" onkeyup="checkShiftUp(event);" onkeypress="checkCapslock2(event)" onkeydown="checkShiftDown(event);" placeholder="이름" class="int">
       <button type="button"  style="visibility:hidden" title="delete" class="errorText">삭제   </button>
       </td>
      </tr>
       <tr>
       <td colspan="3">
       <label id="userNameMsg" class="error" style="display: none; color:red">필수 정보입니다.</label>
         </td>

       </tr>
       <tr>
       <td align="right">*성별 </td> <td ><input type=radio id=sex name=sex value="남성" ><b style="color:blue">남자</b> <input type=radio id=sex name=sex value="여성"><b style="color:red">여자 </b>
       </tr>

       <tr>
     <td align="right">*생년월일</td>
     <td colspan=2>
	    <input name=birth class=int type="text" placeholder="YYYYMMDD">
     </td>
    </tr>
       <tr>
   <td align="right">핸드폰 번호</td>
   <td><select name="phon_fir" class="int">
       <option value=010>010</option>
       <option value=016>016</option>
       <option value=017>017</option>
       <option value=019>019</option>
       </select>
       - <input type=text maxlength=4 size = 3 name="phon_mid" class="int" onkeyup="check_phon();"> - <input type=text maxlength=4 size = 3 name="phon_end" class="int">
   </td>
  </tr>
<tr>
   <td align="right">우편 번호</td>
   <td>
       <input type=text size=4 name="mail_front" class="int" readOnly = "readonly" onclick="zip_alert();">-
       <input type=text size=4 name="mail_end" class="int" onclick="zip_alert();" readOnly ="readonly" >

   <input type=button name="adress_load" value="검색" class="buttonSt" onclick="zipopen();">
   </td>
  </tr>

  <tr>
   <td align="right">기본 주소</td>
   <td><input type=text name="adress1" class="int" readonly="readonly" onclick="zip_alert();"></td>
  </tr>

  <tr>
   <td align="right">상세 주소</td>
   <td><input type=text name="adress2" class="int"></td>
  </tr>


  <tr>
   <td align="right"> Email </td>
   <td colspan="2">
    <input type=text size=9 name="email1" class="int" >@
    <input type=text size=7 name="email2" class="int" >&nbsp;
   <select name="cb_email" onchange="email_Fun();" class="int">
   <option value="직접입력"> 직접입력 </option>
   <option value="naver.com"> 네이버 </option>
   <option value="daum.net"> 다음 </option>
   <option value="google.com"> 구글 </option>
   </select>
   </td>
  </tr>





  </table>

  
  <br>
  <input type="button" value="가입신청" onclick="on_signup();" style="width:200;height:45; background-color:#47C83E;font-weight: 1000; font-size:15pt; color:#CEFBC9">

  </form>
</div>


<jsp:include page="/WEB-INF/views/Layout/footer.jsp" />