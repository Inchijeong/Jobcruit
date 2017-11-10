<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
	<head>
	
<!-- 			 animate.css stylesheet
    <link rel="stylesheet" href="/resources/assets/lib/animate.css/animate.css">


        <link rel="stylesheet" href="/resources/assets/lib/inputlimiter/jquery.inputlimiter.css">
        <link rel="stylesheet" href="/resources/assets/lib/bootstrap-daterangepicker/daterangepicker-bs3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Uniform.js/2.1.2/themes/default/css/uniform.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.1.0/chosen.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-tagsinput/1.3.3/jquery.tagsinput.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/css/bootstrap3/bootstrap-switch.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker3.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-colorpicker/2.0.1/css/bootstrap-colorpicker.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
		
		
		 -->
		
		<%@include file="../common/headerRes.jsp" %> 
		

		
	</head>
	<body class="menu-affix">
		<div id="wrap">
			<%@include file="../common/top.jsp" %> 
			
			
			
			
			<div class="row">
	<div class="col-lg-6">
   	 <div class="box dark">
        <header>
            <div class="icons"><i class="fa fa-edit"></i></div>
            <h5>Input Text Fields</h5>
            <!-- .toolbar -->
            <div class="toolbar">
              <nav style="padding: 8px;">
                  <a href="javascript:;" class="btn btn-default btn-xs collapse-box">
                      <i class="fa fa-minus"></i>
                  </a>
                  <a href="javascript:;" class="btn btn-default btn-xs full-box">
                      <i class="fa fa-expand"></i>
                  </a>
                  <a href="javascript:;" class="btn btn-danger btn-xs close-box">
                      <i class="fa fa-times"></i>
                  </a>
              </nav>
            </div>            <!-- /.toolbar -->
        </header>
        <div id="div-1" class="body collapse in" aria-expanded="true" style="">
            <form class="form-horizontal" method="post">

                    <label>채용 공고 제목</label>

                        <input type="text" name='title' placeholder="게시할 채용공고 제목을 입력하세요" class="form-control" required
                         oninvalid="this.setCustomValidity('제목을 입력해주세요')" oninput="setCustomValidity('')">
                <!-- /.form-group -->

                    <label>희망 경력사항</label>

                        <input class="form-control" type="text" name="career" placeholder="ex) 신입, 3년차, 5년차.." required
                        oninvalid="this.setCustomValidity('희망경력사항을 작성해주세요')" oninput="setCustomValidity('')"><br>
                <!-- /.form-group -->

                    <label>희망 학력사항</label>

                      <select name='eduLevel'>
                      	<option selected value='학력무관'>희망 학력사항 체크</option>
                      	<option value='학력무관'>학력무관</option>
                      	<option value='고졸이상'>고졸이상</option>
                      	<option value='학사이상'>학사이상</option>
                      	<option value='석사이상'>석사이상</option>
                      	<option value='박사이상'>박사이상</option>
                      </select><br>
                <!-- /.form-group -->
                    <label>자격요건</label>

                        <input type="text" name="eligibility" class="form-control" placeholder="자격조건을 입력하세요." required
                        oninvalid="this.setCustomValidity('자격요건을 입력해주세요')" oninput="setCustomValidity('')">
                <!-- /.form-group -->

                
                    <label>고용형태</label>
                      <select name='hireType'>
                      	<option selected value='해당없음'>고용형태</option>
                      	<option value='인턴'>인턴</option>
                      	<option value='계약직'>계약직</option>
                      	<option value='정규직'>정규직</option>
                      </select><br>
                
                
                    <label>직급</label>
                    <input type="text" name="position" placeholder="구인하는 직급을 작성해주세요" class="form-control" required
                    oninvalid="this.setCustomValidity('직급을 입력해주세요')" oninput="setCustomValidity('')">
                    
                   	<label>우대사항</label>
					<input type="text" name="prefer" placeholder="우대사항을 작성해주세요" class="form-control" required
					oninvalid="this.setCustomValidity('우대사항을 입력해주세요')" oninput="setCustomValidity('')">
					
					
             		<label>업무내용</label>
					<input type="text" name="dowhat" placeholder="업무내용을 작성해주세요" class="form-control" required
					oninvalid="this.setCustomValidity('업무내용을 입력해주세요')" oninput="setCustomValidity('')">
                    
                    <label>Tags</label>
					<!-- <input name="tags" value="foo,bar,baz" class="form-control"> -->
                    <input type='text' name="keyword" placeholder="검색키워드를 작성해주세요" class="form-control" required
                    oninvalid="this.setCustomValidity('검색키워드를 입력해주세요')" oninput="setCustomValidity('')">
                        
                <!-- /.form-group -->
               <button id="sendBtn" >저장하기</button>
            </form>
            
          <!--   <form method="post" enctype="multipart/form-data" target="zero">
				<input type="file" name='f1'>
				<button>Upload</button>
			</form> -->
        </div>
    </div>
</div>

<!--END TEXT INPUT FIELD-->


</div>
			
			
			
			
			
			
			
			
		</div>
        <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		 <%@include file="../common/bodyRes.jsp" %>  
		
            <script src="/resources/assets/js/core.js"></script>
            <script src="/resources/assets/js/app.js"></script>
		 
	 	 
	 	 <script>
	 	 		
                    $(function() {
                      Metis.formGeneral();
                    });
        </script> 
	</body>
</html>