<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
body {
background-color: #141723 ;
/* background-color: #FFF ; */
 overflow: hidden;
 text-align:center;
  display: flex;
  align-items: center;
  justify-content: center;
	
}

body,
html {
 height: 100%;
 width: 100%;
 margin: 0;
 padding: 0;
}
:root {
	--line-stroke: #0074b3;
	/* --grid-stroke: #00adef; */
	--line-stroke-width: 1.5;
	--circle-fill: #00adef;
	--circle-stroke: #0074b3;
}

svg {
	position: absolute;
 width: 100%;
 height: 100%;
 visibility: hidden;
 
}
.trailLine {
	stroke:var(--line-stroke);
	stroke-width: var(--line-stroke-width);
	fill: none;
	stroke-linecap: round;
	stroke-linejoin: round;
	stroke-dasharray: 4 10
}
.gridRect {
	stroke:var(--circle-stroke);
	
	
}
#grid {
	
	opacity: 0.085;
	
}
#glowAlpha {
	flood-color: var(--circle-stroke)
}
.plane {
	fill:#CCC;
}

</style>
<script type="text/javascript">
let select = s => document.querySelector(s),
selectAll = s =>  document.querySelectorAll(s),
	mainSVG = select('#mainSVG'),
	trailLine = select('#trailLine'),
	numPoints = 300,
	svgHeight = 600,
	height = svgHeight,
	allPlanes = gsap.utils.toArray('.plane'),
	allTrailLines = selectAll('.trailLine'),
	allTrailPoints = [],
	planeColorArray = ['#04BCE8', '#EA6360', '#4EBE92', '#A83395', '#4A52A6', '#F2CD5D'],
	planeWidth = allPlanes[0].getBBox().width,
	pivotFrame = 60

gsap.defaults({lazy:true}) 

gsap.set('svg', {
	visibility: 'visible'
})
gsap.set(allPlanes, {
	transformOrigin: '50% 100%',
	yPercent: -20
})
let p = CustomEase.create('trail', 'M0,0 C0,0 0.08957,0.04997 0.14563,0.07332 0.17361,0.08497 0.19406,0.08816 0.22447,0.09346 0.25234,0.09831 0.27245,0.10281 0.29876,0.1 0.3304,0.09662 0.3574,0.09206 0.38526,0.07627 0.46146,0.0331 0.50906,-0.01658 0.58698,-0.06332 0.61735,-0.08154 0.64322,-0.09168 0.67604,-0.09815 0.70315,-0.10349 0.72556,-0.09999 0.75503,-0.09644 0.7862,-0.09269 0.8064,-0.0881 0.83671,-0.07879 0.87049,-0.06842 0.89148,-0.06013 0.92338,-0.04473 0.95378,-0.03007 1,0 1,0 ');

const swayPlane = (_id) => {

	gsap.set(allPlanes[_id], {
		x: allTrailPoints[_id][0].x - (planeWidth/2),
		y: allTrailPoints[_id][0].y - planeWidth
	})
		gsap.to(allPlanes[_id], {
			duration: 0.1,
			rotation: ((planeInitArray[_id].x - (allTrailPoints[_id][pivotFrame].x)) * 0.72),
			ease: 'sine.inOut'
		})
}

let planeInitArray = []									 
let duration = gsap.utils.random(5, 20);
for(var j = 0; j < allPlanes.length; j++) {
	let trailLine = allTrailLines[j];
	let pointX = gsap.utils.random(250, 350);
	let pointArray = [];
	let heightMultiplier = gsap.utils.random(0.11, 0.8);
	gsap.set(allTrailLines[j], {
		stroke: planeColorArray[j]
	})
	
	for(let i = 0; i < numPoints; i++) {
		let point = trailLine.points.appendItem(mainSVG.createSVGPoint());
		pointArray.push(point)
		point.x = pointX;
		gsap.set(point, {
			y:(height * heightMultiplier) + (i * ((height ) / numPoints))
		})			
	}
allTrailPoints.push(pointArray)
	planeInitArray.push({x: pointArray[0].x, y: pointArray[0].y} );

	let tl = gsap.timeline();
	tl.to(allTrailPoints[j], {
		duration: gsap.utils.random(7, 14),
		x: '-=' + gsap.utils.random(-600, 600),
		stagger: {
			each: duration / 1000,
			repeat: -1
		},
		onUpdate: swayPlane,
		onUpdateParams:[j],
		ease: 'trail'
	}).seek(gsap.utils.random(300, 1000));
	

}

let extraTl = gsap.timeline();
extraTl.to(allTrailLines, {
	//strokeDashoffset:-(14 * 4),
	//repeat: -1,
	ease: 'none'
}).to('#grid', {
	duration: 1,
		y: '+=40',
	ease: 'none',
	repeat: -1
}, 0)

allTrailLines.forEach(function (i, c) {
	let tl = gsap.timeline();
	//console.log(i, c)
	tl.to(i, {
		strokeDashoffset:-(14 * 4),
		duration: gsap.utils.random(0.5, 0.76),
		repeat: -1,
		ease: 'none'
	})
	extraTl.add(tl, 0)
})</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<svg id="patternSVG" xmlns="http://www.w3.org/2000/svg">
	<defs>
	<pattern id="sqrs" width="20" height="20" patternUnits="userSpaceOnUse" id="pulseBg" viewBox="0 0 20 20" >
			<rect class="gridRect" x="0" y="0" width="20" height="20"  fill="none"/>		
	</pattern>
	</defs>
	<rect id="grid"  class="grid" y="-100" fill="url(#sqrs)" width="100%" height="200%" stroke="none"/>
	
	
	</svg>

<svg id="mainSVG" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600">
	<defs>


      <filter id="glow" x="-100%" y="-100%" width="250%" height="250%">
        <feGaussianBlur stdDeviation="8" result="coloredBlur" />
        <feOffset dx="0" dy="0" result="offsetblur"></feOffset>
        <feFlood id="glowAlpha" flood-color="#FFF" flood-opacity="1"></feFlood>
        <feComposite in2="offsetblur" operator="in"></feComposite>
        <feMerge>
          <feMergeNode/>          
          <feMergeNode in="SourceGraphic"></feMergeNode>
        </feMerge>
      </filter>	
</defs>
	
	<g >
		<polyline class="trailLine"/>
		<polyline class="trailLine"/>
		<polyline class="trailLine"/>
		<polyline class="trailLine"/>
		<polyline class="trailLine"/>
		<polyline class="trailLine"/>
			<path class="plane" d="M20,13.7v-1.4l-8.6-5.1V3.5c0-1-0.6-3.5-1.4-3.5S8.6,2.4,8.6,3.5v3.7L0,12.2v1.4l8.6-1.8l0.5,5l-2.5,1.9V20
    l3.5-0.8l3.5,0.8v-1.2L11,16.9l0.5-5L20,13.7z" />
			<path class="plane" d="M20,13.7v-1.4l-8.6-5.1V3.5c0-1-0.6-3.5-1.4-3.5S8.6,2.4,8.6,3.5v3.7L0,12.2v1.4l8.6-1.8l0.5,5l-2.5,1.9V20
    l3.5-0.8l3.5,0.8v-1.2L11,16.9l0.5-5L20,13.7z" />
			<path class="plane" d="M20,13.7v-1.4l-8.6-5.1V3.5c0-1-0.6-3.5-1.4-3.5S8.6,2.4,8.6,3.5v3.7L0,12.2v1.4l8.6-1.8l0.5,5l-2.5,1.9V20
    l3.5-0.8l3.5,0.8v-1.2L11,16.9l0.5-5L20,13.7z" />
			<path class="plane" d="M20,13.7v-1.4l-8.6-5.1V3.5c0-1-0.6-3.5-1.4-3.5S8.6,2.4,8.6,3.5v3.7L0,12.2v1.4l8.6-1.8l0.5,5l-2.5,1.9V20
    l3.5-0.8l3.5,0.8v-1.2L11,16.9l0.5-5L20,13.7z" />
			<path class="plane" d="M20,13.7v-1.4l-8.6-5.1V3.5c0-1-0.6-3.5-1.4-3.5S8.6,2.4,8.6,3.5v3.7L0,12.2v1.4l8.6-1.8l0.5,5l-2.5,1.9V20
    l3.5-0.8l3.5,0.8v-1.2L11,16.9l0.5-5L20,13.7z" />
			<path class="plane" d="M20,13.7v-1.4l-8.6-5.1V3.5c0-1-0.6-3.5-1.4-3.5S8.6,2.4,8.6,3.5v3.7L0,12.2v1.4l8.6-1.8l0.5,5l-2.5,1.9V20
    l3.5-0.8l3.5,0.8v-1.2L11,16.9l0.5-5L20,13.7z" />
		</g>

</svg>

<c:if test="${empty login }">
<a href="/member/login"><button type="button" class="btn btn-primary">로그인</button></a>
<a href="/member/join"><button type="button" class="btn btn-success">회원가입</button></a>

</c:if>

<c:if test="${login eq true }">
<a href="/member/logout"><button type="button" class="btn btn-danger">로그아웃</button></a>

</c:if>
</body>
</html>