<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/headerRes.jsp" %>
		<link rel="stylesheet" href="/resources/css/attach.css">
	</head>
	<body class="menu-affix">
		<div class="bg-dark dk" id="wrap">
			<%@include file="../common/top.jsp" %> 
			<div id="content">
      	<div class="outer">
      		<div class="inner bg-light lter">
      		
      			<div class="row">
							<div class="col-lg-12">
						    <div class="box dark">
						    	<header>
				           <div class="icons"><i class="glyphicon glyphicon-edit"></i></div>
				           <h5>자유게시판 작성</h5>
				        	</header>
						    
					        <div class="body">
					        
				            <form id="regForm" class="form-horizontal"  method="post">
				            	<input type="hidden" name="mno" value="${login}">
			                <div class="form-group">
		                    <label class="control-label col-lg-2">제목</label>
		                    <div class="col-lg-10">
		                      <input type="text" name="title" placeholder="제목을 입력하세요" class="form-control">
		                    </div>
			                </div>
			                <!-- /.form-group -->
				
			                <div class="form-group">
		                    <label class="control-label col-lg-2">내용</label>
		                    <div class="col-lg-10">
		                      <textarea name="content" placeholder="내용을 입력하세요" class="form-control" rows="15"></textarea>
		                    </div>
			                </div>
			                <!-- /.form-group -->
				            </form>
				            
				            <!-- 첨부 -->
				            <form id="attachForm" class="form-horizontal" method="post" action="/job/upload/free" enctype="multipart/form-data" target="zero">
											<div class="form-group">
					            	<label class="control-label col-lg-2">파일 첨부</label>
					            	<div class="col-lg-9">
													<input type="file" name="mf" class="form-control">
												</div>
												<div class="form-actions no-margin-bottom col-lg-1">
													<input type="submit" value="upload" class="btn btn-default">
	                    	</div>
											</div>
										</form>
										<ul class="uploadList"></ul>
										
	                  <div class="form-actions no-margin-bottom text-right">
	                  	<input type="button" value="등록" class="btn btn-primary regBtn">
	                  </div>
										<!-- /첨부 -->
										
					        </div>
						    </div>
						  </div>
						</div>
						<!--END TEXT INPUT FIELD-->
      		</div>
     		</div>
    	</div>
		</div>
    <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
		<script>
		function showAttach(data){
			var uploadList = $(".uploadList");
			var before = uploadList.html();
			before += "<li><div>"+data.uploadName.split("_")[1]+"<span class='glyphicon glyphicon-remove' data-src='"+data.uploadName+"'></span></div></li>";
			uploadList.html(before);
		}
		
		$(".uploadList").on("click", "span", function(e){
			e.stopPropagation();
			
			var ele = $(this);
			var fileName = $(this).data("src");
			
			$.get("/job/upload/delFile/free?name="+encodeURIComponent(fileName), function(result){
				if(result == 'success')	ele.closest("li").remove();
			});
		});
		
		$(".regBtn").on("click", function(){
			var $regForm = $("#regForm");
			if($("input[name='title']").val().trim() == ""){
				alert("제목을 입력하세요");
				$("input[name='title']").focus();
				return false;
			}
			
			if($("textarea[name='content']").val().trim() == ""){
				$("textarea[name='content']").focus();
				alert("내용을 입력하세요");
				return false;
			}
			
			var $fileList = $(".uploadList > li").find("span");
			var attStr = "";
			
			$fileList.each(function(i){
					attStr += '<input type="hidden" name="files" value="'+$(this).data("src")+'">';
			});
			
			$regForm.append(attStr).submit();
		});
		</script>
		<iframe name="zero" class="zero"></iframe>
	</body>
</html>