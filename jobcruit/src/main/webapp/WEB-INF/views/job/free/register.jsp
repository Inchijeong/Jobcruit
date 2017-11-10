<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/headerRes.jsp" %>
		<!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css"> -->
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
					        
				            <form class="form-horizontal"  method="post">
				            	<input type="hidden" name="mno" value="1">
			                <div class="form-group">
		                    <label class="control-label col-lg-4">제목</label>
		                    <div class="col-lg-8">
		                      <input type="text" name="title" placeholder="제목을 입력하세요" class="form-control">
		                    </div>
			                </div>
			                <!-- /.form-group -->
				
			                <div class="form-group">
		                    <label class="control-label col-lg-4">내용</label>
		                    <div class="col-lg-8">
		                      <textarea name="content" class="form-control" rows="15"></textarea>
		                    </div>
			                </div>
			                <!-- /.form-group -->
<!-- 
											<div class="form-group">
                        <label class="control-label col-lg-4">첨부</label>
                        <div class="col-lg-8">
                        	<div class="fileinput fileinput-new" data-provides="fileinput">
										      	<div class="input-group">
															<div class="form-control uneditable-input span3" data-trigger="fileinput">
																<i class="glyphicon glyphicon-file fileinput-exists"></i> 
																<span class="fileinput-filename"></span>
															</div>
															<span class="input-group-addon btn btn-default btn-file">
																<span class="fileinput-new">Select file</span>
																<span class="fileinput-exists">Change</span>
																<input type="file" name="...">
															</span>
															<a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
										      	</div>
										    	</div>
							          </div>
                    	</div>
-->
                    	<div class="form-actions no-margin-bottom text-right">
                        <input type="submit" value="등록" class="btn btn-primary">
                    	</div>
				            </form>
				            
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
	</body>
</html>