<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			            	<div class="icons"><i class="glyphicon glyphicon-list"></i></div>
			              <h5>자유게시판</h5>
			            </header>
		            	<div class="body">
		            		<div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTable_wrapper">
			            		<div class="row">
			            			<div class="col-sm-6">
			            				<div class="dataTables_length" id="dataTable_length">
			            					<label>
			            					<select id="listSize" class="form-control input-sm" aria-controls="dataTable">
			                     	<c:forEach var="i" begin="10" end="25" step="5">
			                     		<option value="${i}">${i}</option>
			                     	</c:forEach>
			                    	</select>
			                    	</label>
			            				</div>
			            			</div>
			            			<div class="col-sm-6">
			            				<div class="dataTables_filter text-right" id="dataTable_filter">
			            					<select class="form-control input-sm searchType" aria-controls="dataTable">
					                    <option value="title">제목</option>
					                    <option value="all">제목+내용</option>
					                    <option value="writer">작성자</option>
					                  </select>
				            				<div class="input-group">
												    	<input type="text" class="form-control searchTxt">
												      <span class="input-group-btn">
												        <button class="btn btn-default searchBtn" type="button">
												        	<span class="glyphicon glyphicon-search"></span>
																</button>
												      </span>
												    </div><!-- /input-group -->
			            				</div>
			            			</div>
			            		</div>
			            		
											<div class="row">
												<div class="col-sm-12">
						              <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
						              <thead>
						              	<tr>
															<th>번호</th>
															<th>제목</th>
															<th>작성자</th>
															<th>작성일</th>
															<th>조회수</th>
															<th>첨부</th>
														</tr>
									        </thead>
									        <tbody>
									        	<!-- getServerData로 목록 표시 -->
									       	</tbody>                
									       </table>
							       		</div>
							       	</div>
							       	<div class="row">
								       	<div class="col-sm-12 text-center">
									      	<ul class="pagination no-margin"></ul>
								       		<button class="btn btn-primary regBtn" style="float:right">글쓰기</button>
								       		<button class="btn btn-primary hidden listBtn" style="float:right">목록으로</button>
												</div>
								      </div>		
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.row -->
					
					</div>
				</div>
			</div>
		</div>
    <!-- /#wrap -->
    
		<form id="actionForm" action="/job/free/list" method="get"></form>
    
		<%@include file="../common/footer.jsp" %> 
		<%@include file="../common/bodyRes.jsp" %>
		
		
		<script>
			$(document).ready(function(){
				var result = '${result}';
				if(result == 'success'){
					showAlert("등록되었습니다");
				}else if(result == 'fail'){
					showAlert("등록중 오류가 발생하였습니다","error");
				}

				makeURL();
			});
			
			var $actionForm = $("#actionForm");
			var keyword = "";
			var isSearch = false;
			
			function makeURL(pageNum){
				var listSize = $("#listSize option:selected").val();
	    	var searchType = $(".searchType option:selected").val();
	    	if(!pageNum){
	    		if(!isSearch){
		        window.history.replaceState({page:1, size:listSize}, null, "?page=1&size="+listSize);
	    		}else{
	    			window.history.replaceState(
    					{page:1, size:listSize, stype:searchType, skey:keyword}, 
    					null,
    					"?page=1&size="+listSize+"&searchType="+searchType+"&keyword="+keyword
	    			);
	    		}
	    	}
	      getServerData(pageNum, listSize, searchType);
	    }
	
			//페이지번호, 화면에 표시할 게시물 수로 데이터 가져오기 
	    function getServerData(pageNum, listSize, searchType){
        pageNum = !pageNum ? 1 : pageNum;
        listSize = !listSize ? 10 : listSize;
        
        console.log("getServerData > page:"+pageNum + ", list:"+listSize+", search:"+searchType+", keyword:"+keyword);
        $.getJSON("/job/free/page",
        	{
        		page:pageNum, 
        		size:listSize,
        		searchType:keyword.trim() == ""? "":searchType,
        		keyword:keyword.trim() == ""? "":keyword
        	})
        .done(function(retData){
        	var list = retData.list;
        	var listSize = retData.cri.size;
	        var total = retData.total;
	        
        	var str = "";
	        var d = null;
	        var month = 0;
	        var date = 0;
	        var commCount = "";
	        
	        for(let i=0, len = list.length; i< len; i++){
	        	d = new Date(list[i].regDate);
	        	month = d.getMonth()+1;
	        	date = d.getDate();
	        	commCount = list[i].commCount;
	        	
	        	str += "<tr>";
            str += "<td>"+ list[i].fno +"</td>";
            str += "<td><a href='"+ list[i].fno +"' class='read'>"+ list[i].title + (commCount > 0 ?"("+commCount+")":"") +"</td>";
            str += "<td>"+ list[i].mname +"</td>";
            str += "<td>"+ getDateFormat(list[i].regDate,"-") +"</td>";
            str += "<td>"+ list[i].readCount +"</td>";
            if(list[i].isAttach){
	            str += "<td><span class='glyphicon glyphicon-paperclip'></span></td>";
            }else{
            	str += "<td>&nbsp;</td>";
            }
            str += "</tr>";
	        }
	        $("#dataTable tbody").html(str);
	        makePagination(pageNum, listSize, total);
        });
	    }
	    
	    //페이징 표시
	    function makePagination(pageNum, listSize, total){
	    	var pageResult = makePage({page:pageNum, size:listSize, total:total});
				
			  var str = "";
	    	if(pageResult.prev){
	 				str += '<li class="page-item"><a class="page-link" href="'+(parseInt(pageResult.first)-1)+'">prev</a></li>';
	    	}
	    	for(var start=pageResult.first, len=pageResult.last; start<=len; start++){
	 				str += '<li class="page-item'+(pageResult.page == start?" active":"")+'"><a class="page-link" href="'+start+'">'+start+'</a></li>';
	    	}
	    	if(pageResult.next){
	 	  		str += '<li class="page-item"><a class="page-link" href="'+(parseInt(pageResult.last)+1)+'">next</a></li>';
	    	}
	    	$(".pagination").html(str);
	    }
	    
	    function setPushState(pageNum){
	    	var listSize = $("#listSize option:selected").val();
	    	if(!isSearch){
			      window.history.pushState({page:pageNum,size:listSize}, null,"?page="+pageNum+"&size="+listSize);
				  }else{
						var searchType = $(".searchType option:selected").val();
						window.history.pushState(
							{page:pageNum, size:listSize, stype:searchType, skey:keyword}, 
							null,
							"?page="+pageNum+"&size="+listSize+"&searchType="+searchType+"&keyword="+keyword
						);
					}	
	    }
	    
	    function searchKeyword(){
	    	isSearch = true;
	    	var $search = $(".searchTxt");
	    	if($search.val().trim() == ""){
	    		swal({
	    			title:"검색어를 입력하세요",
	    			showConfirmButton: false,
					  timer: 1000
					});
	    		return false;
	    	}
	    	
    		keyword = $search.val();
    		$search.val("");
    		
    		$(".searchType option:eq(0)").attr("selected","selected");
    		$("header > h5").html("'"+keyword+"' 검색결과");
    		$(".regBtn").addClass("hidden");
    		$(".listBtn").removeClass("hidden");
    	
    		makeURL();
	    }
	    
	    //화면에 표시할 게시물 수
    	$("#listSize").change(function(event){
    		var pageNum = 1;
    		setPushState(pageNum);
    		makeURL(pageNum);
    	});
	    
	    $(".searchBtn").on("click", function(e){
	    	searchKeyword();
	    });
	    
	    $(".searchTxt").on("keypress", function(e){
	    	if(e.keyCode == 13){
	    		searchKeyword();
	    	}
	    });
	    
	    $(".listBtn").on("click", function(e){
	    	$("header > h5").html("자유게시판");
	    	$(".regBtn").removeClass("hidden");
    		$(".listBtn").addClass("hidden");
    		$(".searchTxt").val("");
    		keyword = "";
    		makeURL();
	    });
	    
	    //페이지 버튼 클릭시 이동처리
	    $(".pagination").on("click", "a", function(e){
	      e.preventDefault();

	      var pageNum = $(this).attr("href");
	      setPushState(pageNum);
	      makeURL(pageNum);
	    });
	    
	    $(".regBtn").on("click", function(){
	    	location.href = "/job/free/register";
	    });
	    
	    $("table").on("click",".read",function(e){
	    	e.preventDefault();
	    	var fno = $(this).attr("href");
	    	
    	  $actionForm.attr({"action":"/job/free/detail", "target":"_blank"})
    	  					 .html("<input type='hidden' name='fno' value='"+fno+"'>")
     	  					 .submit();
	    });

	    //뒤로가기 시 history에 넣어놓은 데이터를 꺼내서 이전 게시물 출력
	    window.onpopstate = function(e){
	        $("#listSize").val(e.state.size).attr("selected","selected");
	        
	        if(e.state.skey){
	        	isSearch = true;
	        	keyword = e.state.skey;
	        	$(".searchType").val(e.state.stype).attr("selected","selected");
	        	$("header > h5").html("'"+keyword+"' 검색결과");
		    		$(".regBtn").addClass("hidden");
		    		$(".listBtn").removeClass("hidden");
	        }else{
	        	isSearch = false;
	        	keyword = "";
	        	$("header > h5").html("자유게시판");
			    	$(".regBtn").removeClass("hidden");
		    		$(".listBtn").addClass("hidden");
	        }
	        makeURL(e.state.page);
	    }
		</script> 
	</body>
</html>