<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headerRes.jsp"%>
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
					<i class="glyphicon glyphicon-edit"></i>
				</div>
				<h5>기업 등록</h5>
				<!-- .toolbar -->
				<div class="toolbar">
					<nav style="padding: 8px;">
						<a href="javascript:;" class="btn btn-default btn-xs collapse-box">
							<i class="fa fa-minus"></i>
						</a> <a href="javascript:;" class="btn btn-default btn-xs full-box">
							<i class="fa fa-expand"></i>
						</a> <a href="javascript:;" class="btn btn-danger btn-xs close-box">
							<i class="fa fa-times"></i>
						</a>
					</nav>
				</div>
				<!-- /.toolbar -->
			</header>
			<div id="div-1" class="body">
				<form role="form" method="post">
					<div class="form-group">
						<label for="cname" class="control-label col-lg-4">기업명</label>
						<div class="col-lg-8">
							<input type="text" name="cname" id="text1" placeholder="name"
								class="form-control" value="하이">
						</div>
					</div>
					<br>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="cname" class="control-label col-lg-4">업종</label>
						<div class="col-lg-8">
							<input type="text" name="info1" id="info1" placeholder="info"
								class="form-control" value="하이">
						</div>
					</div>
					<br>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="cname" class="control-label col-lg-4">사원수</label>
						<div class="col-lg-8">
							<input type="text" name="info2" id="info2" placeholder="info"
								class="form-control"value="하이">
						</div>
					</div>
					<br>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="cname" class="control-label col-lg-4">설립연도</label>
						<div class="col-lg-8">
							<input type="text" name="info3" id="info3" placeholder="info"
								class="form-control"value="하이">
						</div>
					</div>
					<br>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="cname" class="control-label col-lg-4">기업 형태</label>
						<div class="col-lg-8">
							<input type="text" name="info4" id="info4" placeholder="info"
								class="form-control"value="하이">
						</div>
					</div>
					<br>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="cname" class="control-label col-lg-4">홈페이지</label>
						<div class="col-lg-8">
							<input type="text" name="homepage" id="homepage"
								placeholder="www.example.com" class="form-control"value="하이">
						</div>
					</div>
					<br>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="cname" class="control-label col-lg-4">로고</label>
						<div class="col-lg-8">
							<input type="text" name="file" placeholder="Plz upload the logo file"
								class="form-control" id="logo" value="" readonly>
						</div>
					</div>
					<br>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="cname" class="control-label col-lg-4">주소</label>
						<div class="col-lg-8">
							<input type="text" name="address" id="address" placeholder="logo"
								class="form-control"value="인창동 주공아파트 2단지">
						</div>
					</div>
					<button type="button" class="btn btn-default listBtn" id="mapBtn">지도에서 찾기</button>
				<button type="button" class="btn btn-default fileBtn">로고 업로드하기</button>
				<button type="button" class="btn btn-default btn" id="btn" value="">value 확인</button>
					<button type="submit" class="btn btn-default submitBtn">Submit Button</button>
					<br>
					<br>
					<!-- /.form-group -->
					<div id="map" style="width: 100%; height: 350px;"></div>
					<input type="hidden" name="size" value="${criteria.size}">
					<input type="hidden" name="mno" value="${login}">
					<input type="hidden" name="company_info" id="company_info" value="">
					<input type="hidden" name="logo" id="rlogo" value="">
				</form>
				
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5977f0d595044a32c59caa2b8a88c7f8&libraries=services"></script>
	<script>
	$(document).ready(function() {
		
// 		if(!${login}) {
			
// 		}
		
		$(".fileBtn").on("click", function(e) {
			window.open('/job/company/upload', '_blank');
		});
		
		$(".submitBtn").on("click", function(e) {
			var info = $("#info1").val()+"/"+$("#info2").val()+"/"+$("#info3").val()+"/"+$("#info4").val();
			$("#company_info").val(info);
			$("#logo").val($("#rlogo").val());
			console.log("=================="+info);
			console.log("=============logo=============================="+$("#logo").val());
		});
		
		
		$("#mapBtn").on("click", function(e) {
			showMap();
		});

		function showMap() {
			var infowindow = new daum.maps.InfoWindow({zIndex:1});

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 

			// 키워드로 장소를 검색합니다
			ps.keywordSearch($("#address").val(), placesSearchCB); 

			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === daum.maps.services.Status.OK) {

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new daum.maps.LatLngBounds();

			        for (var i=0; i<data.length; i++) {
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
			        map: map,
			        position: new daum.maps.LatLng(place.y, place.x) 
			    });

			    // 마커에 클릭이벤트를 등록합니다
			    daum.maps.event.addListener(marker, 'click', function() {
			    	
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
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