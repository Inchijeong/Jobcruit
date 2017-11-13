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
					
					<!-- 비밀번호 찾기 -->
					<div id="forgot">
				  <h3>비밀번호 찾기</h3><br>					
<!-- 						<form action="/job/member/recoverPost" method="post"> -->
							<form>
							<label>이메일</label>
							<input type="email" placeholder="이메일" class="form-control" name="email" value="abc@naver.com">
							<label>이름</label>
							<input type="text" placeholder="이름" class="form-control" name="mname" value="chi">
							<label>휴대폰 번호</label>
							<input type="text" placeholder="휴대폰 번호" class="form-control" name="phoneNo" value="01022223333">
							
							<div id="result">
							</div>
							<br>
							
							<button class="btn btn-lg btn-danger btn-block" type="button" id="recoverBtn">비밀번호 찾기</button>
						</form>
					</div>
				</div>
				
				<hr>
		    <div class="text-center">
		        <ul class="list-inline">
		            <li><a class="text-muted" href="/job/member/login">로그인</a></li>
		            <li><a class="text-muted" href="/job/member/signUp">회원가입</a></li>
		        </ul>
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
			var $recoverBtn = $("#recoverBtn");
			var $result = $("#result");
			$recoverBtn.click(function() {
				$.ajax({
					data: {
						"email" : $("input[name='email']").val(),
						"mname" : $("input[name='mname']").val(),
						"phoneNo" : $("input[name='phoneNo']").val()
					},
					url: "/job/member/recoverPost",
					type: "POST",
					dataType: "text"
				}).done(function(data) {
// 					console.log(data);
					if(data == ""){
// 						console.log("일치정보");
						$result.html("<p>일치하는 회원정보가 없습니다.</p>");
					}else{
// 						console.log("일치함")
						location.href = "/job/member/editPassword?mno="+ data;
					}
				});
			});
		});
	</script>
			
</body>
</html>