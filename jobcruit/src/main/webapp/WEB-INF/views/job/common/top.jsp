<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<div id="top">
                <!-- .navbar -->
                <nav class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <header class="navbar-header">
                            <a href="/job/common/main" class="navbar-brand"><img src="/resources/assets/img/logo.png" alt=""></a>
                        </header>
                
                        <div class="topnav">
                        
                        		<!-- 로그인 -->
                            <div class="btn-group logoutView" id="loginDiv">
                                <a href="/job/member/login" data-toggle="tooltip" data-original-title="Login"
                                 data-placement="bottom" class="btn btn-metis-6 btn-sm"> 로그인
                                </a>
                            </div>
                            
                        		<!-- 로그아웃 -->
                         		<span class="logonView" id="loginName"></span>
                            <div class="btn-group logonView" id="logoutDiv">
                                <a href="/job/member/logout" data-toggle="tooltip" data-original-title="Logout"
                                 data-placement="bottom" class="btn btn-metis-1 btn-sm"> 로그아웃
                                </a>
                            </div>
                            
                        		<!-- 회원가입 -->
                            <div class="btn-group logoutView">
                                <a href="/job/member/signUp" data-toggle="tooltip" data-original-title="SignUp"
                                 data-placement="bottom" class="btn btn-success btn-sm"> 회원가입
                                </a>
                            </div>
                            
                            <!-- 풀스크린 -->
                            <div class="btn-group">
                                <a data-placement="bottom" data-original-title="Fullscreen" data-toggle="tooltip"
                                   class="btn btn-default btn-sm" id="toggleFullScreen">
                                    <i class="glyphicon glyphicon-fullscreen"></i>
                                </a>
                            </div>
                        </div>
                
                        <div class="collapse navbar-collapse navbar-ex1-collapse">
                            <!-- .nav -->
                            <ul class="nav navbar-nav">
                                <li><a href="/job/recruit/list">채용정보</a></li>
                                <li><a href="/job/company/list">기업정보</a></li>
                                <li><a href="/job/free/list">자유게시판</a></li>
                                <li><a href="/job/myPage/myPage">MyPage</a></li>
                            </ul>
                            <!-- /.nav -->
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </nav>
                <!-- /.navbar -->
            </div>
            <!-- /#top -->

<!--jQuery -->
<script src="/resources/assets/lib/jquery/jquery.js"></script> 
	           
<script>
	$(document).ready(function(){
		var $logoutView = $(".logoutView");
		var $logonView = $(".logonView");
 		var login = "${login}";
		console.log("세션" + login);
 		var cookieMno = "${cookie.mnoCookie.value}";
		console.log("쿠키" + cookieMno);
		var $loginName = $("#loginName");
		
		
		if(login != ""){
			$logoutView.hide();
			$logonView.show();
 			
			// mno 로 회원정보 가져오기
			$.ajax({
				url: "/job/member/getName",
				data: "mno=" + login,
				type: "post",
				dataType: "json"
			}).done(function(data){
				$loginName.html("<span>" + data.mname + "님 환영합니다!</span>");
			});
			 
		}else{
				$logoutView.show();
				$logonView.hide();
		}
		
		
		
		
	});	
</script>            
            