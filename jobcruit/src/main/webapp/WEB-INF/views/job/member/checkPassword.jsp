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

					<!-- 비밀번호 확인 -->
					<div id="modMember">
						<h3>비밀번호 확인</h3><br>
						<form action="/job/member/modMember" method="post">
						  <label>비밀번호</label>
							<input type="password" placeholder="비밀번호" class="form-control" name="password" value="1234"><br>
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