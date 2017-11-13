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
					
					<!-- 회원가입 -->
					<div id="signup">
				  <h3>회원가입</h3><br>					
						<form action="/job/member/signUpPost" method="post">
							<label>이름</label>
							<input type="text" placeholder="이름" class="form-control"	name="mname">
							<label>이메일</label>
							<input type="email" placeholder="이메일" class="form-control" name="email"  id="email">
							<label>비밀번호</label>
							<input type="password" placeholder="비밀번호" class="form-control" name="password" >
							<label>비밀번호 확인</label>
							<input type="password" placeholder="비밀번호 확인" class="form-control" name="passwordChk">
							<label>휴대폰 번호</label>
							<input type="text" placeholder="휴대폰 번호" class="form-control" name="phoneNo">
							<div>
								<label> <input type="radio" name="category" value="0" checked="checked">
									개인회원
								</label> <label> <input type="radio" name="category" value="1">
									기업회원
								</label>
							</div>
							<br>			
				
							<div id="result">
							</div>
							<br>
							
							<button class="btn btn-lg btn-success btn-block" type="submit">회원가입</button>
						</form>
					</div>
				</div>
				
				<hr>
		    <div class="text-center">
		        <ul class="list-inline">
		            <li><a class="text-muted" href="/job/member/login">로그인</a></li>
		            <li><a class="text-muted" href="/job/member/recover">비밀번호 찾기</a></li>
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
			var $email = $("#email");
			var $result = $("#result");
			
			
			$email.blur(function(){
				$.ajax({
					url: "/job/member/checkID",
					type: "post",
					data: "email=" + $email.val()
				}).done(function(result){
					console.log(result);
					if(result == 1){
						$result.html("<span>이미 사용중이거나 탈퇴한 아이디입니다.</span>");
					}else{
						$result.html("");
					}
					
				});
			});
		});
	</script>
			
</body>
</html>