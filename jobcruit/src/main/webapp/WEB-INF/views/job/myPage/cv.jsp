<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/headerRes.jsp" %> 
		
		<style>
			#wrap{
				margin-bottom: 0;
			}
			.inner{
 				min-height: 800px; 
			}
			#content{
 				margin-bottom: 30px; 
			}
			.li-border{
				border: 1px skyblue solid;
				margin-left: -1px; 
				
			}
		</style>
	</head>
	<body class="menu-affix">
		<div class="bg-dark dk" id="wrap">
			<%@include file="../common/top.jsp" %> 
			<%@include file="../common/siderbar.jsp" %> 
                    <div id="content">
                    <div class="outer">
                      <div class="inner bg-light lter">
                      
												<div class="row">
												  <div class="col-lg-12">
												  	<div class="box">
								            <header class="dark">
								                <div class="icons"><i class="fa fa-cloud-upload"></i></div>
								                <h5>File Upload</h5>
								            </header>
												  	<div class="body">
													    <div class="form-group">
													        <label class="control-label col-lg-4">Bootstrap Style</label>
													        <div class="col-lg-8">
													            <div class="fileinput fileinput-new" data-provides="fileinput">
													              <div class="input-group">
													                <div class="form-control uneditable-input span3" data-trigger="fileinput">
													                    <i class="glyphicon glyphicon-file fileinput-exists">
													                    </i>
													                    <span class="fileinput-filename">
													                    </span>
													                </div>
													            <span class="input-group-addon btn btn-default btn-file">
													                <span class="fileinput-new">Select file</span>
													                <span class="fileinput-exists">Change</span>
													                <input type="file" name="...">
													            </span>
													            <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove
													            </a>
													              </div>
													            </div>
																	</div>
															</div>
														</div>	
												  </div>
												  <!-- /.col-lg-12 -->
												</div>
												<!-- /.row -->
												
                      </div>
                    </div>
                    </div>
        <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
		</div>
		
		<!--jQuery -->
		<script src="/resources/assets/lib/jquery/jquery.js"></script>
		
		<!-- sweetalert2 -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.min.js"></script> -->
		
		<!-- url 파라미터 뺴오기 -->
<!-- 		<script src="/resources/assets/js/getParameters.js" type="text/javascript"></script> -->
				
	</body>
</html>