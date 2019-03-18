<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     <li class="">
       <a href="/job/myPage/myPage">
         <i class="glyphicon glyphicon-star"></i><span class="link-title">&nbsp;관심 채용공고</span>
       </a>
     </li>
     <li class="">
       <a href="/job/myPage/cv" class="">
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