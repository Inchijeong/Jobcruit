<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
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
						<form action="/job/member/loginPost" method="post">
						  <label>이메일</label>
							<input type="email" placeholder="이메일" class="form-control" name="email" value="abc@naver.com">
						  <label>비밀번호</label>
						  <input type="password" placeholder="비밀번호" class="form-control" name="password" value="1234">
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
							<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
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
	
			
</body>
</html>