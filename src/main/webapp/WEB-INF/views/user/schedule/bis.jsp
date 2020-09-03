<%@page import="kr.or.ddit.bis.Bis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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
						<h2>Register my Bus</h2>
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

			
		</div>
		<!-- portfolio End -->
	</section>







<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=695a00dbf1560fd30746e2be14b3f633"></script>
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
      
   });


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
			            	html = "<h5><b>"+Result.response.body.items.item.routeno+"</b>번 버스가 <b>"+parseInt(Result.response.body.items.item.arrtime/60)+"</b>분 <b>"+Result.response.body.items.item.arrtime%60+"</b>초 뒤에 진입예정입니다.</h3>";
							$('#information').append(html);
					    }
				        for(var i=0; i<Result.response.body.totalCount; i++){
							console.log(Result.response.body.items.item[i].routeno);
							console.log(Result.response.body.items.item[i].arrtime);
							html = "<h5><b>"+Result.response.body.items.item[i].routeno+"</b>번 버스가 <b>"+parseInt(Result.response.body.items.item[i].arrtime/60)+"</b>분<b> "+Result.response.body.items.item[i].arrtime%60+"</b>초 뒤에 진입예정입니다.</h3>";
							$('#information').append(html);
					    }
			        },
			   }); //정류소목록 불러오기
	   
   }


   

</script>
