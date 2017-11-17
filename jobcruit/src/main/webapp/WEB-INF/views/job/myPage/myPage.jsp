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
												  	<h2>관심 채용 공고</h2>
														<ul class="pricing-table">
															<div class="clearfix"></div>
														</ul>
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
		
		<script>
			$(document).ready(function(){
				if (getParameters("editInfo")) {
					swal(
							  '성공',
							  '회원정보 수정 완료',
							  'success'
							);
				}
				
				if (getParameters("removeFav")) {
					swal(
							  '성공',
							  '관심 채용 삭제 성공',
							  'success'
							);
				}

// 				var $title = $("#title");
// 				var $career = $("#career");
// 				var $edu_level = $("#edu_level");
// 				var $prefer = $("#prefer");
// 				var $eligibility = $("#eligibility");
// 				var $dowhat = $("#dowhat");
// 				var $hireType = $("#hireType");
// 				var $ = $("#");
			 	var $pricingTable = $(".pricing-table");

				$.ajax({
						url: "/job/myPage/favList",
						data: "mno=${login}",
						type: "get",
						dataType: "json"
				}).done(function(data){
					console.dir(data);
					for(var i = 0; i < data.length; i++){
						var str = 
							'<li class="col-lg-3 li-border">'+
								'<h3 id="title">'+ data[i].title +'</h3>'+
								'<div class="price-body">'+
									'<div class="price"  id="">'+
										'로고'+
									'</div>'+
								'</div>'+
								'<div class="features">'+
									'<ul id="favRecruit">'+
										"<li id='career'><strong>경력</strong> "+ data[i].career +"</li>"+
										"<li id='edu_level'><strong>학력</strong> "+ data[i].eduLevel +"</li>"+
										"<li id='prefer'><strong>우대사항</strong> "+ data[i].prefer +"</li>"+
										"<li id='eligibility'><strong>자격</strong> "+ data[i].eligibility +"</li>"+
										"<li id='dowhat'><strong>하는 일</strong> "+ data[i].dowhat +"</li>"+
										"<li id='hireType'><strong>정규직/계약직</strong> "+ data[i].hireType +"</li>"+
										"<li id='position'><strong>직급</strong> "+ data[i].position +"</li>"+
										"<li id='reg_date'><strong>등록일</strong> "+ data[i].regDate +"</li>"+
									'</ul>'+
								'</div>'+
								'<div class="footer">'+
									'<a href="/job/recruit/detail?rno='+ data[i].rno +'" class="btn btn-info btn-rect">상세 페이지</a>'+
									'<a href="/job/myPage/removeFav?rno='+ data[i].rno +'" class="btn btn-metis-1 btn-rect">삭제</a>'+
								'</div>'+
							'</li>';
							
						$pricingTable.append(str);
							
					}
				});
				
			});
		</script>
		
	</body>
</html>