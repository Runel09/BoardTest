<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/js/httpRequest.js"></script>



<script type="text/javascript" 
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type ="text/css">
table, th{
	text-align:center;


}
tr td:nth-child(2){
	text-align:left;
}

tr td:not(:first-child), tr th:not(:first-child){

	border-left:3px solid white;
}



</style>


<div class ="container" style="width:84%">

<c:forEach items="${list }" var="plan">
	
  <div class="col-sm-6 col-md-3"  style=" height:278px; margin-top: 117px;">
    <div class="thumbnail" style="padding: 0px;">
      <a href="/planner/view?plannerno=${plan.PLANNER_NUM}"><img src="/image/${plan.trip_season}_1.jpg" onclick="/planner/view?plannerno=${PLANNER_NUM}" style="height:180px; width:318.63px;
    width: 318.63px;
}"></a>
      <div style="height: 95px; padding:9px; line-height: 0.8;">
        <div></div>
        <div>${plan.trip_nation }</div><br>
        <div>${plan.trip_season }</div><br>
        <div>${plan.trip_date }</div><br>
        <div>${plan.review_score }</div><br>
      </div>
    </div>
  </div>

</c:forEach>



</div>










