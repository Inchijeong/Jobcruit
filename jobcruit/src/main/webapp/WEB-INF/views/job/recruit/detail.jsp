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
                                     	<div class="form-group">
                                            <label>번호</label>
                                            <input type="text" name="bno" class="form-control" value='${recruit.rno}' readonly='readonly'>
                                        </div>
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input type="text" name="title" class="form-control" value='${recruit.title}' readonly='readonly'>
                                        </div>
                                         <div class="form-group">
                                            <label>경력</label>
                                            <input type="text" name="content" class="form-control" value='${recruit.career}' readonly='readonly'>
                                        </div>
                                         <div class="form-group">
                                            <label>학력사항</label>
                                            <input type="text" name="eduLevel" class="form-control" value='${recruit.eduLevel}' readonly='readonly'>
                                        </div>
                                        <div class="form-group">
                                        	<button type="button" class="btn btn-default " aria-label="Left Align" id="interest">
											  이 기업 좋아요<span class="" aria-hidden="true" id="heart" style="color: red"></span>
											</button>
                                        </div>
                                            <button type="button" class="btn btn-default modBtn">Modify</button>
                                            <button type="button" class="btn btn-default listBtn">List</button>
										
											<form id='actionForm' action='/job/recruit/list' method='get'>
												<input type="hidden" name='page' value='${cri.page}'>
												<input type="hidden" name='size' value='${cri.size}'>
												<input type='hidden' name='rno' value='${recruit.rno}'>
												<input type='hidden' name='rno' value='${recruit.rno}'>
											</form>
											
                                </div>
		
		
		
		
		
		
		
		
		
		
		</div>
        <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
			<script>
		$(document).ready(function(){
			
			var actionForm = $("#actionForm");
			
			$(".listBtn").click(function(){
				actionForm.submit();
			});
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