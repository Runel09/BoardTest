<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
 
<!DOCTYPE html>
<html>
<head>

<!--  jquery 2.2.4  -->
<script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrqp 3.3.2 밑에 3개  -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

//경고 모달 호출 메서드
function warningModal(content) {
   $(".modal-contents").text(content);
   $("#defaultModal").modal('show');
}

function test(){
	warningModal("gkdld");
	
}

// $(document).ready(function(){
// 	$('#myModal').modal({
// 		  keyboard: false
// 	})
	
// });
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
       
            <!--// 경고 모달창 -->
            
            <button id = "button" onclick="test()">하이여</button>
</body>
</html>