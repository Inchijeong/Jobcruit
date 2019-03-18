<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
							    			<ul class="uploadList">
							    				<c:forEach items="${attach}" var="att">
							    				
							    				<li><div><span data-src="${att.fileName}">${fn:substringAfter(att.fileName, "_")}</span></div></li>
							    				</c:forEach>
							    			</ul>
								    	
								    		<form id="oper"></form>
								    		
												<div class="col-lg-12 form-actions no-margin-bottom text-right">
													<button type="button" class="btn btn-default commentBtn"><span></span>댓글</button>
													<c:if test="${free.mno eq login}">
														<input type="button" value="수정/삭제" class="btn btn-primary editBtn">
													</c:if>
													<input type="button" value="닫기" class="btn btn-primary closeBtn">
												</div>
								    	</div>
								    	<!-- /.boardDiv -->
								    	
								    	<div class="commentDiv hidden">
								    		<div class="commentWrite">
								    			<table class="table">
								    			<tr>
								    				<td class="col-lg-11"><textarea name="content" class="form-control" rows="3"></textarea></td>
								    				<td class="col-lg-1"><input type="submit" value="등록" class="btn btn-primary commRegBtn"></td>
								    			</tr>
								    			</table>
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
						                 <label class="control-label col-lg-2">제목</label>
						                 <div class="col-lg-10">
						                   <input type="text" name="title" placeholder="제목을 입력하세요" class="form-control" value='<c:out value="${free.title}" />'>
						                 </div>
						              </div>
						              <!-- /.form-group -->
						
						              <div class="form-group">
						                 <label class="control-label col-lg-2">내용</label>
						                 <div class="col-lg-10">
						                   <textarea name="content" placeholder="내용을 입력하세요" class="form-control" rows="15"><c:out value="${free.content}" /></textarea>
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
		
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
		
		<script>
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
		
		$(".uploadList").on("click", "span", function(e){
			e.stopPropagation();	//안전한 코딩을 위한...
			
			var fileName = $(this).data("src");
			var $oper = $("#oper");
			$oper.attr("action","/job/upload/download/free");
			$oper.html("<input type='hidden' name='name' value='"+fileName+"'>");
			$oper.submit();
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
					content:$content.val().replace(/\r\n|\n|\r/g, '<br />')
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
					content:$content.val().replace(/\r\n|\n|\r/g, '<br />')
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
		  showConfirm("해당 댓글을 삭제하시겠습니까?", function($cno){
			  $.ajax({
				  url:"/job/free/comm/"+$cno,
				  type:"delete",
				  dataType:"text"
				}).done(function(result){
					if(result == "success"){
						showAlert('댓글이 삭제되었습니다');
						getCommentList();
					}else if(result == "fail"){
						showAlert('댓글 삭제중 오류가 발생하였습니다','error');
					}						
				});
		  }, $cno);		  
		});
		
		//댓글 리스트 가져오기
		function getCommentList(){
			$.ajax({
				url:"/job/free/comm",
				data:"fno=${free.fno}",
				dataType:"json"
			}).done(function(commList){
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
					       	'		<div class="pull-right button'+(commList[i].mno == '${login}'?'':' hidden')+'">'+
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
		$(".saveBtn").on("click", function(e){
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
					showAlert('수정중 오류가 발생하였습니다', 'error');
				}						
			});//done
		});
		
		//수정 - 삭제 버튼
		$(".delBtn").on("click", function(e){
			showConfirm('해당 게시물을 삭제하시겠습니까?', function () {
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
						showAlert('삭제중 오류가 발생하였습니다', 'error');
					}						
				});//done
			});	
		});
		
		//수정 - 취소 버튼
		$(".cancelBtn").on("click", function(e){
			$(".detail").removeClass("hidden");
			$(".edit").addClass("hidden");
		});
		
		</script>
	</body>
</html>