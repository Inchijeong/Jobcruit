<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
					        <div id="div-1" class="body">
					        
				            <form class="form-horizontal"  method="post">
				            	<input type="hidden" name="mno" value="1">
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
		                      <textarea name="content" class="form-control"><c:out value="${free.content}" /></textarea>
		                    </div>
			                </div>
			                <!-- /.form-group -->

                    	<div class="form-actions no-margin-bottom text-right">
                        <input type="submit" value="저장" class="btn btn-primary">
                        <input type="button" value="삭제" class="btn btn-primary">
                        <input type="button" value="취소" class="btn btn-primary">
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