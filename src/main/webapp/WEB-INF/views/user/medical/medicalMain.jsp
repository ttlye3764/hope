<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
<!-- 캘린더 -->
<script src="/lastProject/resources/fullcalendar-5.3.0/lib/main.js"></script>
<script src="/lastProject/resources/fullcalendar-5.3.0/lib/main.min.js"></script>
<script src="/lastProject/resources/fullcalendar-5.3.0/lib/locales-all.js"></script>
<script src="/lastProject/resources/fullcalendar-5.3.0/lib/locales-all.min.js"></script>	
<script src='/lastProject/resources/timepicker/jquery.datetimepicker.full.js'></script> 
<style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style> 
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
             data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
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
             data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
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
	             data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
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
	function pillFirst(){
		var shapes = [];
		var colors = [];
		var lines = [];
		var pname = $("input[id='pname']").val();
		var cname = $("input[id='cname']").val();
		$('input[name="shapes"]:checked').each(function(i) {
			shapes.push($(this).val());
		});
		$('input[name="colors"]:checked').each(function(i) {
			colors.push($(this).val());
		});
		$('input[name="lines"]:checked').each(function(i) {
			lines.push($(this).val());
		});
		$.ajax({
					url : '${pageContext.request.contextPath}/user/medical/searchPillJson.do',
					type : 'post',
					dataType : 'json',
					data : {
						'shapes' : shapes,
						'colors' : colors,
						'pname' : pname,
						'cname' : cname,
						'lines' : lines
					},
					success : function(result) {
						$('.list').empty();
						$('#paginationDIV').empty();
						$('#paginationDIV').append(result.pagination);
						$.each(
										result.list,
										function(index,
												item) {
											var newTr = $('<tr data-timestamp="1509426000" data-status="3" style="height: 60px;"></tr>');
											newTr
													.append('<input type="hidden" value="'+item.pi_no+'"/>');
											newTr
													.append('<td class="" style="height: 60px;"><img alt="" src="'+item.pi_bigimg+'" style="width: 96px; height: 71px;"></td>');
											var fmark = item.pi_f_mark;
											var bmark = item.pi_b_mark;
											if (fmark == null) {
												fmark = " ";
											}
											if (bmark == null) {
												bmark = " ";
											}
											var mark = fmark
													.concat("/");
											mark = mark
													.concat(bmark);
											newTr
													.append('<td class="" style="height: 60px; text-align:center; ">'
															+ mark
															+ '</td>');
											newTr
													.append('<td class="" style="height: 60px;">'
															+ item.pi_shape_name
															+ '</td>');
											newTr
													.append('<td class="" style="height: 60px;">'
															+ item.pi_x_size
															+ '</td>');
											newTr
													.append('<td class="" style="height: 60px;">'
															+ item.pi_y_size
															+ '</td>');
											newTr
													.append('<td class="" style="height: 60px;">'
															+ item.pi_z_size
															+ '</td>');
											newTr
													.append('<td class="" style="height: 60px;">'
															+ item.pi_name
															+ '</td>');
											newTr
													.append('<td class="" style="height: 60px;">'
															+ item.pi_b_name
															+ '</td>');
											$('.list')
													.append(
															newTr);
										})
						$('.list tr').on(
								'click',
								function() {
									var pi_no = $(this)
											.find('input')
											.val();
									getpillAPI(pi_no);
								});
					}
				});
	}
	function callAjax(i){
		/* $('.pagination li').click(function(){
			$(this).find('font').addClass('clickPagination');
		}); */
		var shapes = [];
		var colors = [];
		var lines = [];
		var pname = $("input[id='pname']").val();
		var	cname = $("input[id='cname']").val();
        $('input[name="shapes"]:checked').each(function(i){
        	shapes.push($(this).val());
        });
        $('input[name="colors"]:checked').each(function(i){
        	colors.push($(this).val());
        });
        $('input[name="lines"]:checked').each(function(i){
        	lines.push($(this).val());
        });
	
        $.ajax({
            url     : '${pageContext.request.contextPath}/user/medical/searchPillJson.do',
            type    : 'post',
            dataType: 'json',
            data : {'shapes':shapes, 'colors':colors, 'pname':pname,'cname':cname, 'lines':lines, 'currentPage':i },
            success : function(result) { 
           	  $('.list').empty();
           	  $('#paginationDIV').empty();
           	  $('#paginationDIV').append(result.pagination);
		
				  $.each(result.list, function(index, item){
					  var newTr = $('<tr data-timestamp="1509426000" data-status="3" style="height: 60px;"></tr>');			 
					  newTr.append('<input type="hidden" value="'+item.pi_no+'"/>');
					  newTr.append('<td class="" style="height: 60px;"><img alt="" src="'+item.pi_bigimg+'" style="width: 96px; height: 71px;"></td>');
					  var fmark = item.pi_f_mark;
					  var bmark = item.pi_b_mark;
					  if(fmark == null){
					  	fmark = " ";
					  }
					  if(bmark == null){
					  	bmark = " ";
					  }
					  var mark = fmark.concat("/");
					  mark = mark.concat(bmark);
					  newTr.append('<td class="" style="height: 60px; text-align:center;">'+mark+'</td>');						 
					  newTr.append('<td class="" style="height: 60px;">'+item.pi_shape_name+'</td>');
					  newTr.append('<td class="" style="height: 60px;">'+item.pi_x_size+'</td>');
					  newTr.append('<td class="" style="height: 60px;">'+item.pi_y_size+'</td>');
					  newTr.append('<td class="" style="height: 60px;">'+item.pi_z_size+'</td>');
					  newTr.append('<td class="" style="height: 60px;">'+item.pi_name+'</td>');
					  newTr.append('<td class="" style="height: 60px;">'+item.pi_b_name+'</td>');
					  $('.list').append(newTr);
				  })
				  $('.list tr').on('click', function(){
						var pi_no = $(this).find('input').val();
						getpillAPI(pi_no);
				  });
 			}
 		});
	}
	var img1="";
	function getpillAPI(pi_no){
		
		$.ajax({
            url     : '${pageContext.request.contextPath}/user/medical/pillAPI.do',
            type    : 'post',
            dataType: 'json',
            data : {'pi_no':pi_no },
            async : false,
            success : function(result) {
                console.log(result);
            	getImg(pi_no);
            	
				var ee_doc_data="";
				var nb_doc_data="";
				var ud_doc_data="";
				
				var paraIndex=1;
				var index = 0;
				var list = new Array();
				if(result.response.body.items.item.EE_DOC_DATA.DOC.title){
					ee_doc_data = "<h5>"+result.response.body.items.item.EE_DOC_DATA.DOC.title  +  "</h5>";
					console.log(ee_doc_data);
				}
				if(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.title){
					ee_doc_data += "<h5>"+result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.title +  "</h5>";
					console.log(ee_doc_data);
				}
				$.each(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION,function(i,v){	//v=article, title
					if(i=='ARTICLE'){
						if(jQuery.type(v) == "array"){
							list = v;
							$.each(list,function(i1,v1){  //i1=0,1
								ee_doc_data += v1.title + "<br>";
								
								if(jQuery.type(v1.PARAGRAPH)=="array"){
									var list2 = v1.PARAGRAPH;
									$.each(list2,function(index,value){
										ee_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
										console.log(ee_doc_data); 
									});
								}
								
								
							});
						}
						else{
							$.each(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.ARTICLE,function(i1,v1){  //v=paragraph,title
								var i= 1;
								if(i1=='PARAGRAPH'){
									if(jQuery.type(v1) == "array"){
										list = v1;
										$.each(list,function(index,value){
											ee_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
											console.log(ee_doc_data); 
										});	
									}
									else{
										ee_doc_data += "<"+v1.tagName + ">" + v1.content + "</"+v1.tagName + ">";
										console.log(ee_doc_data); 
									}				
								}else{
									if(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.ARTICLE.title){
										var ee = ee_doc_data.split("</h5>");
										ee_doc_data = ee[0] + "</h5>" + i +"."+v1 + "<br>" + ee[1]; 
										i = i+1;
									}
								}
							});
						}
					}
				});
				//NB_DOC_DATA
				if(result.response.body.items.item.NB_DOC_DATA.DOC.title){
					nb_doc_data += "<h5>"+result.response.body.items.item.NB_DOC_DATA.DOC.title  +  "</h5>";
					console.log(ee_doc_data);
				}
				if(result.response.body.items.item.NB_DOC_DATA.DOC.SECTION.title){
					nb_doc_data += "<h5>"+result.response.body.items.item.NB_DOC_DATA.DOC.SECTION.title +  "</h5>";
					console.log(ee_doc_data);
				}
				$.each(result.response.body.items.item.NB_DOC_DATA.DOC.SECTION,function(i,v){	//v=article, title
					if(i=='ARTICLE'){
						if(jQuery.type(v) == "array"){
							list = v;
							$.each(list,function(i1,v1){  //i1=0,1
								nb_doc_data += v1.title + "<br>";
								
								if(jQuery.type(v1.PARAGRAPH)=="array"){
									var list2 = v1.PARAGRAPH;
									$.each(list2,function(index,value){
										nb_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
										console.log(ee_doc_data); 
									});
								}
								
								
							});
						}
						else{
							$.each(result.response.body.items.item.NB_DOC_DATA.DOC.SECTION.ARTICLE,function(i1,v1){  //v=paragraph,title
								var i= 1;
								if(i1=='PARAGRAPH'){
									if(jQuery.type(v1) == "array"){
										list = v1;
										$.each(list,function(index,value){
											nb_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
											console.log(ee_doc_data); 
										});	
									}
									else{
										nb_doc_data += "<"+v1.tagName + ">" + v1.content + "</"+v1.tagName + ">";
										console.log(ee_doc_data); 
									}				
								}else{
									if(result.response.body.items.item.NB_DOC_DATA.DOC.SECTION.ARTICLE.title){
										var nb = nb_doc_data.split("</h5>");
										nb_doc_data = nb[0] + "</h5>" + i +"."+v1 + "<br>" + nb[1]; 
										i = i+1;
									}
								}
							});
						}
					}
				});
				
				//UD_DOC_DATA
				if(result.response.body.items.item.UD_DOC_DATA.DOC.title){
					ud_doc_data += "<h5>"+result.response.body.items.item.UD_DOC_DATA.DOC.title  +  "</h5>";
					console.log(ee_doc_data);
				}
				if(result.response.body.items.item.UD_DOC_DATA.DOC.SECTION.title){
					ud_doc_data += "<h5>"+result.response.body.items.item.UD_DOC_DATA.DOC.SECTION.title +  "</h5>";
					console.log(ee_doc_data);
				}
				$.each(result.response.body.items.item.UD_DOC_DATA.DOC.SECTION,function(i,v){	//v=article, title
					if(i=='ARTICLE'){
						if(jQuery.type(v) == "array"){
							list = v;
							$.each(list,function(i1,v1){  //i1=0,1
								ud_doc_data += "<font style='font-size:5px;'>" + v1.title + "<br></font>";
								
								if(jQuery.type(v1.PARAGRAPH)=="array"){
									var list2 = v1.PARAGRAPH;
									$.each(list2,function(index,value){
										ud_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
										console.log(ee_doc_data); 
									});
								}
								
								
							});
						}
						else{
							$.each(result.response.body.items.item.UD_DOC_DATA.DOC.SECTION.ARTICLE,function(i1,v1){  //v=paragraph,title
								var i = 1;
									if(i1=='PARAGRAPH'){
									if(jQuery.type(v1) == "array"){
										list = v1;
										$.each(list,function(index,value){
											ud_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
											console.log(ee_doc_data); 
										});	
									}
									else{
										ud_doc_data += "<"+v1.tagName + ">" + v1.content + "</"+v1.tagName + ">";
										console.log(ee_doc_data); 
									}				
								}else{
									if(result.response.body.items.item.UD_DOC_DATA.DOC.SECTION.ARTICLE.title){
										var ud = ud_doc_data.split("</h5>");
										ud_doc_data = ud[0] + "</h5>" + i +"."+v1 + "<br>" + ud[1]; 
										i = i+1;
									}
								}
							});
						}
					}
				});
				console.log(result.response.body.items.item); 
				/*                  
	           	 	console.log(result.response.body.items.item.ITEM_NAME);		//제품명
	           	 	console.log(result.response.body.items.item.MAIN_ITEM_INGR);		//성분
	           	 	console.log(result.response.body.items.item.MATERIAL_NAME);		//함량
	           	 	console.log(result.response.body.items.item.INGR_NAME);		//첨가제
	           	 	console.log(result.response.body.items.item.ETC_OTC_CODE);		//전문/일반
	           	 	console.log(result.response.body.items.item.ENTP_NAME);  //제조/수입사
	           	 	console.log(result.response.body.items.item.CHART);  //성상
	           	 	console.log(result.response.body.items.item.ITEM_PERMIT_DATE);  //허가일
	           	 	console.log(result.response.body.items.item.PACK_UNIT);  //포장단위
	           	 	console.log(result.response.body.items.item.STORAGE_METHOD);  //저장방법
	           	 	console.log(result.response.body.items.item.VALID_TERM);  //유효기간//완제/원료구분/업종구분
	           	 	console.log(result.response.body.items.item.MAKE_MATERIAL_FLAG);  //완제/원료구분
	           	 	console.log(result.response.body.items.item.INDUTY_TYPE);  //업종구분 */
	           	 	
	           	 var material = (result.response.body.items.item.MATERIAL_NAME).split('|');
				
	           $("#infotable").empty();
	           $('#modal-div1').empty();
	           $('#modal-div2').empty();
	           $('#modal-div3').empty();
	           $('#modal-p1').empty();
	           $('#modal-p2').empty();
	           $('#modal-p3').empty();
	           var tbody = $('<tbody></tbody>');
	           var tr_1 = $('<tr></tr>');
	           tr_1.append('<th style="border: 2px soild black;">제품명</th>');
	           tr_1.append('<td colspan="2" id="result_drug_name">'+result.response.body.items.item.ITEM_NAME+'</td>');
			   tr_1.append('<td><img id="idfy_img_small" src="'+img1+'" alt="식별 이미지" onclick="" style="height: 123px;"></td>');
	           tbody.append(tr_1);
	           
	           var tr_2 = $('<tr></tr>');
	           tr_2.append('<th>성분 / 함량</th>');
	           tr_2.append('<td colspan="3"><ul id="ingr_mg">'+result.response.body.items.item.MAIN_ITEM_INGR+' <br> '+material[0]+'</ul></td>');
			   tbody.append(tr_2);
			   var tr_3 = $('<tr></tr>');
			   tr_3.append('<th>첨가제</th>');
			   tr_3.append('<td colspan="3" class="additives" id="additives_td"><ul id="additives">'+result.response.body.items.item.INGR_NAME+'</ul></td>');
			   tbody.append(tr_3);
			   var tr_4 = $('<tr></tr>');
			   tr_4.append('<th>전문 / 일반</th>');		
			   tr_4.append('<td>'+result.response.body.items.item.ETC_OTC_CODE+'</td>');	   
			   tr_4.append('<th>단일 / 복합</th>');		
			   tr_4.append('<td id="sunb_count">단일</td>');
			   tbody.append(tr_4);
			   var tr_5 = $('<tr></tr>');	 
			   tr_5.append('<th>제조 / 수입사</th>');
			   tr_5.append('<td style="width: 130px;">'+result.response.body.items.item.ENTP_NAME+'</td>');
			   tr_5.append('<th>유효기간</th>');
			   tr_5.append('<td>'+result.response.body.items.item.VALID_TERM+'</td>');
			   tbody.append(tr_5);
               var tr_6 = $('<tr></tr>');
               tr_6.append('<th>완제/원료</th>');
               tr_6.append('<td id="drug_form">'+result.response.body.items.item.MAKE_MATERIAL_FLAG+'</td>');
			   tr_6.append('<th>업종구분</th>');  
			   tr_6.append('<td id="dosage_route">'+result.response.body.items.item.INDUTY_TYPE+'</td>');
			   tbody.append(tr_6);
			   var tr_7 = $('<tr></tr>');
			   tr_7.append('<th>성상</th>');
			   tr_7.append('<td colspan="3" id="charact">'+result.response.body.items.item.CHART+'</td>');
			   tbody.append(tr_7);
			   var tr_8 = $('<tr></tr>');
			   tr_8.append('<th>허가일</th>');
			   tr_8.append('<td colspan="3">'+result.response.body.items.item.ITEM_PERMIT_DATE+'</td>');
			   tbody.append(tr_8);
	           var tr_9 = $('<tr></tr>');
	           tr_9.append('<th>포장단위<br>(식약처 기준)</th>');
	           tr_9.append('<td colspan="3" class="br0" id="drug_box">'+result.response.body.items.item.PACK_UNIT+'</td>');
	           tbody.append(tr_9);
	           var tr_10 = $('<tr></tr>');
	           tr_10.append('<th class="bb0">저장방법</th>');
	           tr_10.append('<td colspan="4" class="bb0 br0" id="stmt">'+result.response.body.items.item.STORAGE_METHOD+'</td>');
			   tbody.append(tr_10);
			   
				var ee = ee_doc_data.split('</h5>');
				ee[0] = ee[0] + "</h5>";
				var nb = nb_doc_data.split('</h5>');
				nb[0] = nb[0] + "</h5>";
				var ud = ud_doc_data.split('</h5>');
				ud[0] = ud[0] + "</h5>";
				
				
				$("#infotable").append(tbody);	
				$('#modal-p1').append(ee[0]);
				$('#modal-div1').append(ee[1]);
				
				$('#modal-p2').append(nb[0]);
				$('#modal-div2').append(nb[1]);
				
				$('#modal-p3').append(ud[0]);
				$('#modal-div3').append(ud[1]);
				/* var ee_doc_data="";
				var nb_doc_data="";
				var ud_doc_data=""; */
						
				$("#pillInfoDIV").modal("show");
				
 			}//suc
 		});//ajax
	}//getpillAPI
	
	function getImg(pi_no){
		$.ajax({
			  url     : '${pageContext.request.contextPath}/user/medical/pillInfo.do',
	          type    : 'post',
	          dataType: 'json',
	          async : false,
	          data : {'pi_no':pi_no},
	          success : function(result1) { 
				  img1 = result1.pillInfo.pi_bigimg;
			  }
			});
		}
	
	
	$(function() {
		$('#cancleBTN').on('click',function(){
			$('#pname').val('');
			$('#cname').val('');
			$("input:checkbox[name='shapes']").prop("checked", false);
			$("input:checkbox[name='colors']").prop("checked", false);
			$("input:checkbox[name='lines']").prop("checked", false);
			$("input[name='shapes']").removeClass('li_selected');
			$("input[name='colors']").removeClass('li_selected');
			$("input[name='lines']").removeClass('li_selected');
			var div = document.getElementByName('shapes');
			for(i in div){ i.removeClass('li_selected'); }
			
		});
		$('.list tr').on('click', function() {
			var pi_no = $(this).find('input').val();
			getpillAPI(pi_no);
		});
		/* $('.list tr').click(function(){
			var pi_no = $(this).find('input').val();
			alert(pi_no);
			//$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardView.do?bo_no=' + bo_no + '&rnum=' + rnum);
		}); */
		$('.idty li').click(function() {
			if ($(this).hasClass('li_selected')) {
				$(this).removeClass('li_selected');
				$(this).find('input[type="checkbox"]').prop("checked", false);
			} else {
				$(this).addClass('li_selected');
				$(this).find('input[type="checkbox"]').prop("checked", true);
			}
		})
		$('#searchBTN')
				.click(
						function() {
							/* $('.pagination li').click(function(){
								$(this).find('font').addClass('clickPagination');
							}); */
							var shapes = [];
							var colors = [];
							var lines = [];
							var pname = $("input[id='pname']").val();
							var cname = $("input[id='cname']").val();
							$('input[name="shapes"]:checked').each(function(i) {
								shapes.push($(this).val());
							});
							$('input[name="colors"]:checked').each(function(i) {
								colors.push($(this).val());
							});
							$('input[name="lines"]:checked').each(function(i) {
								lines.push($(this).val());
							});
							$
									.ajax({
										url : '${pageContext.request.contextPath}/user/medical/searchPillJson.do',
										type : 'post',
										dataType : 'json',
										data : {
											'shapes' : shapes,
											'colors' : colors,
											'pname' : pname,
											'cname' : cname,
											'lines' : lines
										},
										success : function(result) {
											$('.list').empty();
											$('#paginationDIV').empty();
											$('#paginationDIV').append(
													result.pagination);
											$
													.each(
															result.list,
															function(index,
																	item) {
																var newTr = $('<tr data-timestamp="1509426000" data-status="3" style="height: 60px;"></tr>');
																newTr
																		.append('<input type="hidden" value="'+item.pi_no+'"/>');
																newTr
																		.append('<td class="" style="height: 60px;"><img alt="" src="'+item.pi_bigimg+'" style="width: 96px; height: 71px;"></td>');
																var fmark = item.pi_f_mark;
																var bmark = item.pi_b_mark;
																if (fmark == null) {
																	fmark = " ";
																}
																if (bmark == null) {
																	bmark = " ";
																}
																var mark = fmark
																		.concat("/");
																mark = mark
																		.concat(bmark);
																newTr
																		.append('<td class="" style="height: 60px; text-align:center; ">'
																				+ mark
																				+ '</td>');
																newTr
																		.append('<td class="" style="height: 60px;">'
																				+ item.pi_shape_name
																				+ '</td>');
																newTr
																		.append('<td class="" style="height: 60px;">'
																				+ item.pi_x_size
																				+ '</td>');
																newTr
																		.append('<td class="" style="height: 60px;">'
																				+ item.pi_y_size
																				+ '</td>');
																newTr
																		.append('<td class="" style="height: 60px;">'
																				+ item.pi_z_size
																				+ '</td>');
																newTr
																		.append('<td class="" style="height: 60px;">'
																				+ item.pi_name
																				+ '</td>');
																newTr
																		.append('<td class="" style="height: 60px;">'
																				+ item.pi_b_name
																				+ '</td>');
																$('.list')
																		.append(
																				newTr);
															})
											$('.list tr').on(
													'click',
													function() {
														var pi_no = $(this)
																.find('input')
																.val();
														getpillAPI(pi_no);
													});
										}
									});
						})
	});
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
			<div class="row" style="width: 1300px; ">
			
				<!-- Tab gradient -->
				<div class="" style="width:1300px;  height:1300px;">
					<ul class="nav nav-tabs tab-dark">
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#tab-6-1">복용관리 </a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-6-2" onclick="pillFirst();"> 알약정보 </a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-6-3"> 내 주변 병원/약국 위치 </a> </li>
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
							<div class="" style="width:1300px;">	<!-- 알약정보 -->		
	<div>
		<form id="searchForm" style="margin-bottom: 50px; width:1300px; margin-left: 0%;">
			<table id="searchTable" style=" width:1300px;">
				<tbody>
					<tr>
						<th>제품명</th>
						<td><input type="text" id="pname" name="" style="border: 1px solid #d2d2d2 !important;"></td>
						<th style="width: 100px;">회사명</th>
						<td><input type="text" id="cname" name="" style="border: 1px solid #d2d2d2 !important;"></td>
					</tr>
					<tr>
						<th>모양</th>
						<td colspan="3" class="shape">
							<ul id="shapeids" class="idty">
								<li id="" class="li_style">
								<img src="${pageContext.request.contextPath }/images/pills/shape01.jpg"
									alt="원형"><input type="checkbox" name="shapes" value="원형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape02.jpg"
									alt="타원형"><input type="checkbox" name="shapes"
									value="타원형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape07.jpg"
									alt="장방형"><input type="checkbox" name="shapes"
									value="장방형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape03.jpg"
									alt="반원형"><input type="checkbox" name="shapes"
									value="반원형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape04.jpg"
									alt="삼각형"><input type="checkbox" name="shapes"
									value="삼각형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape05.jpg"
									alt="사각형"><input type="checkbox" name="shapes"
									value="사각형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape06.jpg"
									alt="마름모형"><input type="checkbox" name="shapes"
									value="마름모형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape10.jpg"
									alt="오각형"><input type="checkbox" name="shapes"
									value="오각형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape08.jpg"
									alt="육각형"><input type="checkbox" name="shapes"
									value="육각형"></li>
								<li id="" class="li_style"><img
									src="${pageContext.request.contextPath }/images/pills/shape09.jpg"
									alt="팔각형"><input type="checkbox" name="shapes"
									value="팔각형"></li>
							</ul>
						</td>
					</tr>
					<tr id="color">
						<th>색상</th>
						<td colspan="3" class="idty_td8">
							<ul id="colorids" class="idty">
								<li id="color_white" class="li_style" onclick=""><a><span
										class="white" style="background: rgba(255, 255, 255, 0.87);"></span>하양</a><input
									type="checkbox" name="colors" value="하양"></li>
								<li id="color_yellow" class="li_style"><a onclick=""><span
										class="yellow" style="background: yellow"></span>노랑</a><input
									type="checkbox" name="colors" value="노랑"></li>
								<li id="color_orange" class="li_style"><a onclick=""><span
										class="orange" style="background: orange"></span>주황</a><input
									type="checkbox" name="colors" value="주황"></li>
								<li id="color_pink" class="li_style"><a onclick=""><span
										class="pink" style="background: pink"></span>분홍</a><input
									type="checkbox" name="colors" value="분홍"></li>
								<li id="color_red" class="li_style"><a onclick=""><span
										class="red" style="background: red"></span>빨강</a><input
									type="checkbox" name="colors" value="빨강"></li>
								<li id="color_brown" class="li_style"><a onclick=""><span
										class="brown" style="background: brown"></span>갈색</a><input
									type="checkbox" name="colors" value="갈색"></li>
								<li id="color_ygreen" class="li_style"><a onclick=""><span
										class="ygreen" style="background: yellowgreen"></span>연두</a><input
									type="checkbox" name="colors" value="연두"></li>
								<li id="color_green" class="li_style"><a onclick=""><span
										class="green" style="background: green"></span>초록</a><input
									type="checkbox" name="colors" value="초록"></li>
								<li id="color_bgreen" class="li_style"><a onclick=""><span
										class="bgreen" style="background: rgb(00, 97, 70)"></span>청록</a><input
									type="checkbox" name="colors" value="청록"></li>
								<li id="color_blue" class="li_style"><a onclick=""><span
										class="blue" style="background: blue"></span>파랑</a><input
									type="checkbox" name="colors" value="파랑"></li>
								<li id="color_navy" class="li_style"><a onclick=""><span
										class="navy" style="background: navy"></span>남색</a><input
									type="checkbox" name="colors" value="남색"></li>
								<li id="color_wine" class="li_style"><a onclick=""><span
										class="wine" style="background: rgb(245, 140, 245)"></span>자주</a><input
									type="checkbox" name="colors" value="자주"></li>
								<li id="color_purple" class="li_style"><a onclick=""><span
										class="purple" style="background: purple"></span>보라</a><input
									type="checkbox" name="colors" value="보라"></li>
								<li id="color_grey" class="li_style"><a onclick=""><span
										class="grey" style="background: gray"></span>회색</a><input
									type="checkbox" name="colors" value="회색"></li>
								<li id="color_black" class="li_style"><a onclick=""><span
										class="black" style="background: black"></span>검정</a><input
									type="checkbox" name="colors" value="검정"></li>
								<li id="color_transp" class="li_style"><a onclick=""><span
										class="transp"></span>투명</a><input type="checkbox" name="colors"
									value="투명"></li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>분할선</th>
						<td colspan="3">
							<ul id="lineids" class="idty">
								<li id="line_plus" class="li_style"><a onclick=""><img
										src="${pageContext.request.contextPath }/images/pills/line02.jpg"
										alt="(+)형"></a><input type="checkbox" name="lines" value="+"></li>
								<li id="line_minus" class="li_style"><a onclick=""><img
										src="${pageContext.request.contextPath }/images/pills/line03.jpg"
										alt="(-)형"></a><input type="checkbox" name="lines" value="-"></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="border: none;">
							<button class="btn btn-outline-grad btn-block" id="searchBTN" style="color: #37bf74;"
								type="button">검색</button>
						</td>
						<td colspan="2" style="border: none;">
							<button class="btn btn-outline-grad btn-block" id="cancleBTN" style="color: #37bf74;"
								type="button">취소</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>


	<div class="card" style="width: 1300px;">
		<div class="card-body" style="">
			<div id="" class="" >
				<table class="table-list" data-currentpage="1">

					<thead>
						<tr id="table-list-tr">
							<th rowspan="2" style="border: 1px solid #d2d2d2; width: 10% !important;">
								<ul id="list-ul">
									<li>식별이미지</li>
								</ul>
								<i class="caret"></i>
							</th>
							<th rowspan="2" style="border: 1px solid #d2d2d2; width: 10% !important;">
								<ul id="list-ul">
									<li>식별표시(앞/뒤)</li>
								</ul>
								<i class="caret"></i>
							</th>
							<th rowspan="2" style="border: 1px solid #d2d2d2; width: 10% !important;">
								<ul id="list-ul">
									<li>제형</li>
								</ul>
								<i class="caret"></i>
							</th>
							<th colspan="3" style="border: 1px solid #d2d2d2; width: 15% !important;">
								<ul id="list-ul">
									<li>크기(mm)</li>
								</ul>
								<i class="caret"></i>
							</th>
							<th rowspan="2" style="border: 1px solid #d2d2d2; width: 40% !important;">
								<ul id="list-ul">
									<li>제품명/성분명</li>
								</ul>
								<i class="caret"></i>
							</th>
							<th rowspan="2" style="border: 1px solid #d2d2d2; width: 15% !important;">
								<ul id="list-ul">
									<li>회사명</li>
								</ul>
								<i class="caret"></i>
							</th>
						</tr>
						<tr id="table-list-tr">
							<th style="border: 1px solid #d2d2d2; width: 50px;"><ul
									id="list-ul">
									<li>장축</li>
								</ul></th>
							<th style="border: 1px solid #d2d2d2; width: 50px;"><ul
									id="list-ul">
									<li>단축</li>
								</ul></th>
							<th style="border: 1px solid #d2d2d2; width: 50px;"><ul
									id="list-ul">
									<li>두께</li>
								</ul></th>
						</tr>
					</thead>

					<!-- IMPORTANT, class="list" must be on tbody -->
					<tbody class="list">

						<c:forEach items="${pillList }" var="pillInfo">
							<tr data-timestamp="1509426000" id="tr_id" data-status="3"
								style="height: 60px;">
								<input type="hidden" value="${pillInfo.pi_no}" />
								<td class="" style="height: 60px;"><img alt=""
									src="${pillInfo.pi_bigimg}" style="width: 96px; height: 71px;"></td>
								<td class="" style="height: 60px; text-align: center;">${pillInfo.pi_f_mark}</td>
								<td class="" style="height: 60px;">${pillInfo.pi_shape_name}</td>
								<td class="" style="height: 60px;">${pillInfo.pi_x_size}</td>
								<td class="" style="height: 60px;">${pillInfo.pi_y_size}</td>
								<td class="" style="height: 60px;">${pillInfo.pi_z_size}</td>
								<td class="" style="height: 60px;">${pillInfo.pi_name}</td>
								<td class="" style="height: 60px;">${pillInfo.pi_b_name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="paginationDIV" style="margin-left: 40%; margin-bottom: 20px;">
		<div>${pagination }</div>
	</div>


	<div class="modal fade text-left" id="pillInfoDIV" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenter"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">알약 정보 상세보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">

					<table class="infotable" id="infotable">						
					</table>
				</div>
				<div style="float: left;">
					<p id="modal-p1" style="margin-left: 15px; margin-right: 15px; margin-top: 5px; margin-bottom: 0px;"></p>
					<div id="modal-div1" style="overflow: auto; height:100px; margin-left: 15px; margin-right: 15px; border: 1px solid #d2d2d2 !important;">				
					</div>
				</div>
				<div style="float: left;">
					<p id="modal-p2" style="margin-left: 15px; margin-right: 15px;  margin-top: 10px; margin-bottom: 0px;"></p>
					<div id="modal-div2" style="overflow: auto; height:180px; margin-left: 15px; margin-right: 15px; border: 1px solid #d2d2d2 !important;">				
					</div>
				</div>
				<div style="float: left;">
					<p id="modal-p3" style="margin-left: 15px; margin-right: 15px;  margin-top: 10px; margin-bottom: 0px;"></p>
					<div id="modal-div3" style="overflow: auto; height:180px; margin-left: 15px; margin-right: 15px; border: 1px solid #d2d2d2 !important;">				
					</div>
				</div>					
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
							</div>
						</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0cb6f2e037b46943623093ec6be0f37&libraries=services,clusterer,drawing"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
						
						
						<div class="tab-pane" id="tab-6-3">
						<div class="" style="width: 1300px; display: flex; justify-content: space-between;">
							<div class="map_wrap" style="width: 1300px;">
								<div id="map"
									style="width: 1300px; border: 1px solid black; height: 500px;"></div>
								<ul id="category">
									<li id="HP8" data-order="2"><span
										class="category_bg pharmacy"></span> 병원</li>
									<li id="PM9" data-order="2"><span
										class="category_bg pharmacy"></span> 약국</li>
								</ul>
							<input type="button" onclick="sample5_execDaumPostcode()" style=" width:100px; z-index:1; position:absolute;top:10px; right:10px;"
									value="주소 검색">
							</div>
						</div>



					</div>
					</div>
				</div>
				
			</div>
			<!-- row end -->
		</div>
	</section>
	<!-- =======================
	tab -->
<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(36.3249282,127.4195606), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var geocoder = new daum.maps.services.Geocoder();
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map); 
		
		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);
		
		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';
		
		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
		
		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);  
		
		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();
		
		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
		    if (target.addEventListener) {
		        target.addEventListener(type, callback);
		    } else {
		        target.attachEvent('on' + type, callback);
		    }
		}
		
		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
		    if (!currCategory) {
		        return;
		    }
		    
		    // 커스텀 오버레이를 숨깁니다 
		    placeOverlay.setMap(null);
		
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true, useMapCenter:true, radius:1000}); 
		}
		
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		        displayPlaces(data);
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
		    } else if (status === kakao.maps.services.Status.ERROR) {
		        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
		    }
		}
		
		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		
		    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		    var order = document.getElementById(currCategory).getAttribute('data-order');
		
		    
		
		    for ( var i=0; i<places.length; i++ ) {
		
		            // 마커를 생성하고 지도에 표시합니다
		            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
		
		            // 마커와 검색결과 항목을 클릭 했을 때
		            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		            (function(marker, place) {
		                kakao.maps.event.addListener(marker, 'click', function() {
		                    displayPlaceInfo(place);
		                });
		            })(marker, places[i]);
		    }
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
		    return marker;
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo (place) {
		    var content = '<div class="placeinfo">' +
		                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
		
		    if (place.road_address_name) {
		        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		    }  else {
		        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		    }                
		   
		    content += '    <span class="tel">' + place.phone + '</span>' + 
		                '</div>' + 
		                '<div class="after"></div>';
		
		    contentNode.innerHTML = content;
		    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		    placeOverlay.setMap(map);  
		}
		
		
		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
		    var category = document.getElementById('category'),
		        children = category.children;
		
		    for (var i=0; i<children.length; i++) {
		        children[i].onclick = onClickCategory;
		    }
		}
		
		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
		    var id = this.id,
		        className = this.className;
		
		    placeOverlay.setMap(null);
		
		    if (className === 'on') {
		        currCategory = '';
		        changeCategoryClass();
		        removeMarker();
		    } else {
		        currCategory = id;
		        changeCategoryClass(this);
		        searchPlaces();
		    }
		}
		
		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
		    var category = document.getElementById('category'),
		        children = category.children,
		        i;
		
		    for ( i=0; i<children.length; i++ ) {
		        children[i].className = '';
		    }
		
		    if (el) {
		        el.className = 'on';
		    } 
		} 
		function sample5_execDaumPostcode() {
			new daum.Postcode({ oncomplete: function(data) { // 각 주소의 노출 규칙에 따라 주소를 조합한다. // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
				var fullAddr = data.address; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수 // 기본 주소가 도로명 타입일때 조합한다.
				if(data.addressType === 'R'){ //법정동명이 있을 경우 추가한다. 
					if(data.bname !== ''){ extraAddr += data.bname; } // 건물명이 있을 경우 추가한다. 
					
					if(data.buildingName !== ''){ extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); } // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); }
					// 주소 정보를 해당 필드에 넣는다. 
					
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results, status) { 
					// 정상적으로 검색이 완료됐으면 
						if (status === daum.maps.services.Status.OK) { 
							var result = results[0]; //첫번째 결과의 값을 활용
							// 해당 주소에 대한 좌표를 받아서 
								x = result.x;
								y = result.y;
								var marker = new kakao.maps.Marker({
								        map: map,
								        position: new kakao.maps.LatLng(y,x) 
								});		
								var coords = new daum.maps.LatLng(result.y, result.x); // 지도를 보여준다.
								mapContainer.style.display = "block";
								map.relayout(); // 지도 중심을 변경한다. 
								map.setCenter(coords); // 마커를 결과값으로 받은 위치로 옮긴다. 

								marker.setPosition(coords);

						}
					}); 
			} }).open(); }
</script>