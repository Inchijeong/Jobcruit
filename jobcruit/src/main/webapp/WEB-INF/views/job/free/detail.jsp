<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/headerRes.jsp" %>
	</head>
	<body class="menu-affix">
		<div class="bg-dark dk" id="wrap">
			<%@include file="../common/top.jsp" %> 
			<div id="content">
      	<div class="outer">
      		<div class="inner bg-light lter">

				    <section id="detail">
		    			<div class="row">
								<div class="col-lg-12">
						    	<div class="box">
						    		<%-- 
						    		<header>
								  	  <div class="icons"><i class="glyphicon glyphicon-asterisk"></i></div>
								      <h5>${free.title}</h5>
								    </header>
								    --%>
								    <div class="body">
								    	<div class="boardDiv">
								    		<h2>${free.title}</h2>
								    		<div>
								    			<span class="glyphicon glyphicon-user mr5"></span>
								    			<c:out value="${free.mname}" />
								    		</div>
								    		<div>
								    			<span>
								    				<span class="glyphicon glyphicon-calendar mr5"></span>
								    				<fmt:formatDate value="${free.regDate}" pattern="yyyy-MM-dd hh:mm:ss" />
								    			</span>
								    			<span class="splitbar">|</span>
								    			<span>
								    				<span class="glyphicon glyphicon-eye-open mr5"></span>
								    				<c:out value="${free.readCount}" />
								    			</span>
								    		</div>
								    		<div>
								    			<pre><c:out value="${free.content}" /></pre>
								    		</div>
								    	
												<div class="form-actions no-margin-bottom">
													<span>
													<input type="button" value="수정/삭제" class="btn btn-primary editBtn">
													<input type="button" value="취소" class="btn btn-primary closeBtn">
													</span>
												</div>
								    	</div>
								    	<!-- /.boardDiv -->
								    	
								    	<div class="commentDiv">
								    	
								    	</div>
								    	<!-- /.commentDiv -->
										</div>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</section>
						<!-- /#detail -->
								
						<div id="edit">
							<div class="row">
								<div class="col-lg-12">
						    	<div class="box">
										<header>
								  	  <div class="icons"><i class="glyphicon glyphicon-edit"></i></div>
								      <h5>자유게시판 수정/삭제</h5>
								    </header>
								    
								    <div class="body">
											<form class="form-horizontal" action="/job/free/modify" method="post">
						           	<input type="hidden" name="fno" value="${free.fno}">
						              <div class="form-group">
						                 <label class="control-label col-lg-4">제목</label>
						                 <div class="col-lg-8">
						                   <input type="text" name="title" placeholder="제목을 입력하세요" class="form-control" value='<c:out value="${free.title}" />'>
						                 </div>
						              </div>
						              <!-- /.form-group -->
						
						              <div class="form-group">
						                 <label class="control-label col-lg-4">내용</label>
						                 <div class="col-lg-8">
						                   <textarea name="content" class="form-control" rows="15"><c:out value="${free.content}" /></textarea>
						                 </div>
						              </div>
						              <!-- /.form-group -->
						              <div class="form-actions no-margin-bottom text-right">
						              	<input type="button" value="저장" class="btn btn-primary saveBtn">
						                <input type="button" value="삭제" class="btn btn-primary delBtn">
						                <input type="button" value="취소" class="btn btn-primary cancelBtn">
						              </div>
								    	</form>
							    	</div>
							    	
							    </div>
								</div>
							</div>
						</div>
						<!-- /#edit -->		
						
					</div>
				</div>
			</div>
		</div>
		
		<form id="actionForm" action="/job/free/update" method="post">
			<input type="hidden" name="fno" value="${free.fno}">
		</form>
		
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
		
		<script>
		$(document).ready(function(){
			$actionForm = $("#actionForm");
			$("#edit").hide();
			
			//조회 - 수정/삭제 버튼
			$(".editBtn").on("click", function(e){
				$("#detail").hide();
				$("#edit").show();
			});
			
			//조회 - 닫기 버튼
			$(".closeBtn").on("click", function(e){
				self.close();
			});
			
			$(".saveBtn").on("click", function(e){
				$.ajax({
					url:"/job/free/modify",
					type:"post",
					data:{
						fno:'${free.fno}',
						title:$("input[name='title']").val(),
						content:$("textarea[name='content']").val()
					},
					dataType:"text"
				}).done(function(result){
					if(result == "success"){
						swal({
							  title:'수정되었습니다',
							  type:'success',
							  showConfirmButton: false,
							  timer: 1000
						});
						setTimeout(function(){
							opener.makeURL();
							location.reload();
						},1000);
					}else if(result == "fail"){
						swal({
							  title:'수정중 오류가 발생하였습니다',
							  type:'fail',
							  showConfirmButton: false,
							  timer: 1000
						});
					}						
				});//done
			});
			
			//수정 - 삭제 버튼
			$(".delBtn").on("click", function(e){
				swal({
				  title: '해당 게시물을 삭제하시겠습니까?',
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '예',
					cancelButtonText: '아니오'
				}).then(function () {
					$.ajax({
						url:"/job/free/remove",
						type:"post",
						data:"fno=${free.fno}",
						dataType:"text"
					}).done(function(result){
						if(result == "success"){
							swal({
								  title:'삭제되었습니다',
								  type:'success',
								  showConfirmButton: false,
								  timer: 1000
							});
							setTimeout(function(){
								opener.makeURL();
								self.close();
							},1000);
						}else if(result == "fail"){
							swal({
								  title:'삭제중 오류가 발생하였습니다',
								  type:'fail',
								  showConfirmButton: false,
								  timer: 1000
							});
						}						
					});//done
				});//then
			});
			
			//수정 - 취소 버튼
			$(".cancelBtn").on("click", function(e){
				$("#detail").show();
				$("#edit").hide();
			});
		});
		</script>
	</body>
</html>