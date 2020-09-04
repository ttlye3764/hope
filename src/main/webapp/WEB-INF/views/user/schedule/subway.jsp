<%@page import="kr.or.ddit.bis.Bis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section>
		<div class="container">
			<div class="row mb-4">
				<!-- portfolio images -->
			
					<div id="map" style="width:1300px;height:500px;"></div>
				
				
			</div>

			<div class="row mt-4">
				<!-- portfolio testimonial -->
				<div class="col-md-6">
					<h4 class="mb-4">Client testimonial</h4>
					<blockquote class="blockquote" cite="#">
						<h5 class="mb-2 text-light-gray">Design everything on the assumption that people are not heartless or stupid but marvelously capable, given the chance. Mr be cottage so related minuter is. Delicate say and blessing ladyship exertion few Margaret. Delight herself welcome against smiling its for. Suspected discovery by he affection household of principle perfectly he.</h5>
						<cite>– Allen Smith</cite>
					</blockquote>
				</div>
				<!-- portfolio information -->
				<div class="col-md-6">
					<h4 class="mb-4">Additional information</h4>
					<p>Residence certainly elsewhere something she preferred cordially law. Age his surprise formerly Mrs perceive few standstill moderate. Of in power match on truth worse voice would. Large an it sense shall an match learn. By expect it result silent in formal of. Ask eat questions abilities described elsewhere assurance.</p>
					<p> Appetite in unlocked advanced breeding position concerns as. Cheerful get shutters yet for repeated screened. An no am cause hopes at three. Prevent behaved fertile he is mistake on. </p>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<!-- tag and share -->
					<div class="divider mb-4"></div>
					<div class="row">
						<div class="tags col-12 col-sm-8 text-center text-sm-left">
							<a class="mb-2 mb-sm-0" href="#">studio</a>
							<a class="mb-2 mb-sm-0" href="#">events</a>
							<a class="mb-2 mb-sm-0" href="#">WordPress</a>
							<a class="mb-2 mb-sm-0" href="#">gadgets</a>
							<a class="mb-2 mb-sm-0" href="#">office</a>
						</div>
						<div class="col-12 col-sm-4 text-center text-sm-right">
							<ul class="social-icons si-colored-bg light">
								<li class="social-icons-item social-facebook mb-0"><a class="social-icons-link" href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="social-icons-item social-twitter mb-0"><a class="social-icons-link" href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="social-icons-item social-gplus mb-0"><a class="social-icons-link" href="#"><i class="fa fa-google-plus"></i></a></li>
								<li class="social-icons-item social-linkedin mb-0"><a class="social-icons-link" href="#"><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="divider mt-4"></div>

					<!-- navigation -->
					<div class="row post-navigation mt-5">
						<div class="col-5">
							<a href="#" class="post-prev">
								<p class="m-2 m-lg-0">Previous Post</p>
								<h6 class="text-truncate d-none d-lg-block">The Pink Chair</h6> </a>
						</div>
						<div class="col-2">
							<a href="portfolio-grid-column-3.html" class="all-post" title="View all post"> <i class="fa fa-th"></i> </a>
						</div>
						<div class="col-5">
							<a href="#" class="post-next">
								<p class="m-2 m-lg-0">Next Post</p>
								<h6 class="text-truncate d-none d-lg-block">Black & white</h6> </a>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- portfolio End -->
	</section>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=695a00dbf1560fd30746e2be14b3f633&libraries=services"></script>
<script>

var latitude;
var longitude;

navigator.geolocation.getCurrentPosition(function(pos) {
    latitude = pos.coords.latitude;
    longitude = pos.coords.longitude;
});

$(function(){

// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 카테고리로 지하철역을 검색합니다
ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
        }       
    }
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
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

});


</script>
