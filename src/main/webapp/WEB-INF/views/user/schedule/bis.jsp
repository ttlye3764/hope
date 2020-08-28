<%@page import="kr.or.ddit.bis.Bis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>버스</title>
</head>
<body>

<div style=" height: auto; width: 1500px; margin: auto; ">
<br>
<br>
지역 : <input type="text" id="citycode" class="citycode"  name="citycode" >
버스 번호 : <input type="text" id="routeid" class="routeid" name="routeid" >
<input type ="button" id="searchbtn" value="버튼">
</div>

<div id="map" style="width:100%;height:700px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=695a00dbf1560fd30746e2be14b3f633"></script>
<script>
var citycode;
var routeid;  //노선 번호
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
   	 
	   var res_routeid;   //노선ID
      $('#searchbtn').click(function(){
    	  positions = []; //초기화
    	  citycode = $('.citycode').val();
    	  routeid = $('.routeid').val();
    	  alert(citycode);
    	  alert(routeid);
    	           
	         $.ajax({
	                async    : false,
	                url     : '${pageContext.request.contextPath}/user/schedule/bisSearch.do',
	                type    : 'post',
	                data : {'citycode':citycode,'routeid':routeid},
	                dataType: 'json',
	                success : function(Result) {                      
	                   res_routeid = Result.response.body.items.item.routeid;
	                   console.log(res_routeid);
	                },
	                error : function(request,status,error){
	    				alert(error);
	    			}
	           }); //버스아이디 얻어오기(res_routeid)


	         $.ajax({
	        	 async    : false,
	             url     : '${pageContext.request.contextPath}/user/schedule/bisLocation.do',
	             type    : 'post',
	             data : {'citycode':citycode,'res_routeid':res_routeid},
	             dataType: 'json',
	             success : function(Result) {
	                                      
	                for(var i=0; i<Result.response.body.totalCount; i++){
	                    
						console.log(Result.response.body.items.item[i].gpslong);
						console.log(Result.response.body.items.item[i].gpslati);
						positions.push({latlng:new kakao.maps.LatLng(Result.response.body.items.item[i].gpslati,Result.response.body.items.item[i].gpslong)});
						startx = Result.response.body.items.item[i].gpslati;
						starty = Result.response.body.items.item[i].gpslong;
						
	                 }
	                console.log(positions);
	                
	             },
	             error : function(request,status,error){
	 				alert(error);
	 			}
	        }); //버스위치
        
        
	         var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	         mapOption = { 
	             center: new kakao.maps.LatLng(startx, starty), // 지도의 중심좌표
	             level: 8 // 지도의 확대 레벨
	         };
	
	     	 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	      
	    	 // 마커 이미지의 이미지 주소입니다
	    	 var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	         
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
      })
      
   });


</script>
</body>



</html>