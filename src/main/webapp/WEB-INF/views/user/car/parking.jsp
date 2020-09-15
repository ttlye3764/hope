<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/popper.js/umd/popper.min.js"></script>
<script src="assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>


<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
      <div class="container">
         <div class="row all-text-white">
            <div class="col-md-12 align-self-center">
               <h1 class="innerpage-title">목적지 주차장 찾기</h1>
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/user/main/mainForm.do"><i class="ti-home"></i> Home</a></li>
                     <li class="breadcrumb-item">Timeline</li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </div>
      <br>
      <br>
      <br>

<div style="width:100%" align="center">
	<div class="input-group mb-3" style="width:400px" align="center">
		<input type="text" class="form-control" id="searchtxt">
		<button type="button" onclick="search()">검색</button>
	</div>
	<div id="map" style="width:50%;height:550px;"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0cb6f2e037b46943623093ec6be0f37&libraries=services"></script>
<script>
$(function(){
    $("#searchtxt").keyup(function(e){if(e.keyCode == 13) search();});
});
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

function search(){
	var text = $('#searchtxt').val();
	//키워드로 장소를 검색합니다
	ps.keywordSearch(text, placesSearchCB); 
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }     

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
        ps.categorySearch('PK6', placesSearchParkCB, {useMapBounds:true}); // 지도 표시후 주차장 표시
    } 
}


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchParkCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
        }    
    }
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    var marker = null;
    marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
