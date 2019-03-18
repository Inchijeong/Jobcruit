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
/* 			iframe{
				width: 0px;
				height: 0px;
				border: 0px;
			} */ 
			.fileDrop{
				width: 100%;
				height: 200px;
			}
			.uploadedList{
				border: 1px #ccc solid;
				border-radius: 4px;
				min-height: 100px;
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
												  	<div class="box">
								            <header class="dark">
								                <div class="icons"><i class="fa fa-cloud-upload"></i></div>
								                <h5>이력서 관리</h5>
								            </header>
												  	<div class="body">
												  	
															<!-- 폼 -->
													    <!-- <div class="form-group">
													    	<form id="cvForm" action="/job/myPage/cv" method="post"
													    	 enctype="multipart/form-data" target="cvFrame">											    
													        <label class="control-label col-lg-4">이력서 업로드</label>
													        <div class="col-lg-12">
												              <div class="input-group">
												              	제목 : <input type="text" name="title" id="title" class="form-control" /><br>
												              	<input type="file" name="file" /><br>
												              	<button type="submit">등록</button>
												              </div>
																	</div>
																</form>
															</div>
															<br> -->
															
													    <div class="form-group">
													        <label class="control-label col-lg-4">이력서 업로드</label>
															        <div class="col-lg-12">
												              	제목 <input type="text" name="title" id="title" class="form-control"/><br>
																				<div class="fileDrop form-control">이쪽에 파일을 끌어다 놓으세요.</div><br>
																				확인 창<div class="uploadedList"></div><br>
																				
																				<button type="button" id="cvRegBtn">등록</button>
												              </div>
															</div>
															<br>
															
															
															<!-- 아이프레임 -->
<!-- 															<iframe name="cvFrame"></iframe> -->

															
															
															<!-- 리스트 -->
															<div id="defaultTable" class="body collapse in">
																<table class="table responsive-table">
																	<thead>
																		<tr>
																			<th>번호</th>
																			<th>제목</th>
																			<th>파일 이름</th>
																			<th>등록일</th>
																		</tr>
																	</thead>
																	<tbody id="cvTbody">
																	</tbody>
																</table>
															</div>
									
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
		
			function formatDate(date) {
				  var monthNames = [
				    "January", "February", "March",
				    "April", "May", "June", "July",
				    "August", "September", "October",
				    "November", "December"
				  ];

				  var day = date.getDate();
				  var monthIndex = date.getMonth();
				  var year = date.getFullYear();

				  return day + ' ' + monthNames[monthIndex] + ' ' + year;
				}
			
			// cv 리스트 보여주기
			var $cvTbody = $("#cvTbody");
			
			var cvList = function(){
				$.ajax({
					url: "/job/myPage/cvList",
					type: "get",
					data: "mno="+ '${login}',
					dataType: "json"
				}).done(function(list){
					// console.log(data);
					var str = "";
					for (i = 0, len = list.length; i < len ; i++) {
						var cv = list[i];
						str += 
							"<tr>" +
							"<td>"+cv.cvAno+"</td>" +
							"<td>"+cv.title+"</td>" +
							"<td>"+cv.fileName+"</td>" +
							"<td>"+formatDate(new Date(cv.regDate))+"</td>" +
							"</tr>";
					}
					$cvTbody.html(str);
				});
			}
			
			cvList();
			
			/* function addFilePath(msg) {
				alert(msg);
				document.getElementById("cvform").reset();
			} */
			
			// 일반파일인지 이미지파일인지 체크 
			function checkImageType(fileName){
				
				var pattern = /jpg$|gif$|png$|jpeg$/i;
				
				return fileName.match(pattern);
				
			}
			
			// 파일 원본 파일명 추출하기
			function getOriginalName(fileName){
				
				var idx = fileName.indexOf("_") + 1;
				
				if(checkImageType(fileName)){
					idx = fileName.lastIndexOf("_") + 1;
					// console.log("fileName : " + fileName);
					return fileName.substr(idx);;
				}
				
				
				// console.log("txtFile: " + fileName.substr(idx));
				return fileName.substr(idx);
			}
			
			// 원본 파일찾기
			function getImageLink(fileName){
				
				if(!checkImageType(fileName)){
					return fileName;
				}
				
				var front = fileName.substr(0,12);
				var end = fileName.substr(14);
				
				return front + end;
				
			}
			
			
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});
			
			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
				
				var files = event.originalEvent.dataTransfer.files;
				
				// 드래그앤 드롭시 에이작스
				var dndAjax = function(){
					$.ajax({
						url: "/job/myPage/upload",
						data: formData,
						dataType: "text",
						processData: false,
						contentType: false,
						type: "post"
					}).done(function(data) {
						console.log(data);
						var str = "";
						
						if(checkImageType(data)){
							str = "<div>"
										+"<a id='linkA' href='displayFile?fileName="+getImageLink(data)+"' data-orgName='"+getOriginalName(data)+"'>"
										+"<img src='displayFile?fileName="+data+"'/>"
										+getOriginalName(data)+"</a><small data-src='"+data+"'>X</small></div>";
						}else{
							str = "<div><a id='linkA' href='displayFile?fileName="+data+"' data-orgName='"+getOriginalName(data)+"'>"
										+getOriginalName(data.toString())
										+"</a><small data-src='"+data+"'>X</small></div>";
						}
						
						$(".uploadedList").append(str);
					});
				}

				var file = files[0];
				
				var formData = new FormData();
				
				formData.append("file", file);
				
				dndAjax();
				
				
				/* 
				// 여러개 한번에 올리기
				for (i = 0, len = files.length; i < len; i++ ) {
					
					//console.dir("file" + files[i]);
					
					var formData = new FormData();
					
					formData.append("file", files[i]);
					
					dndAjax();
				}
				 */
			});
			
			// 업로드한 파일 삭제
			$(".uploadedList").on("click", "small", function(event){
				
				var that = $(this);
				
				$.ajax({
					url: "/job/myPage/deleteFile",
					type: "post",
					data: {fileName:that.attr("data-src")},
					dataType: "text"
				}).done(function(result){
					if(result == 'deleted'){
						// alert("삭제성공");
						that.closest("div").remove();
					}
				});
				
			});
			
			// 이력서 등록
			$("#cvRegBtn").click(function(e){
				e.preventDefault();
				
				var $title = $("#title"); 
				var $small = $("small"); 
				var $aLink = $("#linkA");
				var filePath = getImageLink($small.attr("data-src"));
				// console.log(filePath);
				var fileName = $aLink.attr("data-orgName");
				// console.log(fileName);
				
				if(!$title.val()){
					swal(
							  '실패',
							  '제목을 입력해 주세요.',
							  'error'
							)
					return;
				}
				if(!fileName){
					swal(
							  '실패',
							  '파일을 등록해 주세요',
							  'error'
							)
					return;
				}
				
				$.ajax({
					url: "/job/myPage/cvRegister",
					type: "post",
					data: {
							mno: "${login}",
							filePath: filePath,
							fileName: fileName,
							title: $title.val()
						},
					dataType: "text"
				}).done(function(result){
					if(result == 'success'){
						swal(
								  '성공',
								  '이력서 등록 성공',
								  'success'
								);
						$(".uploadedList").html("");
						$title.val("");
						cvList();
					}
				});
				
			});
			
		});
		</script>
				
	</body>
</html>