<%@page import="kr.or.ddit.bis.Bis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Bus Information System</h1>
					<h6 class="subtitle"> Register your favorite bus! </h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a href="index.html"><i class="ti-home"></i> Home</a></li>
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

	<section>
		<div class="container">
			<div class="row mb-4">
				<!-- portfolio images -->
				<div class="col-md-8">
					<div id="map" style=" width:80%;height:700px; margin: 20px 20px 20px 30px; "></div>
				</div>
				<!-- portfolio details -->
				<div class="col-md-4">
					<div class="sticky-element">
						<h2>Register favorite Bus</h2>
						<p>내가 즐겨타는 버스를 등록해주세요~! </p>
						       Region : <select name="citycode" id="citycode">
									<option value="">지역선택</option>
									<option value="25">대전광역시</option>
									<option value="12">세종특별시</option>
									<option value="22">대구광역시</option>
									<option value="23">인천광역시</option>
									<option value="24">광주광역시</option>
									<option value="26">울산광역시</option>
									<option value="39">제주도</option>
					   			   </select>
					   			   <br>
					   			   <br>
					Bus.No : <input type="text" id="routeid" class="routeid" name="routeid" >
					
					&nbsp;<button type ="button" id="searchbtn">검색</button>
					<br>
					<br>
					<button type ="button" id="registbtn">등록</button>
					<br>
				
				<div id="busList" style="overflow: auto; overflow-x:hidden; width: 500px; height:500px;">
				<table id="busTable" class="table table-striped dt-responsive nowrap w-100">
				<thead>
					<tr>
						<th></th>
						<th>지역</th>
						<th>버스번호</th>
						<th style="display: none">인덱스</th>
						<th style="display: none">citycode</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="busVO" items="${busList }" varStatus="status">
						<tr>
							<th>${status.count }</th>
							 <c:choose>
                                           <c:when test="${busVO.city_code eq '25'}">
                                             				 <td>대전광역시</td> 
                                           </c:when>
                                           <c:when test="${busVO.city_code eq '12'}">
                                              				<td>세종특별시</td> 
                                           </c:when>
                                           <c:when test="${busVO.city_code eq '22'}">
                                             				 <td>대구광역시</td>
                                           </c:when>
                                           <c:when test="${busVO.city_code eq '23'}">
                                              				<td>인천광역시</td>
                                           </c:when>
                                           <c:when test="${busVO.city_code eq '24'}">
                                              				<td>광주광역시</td>
                                           </c:when>
                                           <c:when test="${busVO.city_code eq '26'}">
                                              				<td>울산광역시</td>
                                           </c:when>
                                           <c:when test="${busVO.city_code eq '39'}">
                                              				<td>제주도</td>
                                           </c:when>
                            </c:choose>
 							<td>${busVO.bus_no }</td>
 							<td style="display: none">${busVO.bus_index}</td>
 							<td style="display: none">${busVO.city_code}</td>
 							<td><button id="deleteBtn" type="button" value="${busVO.bus_index }" onclick="deletebtn(${busVO.bus_index })">삭제</button></td>
                        </tr>        
					</c:forEach>
				</tbody>	
			</table>
			</div>
					</div>
				</div>
				<!-- portfolio details End -->
			</div>

			<div class="row mt-4">
				<!-- portfolio testimonial -->
				<div class="col-md-6">
					<h4 class="mb-4">Bus System Information</h4>버스 정류장을 클릭해 보세요!
						<div id="information" style="overflow: auto; overflow-x:hidden;; width: 800px; height:200px;"></div>
				</div>
				
			</div>
			<br>
			<br>
			<div class="col-md-6">
					<h4 class="mb-4">Subway stations around me</h4> 내 주변 지하철역
					<div id="map1" style="width:1100px;height:500px;"></div>
		    </div>
			<br>
			<br>
			<br>
			
			<div class="row mb-4">		
				<div class="col-md-6">
						<div class="sticky-element" >
						<h2>Search your favorite Subway</h2>
							<p>내가 즐겨타는 지하철을 검색해보세요~! </p>
							<input type="text" id="subwayname"></input>  <button type="button" id="subwaySearch">검색</button>
						</div>
						<div id="subwayList"  style="overflow: auto; overflow-x:hidden; width: 500px; height:500px;">
							<table id="subwayTable" class="table table-striped dt-responsive nowrap w-100">
								
						</table>
						</div>
				</div>
				
						<div class="col-md-3" style="overflow: auto; overflow-x:hidden; width: 500px; height: 500px;">
							<table id="timeTable" class="table table-striped dt-responsive nowrap w-100" style="text-align: center;">
							</table>
						</div>
						<div class="col-md-3" style="overflow: auto; overflow-x:hidden; width: 500px; height: 500px;">
							<table id="timeTableU" class="table table-striped dt-responsive nowrap w-100" style="text-align: center;">
							</table>
						</div>
		</div>
		
			
		<!-- portfolio End -->
	</section>







<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=695a00dbf1560fd30746e2be14b3f633&libraries=services"></script>
<script>


var citycode;
var positions = [];
var startx;
var starty;
var gpsLati;
var gpsLong;
var latitude;
var longitude;

navigator.geolocation.getCurrentPosition(function(pos) {
    latitude = pos.coords.latitude;
    longitude = pos.coords.longitude;
    /* alert("현재 위치는 : " + latitude + ", "+ longitude); */
});


   $(function(){

	   
		   var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	       mapOption = { 
	           center: new kakao.maps.LatLng(latitude,longitude), // 지도의 중심좌표
	           level: 3 // 지도의 확대 레벨
	        };

	   	   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		   	var marker = new kakao.maps.Marker({ 
		   	    // 지도 중심좌표에 마커를 생성합니다 
		   	    position: map.getCenter() 
		   	}); 
		   	// 지도에 마커를 표시합니다
		   	marker.setMap(map);

	   		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        

	   			
	   	    // 클릭한 위도, 경도 정보를 가져옵니다 
	   	    var latlng = mouseEvent.latLng; 
			console.log(latlng.getLat()+"_"+latlng.getLng());
			gpsLati = latlng.getLat();
			gpsLong = latlng.getLng();
			
			// 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
			searchBusStop();
			
			
	   		});



	   	   
		      $('#searchbtn').click(function(){
			      
		    	  var routeid=0;  //노선 번호
			      var res_routeid = 0;   //노선ID
		    	  positions = []; //초기화
		    	  
		    	  citycode = $('#citycode option:selected').val();
		    	  routeid = $('.routeid').val();
		
		    	  
			         $.ajax({
			                async    : false,
			                url     : '${pageContext.request.contextPath}/user/schedule/bisSearch.do',
			                type    : 'post',
			                data : {'citycode':citycode,'routeid':routeid},
			                dataType: 'json',
			                success : function(Result) {        
				               if(Result.response.body.totalCount==1){              
			                   	res_routeid = Result.response.body.items.item.routeid;
				               }
				               else if(Result.response.body.totalCount==0){
								alert('검색조건을 다시 입력해주세요! 해당하는 정보가 없습니다.');
		
						       }
				               else{
				               	res_routeid = Result.response.body.items.item[0].routeid;
					           }
			                },
			                
			           }); //버스아이디 얻어오기(res_routeid)
			          
			      
					if(res_routeid != 0){
		
			         $.ajax({
			        	 async    : false,
			             url     : '${pageContext.request.contextPath}/user/schedule/bisLocation.do',
			             type    : 'post',
			             data : {'citycode':citycode,'res_routeid':res_routeid},
			             dataType: 'json',
			             success : function(Result) {
	            			if(Result.response.body.totalCount==0){
								alert("위치지원이 되지 않는 버스입니다.");
		            		}
			                for(var i=0; i<Result.response.body.totalCount; i++){
			                    console.log(Result)
								positions.push({latlng:new kakao.maps.LatLng(Result.response.body.items.item[i].gpslati,Result.response.body.items.item[i].gpslong)});
								startx = Result.response.body.items.item[i].gpslati;
								starty = Result.response.body.items.item[i].gpslong;
								
			                 }
			                console.log(positions);
			                
			             },
			             
			        }); //버스위치
		        
		
					}
		        
			         var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			         mapOption = { 
			             center: new kakao.maps.LatLng(startx, starty), // 지도의 중심좌표
			             level: 3 // 지도의 확대 레벨
			         };
			
			     	 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			     	 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {     

					   	    // 클릭한 위도, 경도 정보를 가져옵니다 
					   	    var latlng = mouseEvent.latLng; 
							console.log(latlng.getLat()+"_"+latlng.getLng());
							gpsLati = latlng.getLat();
							gpsLong = latlng.getLng();

									
							searchBusStop();
							
					 }); //클릭한 위치의 위도, 경도 정보를 가져온다.

			      
			    	 // 마커 이미지의 이미지 주소입니다
			    	 /* var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";  */
			    	 var imageSrc = "${pageContext.request.contextPath }/resources/image/bus.png.png"; 
			         
				     for (var i = 0; i < positions.length; i ++) {
				         
				         // 마커 이미지의 이미지 크기 입니다
				         var imageSize = new kakao.maps.Size(24, 35); 
				         
				         // 마커 이미지를 생성합니다    
				         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				         
				         // 마커를 생성합니다
				         var marker = new kakao.maps.Marker({
				             map: map, // 마커를 표시할 지도
				             position: positions[i].latlng, // 마커를 표시할 위치
				             image : markerImage // 마커 이미지 
				         });
				     } 

							  
		      })//검색 이벤트


     
      
      
      $('#registbtn').click(function(){

          
    	  citycode = $('#citycode option:selected').val();
    	  routeid = $('.routeid').val();


    	  $.ajax({
              async    : false,
              url     : '${pageContext.request.contextPath}/user/schedule/bisSearch.do',
              type    : 'post',
              data : {'citycode':citycode,'routeid':routeid},
              dataType: 'json',
              success : function(Result) {        
	               if(Result.response.body.totalCount==1){              
                 	res_routeid = Result.response.body.items.item.routeid;
	               }
	               else if(Result.response.body.totalCount==0){
					alert('검색조건을 다시 입력해주세요! 해당하는 정보가 없습니다.');

			       }
	               else{
	               	res_routeid = Result.response.body.items.item[0].routeid;
		           }
              },
              
         }); //버스아이디 얻어오기(res_routeid)

          
    	  if(res_routeid !=0 && citycode !=0){

					     $.ajax({
			        	 async    : false,
			             url     : '${pageContext.request.contextPath}/user/schedule/registBus.do',
			             type    : 'post',
			             data : {'routeid':routeid,'citycode':citycode,'mem_no':${LOGIN_MEMBERINFO.mem_no}},
			             success : function(Result) {
			                alert('등록되었습니다.');
			             }

			        	});  //내가자주타는 버스 등록 
			  }
		 location.reload();
          
      })//등록 이벤트













   /* 지하철역 지도 start*/


   // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
      var infowindow = new kakao.maps.InfoWindow({zIndex:1});

      var mapContainer1 = document.getElementById('map1'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
              level: 5 // 지도의 확대 레벨
          };  

      // 지도를 생성합니다    
      var map1 = new kakao.maps.Map(mapContainer1, mapOption); 

      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places(map1); 

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
              map: map1,
              position: new kakao.maps.LatLng(place.y, place.x) 
          });

          // 마커에 클릭이벤트를 등록합니다
          kakao.maps.event.addListener(marker, 'click', function() {
              // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
              infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
              infowindow.open(map1, marker);
              

          });

          
      }


     


      /* 지하철역 지도 end*/
      

      $('#subwaySearch').click(function(){
    	  $('#subwayTable').empty();
    	  var count = 1;
          var subwayname = $('#subwayname').val();
    	  $.ajax({
              async    : false,
              url     : '${pageContext.request.contextPath}/user/schedule/subwaySearch.do',
              type    : 'post',
              data : {'name':subwayname},
              dataType: 'json',
              success : function(Result) {        
	              console.log(Result);
	              if(Result.response.body.totalCount>1){
		              $('#subwayTable').append('<thead><tr><th>지하철 노선 이름</th><th>지하철 역 이름</th><th style="display: none">지하철아이디</th></tr></thead>');
		              $('#subwayTable').append('<tbody>');	

		              for(var i=0; i<Result.response.body.totalCount; i++){
		              	$('#subwayTable').append(
				              	'<tr><td id="'+Result.response.body.items.item[i].subwayStationId+'"onclick="subwayRouteName(this.id)";>'+Result.response.body.items.item[i].subwayRouteName+'</td><td>'+Result.response.body.items.item[i].subwayStationName+'</td><td style="display: none">'+Result.response.body.items.item[i].subwayStationId+'</td></tr>');
				      }
		              $('#subwayTable').append('</tbody>');
		          }else if(Result.response.body.totalCount==1){
		              $('#subwayTable').append('<thead><tr><th>지하철 노선 이름</th><th>지하철 역 이름</th><th style="display: none">지하철아이디</th></tr></thead>');
		              	$('#subwayTable').append('<tbody><tr><td id="'+Result.response.body.items.item.subwayStationId+'"onclick="subwayRouteName(this.id);">'+Result.response.body.items.item.subwayRouteName+'</td><td>'+Result.response.body.items.item.subwayStationName+'</td><td style="display: none">'+Result.response.body.items.item.subwayStationId+'</td></tr></tbody>');
			      }
              },
              
         }); //지하철아이디 얻어오기(subwayStationId)
      });

      
   });

function subwayRouteName(e){
	var numOfRows = 10;
	 $.ajax({
         async    : false,
         url     : '${pageContext.request.contextPath}/user/schedule/subwayTime.do',
         type    : 'post',
         data : {'subwayStationId':e},
         dataType: 'json',
         success : function(Result) {  
        	 numOfRows = Result.response.body.totalCount;      
             console.log(numOfRows); // 총 갯수
         },
         
    }); //지하철 시간 알아오기

    
     $('#timeTable').empty();
	 $.ajax({
         async    : false,
         url     : '${pageContext.request.contextPath}/user/schedule/subwayTimeList.do',
         type    : 'post',
         data : {'subwayStationId':e, 'numOfRows':numOfRows},
         dataType: 'json',
         success : function(Result) {        
             console.log(Result);
            	  $('#timeTable').append('<thead><tr><th>상행도착시간</th></tr></thead>');
            	 $('#timeTable').append('<tbody>');
             for(var i=0; i<Result.response.body.totalCount; i++){
            	 var arrTime = Result.response.body.items.item[i].arrTime;
            	 arrTime = arrTime.split("");
            	 $('#timeTable').append('<tr><td>'+arrTime[0]+arrTime[1]+':'+arrTime[2]+arrTime[3]+':'+arrTime[4]+arrTime[5]+'</td></tr>');
                 }
            	 $('#timeTable').append('<tbody>'); 
            
         },
         
    }); //지하철 시간 알아오기
    
	var numOfRows = 10;
	 $.ajax({
         async    : false,
         url     : '${pageContext.request.contextPath}/user/schedule/subwayTimeU.do',
         type    : 'post',
         data : {'subwayStationId':e},
         dataType: 'json',
         success : function(Result) {  
        	 numOfRows = Result.response.body.totalCount;      
             console.log(numOfRows); // 총 갯수
         },
         
    }); //지하철 시간 알아오기(하행)
    
     $('#timeTableU').empty();
	 $.ajax({
         async    : false,
         url     : '${pageContext.request.contextPath}/user/schedule/subwayTimeListU.do',
         type    : 'post',
         data : {'subwayStationId':e, 'numOfRows':numOfRows},
         dataType: 'json',
         success : function(Result) {        
             console.log(Result);
            	  $('#timeTableU').append('<thead><tr><th>하행도착시간</th></tr></thead>');
            	 $('#timeTableU').append('<tbody>');
             for(var i=0; i<Result.response.body.totalCount; i++){
            	 var arrTime = Result.response.body.items.item[i].arrTime;
            	 arrTime = arrTime.split("");
            	 $('#timeTableU').append('<tr><td>'+arrTime[0]+arrTime[1]+':'+arrTime[2]+arrTime[3]+':'+arrTime[4]+arrTime[5]+'</td></tr>');
                 }
            	 $('#timeTableU').append('<tbody>'); 
            
         },
         
    }); //지하철 시간 알아오기
	    
}
	
   function deletebtn(n){
	   var bus_index = n;

	   $.ajax({
      	 async    : false,
           url     : '${pageContext.request.contextPath}/user/schedule/deleteBus.do',
           type    : 'post',
           data : {'bus_index':bus_index},
           success : function(Result) {
              alert('삭제되었습니다.');
           }

      	});  //내가자주타는 버스 삭제
 	   location.reload(); 

   }

   $("#busTable tr").click(function(){

	   var td = $(this).children();
	   console.log("클릭한 Row의 모든 데이터 : "+td.text());

		var routeid = td.eq(2).text();
		var citycode = td.eq(4).text();


		var res_routeid = 0;   //노선ID
		   positions = []; //초기화
		   $.ajax({
	           async    : false,
	           url     : '${pageContext.request.contextPath}/user/schedule/bisSearch.do',
	           type    : 'post',
	           data : {'citycode':citycode,'routeid':routeid},
	           dataType: 'json',
	           success : function(Result) {        
	              if(Result.response.body.totalCount==1){              
	              	res_routeid = Result.response.body.items.item.routeid;
	              }
	              else if(Result.response.body.totalCount==0){
					alert('검색조건을 다시 입력해주세요! 해당하는 정보가 없습니다.');

			       }
	              else{
	              	res_routeid = Result.response.body.items.item[0].routeid;
		           }
	           },
	           
	      }); //버스아이디 얻어오기(res_routeid)
	     
	 
		if(res_routeid != 0){

			    $.ajax({
			   	 async    : false,
			        url     : '${pageContext.request.contextPath}/user/schedule/bisLocation.do',
			        type    : 'post',
			        data : {'citycode':citycode,'res_routeid':res_routeid},
			        dataType: 'json',
			        success : function(Result) {
			                                 
			           for(var i=0; i<Result.response.body.totalCount; i++){
			               console.log(Result)
							positions.push({latlng:new kakao.maps.LatLng(Result.response.body.items.item[i].gpslati,Result.response.body.items.item[i].gpslong)});
							startx = Result.response.body.items.item[i].gpslati;
							starty = Result.response.body.items.item[i].gpslong;
							
			            }
			           console.log(positions);
			           
			        },
			        
			   }); //버스위치

				}
			
			    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(startx, starty), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨
			    };
			
				 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
				   	    // 클릭한 위도, 경도 정보를 가져옵니다 
				   	    var latlng = mouseEvent.latLng; 
						console.log(latlng.getLat()+"_"+latlng.getLng());
						gpsLati = latlng.getLat();
						gpsLong = latlng.getLng();

						searchBusStop();
				 }); //클릭한 위치의 위도, 경도 정보를 가져온다.


				 // 마커 이미지의 이미지 주소입니다
				 /* var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";  */
				 var imageSrc = "${pageContext.request.contextPath }/resources/image/bus.png.png"; 
			    
			    for (var i = 0; i < positions.length; i ++) {
			        
			        // 마커 이미지의 이미지 크기 입니다
			        var imageSize = new kakao.maps.Size(24, 35); 
			        
			        // 마커 이미지를 생성합니다    
			        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			        
			        // 마커를 생성합니다
			        var marker = new kakao.maps.Marker({
			            map: map, // 마커를 표시할 지도
			            position: positions[i].latlng, // 마커를 표시할 위치
			            image : markerImage // 마커 이미지 
			        });
			    } 

			    

   });



   function searchBusStop(){
	   $('#information').html("");
		var busStopNodeid;
		var busStopcityCode;
	  $.ajax({
		   	 async    : false,
		        url     : '${pageContext.request.contextPath}/user/schedule/busStop.do',
		        type    : 'post',
		        data : {'gpsLati':gpsLati,'gpsLong':gpsLong},
		        dataType: 'json',
		        success : function(Result) {
			        if(Result.response.body.totalCount>1){
		        	    busStopNodeid = Result.response.body.items.item[0].nodeid;
		        		busStopcityCode	= Result.response.body.items.item[0].citycode;
		               console.log(Result.response.body.items.item[0].nodeid)
		               console.log(Result.response.body.items.item[0].nodenm)
		               console.log(Result.response.body.items.item[0].citycode)
				        }
			        else if(Result.response.body.totalCount==1){
			        	busStopNodeid = Result.response.body.items.item.nodeid;
		        		busStopcityCode	= Result.response.body.items.item.citycode;
		               console.log(Result.response.body.items.item.nodeid)
		               console.log(Result.response.body.items.item.nodenm)
		               console.log(Result.response.body.items.item.citycode)
				    }else{
				        alert('해당하는 정보가 없습니다.');
				        return false;
					 }
		        },
		   }); //정류소목록 불러오기

		// var timer = setInterval(function(){
		  $('#information').html("");
		   var html;
		   $.ajax({
			   	 async    : false,
			        url     : '${pageContext.request.contextPath}/user/schedule/busStopInfo.do',
			        type    : 'post',
			        data : {'cityCode':busStopcityCode,'nodeId':busStopNodeid},
			        dataType: 'json',
			        success : function(Result) {
			            console.log(Result)
			            if(Result.response.body.totalCount==1){
			            	html = "<h5><b>"+Result.response.body.items.item.routeno+"</b>번 버스가 <b>"
			            	+parseInt(Result.response.body.items.item.arrtime/60)+"</b>분 <b>"
			            	+Result.response.body.items.item.arrtime%60+"</b>초 뒤에 진입예정입니다.</h3>";
							$('#information').append(html);
					    }
				        for(var i=0; i<Result.response.body.totalCount; i++){
							console.log(Result.response.body.items.item[i].routeno);
							console.log(Result.response.body.items.item[i].arrtime);
							html = "<h5><b>"+Result.response.body.items.item[i].routeno+"</b>번 버스가 <b>"
							+parseInt(Result.response.body.items.item[i].arrtime/60)+"</b>분<b> "
							+Result.response.body.items.item[i].arrtime%60+"</b>초 뒤에 진입예정입니다.</h3>";
							$('#information').append(html);
					    }
			        },
			   }); //정류소목록 불러오기
			// },1000)
   }

 

</script>
