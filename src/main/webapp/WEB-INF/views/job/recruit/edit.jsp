<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
	<style>
		.mai-search{
			width:30%;
		}
		.heartRed{
			color: red;
		}
		.heartBlack{
			color: black;
		}
		 
	</style>
		<%@include file="../common/headerRes.jsp" %> 
	</head>
	<body class="menu-affix">
		<div class="bg-dark dk" id="wrap">
			<%@include file="../common/top.jsp" %> 
			
		
		
		
		<div class="col-lg-6">
       <br><br><br><br><br><br>
       							<form id='actionForm' action='/job/recruit/edit' method='get'>		
                                     	<div class="form-group">
                                            <label>번호</label>
                                            <input type="text" name="rno" class="form-control" value='${recruit.rno}' >
                                        </div>
                                        <div class="form-group">
                                            <label>공고 제목</label>
                                            <input type="text" name="title" class="form-control" value='${recruit.title}' >
                                        </div>
                                         <div class="form-group">
                                            <label>희망 경력</label>
                                            <input type="text" name="career" class="form-control" value='${recruit.career}' >
                                        </div>
                                         <div class="form-group">
                                            <label>희망 학력</label>
                                            <input type="text" name="eduLevel" class="form-control" value='${recruit.eduLevel}' >
                                        </div>
                                        <div class="form-group">
                                            <label>자격 요건</label>
                                            <input type="text" name="eligibility" class="form-control" value='${recruit.eligibility}' >
                                        </div>
                                        <div class="form-group">
                                            <label>고용 형태 </label>
                                            <input type="text" name="hireType" class="form-control" value='${recruit.hireType}' >
                                        </div>
                                      
                                        <div class="form-group">
                                            <label>직급 </label>
                                            <input type="text" name="position" class="form-control" value='${recruit.position}' >
                                        </div>
                                      
                                        <div class="form-group">
                                            <label>우대사항 </label>
                                            <input type="text" name="prefer" class="form-control" value='${recruit.prefer}' >
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>업무내용 </label>
                                            <input type="text" name="dowhat" class="form-control" value='${recruit.dowhat}' >
                                        </div>
										
                                        
                                        
                                      
                                            <button type="button" class="btn btn-default editBtn">Save</button>
										
									
												<input type="hidden" name='page' value='${cri.page}'>
												<input type="hidden" name='size' value='${cri.size}'>
								</form>
								<form id="deleteForm" action='/job/recruit/delete'>
										<input type="hidden" name='rno' value='${recruit.rno}'>
										<input type="hidden" name='page' value='${cri.page}'>
										<input type="hidden" name='size' value='${cri.size}'>
										<button type="button" class="btn btn-default deleteBtn">Delete</button>
										<button type="button" class="btn btn-default ListBtn">Cancel</button>
								</form>
                                </div>
		
		
		
		
		
		
		
		
		
		
		</div>
        <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
			<script>
		$(document).ready(function(){
			
		 var actionForm = $("#actionForm");
		 var deleteForm = $("#deleteForm");
		 
		 $(".deleteBtn").click(function(){
			 deleteForm.submit();
				alert("삭제를 완료했습니다.")
			});
			
			$(".editBtn").click(function(){
				actionForm.submit();
				alert("수정을 완료했습니다.")
			});
			
						
				
			});
			
	</script>
	</body>
</html>