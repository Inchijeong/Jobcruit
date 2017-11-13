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
				border: 1px black solid;
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
                            <a href="">
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
<!--                            <a href="#right" data-toggle="onoffcanvas" class="btn btn-default btn-sm" aria-expanded="false"> -->
<!--                                <span class="fa fa-fw fa-comment"></span> -->
<!--                            </a> -->
                        </div>
                    <!-- /#left -->
                    <div id="content">
                    <div class="outer">
                      <div class="inner bg-light lter">
                      
												<div class="row">
												  <div class="col-lg-12">
												  	<h2>관심 채용 공고</h2>
														<ul class="pricing-table">
														
															<li class="col-lg-3 li-border">
																<h3>채용 제목</h3>
																<div class="price-body">
																	<div class="price">
																		기업
																	</div>
																</div>
																<div class="features">
																	<ul>
																		<li><strong>경력</strong> every month</li>
																		<li><strong>학력</strong> every month</li>
																		<li><strong>지원자격</strong> every month</li>
																		<li><strong>우대사항</strong> every month</li>
																		<li><strong>직급</strong> every month</li>
																		<li><strong>하는 일</strong> every month</li>
																		<li><strong>등록일</strong> every month</li>
																	</ul>
																</div>
																<div class="footer">
																	<a href="#" class="btn btn-info btn-rect">상세 페이지</a>
																</div>
															</li>
															<li class="col-lg-3">
																<h3>채용 제목</h3>
																<div class="price-body">
																	<div class="price">
																		기업
																	</div>
																</div>
																<div class="features">
																	<ul>
																		<li><strong>경력</strong> every month</li>
																		<li><strong>학력</strong> every month</li>
																		<li><strong>지원자격</strong> every month</li>
																		<li><strong>우대사항</strong> every month</li>
																		<li><strong>직급</strong> every month</li>
																		<li><strong>하는 일</strong> every month</li>
																		<li><strong>등록일</strong> every month</li>
																	</ul>
																</div>
																<div class="footer">
																	<a href="#" class="btn btn-info btn-rect">상세 페이지</a>
																</div>
															</li>
															<li class="col-lg-3">
																<h3>채용 제목</h3>
																<div class="price-body">
																	<div class="price">
																		기업
																	</div>
																</div>
																<div class="features">
																	<ul>
																		<li><strong>경력</strong> every month</li>
																		<li><strong>학력</strong> every month</li>
																		<li><strong>지원자격</strong> every month</li>
																		<li><strong>우대사항</strong> every month</li>
																		<li><strong>직급</strong> every month</li>
																		<li><strong>하는 일</strong> every month</li>
																		<li><strong>등록일</strong> every month</li>
																	</ul>
																</div>
																<div class="footer">
																	<a href="#" class="btn btn-info btn-rect">상세 페이지</a>
																</div>
															</li>
															<li class="col-lg-3">
																<h3>채용 제목</h3>
																<div class="price-body">
																	<div class="price">
																		기업
																	</div>
																</div>
																<div class="features">
																	<ul>
																		<li><strong>경력</strong> every month</li>
																		<li><strong>학력</strong> every month</li>
																		<li><strong>지원자격</strong> every month</li>
																		<li><strong>우대사항</strong> every month</li>
																		<li><strong>직급</strong> every month</li>
																		<li><strong>하는 일</strong> every month</li>
																		<li><strong>등록일</strong> every month</li>
																	</ul>
																</div>
																<div class="footer">
																	<a href="#" class="btn btn-info btn-rect">상세 페이지</a>
																</div>
															</li>
															
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
				
				
				
			});
		</script>
		
	</body>
</html>