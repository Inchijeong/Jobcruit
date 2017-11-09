<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="top">
                <!-- .navbar -->
                <nav class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <header class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="index.html" class="navbar-brand"><img src="/resources/assets/img/logo.png" alt=""></a>
                        </header>
                
                        <div class="topnav">
                            <div class="btn-group">
                                <a data-placement="bottom" data-original-title="Fullscreen" data-toggle="tooltip"
                                   class="btn btn-default btn-sm" id="toggleFullScreen">
                                    <i class="glyphicon glyphicon-fullscreen"></i>
                                </a>
                            </div>
                            <div class="btn-group">
                                <a data-placement="bottom" data-original-title="E-mail" data-toggle="tooltip"
                                   class="btn btn-default btn-sm">
                                    <i class="fa fa-envelope"></i>
                                    <span class="label label-warning">5</span>
                                </a>
                                <a data-placement="bottom" data-original-title="Messages" href="#" data-toggle="tooltip"
                                   class="btn btn-default btn-sm">
                                    <i class="fa fa-comments"></i>
                                    <span class="label label-danger">4</span>
                                </a>
                                <a data-toggle="modal" data-original-title="Help" data-placement="bottom"
                                   class="btn btn-default btn-sm"
                                   href="#helpModal">
                                    <i class="fa fa-question"></i>
                                </a>
                            </div>
                            <div class="btn-group">
                                <a href="login.html" data-toggle="tooltip" data-original-title="Logout" data-placement="bottom"
                                   class="btn btn-metis-1 btn-sm">
                                    <i class="fa fa-power-off"></i>
                                </a>
                            </div>
                            <div class="btn-group">
                                <a data-placement="bottom" data-original-title="Show / Hide Left" data-toggle="tooltip"
                                   class="btn btn-primary btn-sm toggle-left" id="menu-toggle">
                                    <i class="fa fa-bars"></i>
                                </a>
                                <a href="#right" data-toggle="onoffcanvas" class="btn btn-default btn-sm" aria-expanded="false">
                                    <span class="fa fa-fw fa-comment"></span>
                                </a>
                            </div>
                        </div>
                
                        <div class="collapse navbar-collapse navbar-ex1-collapse">
                            <!-- .nav -->
                            <ul class="nav navbar-nav">
                                <li><a href="/job/recruit/list">채용정보</a></li>
                                <li><a href="/job/company/list">기업정보</a></li>
                                <li><a href="/job/free/list">자유게시판</a></li>
                                <li><a href="/job/member/mypage">MyPage</a></li>
                            </ul>
                            <!-- /.nav -->
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </nav>
                <!-- /.navbar -->
            </div>
            <!-- /#top -->