<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5de76b36d96992700fcaa8ab/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();


//마우스 스크롤링

jQuery(document).ready(function($){
	   
	   $('a.scroll-link').click(function(e){
	      e.preventDefault();
	      $id = $(this).attr('href');
	      $('body,html').animate({
	         scrollTop: $($id).offset().top -20
	      }, 750);
	   });
	   
	});
</script>
<!--End of Tawk.to Script-->
<style type="text/css">
/*
마우스 스크롤링
*/
@import url('https://fonts.googleapis.com/css?family=Playfair+Display:700|Source+Sans+Pro');

$mouse-width: 2.5rem;

*,
*::before,
*::after {
   box-sizing: border-box;
}

body {
   -webkit-font-smoothing: antialiased;
   -moz-osx-font-smoothing: grayscale;
   font-family: 'Source Sans Pro', sans-serif;
   font-size: 16px;
   line-height: 1.618;
}

h1,
h2 {
   font-family: 'Playfair Display', serif;
   line-height: 1.2;
   margin-bottom: 1rem;
   letter-spacing: 1px;
}

h1 {
   font-size: 3rem;
   max-width: 35rem;
   text-align: center;
}

h2 {
   font-size: 2.5rem;
}

.hero {
   position: relative;
   min-height: 8vh;
   display: flex;
   align-items: center;
   justify-content: center;
   padding: 3rem 2rem;
   color: white;
   background: {
      image: linear-gradient(to bottom,  rgba(69,72,77,1) 0%,rgba(0,0,0,1) 100%), url('https://source.unsplash.com/random/1920x1080/?sky');
      blend-mode: multiply;
      size: cover;
   }
}

.mouse {
   max-width: $mouse-width;
   width: 15%;
   height: auto;
}

.scroll {
   animation-name: scroll;
   animation-duration: 1.5s;
   animation-timing-function: cubic-bezier(0.650, -0.550, 0.250, 1.500);
   animation-iteration-count: infinite;
   transform-origin: 50% 20.5px;
   will-change: transform, opacity;
   opacity: 1;
}

.scroll-link {
   position: absolute;
   bottom: 1rem;
   left: 50%;
   transform: translateX(-50%);
}

@keyframes scroll {

   0%, 20% {
      transform: translateY(0) scaleY(1);
   }

   100% {
      transform: translateY(36px) scaleY(2);
      opacity: 0;
   }

}

.content {
   min-height: 100vh;
   max-width: 28rem;
   margin: 0 auto;
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   text-align: center; 
}



div#sliderbox{

	width: 1000px;
	height: 650px;
	border: 1px solid #ccc;
	
	/*overflow: hidden; /* div영역을 벗어난 부분을 안 보이게 처리 */
	overflow: hidden;
	margin: 0 auto;/* div영역을 중앙으로 정렬(외부 정렬) */

}

ul#slider{

	/* ul태그의 기본 스타일 없애기 */
	padding: 0;/* 내부여백 삭제 */
	margin: 0; /* 외부여백 삭제 */
	list-style: none; /* 리스트스타일 없음 */
	
	position: relative;
}

ul#slider li{
	position: absolute;
}

ul#slider li img{
	width: 1000px;
	height: 650px;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){	
	
	//모든 이미지 리스트
	var $slider_list=$("ul#slider li");
	
	//모든 이미지를 "left:600px"로 보내기(숨기기)
	$slider_list.css("left","1000px");//("left",("div#sliderbox").css("width"));
	
	
	//---------------------------
	//첫번째 이미지를 div안쪽으로 보내기
	//첫 이미지 보여주기
	
	$slider_list.eq(0).css("left",0);
  //$("ul#slider li:first-child").css("left",0);
  
  //---------------------------------
  //클릭이 될 때마다 이미지 한 장씩 교체하기 - image slide
  
  var curSlide =0; //현재 슬라이드(이미지) 인덱스
  	//2초마다 이미지 바꾸기
	setInterval(function(){
		 //console.log("clicked");
		 
		 //다음에 보여질 이미지의 인덱스
		 var nextSlide=curSlide+1;
		 nextSlide %=$slider_list.length;//보정
		 
		 //보여져아 할 이미지를 오른쪽으로 보내주기
		 $slider_list.eq(nextSlide).css("left","1000px");
		 
		 //현재 이미지 숨기기: curSlide
		 $slider_list.eq(curSlide).animate({"left":"-=1000px"});
		 
		 //다음 이미지 보여주기: nextSlide
		 $slider_list.eq(nextSlide).animate({"left":"-=1000px"});
		 
		 //순환구조 만들기
		 curSlide++;
		 curSlide %=$slider_list.length;//보정
	  },3000);
});
</script>
</head>
<body>

<div id="sliderbox">
	<ul id="slider">
		<li><img src="/image/lisheng-chang-m9BBVrPl87M-unsplash.jpg"/></li>
		<li><img src="/image/alex-knight-wfwUpfVqrKU-unsplash.jpg"/></li>
		<li><img src="/image/sebastian-pena-lambarri-7i5HMCGupVw-unsplash.jpg"/></li>
		<li><img src="/image/sebastien-jermer-n7DY58YFg9E-unsplash.jpg"/></li>
		<li><img src="/image/sutirta-budiman-kjOBqwMUnWw-unsplash.jpg"/></li>
		<li><img src="/image/clay-banks-hwLAI5lRhdM-unsplash.jpg"/></li>
		</ul>
</div>

<!-- 마우스 스크롤링 -->
<div class="hero">
   

   
   <a class="scroll-link" href="#content" style="text-decoration:none;">
      <svg class="mouse" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76 130" preserveAspectRatio="xMidYMid meet">
      <g fill="none" fill-rule="evenodd">
         <rect width="70" height="118" x="1.5" y="1.5" stroke="#282c37" stroke-width="3" rx="36"/>
         <circle class="scroll" cx="36.5" cy="31.5" r="4.5" fill="#FFF"/>
      </g>
   </svg>
   <span style="margin: -34px; font-size: 32px; font-family: fantasy;">↓</span>
   </a>
   
</div>

<div id="content" class="content">
   
   
   <jsp:include page="/WEB-INF/views/search/searchAir.jsp"/>
   <jsp:include page="/WEB-INF/views/search/searchHotel.jsp"/>
</div>
   <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>


   

