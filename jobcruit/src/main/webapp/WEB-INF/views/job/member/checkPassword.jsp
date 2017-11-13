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

					<!-- 비밀번호 확인 -->
					<div id="checkPassword">
						<h3>비밀번호 확인</h3><br>
<!-- 						<form action="/job/member/editInfo" method="post" id="checkPassForm"> -->
						<form>
						  <label>비밀번호</label>
							<input type="password" placeholder="비밀번호" class="form-control" name="password" id="password" required>
							<input type="hidden" name="mno" value='${login}'>
							<br>
							<div id="result">
							</div>
							<br>
							<button class="btn btn-lg btn-primary btn-block" type="button" id="checkPassBtn">확인</button>
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


			<script>
				$(document).ready(function(){
					var $checkPassForm = $("#checkPassForm");
					var $checkPassBtn = $("#checkPassBtn");
					var login = ${login};
					var $password = $("#password");
					var $result = $("#result");
					
					
					$checkPassBtn.click(function(e){
						e.preventDefault();
						$.ajax({
							url:"/job/member/checkPassword",
							data: {"mno": '${login}', "password": $password.val()},
							type: "post",
							dataType: "text"
						}).done(function(data){
							console.log(data == 0? "비밀번호를 확인" : "확인됐음");
							if(data == 0) {
								$result.html("<p>비밀번호를 다시 확인하세요.</p>");
							}
							else {
								location.href = "/job/member/editInfo";
							}
						});
						
					});
				}); 
			</script>
			
			
</body>
</html>