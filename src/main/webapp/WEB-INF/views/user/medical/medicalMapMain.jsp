<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section class="blog-page pb-0">
		<div class="container">
			<div class="row">
				<!-- sidebar start -->
				<aside class="col-md-3 sidebar order-last order-md-first">
					<!-- Text Widget -->
					<div class="widget">
						<h5 class="widget-title">Text Widget</h5>
						<p class="mb-0">Resources exquisite set arranging moonlight sex him household had. Months had too ham cousin remove far spirit. She procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>

					<!-- Newsletter Widget -->
					<div class="widget widget-newsletter">
						<h5 class="widget-title">Newsletter</h5>
						<p class="mb-1">Subscribe to our newsletter to receive exclusive offers.</p>
						<form>
							<div class="input-group">
								<input type="email" class="form-control" placeholder="Enter your Email...">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-grad mb-0"><svg class="svg-inline--fa fa-paper-plane fa-w-16 m-0" aria-hidden="true" data-prefix="fa" data-icon="paper-plane" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M476 3.2L12.5 270.6c-18.1 10.4-15.8 35.6 2.2 43.2L121 358.4l287.3-253.2c5.5-4.9 13.3 2.6 8.6 8.3L176 407v80.5c0 23.6 28.5 32.9 42.5 15.8L282 426l124.6 52.2c14.2 6 30.4-2.9 33-18.2l72-432C515 7.8 493.3-6.8 476 3.2z"></path></svg><!-- <i class="fa fa-paper-plane m-0"></i> --></button>
								</span>
							</div>
						</form>
					</div>

					<!-- Posts Widget -->
					<div class="widget widget-post">
						<h5 class="widget-title">Recent Posts</h5>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/01.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">The Stories Behind those Iconic Blogs</a>
								<p class="date">Aug 26, 2018</p>
							</div>
						</div>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/02.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">Months had too ham cousin remove</a>
								<p class="date">Jun 05, 2018</p>
							</div>
						</div>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/03.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">Lady an mr here must neat sold</a>
								<p class="date">May 16, 2018</p>
							</div>
						</div>
					</div>

					<!-- Tag Widget -->
					<div class="widget">
						<h5 class="widget-title">Tags</h5>
						<div class="tags">
							<a href="#">studio</a>
							<a href="#">events</a>
							<a href="#">WordPress</a>
							<a href="#">gadgets</a>
							<a href="#">office</a>
							<a href="#">magazine</a>
							<a href="#">freebies</a>
							<a href="#">photograpy</a>
							<a href="#">updates</a>
							<a href="#">creative</a>
							<a href="#">travel</a>
						</div>
					</div>
				</aside>
				<!-- sidebar end -->

				<!-- blog start -->
				<div class="col-md-9 order-first order-lg-first">			
					<div class="preloader">
						<img src="${pageContext.request.contextPath }/resources/template/assets/images/preloader.svg" alt="Pre-loader">
					</div>
					
					<!-- =======================
					Maps -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0cb6f2e037b46943623093ec6be0f37&libraries=services"></script>
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
					<section class="contact-page">
						<div class="container">
							<div class="row">
								<!-- Standard Map -->
								<div class="col-md-6 mb-5">	
									
									<input type="text" id="sample5_address" placeholder="주소"> 
									<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br> 
								
									<div id="map" style="border: 1px solid black; width: 800px; height: 800px;">
									<!-- <script>
									var container = document.getElementById('map');
									var options = {
									center: new kakao.maps.LatLng(33.450701, 126.570667),
									level: 3
									};
									var map = new kakao.maps.Map(container, options);
									var places = new kakao.maps.services.Places();
									var callback = function(result, status) {
									    if (status === kakao.maps.services.Status.OK) {
									        console.log(result);
									    }
									};
				
									// 공공기관 코드 검색
									places.categorySearch('HP8', callback, {
									    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
									    location: new kakao.maps.LatLng(37.564968, 126.939909)
									});
									</script> -->
									
									
								<!-- 	<script>
										//대덕인재개발원 주변 병원/약국 위치 표시
										// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
										var infowindow = new kakao.maps.InfoWindow({zIndex:1});
					
										var mapContainer = document.getElementById('map'), 					
										    mapOption = {
										        center: new kakao.maps.LatLng(36.324411, 127.420189), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨,
										    };  
					
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
					
										// 장소 검색 객체를 생성합니다
										var ps = new kakao.maps.services.Places(map); 
					
										// 카테고리로 은행을 검색합니다
										ps.categorySearch('HP8', placesSearchCB, {useMapBounds:true}); 
										ps.categorySearch('PM9', placesSearchCB, {useMapBounds:true}); 
					
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
									</script> -->
									
											
											
									<script>
										//대덕인재개발원 주변 병원/약국 위치 표시
										// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
										var imageSrc = '${pageContext.request.contextPath }/resources/template/assets/images/favicon.ico', // 마커이미지의 주소입니다    
									    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
									    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				
										// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
										var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
									    markerPosition = new kakao.maps.LatLng(36.324411, 127.420189); // 마커가 표시될 위치입니다
									    
										var marker = new kakao.maps.Marker({
											position: markerPosition 
										});	
										
										
										
										var infowindow = new kakao.maps.InfoWindow({zIndex:1});
					
										var mapContainer = document.getElementById('map'), 					
										    mapOption = {
										        center: new kakao.maps.LatLng(36.324411, 127.420189), // 지도의 중심좌표
										        level: 3
										};  
					
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										var geocoder = new daum.maps.services.Geocoder();
										// 장소 검색 객체를 생성합니다
										var ps = new kakao.maps.services.Places(map); 
				
										
										marker.setMap(map);
				
										var iwContent ='<div class ="label">내위치</div>';
										// 인포윈도우를 생성합니다
										var infowindow2 = new kakao.maps.InfoWindow({
										    position : markerPosition, 
										    content : iwContent 
										});
										  
										// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
										infowindow2.open(map, marker);
				
				
				
										 
										// 카테고리로 은행을 검색합니다
										ps.categorySearch('HP8', placesSearchCB, {useMapBounds:true, useMapCenter:true, radius:1000}); 
										ps.categorySearch('PM9', placesSearchCB, {useMapBounds:true, useMapCenter:true, radius:1000});
										
										
										
										
				 						//marker = new daum.maps.Marker({ position: new daum.maps.LatLng(36.324411, 127.420189), map: map }); 
				 						
				 						var circle = new kakao.maps.Circle({
										    center : new kakao.maps.LatLng(36.324411, 127.420189),  // 원의 중심좌표 입니다 
										    radius: 1000, // 미터 단위의 원의 반지름입니다 
										    strokeWeight: 5, // 선의 두께입니다 
										    strokeColor: '#75B8FA', // 선의 색깔입니다
										    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
										    strokeStyle: 'solid', // 선의 스타일 입니다
										    fillColor: '#CFE7FF', // 채우기 색깔입니다
										    fillOpacity: 0.3  // 채우기 불투명도 입니다   
										}); 
				
										// 지도에 원을 표시합니다 
										circle.setMap(map); 
										/* var imageSrc = "${pageContext.request.contextPath }/logo.png", // 마커이미지의 주소입니다    
										imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
										imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
										  
										//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
										var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
										markerPosition = new kakao.maps.LatLng(36.324411, 127.420189); // 마커가 표시될 위치입니다
										
										//마커를 생성합니다
										var marker = new kakao.maps.Marker({
											position: markerPosition, 
											image: markerImage // 마커이미지 설정 
										});
										marker.setMap(map); */
				 
				 
				 
										function sample5_execDaumPostcode() {
											new daum.Postcode({ oncomplete: function(data) { // 각 주소의 노출 규칙에 따라 주소를 조합한다. // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
												var fullAddr = data.address; // 최종 주소 변수
												var extraAddr = ''; // 조합형 주소 변수 // 기본 주소가 도로명 타입일때 조합한다.
												if(data.addressType === 'R'){ //법정동명이 있을 경우 추가한다. 
													if(data.bname !== ''){ extraAddr += data.bname; } // 건물명이 있을 경우 추가한다. 
													
													if(data.buildingName !== ''){ extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); } // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
													fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); }
													// 주소 정보를 해당 필드에 넣는다. 
													document.getElementById("sample5_address").value = fullAddr; 
													// 주소로 상세 정보를 검색
													geocoder.addressSearch(data.address, function(results, status) { 
													// 정상적으로 검색이 완료됐으면 
														if (status === daum.maps.services.Status.OK) { 
															var result = results[0]; //첫번째 결과의 값을 활용
															// 해당 주소에 대한 좌표를 받아서 
																x = result.x;
																y = result.y;
																
																var circle = new kakao.maps.Circle({
																    center : new kakao.maps.LatLng(result.y, result.x),  // 원의 중심좌표 입니다 
																    radius: 1000, // 미터 단위의 원의 반지름입니다 
																    strokeWeight: 5, // 선의 두께입니다 
																    strokeColor: '#75B8FA', // 선의 색깔입니다
																    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
																    strokeStyle: 'solid', // 선의 스타일 입니다
																    fillColor: '#CFE7FF', // 채우기 색깔입니다
																    fillOpacity: 0.3  // 채우기 불투명도 입니다   
																}); 
				
																// 지도에 원을 표시합니다 
																circle.setMap(map); 
																
																var coords = new daum.maps.LatLng(result.y, result.x); // 지도를 보여준다.
																mapContainer.style.display = "block";
																map.relayout(); // 지도 중심을 변경한다. 
																map.setCenter(coords); // 마커를 결과값으로 받은 위치로 옮긴다. 
				
																marker.setPosition(coords);
				
																// 카테고리로 은행을 검색합니다
																ps.categorySearch('HP8', placesSearchCB, {useMapBounds:true, useMapCenter:true, radius:1000}); 
																ps.categorySearch('PM9', placesSearchCB, {useMapBounds:true, useMapCenter:true, radius:1000});
														}
													}); 
											} }).open(); }
										
										
										
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
				
				
				
										
									</script>
											 
											
											<!-- <script> 
											var x = 0;
											var y = 0;
											var mapContainer = document.getElementById('map'), 
											mapOption = { center: new daum.maps.LatLng(37.537187, 127.005476),level: 5 }; //지도를 미리 생성 
											var map = new daum.maps.Map(mapContainer, mapOption); 
											var geocoder = new daum.maps.services.Geocoder();
											var marker = new daum.maps.Marker({ position: new daum.maps.LatLng(37.537187, 127.005476), map: map }); 
											
											function sample5_execDaumPostcode() {
												new daum.Postcode({ oncomplete: function(data) { // 각 주소의 노출 규칙에 따라 주소를 조합한다. // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
													var fullAddr = data.address; // 최종 주소 변수
													var extraAddr = ''; // 조합형 주소 변수 // 기본 주소가 도로명 타입일때 조합한다.
													if(data.addressType === 'R'){ //법정동명이 있을 경우 추가한다. 
														if(data.bname !== ''){ extraAddr += data.bname; } // 건물명이 있을 경우 추가한다. 
														
														if(data.buildingName !== ''){ extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); } // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
														fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); }
														// 주소 정보를 해당 필드에 넣는다. 
														document.getElementById("sample5_address").value = fullAddr; 
														// 주소로 상세 정보를 검색
														geocoder.addressSearch(data.address, function(results, status) { 
														// 정상적으로 검색이 완료됐으면 
															if (status === daum.maps.services.Status.OK) { 
																var result = results[0]; //첫번째 결과의 값을 활용
																// 해당 주소에 대한 좌표를 받아서 
																	x = result.x;
																	y = result.y;
																	var coords = new daum.maps.LatLng(result.y, result.x); // 지도를 보여준다.
																	mapContainer.style.display = "block"; map.relayout(); // 지도 중심을 변경한다. 
																	map.setCenter(coords); // 마커를 결과값으로 받은 위치로 옮긴다. 
																	marker.setPosition(coords) 
															}
														}); 
												} }).open(); }
											</script> -->​
									</div>
								</div>			
							</div>
							<img alt="" src="${pageContext.request.contextPath }/resources/template/assets/images/favicon.ico" style="border: 1px solid black; width:50px; height: 50px;">
						</div>
					</section>
					
				
					
				
					<div> <a href="#" class="back-top btn btn-grad"><i class="ti-angle-up"></i></a> </div>
				
					


					

				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>