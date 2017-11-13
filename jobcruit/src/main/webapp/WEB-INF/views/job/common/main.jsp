<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/headerRes.jsp" %> 
	</head>
	<body class="menu-affix">
		<div class="bg-dark dk" id="wrap">
			<%@include file="../common/top.jsp" %> 
			<div id="content">
            	<div class="outer">
            		<div class="inner bg-light lter">
            		
            		
            		
            		
            		<h3>최근 채용 정보</h3>
            			<!-- Container (Portfolio Section) -->
<div class="container-fluid text-center bg-grey">
  <div class="row text-center">
   <c:forEach items='${list}' var='recruit'>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src='/job/common/display?name=${recruit.cid}.png' alt="Paris" width="400" height="200">
        <a href='/job/recruit/detail?rno=${recruit.rno}'><strong><h3>${recruit.title}</h3></strong></a><br>
        <p>자격요건-${recruit.eligibility}</p>
        <p>우대사항-${recruit.prefer}</p>
      </div>
    </div>
    </c:forEach>

  </div>
</div>
            		
            		
            		
            		
            		
            		
            		
            		</div>
           		</div>
        	</div>
		</div>
        <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
		
		<!--jQuery -->
		<script src="/resources/assets/lib/jquery/jquery.js"></script>
		
		<!-- sweetalert2 -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.min.js"></script> -->
		
		<!-- url 파라미터 뺴오기 -->
<!-- 		<script src="/resources/assets/js/getParameters.js" type="text/javascript"></script> -->
		
		<script>
			$(document).ready(function(){
				
				
				if (getParameters("editPassword")) {
					swal(
							  '성공',
							  '비밀번호 수정 완료',
							  'success'
							);
				}
			});
		</script>
		
	</body>
</html>