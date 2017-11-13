<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headerRes.jsp"%>
</head>
<body class="menu-affix">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<div class="bg-dark dk" id="wrap">
		<%@include file="../common/top.jsp"%>
	</div>
				<form id="fileForm" action="/job/company/upload" method="post" enctype="multipart/form-data">
				<input type="file" name="file">
				<input type="hidden" name="mno" id="mno" value="3">
				<input type="submit">
				</form>
		<div id="fileName">
		</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5977f0d595044a32c59caa2b8a88c7f8&libraries=services"></script>
	
	<script>
	$(document).ready(function() { 
		var result = '${savedName}';
			console.log("=====asdfasdf==============asdfasdf=================");
		if(result) {
			console.log("===================================="+ result);
			//opener.$("#logo").val(result);
			opener.document.getElementById("rlogo").value = result;
			opener.document.getElementById("logo").value = result;
			self.close();
		}
	});
	</script>
	<!-- /#wrap -->
	<%@include file="../common/footer.jsp"%>
	<%@include file="../common/bodyRes.jsp"%>
</body>
</html>