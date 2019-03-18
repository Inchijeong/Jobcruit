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
			
		<br />
		
		
		<div class="col-lg-6">
       							<form id='actionForm' action='/job/recruit/list' method='Post'>
                                     	<div class="form-group">
                                            <label>번호</label>
                                            <input type="text" name="rno" class="form-control" value='${recruit.rno}' readonly="readonly" >
                                        </div>
                                        <div class="form-group">
                                            <label>공고 제목</label>
                                            <input type="text" name="title" class="form-control" value='${recruit.title}' readonly="readonly" >
                                        </div>
                                         <div class="form-group">
                                            <label>희망 경력</label>
                                            <input type="text" name="career" class="form-control" value='${recruit.career}' readonly="readonly">
                                        </div>
                                         <div class="form-group">
                                            <label>희망 학력</label>
                                            <input type="text" name="eduLevel" class="form-control" value='${recruit.eduLevel}' readonly="readonly">
                                        </div>
                                        <div class="form-group">
                                            <label>자격 요건</label>
                                            <input type="text" name="eligibility" class="form-control" value='${recruit.eligibility}' readonly="readonly" >
                                        </div>
                                        <div class="form-group">
                                            <label>고용 형태 </label>
                                            <input type="text" name="hireType" class="form-control" value='${recruit.hireType}' readonly="readonly" >
                                        </div>
                                      
                                        <div class="form-group">
                                            <label>직급 </label>
                                            <input type="text" name="position" class="form-control" value='${recruit.position}' readonly="readonly" >
                                        </div>
                                      
                                        <div class="form-group">
                                            <label>우대사항 </label>
                                            <input type="text" name="prefer" class="form-control" value='${recruit.prefer}' readonly="readonly" >
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>업무내용 </label>
                                            <input type="text" name="dowhat" class="form-control" value='${recruit.dowhat}' readonly="readonly" >
                                        </div>
										<div class="form-group">
                                        	<button type="button" class="btn btn-default " aria-label="Left Align" id="interest">
											  좋아요<span class="" aria-hidden="true" id="heart" style="color: red"></span>
											</button>
                                        </div>
                                        
                                        
                                      
                                            <button type="button" class="btn btn-default editBtn">수정/삭제</button>
                                            <button type="button" class="btn btn-default ListBtn">닫기</button>
										
								
												
								</form>
											
                                </div>
			<form id="listForm" action='/job/recruit/list'>
				<input type='hidden' name='page' value=1>
				<input type='hidden' name='size' value=10>
			</form>
				
		
		
		
		
		
		
		
		
		</div>
        <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
			<script>
		$(document).ready(function(){
			
			var actionForm = $("#actionForm");
			var listForm = $("#listForm");
			
			$(".listBtn").click(function(){
				//listForm.submit();
				self.close();
			});
			$(".editBtn").click(function(){
				actionForm.attr("action","/job/recruit/edit")
				actionForm.submit();
			})
			
			var heart = $("#heart");
			$("#interest").click(function(){
				 $("#heart").toggleClass("glyphicon glyphicon-heart-empty");
				 
				 if($("#heart").attr("class") != ""){
					
						$.ajax({
							url: "/job/recruit/heart",
							type: "get",
				//			data: "msg=" + $("#msg").val()
							data:{rno:'${recruit.rno}'}
						})
						.done(function(data){
							alert("이 기업의 공고를 관심채용에 등록하였습니다");	
						});
				 }else{
					 $.ajax({
							url: "/job/recruit/heartCancel",
							type: "get",
				//			data: "msg=" + $("#msg").val()
							data:{rno:'${recruit.rno}'}
						})
						.done(function(data){
							alert("이 기업의 공고를 관심채용에서 삭제하였습니다");	
						});
				 };
				 
				
			});
						
				
			});
			
	</script>
	</body>
</html>