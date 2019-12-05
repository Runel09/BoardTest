<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- <h2>정보</h2> -->
<!-- <hr> -->
<!-- <table> -->
<!-- 	<tr> -->
<%-- 		<td>${board.boardno}</td> --%>
<%-- 		<td>${board.title }</td> --%>
<%-- 		<td>${board.id}</td> --%>
<%-- 		<td>${board.content }</td> --%>
<%-- 		<td>${board.hit }</td> --%>
<%-- 		<td>${board.writtendate }</td> --%>
<!-- 	</tr>	 -->

<!-- </table> -->
<!-- 	<button onclick="location.href='/board/list';">목록 </button> -->
<!-- 	<button onclick="location.href='/board/update';">수정 </button> -->
<!-- </body> -->
<!-- </html> -->





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />



<script type="text/javascript">
$(document).ready(function() {
// 	$("#btnCommInsert").click(function(){
// 	    if(!'${login}'){
	    	
// 	    	warningModal("로그인이 필요합니다")
	    	
// 	    }
// 	   })

	$("#btnList").click(function() {
    $(location).attr("href", "/place/list");
   		});


	// 댓글 입력
	$("#btnCommInsert").click(function() {
		 if(!'${login}'){
			 
		    	
		    	warningModal("로그인이 필요합니다")
		    	
		    	
		    }	
		
		
		
// 	${viewplace.place_number }
// 	//		console.log($("#commentWriter").val());
	
	else if('${login}'){
		console.log($("#commentContent").val());
	
		

		$form = $("<form>").attr({
			action: "/place/comment",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"place_number",
				value:"${viewplace.place_number }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"user_number",
				value:"${sessionScope.user_number }"
			})
		).append(
			$("<textarea>")
				.attr("name", "review_char")
				.css("display", "none")
				.text($("#commentContent").val())
		).append(
			$("<input>")
				.attr("name", "testInput")
				.css("display", "none")
				.attr("value", $("#writeReviewForm").find("[name='testInput']:checked").val() ));
		
		$(document.body).append($form);
		
		$form.submit();
	}	
	});
	

	
});

//댓글 삭제
function deleteComment(review_number) {
	$.ajax({
		type: "post"
		, url: "/place/commentdelete"
		, dataType: "json"
		, data: {
			"review_number": review_number
		}
		, success: function(data){
			if(data.success) {
				$("[data-review_number='"+review_number+"']").remove();
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}


function warningModal(content) {
    $(".modal-contents").text(content);
    $("#defaultModal").modal('show');
 }




</script>
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
                           <form action ="/member/login" method="get">
                           <button type = "submit" class="btn btn-primary">로그인</button>
                           </form>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
       
            <!--// 경고 모달창 -->








<h1 class="name">게시판 - 장소정보 상세보기</h1>

<!-- <div id = "sliderbox" class= "tokyo"> -->
<!-- 	<ul id= "slider"> -->
<%-- 	<li><img style = "height:350px;"  src="/image/${viewplace.place_number}_1.jpg"></li> --%>
<%-- 	<li><img style = "height:350px;"  src="/image/${viewplace.place_number}_2.jpg"></li> --%>
<!-- 	</ul> -->
<%-- <%-- <img src="/image/${viewplace.place_number}_2.PNG"> --%> 
<!-- </div> -->



<div id="carousel-example-generic" class="carousel slide container" data-ride="carousel" style= "width:750px; text-align:center;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox"  >
    <div class="item active"  >
      <img style = "height:400px;"  src="/image/${viewplace.place_number}_1.jpg">
     
    </div>
    <div class="item" >
      <img style = "height:400px;"  src="/image/${viewplace.place_number}_2.jpg">
<%--       <img style = "height:350px;"  src="/image/${viewplace.place_number}_2.jpg"> --%>
      
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  
</div>






<table class="table table-bordered">
<tr>
<td class="info">장소정보</td><td colspan="3">${viewplace.place_number }</td>
<td class="info">장소이름</td><td colspan="3">${viewplace.place_name }</td>
</tr>

<tr>
<td class="info">좌표lat</td><td colspan="3">${viewplace.coordinate_lat }</td>
<td class="info">좌표lng</td><td colspan="3">${viewplace.coordinate_lng }</td>
</tr>

<tr>
<td class="info">주소</td><td colspan="3">${viewplace.address }</td>
<td class="info">카테고리</td><td colspan="3">${viewplace.place_cate }</td>
</tr>

<tr>
<td class="info">디테일</td><td colspan="3">${viewplace.detail }</td>
<td class="info">웹사이트주소</td><td colspan="3">${viewplace.db_web_site }</td>
</tr>

<tr>
<td class="info">영업시간</td><td colspan="3">${viewplace.business_hours }</td>
<td class="info">전화번호</td><td colspan="3">${viewplace.tel_number }</td>
</tr>



<!-- <tr> -->
<%-- <td class="info">장소정보</td><td colspan="3">${viewplace.place_information }</td> --%>
<!-- </tr> -->







<tr>
<td class="info"  >장소정보내용</td><td colspan="3">${viewplace.place_information }</td>
<td class="info"  >점수</td><td colspan="3">${viewplace.review_score }</td>

</tr>



<c:if test="${viewplace.place_number eq viewfile.place_number}">
<tr><td class="info"  colspan="7">첨부파일</td></tr>
<tr><td colspan="4">${viewfile.originname }</td></tr>
</c:if>

</table>
<!-- 관리자 로그인 됐을  때만 수정,삭제 버튼 보이게 -->
<div class="text-right">

<c:if test="${super_id eq 'supervisor' }">
<button  type="button" class="btn btn-warning" onclick="location.href='/supervisor/placeupdate?place_number=${viewplace.place_number}'">수정</button>

<button type="button" class="btn btn-danger">삭제</button>

</c:if>
</div>


<!-- 댓글 처리 -->
<div>




<!-- 로그인상태 -->
<%-- <c:if test="${login }"> --%>
<!-- 댓글 입력 -->
<%-- </c:if> --%>

<!-- 비로그인상태 -->
<%-- <c:if test="${not login }"> --%>
<!-- <div class= "text-right"> -->
<!-- <strong>댓글 작성시 로그인이 필요합니다</strong><br> -->
<!-- <button onclick='location.href="/member/login";'>로그인</button> -->
<!-- <button onclick='location.href="/member/join";'>회원가입</button> -->
<!-- </div> -->
<%-- </c:if> --%>




 
<!-- 댓글 리스트 -->
<div class="continer" style="text-align: -webkit-center;">
<!-- <div style="align: center;"> -->
<table class="table table-striped table-hover table-condensed " style= "width:1000px; ">
<thead>
<tr>
<!-- 	<th style="width: 10%;"></th> -->
	<th style="width: 10%;">유저번호</th>
	<th style="width: 10%;">장소번호</th>
	<th style="width: 60%;">댓글</th>
	<th style="width: 10%;"></th>

</tr>
</thead>
<tbody id="commentBody">
<c:forEach items="${commentList }" var="comment">
<tr data-review_number="${comment.review_number }">
<!-- 	<td></td> -->
	<td class="info">${comment.user_number }</td>
	<td class="warning">${comment.place_number }</td>
	<td>${comment.review_char }</td>
	
	

	<td>
		<c:if test="${sessionScope.user_userNum eq comment.user_number }">
		<button class="btn btn-default btn-xs"
			onclick="deleteComment(${comment.review_number });">삭제</button>
		</c:if>
	</td>
	
</tr>

</c:forEach>
</tbody>
</table>	<!-- 댓글 리스트 end -->
<!-- </div> -->
</div>


<!-- <form action="/place/comment" method="post" > -->
<div id="writeReviewForm" class="form-inline text-center">
<%-- 	<input type="text" size="10" class="form-control" id="commentWriter" value="${usernick }" readonly="readonly"/> --%>
<!-- 	<form  action ="/place/comment" method="post"> -->
	
	
	3점<input type="radio" name="testInput" value="3" />
	2점<input type="radio" name="testInput" value="2" />
	1점<input type="radio" name="testInput" value="1" />
	
	<textarea rows="1" cols="50" class="form-control" id="commentContent" name="review_char"></textarea>
	<button id="btnCommInsert" class="btn" type = "button">입력</button>
	
<!-- 	</form> -->
</div>	<!-- 댓글 입력 end -->
<!-- </form> -->


<div class="text-center">   
   <button id="btnList" class="btn btn-primary" onclick='href=""'>목록</button>
</div>

</div>	<!-- 댓글 처리 end -->








<!------------------------------------------------------------->

<!-- </div>.container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

