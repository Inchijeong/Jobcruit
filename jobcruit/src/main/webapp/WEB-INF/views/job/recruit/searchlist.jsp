<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/headerRes.jsp" %> 
	</head>
	<body class="menu-affix">
		<div class="bg-dark dk" id="wrap">
			<%@include file="../common/top.jsp" %> 
			<div id="content">
				<div class="outer">
					<div class="inner bg-light lter">



<div class="row">
  <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Dynamic Table</h5>
            </header>



					<div class="search-bar">
						<!-- <form class="main-search" action=""> -->
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="검색해주세요" id="searchval"><span
									class="input-group-btn">
									<button class="btn btn-primary btn-sm text-muted" id="searchBtn">
									검색
									</button>
								</span>
							</div>
						<!-- </form> -->
						<!-- /.main-search -->
					</div>

					<div id="collapse4" class="body">
                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                        	<th>RNO</th>
	                        <th>Title</th>
	                        <th>Company ID</th>
	                        <th>Career</th>
	                        <th>prefer</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                         <c:forEach items="${list}" var="recruit">
                     	<tr>
                     		<td><c:out value="${recruit.rno}"></c:out></td>
                     		<td><a href='${recruit.rno}' class='target'><c:out value="${recruit.title}"></c:out></a></td>
                     		<td><c:out value="${recruit.cid}"></c:out></td>
                     		<td><c:out value="${recruit.career}"></c:out></td>
                     		<td><c:out value="${recruit.prefer}"></c:out></td>
                     	</tr>
                     </c:forEach>  
                    </tbody> 
               </table>
               <button id='registerBtn'>register</button>
               <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                     <ul class="pagination">
                   
                     </ul>
               </div>
            </div>
        </div>
    </div>
</div>
			
			
			
			 <form id='actionForm' action='' method='get'>
				<input type="hidden" name='page' value='${criteria.page}'>
				<input type="hidden" name='size' value='${criteria.size}'>
				<input type="hidden" name="rno" value=''>
				<input type='hidden' name='keyword'>
			</form>
			
			
			
			
			
			
		</div>
			</div>
			</div>	
		</div>
        <!-- /#wrap -->
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %> 
		<script src="/resources/assets/js/pagination.js"></script>
		
		
		
		
		
		
		 <script>
    $(document).ready(function() {
    	
	   var actionForm = $("#actionForm");
    	
       var result = '${result}';
       
       var pageResult = makePage({page:${criteria.page}, total:${total}, size:${criteria.size}});
       
       $("#registerBtn").click(function(){
    	  actionForm.attr("action","/job/recruit/register");
    	  actionForm.attr("method","get");
    	  actionForm.submit();
       });
       
       $("#searchBtn").click(function(){
      	  actionForm.attr("action","/job/recruit/searchlist");
      	  actionForm.attr("method","get");
      	  
      	  var keyword = $("#searchval").val();
      	  console.log("key : " + keyword);
      	 actionForm.find("input[name='keyword']").val(keyword);
      	  actionForm.submit();
         });
       
       $("#listSize").change(function(e){
    	  
    	var size =$("#listSize option:selected").val();
    	actionForm.find("input[name='size']").val(size);
    	actionForm.find("input[name='page']").val(1);
    	actionForm.submit();
    	  
       });
       $(".target").on("click", function(event){
    	   event.preventDefault();
    	   
    	   var rno = $(this).attr("href");
    	   
    	   //alert(rno);
    	   window.open("http://localhost:8000/job/recruit/detail?rno="+rno);
    	   /* actionForm.find("input[name='rno']").val(rno);
    	   actionForm.attr("action", "/job/recruit/detail").submit(); */
       });
       
       $(".pagination").on("click", "li > a", function(event){
    	   
    	   event.preventDefault();
    	   
    	   var pageNum = $(this).attr("href");
    	   var keyword ='${searchCriteria.keyword}';
    	   //alert("PAGE: " + pageNum);
    	   
    	   actionForm.find("input[name='page']").val(pageNum);
    	   actionForm.find("input[name='keyword']").val(keyword);
    	   
    	   actionForm.submit();
    	   
       });
       
       var str = "";
       
       if(pageResult.prev) {
          str+= "<li class='paginate_button'><a href="+ (parseInt(pageResult.first) -1)+">Prev</a></li>";
       }
       for(var start = pageResult.first; start <= pageResult.last; start++) {
          str+= "<li class='paginate_button"+(pageResult.page == start?"active":"")+"'><a href="+start+">"+start+"</a></li>";
       }
       if(pageResult.next) {
          str+= "<li class='paginate_button'><a href="+ (parseInt(pageResult.last)+1)+">Next</a></li>";
       }
       
       console.log(pageResult.last);
       $(".pagination").html(str); 
       
       console.log(pageResult);
       
        if(result) {
          alert(result);
       }
      
    }); 
    </script>
	</body>
</html>