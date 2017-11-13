<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headerRes.jsp"%>
</head>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<body class="menu-affix">
	<div class="bg-dark dk" id="wrap">
		<%@include file="../common/top.jsp"%>
	</div>
	
	
	<div class="col-lg-12">
		<div class="box">
			<header>
				<div class="icons">
					<i class="glyphicon glyphicon-list"></i>
				</div>
				<h5>기업 관리</h5>
			</header>
			<select id="listSize" name="listSize">
						<option value="10" ${criteria.size==10?"selected":""}>10건씩 보기</option>
						<option value="20" ${criteria.size==20?"selected":""}>20건씩 보기</option>
						<option value="50" ${criteria.size==50?"selected":""}>50건씩 보기</option>
					</select>
			<div id="collapse4" class="body">
				<table id="dataTable"
					class="table table-bordered table-condensed table-hover table-striped">
					<thead>
						<tr id="header">
							<th>기업 번호</th>
							<th>기업명</th>
							<th>업종</th>
							<th>사원수</th>
							<th>설립 연도</th>
							<th>기업 형태</th>
							<th>주소</th>
							<th>홈페이지</th>
							<th>로고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="company">
						<c:set var="info" value="${company.company_info}"/>
						<c:set var="c_info" value="${fn:split(info, '/')}" />
							<tr>
								<td><c:out value="${company.cid}"></c:out></td>
								<td><a href="${company.cid}" class="target"><c:out value="${company.cname}"></c:out></a></td>
								<td><c:out value="${c_info[0]}"></c:out></td>
								<td><c:out value="${c_info[1]}"></c:out></td>
								<td><c:out value="${c_info[2]}"></c:out></td>
								<td><c:out value="${c_info[3]}"></c:out></td>
								<td><c:out value="${company.address}"></c:out></td>
								<td><c:out value="${company.homepage}"></c:out></td>
								<td><c:out value="${company.logo}"></c:out></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<button type="button" class="btn btn-default regBtn" id="regBtn">기업 등록하기</button>
				
				<div class="well">
					<nav aria-label="Page navigation example">
						<ul class="pagination mypage">
							
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<form id="actionForm" action="/job/company/listAll" method="get">
		<input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="cid">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	<script src="/resources/assets/js/pagination.js"></script>
	<script> 
    $(document).ready(function() { 
    	  
    	var actionForm = $("#actionForm");
    	var result = '${result}';
    	var size = '${criteria.size}';
    	var pageResult = makePage({page:${criteria.page}, total:${total}, size:${criteria.size}});
    	
    
    	$("#regBtn").click(function(event) {
    		actionForm.attr("action", "/job/company/register");	
    		actionForm.attr("method", "get");
    		actionForm.submit();
    	});
    	
    	$("#listSize").change(function(event) {
    		var size = $("#listSize option:selected").val();
    		actionForm.find("input[name='size']").val(size);
    		actionForm.submit();
    	});
    	$(".target").on("click", function(event) {
    		event.preventDefault();
    		
    		var cid = $(this).attr("href");
    		actionForm.find("input[name='cid']").val(cid); 
    		actionForm.attr("action", "/job/company/detail").submit();
    	});
    	
    	$(".mypage").on("click", "li > a", function(event) {
    		event.preventDefault();
    		var pageNum = $(this).attr("href");
    		
    		actionForm.find("input[name='page']").val(pageNum);
    		actionForm.submit();
    	});
    	
    	var str = "";
    	
    	if(pageResult.prev) {
    		str+= "<li class='page-item'><a class='page-link' href="+(parseInt(pageResult.first) -1)+">Prev</a></li>";
    	}
    	for(var start = pageResult.first; start <= pageResult.last; start++) {
    		str+= "<li class='page-item "+(pageResult.page == start?"active":"")+"'><a class='page-link' href="+start+">"+start+"</a></li>";
    	}
    	if(pageResult.next) {
    		str+= "<li class='page-item'><a class='page-link' href="+(parseInt(pageResult.last)+1)+">Next</a></li>";
    	}
    	

    	$(".mypage").html(str); 
    	
    	
    	if(result === 'success') {
    		alert("success!!!!!!!");
    	}
    	
    });
    </script>

	<!-- /#wrap -->
	<%@include file="../common/footer.jsp"%>
	<%@include file="../common/bodyRes.jsp"%>
</body>
</html>