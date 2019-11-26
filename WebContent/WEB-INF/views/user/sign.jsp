<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#logForm .inputform label {
	width: 60px;
}
</style>
<script type="text/javascript" src="/resource/js/SignService.js">
<!--

//-->
</script>
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


 

   <title> 회원가입 </title>
<div class="container">

  <H1 style="color:#47C83E">회원가입</H1>

 <form name="frm_signup" method="post" action="/user/sign" class="rounded">

     <table style="border:0;">
     <tr>
      <td align="right">
      <label id="idLb" for="id">*아이디</label>
      </td>
      <td>
      <input type="text" id="id" name="id" maxlength="20" autocomplete="off" onfocus="toggleLabel('idLb','id','in');" onblur="toggleLabel('idLb','id','out'); checkId('first')" placeholder="아이디" class="int">
      <input type=button name="button_check" value="중복확인" class="buttonSt" onclick="check_id();">
      <input type=hidden name="check_on" value="1">
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
          <td align="right"><label id="userNickLb" for="userNick" >*닉네임</label></td>
       <td>
     <input type="text" id="userNick" name="userNick" maxlength="6" onfocus="toggleLabel('userNickLb','userNick','in');" onblur="toggleLabel('userNickLb','userNick','out');checkName('check')" onkeyup="checkShiftUp(event);" onkeypress="checkCapslock2(event)" onkeydown="checkShiftDown(event);" placeholder="닉네임" class="int">
       <button type="button"  style="visibility:hidden" title="delete" class="errorText">삭제   </button>
       </td>
      </tr>
       <tr>
       <td colspan="3">
       <label id="userNickMsg" class="error" style="display: none; color:red">필수 정보입니다.</label>
         </td>
       </tr>
       
       
       <tr>
       <td align="right">*성별 </td> <td ><input type=radio id=sex name=sex value="1" ><b style="color:blue">남자</b> <input type=radio id=sex name=sex value="2"><b style="color:red">여자 </b>
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


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />