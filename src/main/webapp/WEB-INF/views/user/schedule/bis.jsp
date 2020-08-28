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

</style>
</head>
<body>

<div style=" height: auto; width: 1500px; margin: auto; ">
<br>
<br>

지역 : <select name="citycode" id="citycode">
			<option value="">지역선택</option>
			<option value="25">대전광역시</option>
			<option value="12">세종특별시</option>
			<option value="22">대구광역시</option>
			<option value="23">인천광역시</option>
			<option value="24">광주광역시</option>
			<option value="26">울산광역시</option>
			<!-- <option value="31010">수원시</option>
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

</div>

<div id="map" style="width:1500px;height:700px; margin: auto;"></div>

<div style="width: 80%; margin:auto;"  >
<br>
<br>
<h4 style="text-align: center; font-weight: bold; "> 내가 즐겨타는 버스  </h4>
<br>

<div class="row">
<c:forEach var="busVO" items="${busList }" varStatus="status">
 <div class="col-md-6 col-xl-3">
                                <!-- project card -->
                                <div class="card d-block">
                                    <div align="center"  >
                                        <!-- project title-->
                                        <div align="left">
                                        <h4 class="mt-0">
     									  ${busVO.bus_no}
     									  <input id="bus_index" type="hidden" value="${busVO.bus_index}">
     									  
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           <button onclick="deletebtn()" type= "button" style="background-color: #FFFFFF; color:#4CAF50">X</button>
                                        </h4>
                                        
                                        <div class="badge badge-success mb-3">
                                        <c:choose>
	                                        <c:when test="${busVO.city_code eq '25'}">
	                                        	대전광역시
	                                        </c:when>
	                                        <c:when test="${busVO.city_code eq '12'}">
	                                        	세종특별시
	                                        </c:when>
	                                        <c:when test="${busVO.city_code eq '22'}">
	                                        	대구광역시
	                                        </c:when>
	                                        <c:when test="${busVO.city_code eq '23'}">
	                                        	인천광역시
	                                        </c:when>
	                                        <c:when test="${busVO.city_code eq '24'}">
	                                        	광주광역시
	                                        </c:when>
	                                        <c:when test="${busVO.city_code eq '26'}">
	                                        	울산광역시
	                                        </c:when>
	                                        <c:when test="${busVO.city_code eq '39'}">
	                                        	제주도
	                                        </c:when>
	                                      
	                                    </c:choose>
                                        </div>

                                        </div>
	                                      	<img alt="bus" width="200px" height="200px" src="${pageContext.request.contextPath }/resources/image/trolleybus_PNG1.png" onClick="busClick(${busVO.bus_no},${busVO.city_code})">
                                    	</div> <!-- end card-body-->
                                  
                                    </div> <!-- end card-body-->
                                    <br>
                                </div> <!-- end card-->
                                
</c:forEach>
</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=695a00dbf1560fd30746e2be14b3f633"></script>
<script>
var citycode;
var positions = [];
var startx;
var starty;


   $(function(){

		   
		   var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	       mapOption = { 
	           center: new kakao.maps.LatLng(36.40457,127.304968), // 지도의 중심좌표
	           level: 8 // 지도의 확대 레벨
	        };

			
	   	   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	   	   
   	 
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
			             level: 8 // 지도의 확대 레벨
			         };
			
			     	 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			      
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
			                alert('등록성공');
			             }

			        	});  //내가자주타는 버스 등록 
			  }
		 location.reload();
          
      })//등록 이벤트
      
   });


   function deletebtn(){

	alert($('#bus_index').val());

   }

   
   function busClick(routeid,citycode){
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
		        level: 8 // 지도의 확대 레벨
		    };
		
			 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		 
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
	}


</script>
</body>



</html>