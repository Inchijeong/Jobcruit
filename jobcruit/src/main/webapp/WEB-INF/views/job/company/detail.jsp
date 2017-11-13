<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headerRes.jsp"%>
<style>

.reveiwLi {
	margin: 10px;
	margin-botton:20px;
	border : solid 1px grey;
	border-radius: 3px;
}

</style>
</head>
<body class="menu-affix">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<div class="bg-dark dk" id="wrap">
		<%@include file="../common/top.jsp"%>
	</div>

	<div class="col-lg-6">
		<div class="box dark">
			<header>
				<div class="icons">
					<i class="fa fa-edit"></i>
				</div>
				<h5>Detail</h5>
				<!-- .toolbar -->
				<div class="toolbar">
				</div>
				<!-- /.toolbar -->
			</header>
			<div id="div-1" class="body">
				<c:set var="info" value="${company.company_info}" />
				<c:set var="c_info" value="${fn:split(info, '/')}" />

				<div class="form-group">
					<label for="cname" class="control-label col-lg-4">기업명</label>
					<div class="col-lg-8">
						<input type="text" name="cname" id="text1" placeholder="name"
							class="form-control" value='${company.cname}' readonly>
					</div>
				</div>
				<br>
				<!-- /.form-group -->
				<div class="form-group">
					<label for="cname" class="control-label col-lg-4">업종</label>
					<div class="col-lg-8">
						<input type="text" name="info1" id="info1" placeholder="info"
							class="form-control" value="${c_info[0]}" readonly>
					</div>
				</div>
				<br>
				<!-- /.form-group -->
				<div class="form-group">
					<label for="cname" class="control-label col-lg-4">사원수</label>
					<div class="col-lg-8">
						<input type="text" name="info2" id="info2" placeholder="info"
							class="form-control" value="${c_info[1]}" readonly>
					</div>
				</div>
				<br>
				<!-- /.form-group -->
				<div class="form-group">
					<label for="cname" class="control-label col-lg-4">설립연도</label>
					<div class="col-lg-8">
						<input type="text" name="info3" id="info3" placeholder="info"
							class="form-control" value="${c_info[2]}" readonly>
					</div>
				</div>
				<br>
				<!-- /.form-group -->
				<div class="form-group">
					<label for="cname" class="control-label col-lg-4">기업 형태</label>
					<div class="col-lg-8">
						<input type="text" name="info4" id="info4" placeholder="info"
							class="form-control" value="${c_info[3]}" readonly>
					</div>
				</div>
				<br>
				<!-- /.form-group -->
				<div class="form-group">
					<label for="cname" class="control-label col-lg-4">홈페이지</label>
					<div class="col-lg-8">
						<input type="text" name="homepage" id="homepage"
							placeholder="www.example.com" class="form-control"
							value="${company.homepage}" readonly>
					</div>
				</div>
				<br>
				<!-- /.form-group -->
				<div class="form-group">
					<label for="cname" class="control-label col-lg-4">로고</label>
					<div class="col-lg-8">
						<input type="text" name="logo" id="logo" placeholder="logo"
							class="form-control" value="${company.logo}" readonly>
					</div>
				</div>
				<br>
				<!-- /.form-group -->
				<div class="form-group">
					<label for="cname" class="control-label col-lg-4">주소</label>
					<div class="col-lg-8">
						<input type="text" name="address" id="address"
							placeholder="address" class="form-control"
							value="${company.address}" readonly>
					</div>
				</div>
				<br> <br>
				<button type="button" class="btn btn-default mapBtn" id="mapBtn">지도에서 위치보기</button>
				<button type="button" class="btn btn-default modBtn">Modify n Delete</button>
				<button type="button" class="btn btn-default listBtn">TO LIST</button>
				<button type="button" class="btn btn-default reviewBtn">재직자 리뷰 보기</button>
				<button type="button" class="btn btn-default recruitBtn">채용공고 등록하기</button>
				

				<ul class="list-group">
				</ul>
					
				<div id="map" style="width: 100%; height: 350px;"></div>
				</div>
				<!-- /.form-group -->
				<form id="actionForm" action="/job/company/list" method="get">
					<input type="hidden" id="page" name="page" value="${cri.page}">
					<input type="hidden" id="cid" name="cid" value="${company.cid}">
					<input type="hidden" id="size" name="size" value="${cri.size}">
				</form>
				<form id="actionForm2" action="/job/company/update" method="get">
					<input type="hidden" name="page" value="${cri.page}"> <input
						type="hidden" name="cid" value="${company.cid}"> <input
						type="hidden" name="size" value="${cri.size}">
				</form>
			</div>
		</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5977f0d595044a32c59caa2b8a88c7f8&libraries=services"></script>
	
	
	
	<script>
		$(document).ready(function() {

			var actionForm = $("#actionForm");
			var actionForm2 = $("#actionForm2");
			

			$(".modBtn").click(function(event) {
				console.log("============================"+ $("#cid").val());
				actionForm2.submit();
			});

			$(".listBtn").click(function(event) {
				actionForm.submit();
			});

			$(".reviewBtn").click(function(event) {
				console.log("======================================================== reveiw btn clicked");

				$.ajax({
					url : "/job/review/list",
					data : {
						page : $("#page").val(),
						cid : $("#cid").val(),
						size : $("#size").val()
					},
					method : "get",
					success : function(data) {
						
						if(data.length>0) {
							var li="";
							for(var i=0;i<data.length;i++) {
								li += '<br><br><li class="list-group-item d-flex justify-content-between align-items-center">'+data[i].title+
										'<span class="badge badge-primary badge-pill">'+data[i].grade+
										'</span><br><div class="reveiwLi">'+data[i].merit+
										'</div><div class="reveiwLi">'+data[i].weakness+'</div></li>';
							}
						} else {
							li = '<br><br><li class="list-group-item d-flex justify-content-between align-items-center">리뷰가 아직 없습니다</li>';
						}
						
						$(".list-group").html(li);
					},
					error : function(data) {
						console.log("errrrrrorrorororororororororor"+ data);
					}
					});

				});

			$("#mapBtn").on("click", function(e) {
				showMap();
			});

			/* function getList() {
				$.getJSON
			} */
			function showMap() {
				var infowindow = new daum.maps.InfoWindow({
					zIndex : 1
				});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(37.566826,126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer,mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new daum.maps.services.Places();

				// 키워드로 장소를 검색합니다
				ps.keywordSearch($("#address").val(),placesSearchCB);

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status,pagination) {
					if (status === daum.maps.services.Status.OK) {

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						var bounds = new daum.maps.LatLngBounds();

						for (var i = 0; i < data.length; i++) {
							displayMarker(data[i]);
							bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
						}

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						map.setBounds(bounds);
					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {

					// 마커를 생성하고 지도에 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : new daum.maps.LatLng(place.y, place.x)
					});

					// 마커에 클릭이벤트를 등록합니다
					daum.maps.event.addListener(marker,'click',function() {

										// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
						infowindow.setContent('<div style="padding:5px;font-size:12px;">'+ place.place_name+ '</div>');
						infowindow.open(map,marker);
						console.log(place.address_name);
						$("#address").val(place.address_name);
					});
				}
			}
		});
	</script>
	<!-- /#wrap -->
	<%@include file="../common/footer.jsp"%>
	<%@include file="../common/bodyRes.jsp"%>
</body>
</html>