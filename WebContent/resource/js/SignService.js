/**
 *
 */
   //전화 번호 4자리 입력시 다음칸으로 이동
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
	  //가입 정보 폼
   var frm_signup = document.frm_signup;
   	  //이메일 도메인 셀렉박스값
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
