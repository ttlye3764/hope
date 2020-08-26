<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/template/assets/images/favicon.ico">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CPlayfair+Display:400,400i,700,700i%7CRoboto:400,400i,500,700" rel="stylesheet">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/themify-icons/css/themify-icons.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/animate/animate.min.css" />

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/css/style.css" />
	
	<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>

<!-- 부트스트랩 -->
	<!--Global JS-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-easing/jquery.easing.min.js"></script>







<!-- timepicker -->
<link
	href='${pageContext.request.contextPath }/resources/timepicker/jquery.datetimepicker.min.css'
	rel='stylesheet' />
<!-- 캘린더 -->
<link
	href='${pageContext.request.contextPath }/resources/fullcalendar-5.3.0/lib/main.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath }/resources/fullcalendar-5.3.0/lib/main.min.css'
	rel='stylesheet' />
<!-- 캘린더 -->
<script
	src='${pageContext.request.contextPath }/resources/fullcalendar-5.3.0/lib/main.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/fullcalendar-5.3.0/lib/main.min.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/fullcalendar-5.3.0/lib/locales-all.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/fullcalendar-5.3.0/lib/locales-all.min.js'></script>
<!-- timepicker -->
<script
	src='${pageContext.request.contextPath }/resources/timepicker/jquery.datetimepicker.full.js'></script>
<style type="text/css">
.calendarClass{
	width: 50%;
	margin-left: 25%;
}
</style>

<script>
$(function(){
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
			alert('복용시작일과 복용종료일을 제대로 입력해주세요.');
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
			alert('복용시작일과 복용종료일을 제대로 입력해주세요.');
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
             url     : '${pageContext.request.contextPath}/user/medical/viewJson.do',
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
    	        	 url     : '${pageContext.request.contextPath}/user/medical/viewJson2.do',
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
    	     	        $("#regist-modal2 img[id=img2]").attr("src", "/D:/temp/files/"+result.json2.file_save_name);
    	             }
        	    });
    	       
    	        $("#regist-modal2").modal("show");

				$("#deleteBTN").on('click',function(){
					$(location).attr('href', '${pageContext.request.contextPath}/user/medical/deleteMedicalInfo.do?pill_no='+eventObj.id);
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
                 $(this).attr('action','${pageContext.request.contextPath }/user/medical/insertMedicalInfo.do');
                 return true;
            });  */ //서브밋
       },//클릭
       events:(jsonData),
       eventColor:event.color
     });//캘린더
     calendar.render();
}






</script>
</head>
<body>

	<div id='calendar' class="calendarClass"></div>


	<!-- SignIn modal content -->
	<div id="regist-modal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width:580px;">
				<div class="modal-body">
					<div class="container" style="">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<h2>약 복용정보 등록</h2>
					</div>
				</div>
			</div>
			<div class="row ">
				<!-- contact form -->
				<div class="col-md-6">
					<div class="h-100" style="width:500px;">
						<form class="contact-form" id="contact-form" name="contactform2" action="${pageContext.request.contextPath}/user/medical/insertMedicalInfo.do" method="post" enctype="multipart/form-data">			
							<!-- Start main form -->
							
								<div class="" style="width:50%; float: left;" >
									<!-- name -->
										<label>제품 명 </label><input id="pill_name" name="pill_name" type="text" class="form-control" placeholder="제품명">
										<label>복용일수 </label><input id="pill_count1" name="pill_count1" type="text" class="form-control" disabled>
										<input id="pill_count" name="pill_count" type="hidden" class="form-control">
										<label>복용시작일</label><input type="date" id="pill_start" name="pill_start"  class="form-control">
										<label>복용종료일</label><input type="date" id="pill_end" name="pill_end" class="form-control">
										<label>알림시간설정</label><input type="time" id="pill_alerttime" name="pill_alerttime" class="form-control">
								</div>
							
								<div class="" style="width:50%; float: right;">
									<div></div>
									<div class="col-md-12 text-center">
									<input type="file" class="btn btn-outline-primary btn-block" style="margin-top: 30px;" id="files" name="files">
									</div>
									<div style="width: 230px; height: 150px;" >
									<img id="img" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;">
									</div>
									<div class="col-md-12 text-center"><button class="btn btn-outline-primary btn-block" style="margin-top: 60px;">약 상세보기</button></div>
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
	
	
	<div id="regist-modal2" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width:580px;">
				<div class="modal-body">
					<div class="container" style="">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<h2>약 복용정보</h2>
					</div>
				</div>
			</div>
			<div class="row ">
				<!-- contact form -->
				<div class="col-md-6">
					<div class="h-100" style="width:500px;">
						<form class="contact-form" id="contact-form" name="contactform" action="${pageContext.request.contextPath}/user/medical/updateMedicalInfo.do" method="post" enctype="multipart/form-data">			
							<!-- Start main form -->							
								<div class="" style="width:50%; float: left;">
									<!-- name -->
										<input id="pill_no" name="pill_no" type="hidden" class="form-control">
										<label>제품 명 </label><input id="pill_name" name="pill_name" type="text" class="form-control" placeholder="제품명">
										<label>복용일수 </label><input id="pill_count1_update" name="pill_count1" type="text" class="form-control" disabled>
										<input id="pill_count_update" name="pill_count" type="hidden" class="form-control">
										<label>복용시작일</label><input type="date" id="pill_start_update" name="pill_start"  class="form-control">
										<label>복용종료일</label><input type="date" id="pill_end_update" name="pill_end" class="form-control">
										<label>알림시간설정</label><input type="time" id="pill_alerttime" name="pill_alerttime" class="form-control">
								</div>	
								<div class="" style="width:50%; float: left;">
									<div></div>
									<div class="col-md-12 text-center">
									<input type="file" class="btn btn-outline-primary btn-block" style="margin-top: 30px;" id="files2" name="files">
									</div>
									<div style="width: 230px; height: 150px;" >
									<img id="img2" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;">
									</div>
									<div class="col-md-12 text-center"><button class="btn btn-outline-primary btn-block" style="margin-top: 60px;">약 상세보기</button></div>
									<label style="margin-top: 30px; margin-left: 15px;">달력 표시 색 설정</label><div><input type="color" id="pill_color" name="pill_color" style="margin-left: 15px;"></div>
								</div>																							
								<!-- submit button -->
							
								<button class="btn btn-outline-grad btn-block" type="submit">수정</button>
								<button class="btn btn-outline-grad btn-block" id="deleteBTN" type="button">삭제</button>
							
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




</body>

<script>
   $("#s_enddate").datetimepicker();
   $("#s_startdate").datetimepicker();
</script>

</html>