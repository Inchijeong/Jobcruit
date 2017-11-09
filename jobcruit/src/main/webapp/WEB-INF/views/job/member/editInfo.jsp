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
							<input type="text" placeholder="이름" class="form-control"	name="mname" value="chi">
						  <label>이메일</label>
							<input type="email" placeholder="이메일" class="form-control" name="email" value="abc@naver.com">
						  <label>비밀번호</label>
							<input type="password" placeholder="비밀번호" class="form-control" name="password" value="1234">
						  <label>비밀번호 확인</label>
							<input type="password" placeholder="비밀번호 확인" class="form-control" name="passwordChk" value="1234">
						  <label>휴대폰 번호</label>
							<input type="text" placeholder="휴대폰 번호" class="form-control" name="phoneNo" value="01022223333"><br>
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
				
			
			
			</script>
			
			
</body>
</html>