<%@page import="kr.or.ddit.bis.Bis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>버스</title>
   
<style>
button[type=button], input[type=submit], input[type=reset] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 5px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px;
}
.main_left_btn {
width:50%;
height:1300px;
float:left;
padding-left: 50px;}

.main_right_btn {
width:50%;
height:1300px;
float:left;
padding-right: 50px;}

table {
width: 100%;
}
table, th, td {
border: 1px solid #bcbcbc;
}
     
      
</style>

</head>

<body>
	<div class="main_left_btn">
		<h4>지역 : <select name="citycode" id="citycode">
					<option value="">지역선택</option>
					<option value="25">대전광역시</option>
					<option value="12">세종특별시</option>
					<option value="22">대구광역시</option>
					<option value="23">인천광역시</option>
					<option value="24">광주광역시</option>
					<option value="26">울산광역시</option>
<!-- 					<option value="31010">수원시</option>
					<option value="31020">성남시</option>
					<option value="31030">의정부시</option>
					<option value="31040">안양시</option>
					<option value="31050">부천시</option>
					<option value="31060">광명시</option>
					<option value="31070">평택시</option>
					<option value="31080">동두천시</option>
					<option value="31090">안산시</option>
					<option value="31100">고양시</option>
					<option value="31110">과천시</option>
					<option value="31120">구리시</option>
					<option value="31130">남양주시</option>
					<option value="31140">오산시</option>
					<option value="31150">시흥시</option>
					<option value="31160">군포시</option>
					<option value="31170">의왕시</option>
					<option value="31180">하남시</option>
					<option value="31190">용인시</option>
					<option value="31200">파주시</option>
					<option value="31210">이천시</option>
					<option value="31220">안성시</option>
					<option value="31230">김포시</option>
					<option value="31240">화성시</option> -->
					<option value="39">제주도</option>
			   </select>
			버스 번호 : <input type="text" id="routeid" class="routeid" name="routeid" >
			<button type ="button" id="searchbtn">검색</button>
			<button type ="button" id="registbtn">등록</button>
			<div id="map" style=" width:80%;height:700px; margin: 20px 20px 20px 30px; "></div>
				<button type="button" id="searchBusStop" onclick="searchBusStop()">정류소 정보 보기</button> 지도위의 정류소를 클릭한 후 버튼을 클릭해주세요.
			
			<div id="information" style="overflow:scroll; width: 800px; height:200px;"></div>
		</h4>
	</div>
	
	
	<div class="main_right_btn">
	<br>
	<br>
	<br>
		
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


			   	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			   	if (navigator.geolocation) {
			   	    
			   	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			   	    navigator.geolocation.getCurrentPosition(function(position) {
			   	        
			   	        var lat = position.coords.latitude, // 위도
			   	            lon = position.coords.longitude; // 경도
			   	        
			   	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			   	            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
			   	        
			   	        // 마커와 인포윈도우를 표시합니다
			   	        displayMarker(locPosition, message);
			   	            
			   	      });
			   	    
			   	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			   	    
			   	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
			   	        message = 'geolocation을 사용할수 없어요..'
			   	        
			   	    displayMarker(locPosition, message);
			   	}

			   	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
			   	function displayMarker(locPosition, message) {
		
			   	    // 마커를 생성합니다
			   	    var marker = new kakao.maps.Marker({  
			   	        map: map, 
			   	        position: locPosition
			   	    }); 
			   	    
			   	    var iwContent = message, // 인포윈도우에 표시할 내용
			   	        iwRemoveable = true;
		
			   	    // 인포윈도우를 생성합니다
			   	    var infowindow = new kakao.maps.InfoWindow({
			   	        content : iwContent,
			   	        removable : iwRemoveable
			   	    });
			   	    
			   	    // 인포윈도우를 마커위에 표시합니다 
			   	    infowindow.open(map, marker);
			   	    
			   	    // 지도 중심좌표를 접속위치로 변경합니다
			   	    map.setCenter(locPosition);      
			   	}    
	   	

	   		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        


	   		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	   			if (navigator.geolocation) {
	   			    
	   			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	   			    navigator.geolocation.getCurrentPosition(function(position) {
	   			        
	   			        var lat = position.coords.latitude, // 위도
	   			            lon = position.coords.longitude; // 경도
	   			        
	   			        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	   			            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	   			        
	   			        // 마커와 인포윈도우를 표시합니다
	   			        displayMarker(locPosition, message);
	   			            
	   			      });
	   			    
	   			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	   			    
	   			    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	   			        message = 'geolocation을 사용할수 없어요..'
	   			        
	   			    displayMarker(locPosition, message);
	   			}

	   			// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	   			function displayMarker(locPosition, message) {

	   			    // 마커를 생성합니다
	   			    var marker = new kakao.maps.Marker({  
	   			        map: map, 
	   			        position: locPosition
	   			    }); 
	   			    
	   			    var iwContent = message, // 인포윈도우에 표시할 내용
	   			        iwRemoveable = true;

	   			    // 인포윈도우를 생성합니다
	   			    var infowindow = new kakao.maps.InfoWindow({
	   			        content : iwContent,
	   			        removable : iwRemoveable
	   			    });
	   			    
	   			    // 인포윈도우를 마커위에 표시합니다 
	   			    infowindow.open(map, marker);
	   			    
	   			    // 지도 중심좌표를 접속위치로 변경합니다
	   			    map.setCenter(locPosition);      
	   			}    
	   			
	   	    // 클릭한 위도, 경도 정보를 가져옵니다 
	   	    var latlng = mouseEvent.latLng; 
			console.log(latlng.getLat()+"_"+latlng.getLng());
			gpsLati = latlng.getLat();
			gpsLong = latlng.getLng();
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
			             data : {'routeid':routeid,'citycode':citycode,'mem_no':2},
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
			            	html = "<h3>"+Result.response.body.items.item.routeno+"번 버스가 "+parseInt(Result.response.body.items.item.arrtime/60)+"분 "+Result.response.body.items.item.arrtime%60+"초 뒤에 진입예정입니다.</h3>";
							$('#information').append(html);
					    }
				        for(var i=0; i<Result.response.body.totalCount; i++){
							console.log(Result.response.body.items.item[i].routeno);
							console.log(Result.response.body.items.item[i].arrtime);
							html = "<h3>"+Result.response.body.items.item[i].routeno+"번 버스가 "+parseInt(Result.response.body.items.item[i].arrtime/60)+"분 "+Result.response.body.items.item[i].arrtime%60+"초 뒤에 진입예정입니다.</h3>";
							$('#information').append(html);
					    }
			        },
			   }); //정류소목록 불러오기
	   
   }


   

</script>
</body>



</html>