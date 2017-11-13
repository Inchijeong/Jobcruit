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
		
		
		                    <div id="left">
	                        <div class="media user-media bg-dark dker">
	                            <div class="user-media-toggleHover">
	                                <span class="glyphicon glyphicon-th-list"></span>
	                            </div>
	                        </div>
                        
	                        <!-- #menu -->
	                        <ul id="menu" class="bg-blue dker">
	                          <li class="nav-header">My Menu
	                          </li>
	<!--                           <li class="nav-divider"></li> -->
	                          <li class="">
	                            <a href="/job/myPage/myPage">
	                              <i class="glyphicon glyphicon-star"></i><span class="link-title">&nbsp;관심 채용공고</span>
	                            </a>
	                          </li>
	                          <li class="">
	                            <a href="">
	                              <i class="glyphicon glyphicon-paperclip"></i><span class="link-title">&nbsp;이력서 관리</span>
	                            </a>
	                          </li>
	                          <li class="">
	                            <a href="/job/member/checkPassword">
	                             	<i class="glyphicon glyphicon-user"></i><span class="link-title">&nbsp;회원정보 관리</span>
	                             </a>
	                          </li>
	                          <li class="">
	                            <a href="/job/company/list?mno=${login}">
	                              <i class="glyphicon glyphicon-user"></i><span class="link-title">&nbsp;기업 등록</span>
	                            </a>
	                          </li>
	                                  
	                         </ul>
	                        <!-- /#menu -->
	                    	</div>
	                      <div class="btn-group">
                           <a data-placement="bottom" data-original-title="Show / Hide" data-toggle="tooltip"
                              class="btn btn-primary btn-sm toggle-left" id="menu-toggle">
                               <i class="glyphicon glyphicon-chevron-left"></i>
                           </a>
                        </div>
                    		<!-- /#left -->
                    
                    <div id="content">
                    <div class="outer">
                      <div class="inner bg-light lter">
                      
												<div class="row">
												  <div class="col-lg-12">
												  	<h2>관심 채용 공고</h2>
														<ul class="pricing-table">
														
															<!-- <li class="col-lg-3 li-border">
																<h3 id="title">채용 제목</h3>
																<div class="price-body">
																	<div class="price"  id="">
																		기업
																	</div>
																</div>
																<div class="features">
																	<ul id="favRecruit">
																		<li id="career"><strong>경력</strong> every month</li>
																		<li id="edu_level"><strong>학력</strong> every month</li>
																		<li id="prefer"><strong>우대사항</strong> every month</li>
																		<li id="eligibility"><strong>자격</strong> every month</li>
																		<li id="dowhat"><strong>하는 일</strong> every month</li>
																		<li id="hireType"><strong>정규직/계약직</strong> every month</li>
																		<li id="position"><strong>직급</strong> every month</li>
																		<li id="reg_date"><strong>등록일</strong> every month</li>
																	</ul>
																</div>
																<div class="footer">
																	<a href="#" class="btn btn-info btn-rect">상세 페이지</a>
																	<a href="#" class="btn btn-metis-1 btn-rect">삭제</a>
																</div>
															</li> -->
															
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