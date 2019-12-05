<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/views/layout/supervisor_header.jsp"/>

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
</script>
<!--End of Tawk.to Script-->
<div style="text-align: center">
<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/memberlist'"  >회원관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/boardmanage'"  >게시판관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/place/list'" >장소정보 관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/place/insert'" >장소정보 입력</button>
<br><br>
<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/noticelist'" >공지사항 관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/insertnotice'" >공지사항 입력</button>

<button class="btn btn-lg btnMenu" onclick="location.href='/supervisor/reportlist'" >신고글 관리</button>

<button class="btn btn-lg btnMenu" onclick="location.href='https://dashboard.tawk.to/#/chat'"  >1:1 문의 채팅</button>
<Br><br>
<button class="btn btn-warning "  onclick="location.href='/supervisor/logout'" >로그아웃</button>

</div>
</body>
</html>