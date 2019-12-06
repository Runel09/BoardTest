<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script -->
<!--    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<!-- <script type="text/javascript" -->
<!--    src="http://code.jquery.com/jquery-2.2.4.min.js"></script> -->

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

$('#testBtn').click(function(e){
   $('#testModal').modal();
});

</script>



<style type="text/css">

.myPageContainer {
   width: 95%;
}

.container1 {
   margin-left: auto;
   margin-right: auto;
   margin-top: 25px;
   width: 292px;
   height: 60px;
   border: 1px solid #ddd;
   text-align: center;
   font-size: 45px;
    border-radius: 80px;
}

.box {
   width: 80%;
   min-height: 600px;
   backgorund:#49494A;
   text-align:center;
   border: 1px solid #ddd;
   border-radius: 80px;
}

.inner_con1{
   display: inner-block;
    float: left;
    width: 45%;
    height: 531px;
    border: 1px solid #ddd;
    box-sizing: border-box;
    margin: 34px;
    padding: 16px;
    border-radius: 40px;
}

.inner_con2{
   display: inner-block;
    float: right;
    background: #FFFFFF;
    width: 39%;
    height: 531px;
    padding: 16px;
    margin: 33px;
    border: 1px solid #ddd;
    margin-bottom: 30px;
    border-radius: 40px;
}

.inner_con3{
   display: inner-block;
    float: right;
    background: #FFFFFF;
    width: 36%;
    height: 300px;
    padding: 16px;
    margin: 50px;
    border: 1px solid #ddd;
    border-radius: 40px;
    margin-top: 0;
}

.img-responsive {
    display: block;
    max-width: 40%;
    height: auto;
    margin: auto;
}

</style>

</head>
<body>
<div class="container myPageContainer">
   <div class="container text-center">
      <h1>마이페이지</h1>
   </div>
   <div class="container box">

      <div class="inner_con1" > 
 
         <ul class="list-group">
           <li class="list-group-item list-group-item-info"><p style="font-size: 25px">나의정보</p></li>
         </ul>
         <hr>
         <ul class="userinfo">
         <li>이름:${member.user_name}</li>
         <li>닉네임:${member.user_nick }</li>
         <li>이메일:${member.user_email }</li>
         <li>주소:${member.user_addr } /${member.user_addr_detail }</li>
         <li>전화번호:${member.user_phnum }</li>
         </ul>
         
         <hr>
         
         <ul class="list-group">
           <li class="list-group-item list-group-item-info"><p style="font-size: 25px"><!-- 모달을 열기 위한 버튼 -->
         <button type="button" class="btn btn-info" data-toggle="modal" data-target="#testModal">
      		   비밀번호 수정
         </button></p></li>
           <li class="list-group-item list-group-item-info"><p style="font-size: 25px"> <button type="button" class="btn btn-info">회원탈퇴</button></p></li>
         </ul>

         
         <!-- 모달 영역 -->
         <div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
         <h4 class="modal-title" id="myModalLabel">비밀번호 수정</h4>
         </div>
         
         <form id="form" runat="server">
            <input type='file' id="imgInput"/>
            <img id="image_section" src="#" alt="your image"/>
         </form>
         
         <form action="/mypage/pwmodify" method="post">
            <div class="modal-body">
            현재비밀번호<input type="password" name="password1"> <br>
            수정할비밀번호<input type="password" name="password2"> <br>
            수정할비밀번호 확인<input type="password" name="password2">
            </div>
         </form>
         <div class="modal-footer">
         <button type="button" class="btn btn-primary">확인</button>
         <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
         </div>
         </div>
         </div>
         </div>
         
         <br>
        
      </div>
      
      <div class="inner_con2">
         <!-- 내가쓴 게시물  -->
         <p style="text-align:left; font-size:25px">내가 작성한 게시글</p>
         <hr>
         <table class="table table-hover table-condenssed table-striped ">
		<tr class="board">
			<th style="width: 10%">카테고리</th>
			<th style="width: 10%">제목</th>
	
		</tr>
		
		<c:forEach var="board" items="${list }">
		
		<tr>
			<td>${board.checkboard}</td> 
			<td><a href="/board/view?boardno=${board.boardno }">${board.title}</a></td>

		</tr>
		</c:forEach>
		</table>
         
<jsp:include page="/WEB-INF/views/layout/mypage_paging.jsp" />
      </div>

      
      <div style="clear: both;"></div>
   </div>
</div> <!-- container -->
      
   
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />