<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/headerRes.jsp" %> 
		
		<style>
			#content{
/* 				min-height: 50%; */
/* 				min-width: 85%; */
				margin-bottom: 50px;
			}
			#wrap{
				min-height: 80%;
			}
		</style>
	</head>
	<body>
		<div class="bg-dark dk" id="wrap">
			<%@include file="../common/top.jsp" %> 
		
		
		                    <div id="left">
                        <div class="media user-media bg-dark dker">
                            <div class="user-media-toggleHover">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </div>
                        </div>
                        
                        <!-- #menu -->
                        <ul id="menu" class="bg-blue dker">
                          <li class="nav-header">My Menu
                          </li>
<!--                           <li class="nav-divider"></li> -->
                          <li class="">
                            <a href="">
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
                               <i class="glyphicon glyphicon-plus"></i>
                           </a>
<!--                            <a href="#right" data-toggle="onoffcanvas" class="btn btn-default btn-sm" aria-expanded="false"> -->
<!--                                <span class="fa fa-fw fa-comment"></span> -->
<!--                            </a> -->
                        </div>
                    <!-- /#left -->
                    <div id="content">
                    <div class="outer">
                      <div class="inner bg-light lter">
                      	<p>wfefwfwfeew<br></p>
                      	<p>wfefwfwfeew<br></p>
                      	<p>wfefwfwfeew<br></p>
                      	<p>wfefwfwfeew<br></p>
                      	<p>wfefwfwfeew<br></p>
                      	<p>wfefwfwfeew<br></p>
                      	<p>wfefwfwfeew<br></p>
                      </div>
                    </div>
                    </div>
        <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
		</div>
	</body>
</html>