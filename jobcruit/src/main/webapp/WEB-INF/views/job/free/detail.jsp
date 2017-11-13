<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/headerRes.jsp" %>
		<link rel="stylesheet" href="/resources/css/comment.css">
	</head>
	<body class="menu-affix">
		<div class="bg-dark dk" id="wrap">
			<%@include file="../common/top.jsp" %> 
			<div id="content">
      	<div class="outer">
      		<div class="inner bg-light lter">

				    <div class="detail">
		    			<div class="row">
								<div class="col-lg-12">
						    	<div class="box">
						    	
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
								    	
												<div class="col-lg-12 form-actions no-margin-bottom text-right">
													<button type="button" class="btn btn-default commentBtn"><span class="glyphicon glyphicon-chevron-down"></span>댓글</button>
													<input type="button" value="수정/삭제" class="btn btn-primary editBtn">
													<input type="button" value="취소" class="btn btn-primary closeBtn">
												</div>
								    	</div>
								    	<!-- /.boardDiv -->
								    	
								    	<div class="commentDiv hidden">
								    		<div class="commentWrite">
								    			<table class="table">
								    			<tr>
								    				<td><textarea name="content" class="form-control" rows="3"></textarea></td>
								    				<td><input type="submit" value="등록" class="btn btn-primary commRegBtn"></td>
								    			</tr>
								    			</table>
									   			<!-- <div class="col-lg-10 form-group">
												    <textarea name="content" class="form-control" rows="3"></textarea>
													</div>
					                <div class="col-lg-2 form-actions no-margin-bottom text-right">
		                      	<input type="submit" value="등록" class="btn btn-primary commRegBtn">
		                    	</div> -->
										    </div>      
										    
								    		<div class="commentList">
								    		</div>
								    	</div>
								    	<!-- /.commentDiv -->
										</div>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /#detail -->
			 
						<div class="edit hidden">
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
		<%-- 
		<form id="actionForm" action="/job/free/update" method="post">
			<input type="hidden" name="fno" value="${free.fno}">
		</form>
		 --%>
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
		
		<script>
		$(document).ready(function(){
			//getCommentList();
		});
		//===========================조회 화면==============================
		$actionForm = $("#actionForm");
		
		//조회 - 수정/삭제 버튼
		$(".editBtn").on("click", function(e){
			$(".detail").addClass("hidden");
			$(".edit").removeClass("hidden");
		});
		
		//조회 - 닫기 버튼
		$(".closeBtn").on("click", function(e){
			self.close();
		});
		
		//조회 - 댓글 버튼
		$(".commentBtn").on("click", function(e){
			var $commentDiv = $(".commentDiv");
			
			$commentDiv.toggleClass("hidden");
			
			if(!$commentDiv.hasClass("hidden")){
				getCommentList();
			}
		});
		//==========================조회 - 댓글 영역==========================
		
		var $commentList = $(".commentList");
		$(".commRegBtn").on("click", function(e){
			var $content = $(".commentWrite").find("textarea[name='content']");
			$.ajax({
				url:"/job/free/comm",
				type:"post",
				data:{
					fno:'${free.fno}',
					mno:'${login}',
					content:$content.val()
				},
				dataType:"text"
			}).done(function(result){
				showAlert("댓글이 등록되었습니다");
				getCommentList();
				$content.val("");
			});
		});
		
		$commentList.on("click", ".commSaveBtn",function(e){
			e.preventDefault();
			
			var $cno = $(this).attr("href");
			var $content = $("#cno_"+$cno).find("textarea[name='content']");
			$.ajax({
				url:"/job/free/comm/"+$cno,
				type:"put",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					content:$content.val()
				}),
				dataType:"text"
			}).done(function(result){
				showAlert("댓글이 수정되었습니다");
				getCommentList();
			});
		});
		
		$commentList.on("click",".commModiBtn",function(e){
			e.preventDefault();
			
			var $cno = $(this).attr("href");
			var $description = $("#cno_"+$cno).find(".post-description");
			$description.html('<textarea name="content" class="form-control" rows="3">'+$description.find("p").text()+'</textarea>');
			$(this).toggleClass("hidden").prev().toggleClass("hidden");
		});
		
		$commentList.on("click",".commDelBtn",function(e){
		  e.preventDefault();
		  
		  var $cno = $(this).attr("href");
		  
		  $.ajax({
			  url:"/job/free/comm/"+$cno,
			  type:"delete",
			  dataType:"text"
			}).done(function(result){
				console.log(result);			
				if(result == "success"){
					showAlert('댓글이 삭제되었습니다');
					getCommentList();
				}else if(result == "fail"){
					showAlert('댓글 삭제중 오류가 발생하였습니다','fail');
				}						
			});
		});
	
		//댓글 리스트 가져오기
		function getCommentList(){
			$.ajax({
				url:"/job/free/comm",
				data:"fno=${free.fno}",
				dataType:"json"
			}).done(function(commList){
				console.log(commList);
				if(commList){
					makeComment(commList);
				}
			});
		}
		
		//화면에 댓글 표시
		function makeComment(commList){
			var commStr = "";
			for(let i in commList){
				commStr += '<div class="panel panel-white post" id="cno_'+commList[i].freeCno+'">'+
					        '	<div class="post-heading">'+
					        '		<div class="pull-left comm-info h5">'+
					        '    	<b><span class="glyphicon glyphicon-user"></span>'+commList[i].mname+'</b>'+
					        '			<span class="text-muted time">'+getDateTime(commList[i].regDate)+'</span>'+
					       	' 	 </div>'+
					       	'		<div class="pull-right button">'+
					       	'			<a href="'+commList[i].freeCno+'" class="commSaveBtn hidden"><span>저장</span></a>'+
					       	'			<a href="'+commList[i].freeCno+'" class="commModiBtn"><span>수정</span></a>'+
					       	'			<a href="'+commList[i].freeCno+'" class="commDelBtn"><span>삭제</span></a>'+
					       	'		</div>'+
					        '	</div>'+
					        '	<div class="post-description">'+
					        '  	<p>'+commList[i].content+'</p>'+
					        '	</div>'+
						      '</div>';
			}
			$commentList.html(commStr);
		}
		
		//===========================수정/삭제 화면==========================
		//수정 - 저장 버튼
		$(".saveBtn").on("click", function(e){alert($("form textarea[name='content']").val());
			$.ajax({
				url:"/job/free/modify",
				type:"post",
				data:{
					fno:'${free.fno}',
					title:$("input[name='title']").val(),
					content:$("form textarea[name='content']").val()
				},
				dataType:"text"
			}).done(function(result){
				if(result == "success"){
					showAlert('수정되었습니다');
					setTimeout(function(){
						opener.makeURL();
						location.reload();
					},1000);
				}else if(result == "fail"){
					showAlert('수정중 오류가 발생하였습니다', 'fail');
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
						showAlert('삭제되었습니다');
						setTimeout(function(){
							opener.makeURL();
							self.close();
						},1000);
					}else if(result == "fail"){
						showAlert('삭제중 오류가 발생하였습니다', 'fail');
					}						
				});//done
			});//then
		});
		
		//수정 - 취소 버튼
		$(".cancelBtn").on("click", function(e){
			$(".detail").removeClass("hidden");
			$(".edit").addClass("hidden");
		});
		
		</script>
	</body>
</html>