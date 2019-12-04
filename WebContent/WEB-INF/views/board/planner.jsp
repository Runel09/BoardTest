<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">

$(document).ready(function() {
	

//테마 선택
($("#tag_body").children().children()).on('click',function() {
   if(this==this.parentNode.firstElementChild){
      return false;
   }
   $(this.parentNode.firstElementChild).children("input").val(this.innerText)
   $(this.parentNode).children(".selected").removeClass('selected');
   $(this).addClass("selected");
   console.log($(this.parentNode.firstElementChild).children("input").val())
})
})
</script>

<script type="text/javascript">
$(document).ready(function() {

	$("#tag_body").click(function() {
		
		if(this == this.parentNode.firstElementChild) {
		      return false;
		  }
		
		$.ajax({
			type: "get"
			, url: "/board/planner"
			, data: {"traval_thema": $("#traval_thema"),
					"travel_season" : $("#travel_season"),
					"travel_date" : $("#travel_date"),
					"travel_Place" : $("#travel_Place")
			}
			, dataType: "json"
			, success: function( data ) {
				console.log("성공");
				console.log(data);
			
				$("#recommend").html(data.cnt);
		
			}
			, error: function() {
				console.log("실패");
				
			}
		});
	});
	
});
</script>


<style type="text/css">

/* 게시판board style */
table, th {
	text-align: center;
}


tr td:not(:first-child), tr th:not(:first-child) {
	border-left: 1px solid white;
}


/* 게시판tab style */
@import 'https://fonts.googleapis.com/css?family=Raleway';

div.container
{
    font-family: Raleway;
    margin: 0 auto;
	padding: 1em 7em;
	text-align: center;
}

div.container a
{
    color: #6f6565;
    text-decoration: none;
    font: 20px Raleway;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    cursor: pointer;
}

.yellow
{
    background: #f7bcbc;
    
}

/* Pull right  */
div.pullRight a:before
{
    position: absolute;
    width: 2px;
    height: 100%;
    left: 0px;
    top: 0px;
    content: '';
    background: #FFF;
    opacity: 0.3;
    transition: all 0.3s;
}

div.pullRight a:hover:before
{
    width: 100%;
}

.community {
	font-size: 48px;
	padding: 0px 793px 26px 0px;
	color: white;
}

/* 카테고리 */
.tag_body {
   width: 0px;
   margin-left: 29em;
}

.tag_body div div {
   float: left;
   width: 138px;
   text-align: center;
   font-size: 23px;
}

.tag_body div {
   float: left;
   width: 1200px;
   margin-bottom: 6px;
}
.selected{
   color: white;
   background: black;
}
</style>

<div class="container yellow pullRight"  style="margin-bottom: 45px; margin-top: 50px;">

<div class="community">
<span>커뮤니티</span>
</div>

  <a href="/board/planner" class="menutab" style="font-size:38px; color: white;">플래너</a>
  <a href="/board/free" class="menutab" style="font-size:38px; ">자유</a>
  <a href="/board/tip" class="menutab" style="font-size:38px;">여행팁</a>
  <a href="/board/question" class="menutab" style="font-size:38px;">질문</a>
</div>
<br>
<h2 style="text-align:center; margin-bottom: 70px; ">여행자들의 일정보기</h2>

<div class="tag_body" id="tag_body">
                  <div class="place">
                     <div id="place_head">
                        여행지 | <input type="hidden" id="travel_Place" value="" />
                     </div>
                     <div>국내</div>
                     <div>일본</div>
                     <div>홍콩</div>
                     <div>싱가포르</div>
                     <div>대만</div>
                     <div>태국</div>
                     <div>미국</div>
                  </div>
                  <div class="danger travel_date">
                     <div id="travel_date_head">
                        여행일 |<input type="hidden" id="travel_date" value="" />
                     </div>
                     <div>1-3일</div>
                     <div>4-6일</div>
                     <div>7-10일</div>
                     <div>11-15일</div>
                     <div>15일이상</div>
                  </div>
                  <div class="travel_season">
                     <div id="travel_season_head">
                        여행시기|<input type="hidden" name="travel_season" value="">
                     </div>
                     <div>봄</div>
                     <div>여름</div>
                     <div>가을</div>
                     <div>겨울</div>
                  </div>
                  <div class="success traval_thema">
                     <div id ="traval_thema_head">
                        여행테마|<input type="hidden" id="traval_thema" value="" />
                     </div>
                     <div>가족여행</div>
                     <div>나홀로여행</div>
                     <div>커플여행</div>
                     <div>친구와함께</div>
                     <div>비지니스여행</div>
                  </div>
               </div>
    
<br><br><br><br><br><br><br><br><br><br><br>
<div class="container">
<h1 style="float:left;">플래너 게시판</h1><br><br><br><br><br>
<div style="text-align: left;">인기 | 신규</div>

<jsp:include page="/WEB-INF/views/layout/planner_paging.jsp" />

</div> <!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />