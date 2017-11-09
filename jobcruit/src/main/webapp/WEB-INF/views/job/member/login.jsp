<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				
					<!-- 로그인 -->
					<div id="login">
			  	<h3>로그인</h3><br>				
						<form action="/job/member/loginPost" method="post" id="loginForm">
						  <label>이메일</label>
							<input type="email" placeholder="이메일" class="form-control" name="email" id="email" value="abc@naver.com">
						  <label>비밀번호</label>
						  <input type="password" placeholder="비밀번호" class="form-control" name="password" id="password" value="1234">
							<div class="checkbox">
							<label>
							<input type="checkbox" name="rememberId">
							아이디 저장
						  </label>
							<label>
							<input type="checkbox" name="rememberMe">
							로그인 유지
						  </label>
							</div><br>
							
							<div id="result">
								<h1><c:out value="${msg}"/> </h1>
							</div>
							<br>
							
							<button class="btn btn-lg btn-primary btn-block" id="loginBtn" type="button">로그인</button>
						</form>
					</div>
				</div>
				
					<hr>
			    <div class="text-center">
			        <ul class="list-inline">
			            <li><a class="text-muted" href="/job/member/recover">비밀번호 찾기</a></li>
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
			
			var $loginBtn = $("#loginBtn");
			var $result = $("#result");
			var $loginForm = $("#loginForm");
			
			$loginBtn.on("click", function(e){
				e.preventDefault();
				$.ajax({
					url: "/job/member/loginCheck",
					data: {
						"email": $("#email").val(),
						"password": $("#password").val()
					},
					dataType: "text",
					type: "post"
				}).done(function(data){
					if(data){
						$loginForm.submit();
					} else {
						$result.html("<p>아이디 또는 비밀번호를 다시 확인하세요.</p>")
					}
				});
			});
			
		});
	</script>		
</body>
</html>