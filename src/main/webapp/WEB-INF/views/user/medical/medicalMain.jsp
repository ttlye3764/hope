<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- timepicker -->

	
<!-- 캘린더 -->
<script src="/lastProject/resources/fullcalendar-5.3.0/lib/main.js"></script>
<script src="/lastProject/resources/fullcalendar-5.3.0/lib/main.min.js"></script>
<script src="/lastProject/resources/fullcalendar-5.3.0/lib/locales-all.js"></script>
<script src="/lastProject/resources/fullcalendar-5.3.0/lib/locales-all.min.js"></script>	
<!-- timepicker -->
<script src='/lastProject/resources/timepicker/jquery.datetimepicker.full.js'></script> 
<script>
function pill_info(pill_no){
	 $.ajax({
    	 url     : '/lastProject/user/medical/viewJson2.do',
         type    : 'post',
         dataType: 'json',
         data : {'pill_no':pill_no},
         success : function(result) {
             substart = (result.json.pill_start).split("T");
             subend = (result.json.pill_end).split("T");
        	$("#regist-modal2 input[name='pill_name']").val(result.json.pill_name);
 	        $("#regist-modal2 input[name='pill_count1']").val(result.json.pill_count);
 	        $("#regist-modal2 input[name='pill_start']").val(substart[0]);
 	        $("#regist-modal2 input[name='pill_end']").val(subend[0]);
 	        $("#regist-modal2 input[name='pill_alerttime']").val(result.json.pill_alerttime);
 	        $("#regist-modal2 input[name='pill_color']").val(result.json.pill_color);
 	        $("#regist-modal2 input[name='pill_no']").val(result.json.pill_no);
 	        if(result.json2==null){
     	    $("#regist-modal2 img[id=img2]").attr("src", "/lastProject/images/unnamed.jpg");
     	    }else{
 	        $("#regist-modal2 img[id=img2]").attr("src", "/files/"+result.json2.file_save_name);
	     	}
         }
    });
   
    $("#regist-modal2").modal("show");

	$("#deleteBTN").on('click',function(){
		$(location).attr('href', '/lastProject/user/medical/deleteMedicalInfo.do?pill_no='+pill_no);
	})
} 
	$(function(){
		
	
		
		 $.ajax({			//당일 복용리스트
             url     : '/lastProject/user/medical/todayMedical.do',		
             type    : 'post',
             dataType: 'json',
             data : {'mem_no':1},
             success : function(result) {      
            	$.each(result.json,function(i,v){
            		var str = '<a href="#" class="btn btn-outline-primary" /* onclick="pill_info('+v.pill_no+');" */ id="'+v.pill_no+'"  style="margin-left: 5px; display: block; margin-top:5px; margin-right:5px;">'+v.pill_name+'</a>';
					$('#calendarDiv1').append(str);
             	 });            	   
          	  
  			}
  		});
		 $.ajax({			//일주일 복용리스트
             url     : '/lastProject/user/medical/weekMedical.do',		
             type    : 'post',
             dataType: 'json',
             data : {'mem_no':1},
             success : function(result) {      
            	$.each(result.json,function(i,v){
            		var str = '<a href="#" class="btn btn-outline-primary" /* onclick="pill_info('+v.pill_no+');" */ id="'+v.pill_no+'"  style="margin-left: 5px; display: block; margin-top:5px; margin-right:5px;">'+v.pill_name+'</a>';
					$('#calendarDiv2').append(str);
             	 });            	   
          	  
  			}
  		});


		
		$('#files').on('change', handleImgFileSelect);
		$('#files2').on('change', handleImgFileSelect);
		
		$('#pill_alerttime').change(function(){
			var x = document.getElementById("pill_alerttime").value;
		})
		
		$('#pill_start').change(function (){
			var date = $('#pill_start').val();
	        date2 = $('#pill_end').val();
	        if(date > date2){
				alert('복용시작일과 복용종료일을 제대로 입력해주세요.');
				$('#pill_count1').val("0");
			}else{			
				var dateString = date; 
				var dateString2 = date2;
				var dateArray = dateString.split("-");
				var dateArray2 = dateString2.split("-");
				var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
				var dateObj2 = new Date(dateArray2[0], Number(dateArray2[1])-1, dateArray2[2]);  
				var betweenDay = (dateObj2.getTime() - dateObj.getTime())/1000/60/60/24;
				$('#pill_count').val(betweenDay);
				$('#pill_count1').val(betweenDay);
			}
	 	});
	 	
		$('#pill_end').change(function (){
			var date = $('#pill_start').val();
			var date2 = $('#pill_end').val();
			if(date > date2){
				alert('복용시작일과 복용종료일을 제대로 입력해주세요.');
				$('#pill_count1').val("0");
			}else{
				var dateString = date; 
				var dateString2 = date2;
				var dateArray = dateString.split("-");
				var dateArray2 = dateString2.split("-");
				var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
				var dateObj2 = new Date(dateArray2[0], Number(dateArray2[1])-1, dateArray2[2]);  
				var betweenDay = (dateObj2.getTime() - dateObj.getTime())/1000/60/60/24;
				$('#pill_count1').val(betweenDay);
				$('#pill_count').val(betweenDay);
			}
		});
		$('#pill_start_update').change(function (){
			var date = $('#pill_start_update').val();
	        date2 = $('#pill_end_update').val();
	        if(date > date2){
				alert('복용시작일이 복용종료일보다 작아야합니다.');
				$('#pill_count1_update').val("0");
			}else{			
				var dateString = date; 
				var dateString2 = date2;
				var dateArray = dateString.split("-");
				var dateArray2 = dateString2.split("-");
				var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
				var dateObj2 = new Date(dateArray2[0], Number(dateArray2[1])-1, dateArray2[2]);  
				var betweenDay = (dateObj2.getTime() - dateObj.getTime())/1000/60/60/24;
				$('#pill_count_update').val(betweenDay);
				$('#pill_count1_update').val(betweenDay);
			}
	 	});
	 	
		$('#pill_end_update').change(function (){
			var date = $('#pill_start_update').val();
			var date2 = $('#pill_end_update').val();
			if(date > date2){
				alert('복용시작일이 복용종료일보다 작아야합니다.');
				$('#pill_count1_update').val("0");
			}else{
				var dateString = date; 
				var dateString2 = date2;
				var dateArray = dateString.split("-");
				var dateArray2 = dateString2.split("-");
				var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
				var dateObj2 = new Date(dateArray2[0], Number(dateArray2[1])-1, dateArray2[2]);  
				var betweenDay = (dateObj2.getTime() - dateObj.getTime())/1000/60/60/24;
				$('#pill_count1_update').val(betweenDay);
				$('#pill_count_update').val(betweenDay);
			}
		});
		
		
	})

	 function handleImgFileSelect(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("이미지만 업로드 가능합니다.");
					return;
				}
				
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e)	{
						$("#img").attr("src", e.target.result);
						$("#img2").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}


	var event = [];
	var sJson;
	var pillInfo = [];
	var substart=[];
	var subend=[];
	    document.addEventListener('DOMContentLoaded', function() { 	
	    	 $.ajax({
	             url     : '/lastProject/user/medical/viewJson.do',
	             type    : 'post',
	             dataType: 'json',
	             data : {'mem_no':1},
	             success : function(result) {      
	            	$.each(result.json,function(i,v){
	             		  event.push({
	                 		id : v.pill_no,
	             			title : v.pill_name,
	             			start : v.pill_start,
	             			end : v.pill_end,
	             			color : v.pill_color
	             		  });
	             	 });            	   
	          	   setCalendar(event);
	          	  
	  			}
	  		});
	});


	function setCalendar(data){
		 var jsonData = data;
		 var calendarEl = document.getElementById('calendar');
	     var calendar = new FullCalendar.Calendar(calendarEl, {
	    	 eventClick: function(info) {
	    	      var eventObj = info.event;
	    	        $.ajax({
	    	        	 url     : '/lastProject/user/medical/viewJson2.do',
	    	             type    : 'post',
	    	             dataType: 'json',
	    	             data : {'pill_no':eventObj.id},
	    	             success : function(result) {
	        	             substart = (result.json.pill_start).split("T");
	        	             subend = (result.json.pill_end).split("T");
	    	            	$("#regist-modal2 input[name='pill_name']").val(result.json.pill_name);
	    	     	        $("#regist-modal2 input[name='pill_count1']").val(result.json.pill_count);
	    	     	        $("#regist-modal2 input[name='pill_start']").val(substart[0]);
	    	     	        $("#regist-modal2 input[name='pill_end']").val(subend[0]);
	    	     	        $("#regist-modal2 input[name='pill_alerttime']").val(result.json.pill_alerttime);
	    	     	        $("#regist-modal2 input[name='pill_color']").val(result.json.pill_color);
	    	     	        $("#regist-modal2 input[name='pill_no']").val(result.json.pill_no);
	    	     	        if(result.json2==null){
	        	     	    $("#regist-modal2 img[id=img2]").attr("src", "/lastProject/images/unnamed.jpg");
	        	     	    }else{
	    	     	        $("#regist-modal2 img[id=img2]").attr("src", "/files/"+result.json2.file_save_name);
	            	     	}
	    	             }
	        	    });
	    	       
	    	        $("#regist-modal2").modal("show");

					$("#deleteBTN").on('click',function(){
						$(location).attr('href', '/lastProject/user/medical/deleteMedicalInfo.do?pill_no='+eventObj.id);
					})
	    	        
	    	    },
	          initialView: 'dayGridMonth', //초기화면설정
	          navLinks: true, 
	          selectable: true, //일자선택시 일별로 보이기
	          contentHeight: 600,
	          headerToolbar: {
	             left: 'prev,next today',
	             center: 'title',
	             right: 'dayGridMonth,timeGridWeek,timeGridDay'
	          },
	          dateClick: function(info) {

	          $("#regist-modal").modal("show"); //모달창 띄우기
	          $("#img").attr("src", " ");
	         /*  $('form[name=scheduleForm]').submit(function(){
	          	var arr = getCalendarDataInDB();
	             $(this).append('<input type="hidden" name="mem_no" value="0"/>');
	                 var dateStr = info.dateStr;
	                 var start = $("#s_startdate").val();
	                 var title=$("#s_memo").val();
	                 var end = $("#s_enddate").val();
	                 var startdate = new Date(start);
	                 var enddate = new Date(end);
	       
	                 if (!isNaN(startdate.valueOf())) { // valid?
	                     calendar.addEvent(
	                   {     title: title,
	                         start: startdate, //시작날짜(시간까지 정함)
	                         end: enddate, //끝나는날짜 (시간까지 정함)
	                         allDay: false 
	                   });
	                   alert('Great. Now, update your database...');
	                 } else {
	                   alert('Invalid date.');
	                 }       
	                 $(this).attr('action','/lastProject/user/medical/insertMedicalInfo.do');
	                 return true;
	            });  */ //서브밋
	       },//클릭
	       events:(jsonData),
	       eventColor:event.color
	     });//캘린더
	     calendar.render();
	}

</script>
	
	
<style type="text/css">
.calendarClass{
	width: 50%;
	margin-left: 25%;
}
</style>


	<!-- =======================
	tab -->
	<section>
		<div class="container" style="width: 1300px; margin-left: 15%;">
			<div class="row" style="width: 1300px;">
			
				<!-- Tab gradient -->
				<div class="" style="width:1300px;">
					<ul class="nav nav-tabs tab-dark">
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#tab-6-1">복용관리 </a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-6-2"> Design </a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-6-3"> Develop </a> </li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane show active" id="tab-6-1">
						<div class="" style="width:1300px; display: flex; justify-content:space-between;">			


  
						<div id="calendar" class="calendarClass fc fc-media-screen fc-direction-ltr fc-theme-standard" style="margin-left: 0%; width: 950px;"><div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr"><div class="fc-toolbar-chunk"><div class="fc-button-group"><button class="fc-prev-button fc-button fc-button-primary" type="button" aria-label="prev"><span class="fc-icon fc-icon-chevron-left"></span></button><button class="fc-next-button fc-button fc-button-primary" type="button" aria-label="next"><span class="fc-icon fc-icon-chevron-right"></span></button></div><button disabled="" class="fc-today-button fc-button fc-button-primary" type="button">today</button></div><div class="fc-toolbar-chunk"><h2 class="fc-toolbar-title">September 2020</h2></div><div class="fc-toolbar-chunk"><div class="fc-button-group"><button class="fc-dayGridMonth-button fc-button fc-button-primary fc-button-active" type="button">month</button><button class="fc-timeGridWeek-button fc-button fc-button-primary" type="button">week</button><button class="fc-timeGridDay-button fc-button fc-button-primary" type="button">day</button></div></div></div><div class="fc-view-harness fc-view-harness-active" style="height: 600px;"><div class="fc-daygrid fc-dayGridMonth-view fc-view"><table class="fc-scrollgrid  fc-scrollgrid-liquid"><thead><tr class="fc-scrollgrid-section fc-scrollgrid-section-header "><td><div class="fc-scroller-harness"><div class="fc-scroller" style="overflow: hidden;"><table class="fc-col-header " style="width: 343px;"><colgroup></colgroup><tbody><tr><th class="fc-col-header-cell fc-day fc-day-sun"><div class="fc-scrollgrid-sync-inner"><a class="fc-col-header-cell-cushion ">Sun</a></div></th><th class="fc-col-header-cell fc-day fc-day-mon"><div class="fc-scrollgrid-sync-inner"><a class="fc-col-header-cell-cushion ">Mon</a></div></th><th class="fc-col-header-cell fc-day fc-day-tue"><div class="fc-scrollgrid-sync-inner"><a class="fc-col-header-cell-cushion ">Tue</a></div></th><th class="fc-col-header-cell fc-day fc-day-wed"><div class="fc-scrollgrid-sync-inner"><a class="fc-col-header-cell-cushion ">Wed</a></div></th><th class="fc-col-header-cell fc-day fc-day-thu"><div class="fc-scrollgrid-sync-inner"><a class="fc-col-header-cell-cushion ">Thu</a></div></th><th class="fc-col-header-cell fc-day fc-day-fri"><div class="fc-scrollgrid-sync-inner"><a class="fc-col-header-cell-cushion ">Fri</a></div></th><th class="fc-col-header-cell fc-day fc-day-sat"><div class="fc-scrollgrid-sync-inner"><a class="fc-col-header-cell-cushion ">Sat</a></div></th></tr></tbody></table></div></div></td></tr></thead><tbody><tr class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid"><td><div class="fc-scroller-harness fc-scroller-harness-liquid"><div class="fc-scroller fc-scroller-liquid-absolute" style="overflow: hidden auto;"><div class="fc-daygrid-body fc-daygrid-body-unbalanced " style="width: 343px;"><table class="fc-scrollgrid-sync-table" style="width: 343px; height: 572px;"><colgroup></colgroup><tbody><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other" data-date="2020-08-30"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-08-30&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">30</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-past fc-day-other" data-date="2020-08-31"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-08-31&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">31</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-past" data-date="2020-09-01"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-01&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">1</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-past" data-date="2020-09-02"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-02&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">2</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-past" data-date="2020-09-03"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-03&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">3</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-past" data-date="2020-09-04"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-04&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">4</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-today " data-date="2020-09-05"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-05&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">5</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2020-09-06"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-06&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">6</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2020-09-07"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-07&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">7</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2020-09-08"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-08&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">8</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2020-09-09"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-09&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">9</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2020-09-10"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-10&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">10</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2020-09-11"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-11&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">11</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2020-09-12"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-12&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">12</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2020-09-13"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-13&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">13</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2020-09-14"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-14&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">14</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2020-09-15"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-15&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">15</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 44px;"><div class="fc-daygrid-event-harness fc-daygrid-event-harness-abs" style="right: -196px;"><a class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-start fc-event-future" style="border-color: rgb(153, 216, 255); background-color: rgb(153, 216, 255);"><div class="fc-event-main"><div class="fc-event-main-frame"><div class="fc-event-time">1:28p</div><div class="fc-event-title-container"><div class="fc-event-title fc-sticky">타이레놀3</div></div></div></div></a></div><div class="fc-daygrid-event-harness fc-daygrid-event-harness-abs" style="right: -147px; top: 22px;"><a class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-start fc-event-end fc-event-future" style="border-color: rgb(255, 0, 0); background-color: rgb(255, 0, 0);"><div class="fc-event-main"><div class="fc-event-main-frame"><div class="fc-event-time">4:15p</div><div class="fc-event-title-container"><div class="fc-event-title fc-sticky">타이레놀</div></div></div></div></a></div></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2020-09-16"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-16&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">16</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 44px;"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2020-09-17"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-17&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">17</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 44px;"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2020-09-18"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-18&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">18</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 44px;"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2020-09-19"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-19&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">19</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 22px;"></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2020-09-20"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-20&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">20</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 22px;"><div class="fc-daygrid-event-harness fc-daygrid-event-harness-abs" style="right: -147px;"><a class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-end fc-event-future" style="border-color: rgb(153, 216, 255); background-color: rgb(153, 216, 255);"><div class="fc-event-main"><div class="fc-event-main-frame"><div class="fc-event-time">12a</div><div class="fc-event-title-container"><div class="fc-event-title fc-sticky">타이레놀3</div></div></div></div></a></div></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2020-09-21"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-21&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">21</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 22px;"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2020-09-22"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-22&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">22</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 22px;"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2020-09-23"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-23&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">23</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 22px;"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2020-09-24"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-24&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">24</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2020-09-25"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-25&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">25</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2020-09-26"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-26&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">26</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2020-09-27"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-27&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">27</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2020-09-28"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-28&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">28</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2020-09-29"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-29&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">29</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2020-09-30"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-09-30&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">30</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other" data-date="2020-10-01"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-01&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">1</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other" data-date="2020-10-02"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-02&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">2</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other" data-date="2020-10-03"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-03&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">3</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future fc-day-other" data-date="2020-10-04"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-04&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">4</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future fc-day-other" data-date="2020-10-05"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-05&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">5</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other" data-date="2020-10-06"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-06&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">6</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other" data-date="2020-10-07"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-07&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">7</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other" data-date="2020-10-08"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-08&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">8</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other" data-date="2020-10-09"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-09&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">9</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other" data-date="2020-10-10"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2020-10-10&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">10</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr></tbody></table></div></div></div></td></tr></tbody></table></div></div></div>
						
						
						<div style="width: 300px; background-color: #e3e3e3;">
							<div style="height: 50%; background-color: white; ">
								<div style="height: 45px; background-color: #35d47c; display: block;">
									<div style="height:45px; display: flex; align-items:center;  ">
										<h3 style="color: white; margin-left: 5px;">TODAY</h3>
									</div>
								</div>
								
								<div id="calendarDiv1" style="height: 250px; display: block; border: 1px solid #e3e3e3; overflow: auto;">
									<!-- <a href="#" class="btn btn-outline-primary" style="margin-left: 5px; display: block; margin-top:5px; margin-right:5px;">감기약</a> -->
								
								</div>								
							</div>
							<div style="height: 50%; background-color: white;">
								<div style="height: 45px; background-color: #35d47c; display: block; ">
									<div style="height:45px; display: flex; align-items:center;">
										<h3 style="color: white; margin-left: 5px;">WEEK</h3>
									</div>
								</div>
								
								<div id="calendarDiv2" style="height: 285px; display: block; border: 1px solid #e3e3e3; overflow: auto;">
									<!-- <a href="#" class="btn btn-outline-primary" style="margin-left: 5px; margin-top:5px; margin-right:5px; display: block;">타이레놀</a> -->
								</div>
							</div>
						</div>



	<!-- SignIn modal content -->
	<div id="regist-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width:580px;">
				<div class="modal-body">
					<div class="container" style="">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<h2 style="border-bottom: 1px solid #d2d2d2; ">약 복용정보 등록</h2>
					</div>
				</div>
			</div>
			<div class="row ">
				<!-- contact form -->
				<div class="col-md-6">
					<div class="h-100" style="width:500px;">
						<form class="contact-form" id="contact-form2" name="contactform2" action="/lastProject/user/medical/insertMedicalInfo.do" method="post" enctype="multipart/form-data">			
							<!-- Start main form -->
							
								<div class="" style="width:50%; float: left;">
									<!-- name -->
										<label>제품 명 </label><input id="pill_name" name="pill_name" type="text" class="form-control" placeholder="제품명">
										<label>복용일수 </label><input id="pill_count1" name="pill_count1" type="text" class="form-control" disabled="">
										<input id="pill_count" name="pill_count" type="hidden" class="form-control">
										<label>복용시작일</label><input type="date" id="pill_start" name="pill_start" class="form-control">
										<label>복용종료일</label><input type="date" id="pill_end" name="pill_end" class="form-control">
										<label>알림시간설정</label><input type="time" id="pill_alerttime" name="pill_alerttime" class="form-control">
								</div>
							
								<div class="" style="width:50%; float: right;">
									<div></div>
									<div class="col-md-12 text-center">
									<input type="file" class="btn btn-outline-primary btn-block" style="margin-top: 30px;" id="files" name="files">
									</div>
									<div style="width: 230px; height: 150px;">
									<img id="img" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;">
									</div>
									<div class="col-md-12 text-center" style="margin-top: 60px;"><!-- <button class="btn btn-outline-primary btn-block" style="margin-top: 60px;">약 상세보기</button> --></div>
									<label style="margin-top: 30px; margin-left: 15px;">달력 표시 색 설정</label><div><input type="color" id="pill_color" name="pill_color" style="margin-left: 15px;"></div>
								
								</div>																													
								
								<button class="btn btn-outline-grad btn-block" type="submit">등록</button>								
							
							<!-- End main form -->
						</form>
					</div>
				</div>
			</div>
		</div><!-- 컨테이너 -->

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
	<div id="regist-modal2" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width:580px;">
				<div class="modal-body">
					<div class="container" style="">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<h2 style="border-bottom: 1px solid #d2d2d2; ">약 복용정보</h2>
					</div>
				</div>
			</div>
			<div class="row ">
				<!-- contact form -->
				<div class="col-md-6">
					<div class="h-100" style="width:500px;">
						<form class="contact-form" id="contact-form" name="contactform" action="/lastProject/user/medical/updateMedicalInfo.do" method="post" enctype="multipart/form-data">			
							<!-- Start main form -->							
								<div class="" style="width:50%; float: left;">
									<!-- name -->
										<input id="pill_no" name="pill_no" type="hidden" class="form-control">
										<label>제품 명 </label><input id="pill_name" name="pill_name" type="text" class="form-control" placeholder="제품명">
										<label>복용일수 </label><input id="pill_count1_update" name="pill_count1" type="text" class="form-control" disabled="">
										<input id="pill_count_update" name="pill_count" type="hidden" class="form-control">
										<label>복용시작일</label><input type="date" id="pill_start_update" name="pill_start" class="form-control">
										<label>복용종료일</label><input type="date" id="pill_end_update" name="pill_end" class="form-control">
										<label>알림시간설정</label><input type="time" id="pill_alerttime" name="pill_alerttime" class="form-control">
								</div>	
								<div class="" style="width:50%; float: left;">
									<div></div>
									<div class="col-md-12 text-center">
									<input type="file" class="btn btn-outline-primary btn-block" style="margin-top: 30px;" id="files2" name="files">
									</div>
									<div style="width: 230px; height: 150px;">
									<img id="img2" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;">
									</div>
									<div class="col-md-12 text-center" style="margin-top: 60px;"><!-- <button class="btn btn-outline-primary btn-block" style="margin-top: 60px;">약 상세보기</button> --></div>
									<label style="margin-top: 30px; margin-left: 15px;">달력 표시 색 설정</label><div><input type="color" id="pill_color" name="pill_color" style="margin-left: 15px;"></div>
								</div>																							
								<!-- submit button -->
							
								<button class="btn btn-outline-grad btn-block" type="submit">수정</button>
								<button class="btn btn-outline-grad btn-block" style="color: #37bf74;" id="deleteBTN" type="button">삭제</button>
							
							<!-- End main form -->
						</form>
					</div>
				</div>
			</div>
		</div>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

<script>
   $("#s_enddate").datetimepicker();
   $("#s_startdate").datetimepicker();
</script>
				</div>
						</div>
						<div class="tab-pane" id="tab-6-2">
							We pride ourselves on the service we give to our clients. Our friendly team members are always willing to help you understand your present technology requirements and provide suggestions on your future needs. It can be the packaging of an item or the design of its website and Applications.
						</div>
						
						
						
						
						
						
						
						<div class="tab-pane" id="tab-6-3">
							Wizixo; an innovative Internet marketing solutions company that offers comprehensive web development, SMO services, SEO strategies and various other types of Internet marketing related services. With us at your side, you will find the IT solution to achieve your strategic and financial goals.
						</div>
					</div>
				</div>
				
			</div>
			<!-- row end -->
		</div>
	</section>
	<!-- =======================
	tab -->


