<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headerRes.jsp"%>
</head>
<body class="login">
				<%@include file="../common/top.jsp"%>
			<hr>
			<div class="form-signin">
				<div class="text-center">
					<img src="/resources/assets/img/logo.png" alt="Metis Logo">
				</div>
				<hr>
				<div class="tab-content">

					<!-- 비밀번호 재설정 -->
					<div id="modMember">
						<h3>비밀번호 재설정</h3><br>
						<form action="/job/member/editPassword" method="post">
<!-- 							<p class="text-muted text-center">비밀번호를 다시 설정해 주세요</p><br> -->
							<label>비밀번호</label>
							<input type="password" placeholder="비밀번호" class="form-control" name="password">
							<label>비밀번호 확인</label>
							<input type="password" placeholder="비밀번호 확인" class="form-control" name="passwordChk"><br>
							<input type="hidden" id="mno" name="mno">
							<button class="btn btn-lg btn-primary btn-block" type="submit">확인</button>
						</form>
					</div>
						
				</div>
			</div>
	
	<!-- /#wrap -->
	<%@include file="../common/footer.jsp"%>
	
			<!--jQuery -->
			<script src="/resources/assets/lib/jquery/jquery.js"></script>

			<!--Bootstrap -->
			<script src="/resources/assets/lib/bootstrap/js/bootstrap.js"></script>

			<!-- url 파라미터 뺴오기 -->
			<script src="/resources/assets/js/getParameters.js" type="text/javascript"></script>

			<script type="text/javascript">
			$(document).ready(function() {
				var mno = $("#mno");
				mno.val(getParameters("mno"));
			});
			
			</script>
			
			
</body>
</html>