<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
#hotel{
width: 70%;

}


</style>
<h1 style="font-family: 'NIXGONL-Vb'; margin-top: 60px;">항공권 검색</h1>
<div style="font-family: 'NIXGONL-Vb';">
<div  class="container text-center" id="hotel" data-skyscanner-widget="FlightSearchWidget" data-locale="ko-KR" 
data-widget-scale="1.6" data-target = "_ self" ></div>
<script src="https://widgets.skyscanner.net/widget-server/js/loader.js" async></script>
</div>

<h1 style="font-family: 'NIXGONL-Vb'; margin-top: 80px;">호텔 검색</h1>
<div style="font-family: 'NIXGONL-Vb';">
<div  class="container text-center" id="hotel" data-skyscanner-widget="HotelSearchWidget" data-locale="ko-KR" 
data-widget-scale="1.7" ></div>
<script src="https://widgets.skyscanner.net/widget-server/js/loader.js" async></script>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>




