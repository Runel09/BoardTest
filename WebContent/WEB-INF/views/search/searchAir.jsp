<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>


    

<style type="text/css">
#hotel{
width: 70%;

}


</style>
<div>
<div  class="container text-center" id="hotel" data-skyscanner-widget="FlightSearchWidget" data-locale="ko-KR" 
data-widget-scale="1.6"></div>
<script src="https://widgets.skyscanner.net/widget-server/js/loader.js" async></script>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</html>
