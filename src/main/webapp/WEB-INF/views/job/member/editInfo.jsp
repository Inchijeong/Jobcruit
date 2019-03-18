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

					<!-- 개인정보 수정 -->
					<div id="modMember">
						<h3>개인정보 수정</h3><br>
						<form action="/job/member/editInfo" method="post">
						  <label>이름</label>
							<input type="text" placeholder="이름" class="form-control"	name="mname" id="mname" required>
						  <label>비밀번호</label>
							<input type="password" placeholder="비밀번호" class="form-control" name="password" id="password" required>
						  <label>비밀번호 확인</label>
							<input type="password" placeholder="비밀번호 확인" class="form-control" name="passwordChk" id="passwordChk" required>
						  <label>휴대폰 번호</label>
							<input type="text" placeholder="휴대폰 번호" class="form-control" name="phoneNo" id="phoneNo" required><br>
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


			<script type="text/javascript">
				$(document).ready(function(){

					var $mname = $("#mname");
					var $password = $("#password");
					var $passwordChk = $("#passwordChk");
					var $phoneNo = $("#phoneNo");
					
					$.ajax({
						url: "/job/member/getName",
						type: "post",
						data: "mno=" + "${login}",
						dataType: "json"
					}).done(function(data){
						$mname.val(data.mname);
						$password.val(data.password);
						$passwordChk.val(data.password);
						$phoneNo.val(data.phoneNo);
					});
				});
			
			
			</script>
			
			
</body>
</html>