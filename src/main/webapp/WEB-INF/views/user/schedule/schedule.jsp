<%@page import="java.util.Calendar"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


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
<!-- Moment -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Schedule</h1>
					<h6 class="subtitle"> Register your schedule </h6>
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

<div style=" height: auto; width: 1200px; margin: auto; ">
   <div id='calendar'></div>
</div>


   <!-- SignIn modal content -->
   <div id="regist-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
               <div class="text-center mt-2 mb-4">
                  <a href="index.html" class="text-success"> <span><img
                        src="${pageContext.request.contextPath }/resources/html/
                        dist/assets/images/logo-dark.png"
                        alt="" height="18"></span>
                  </a>
               </div>

               <form name="scheduleForm"
                  <%-- action="${pageContext.request.contextPath }/user/schedule/insertScheduleInfo.do" --%>
                  class="pl-3 pr-3">

                  <div class="form-group">
                     <label for="start">시작하는날</label> <input class="form-control"
                        type="text" id="s_startdate" name="s_startdate" autocomplete="off" >
                  </div>

                  <div class="form-group">
                     <label for="end">끝나는날</label> <input class="form-control"
                        type="text" id="s_enddate" name="s_enddate" autocomplete="off" >
                  </div>

                  <div class="form-group">
                     <label for="memo">memo</label> <input name="s_memo" id="s_memo"
                        class="form-control" type="text" required=""
                        placeholder="Enter your memo" autocomplete="off" >
                  </div>

                  <div class="form-group">
                     
                        <input type="checkbox" id="Check" name="regist-Check"> <label
                          >알람</label>
                     
                  </div>
                  
                  <div class="form-group">
                  <input type="hidden" name="s_alerttime">
                  <input type="hidden" name="mem_no">
                  				
				  <div>
<!-- 					  <label for="name">공유할 아이디:</label> -->
<!-- 					    <input class="form-control" type="text" id="id" placeholder="Enter a Id" autocomplete="off"> -->
<!-- 					  <br>  -->
<!-- 					   <button id="btnAdd">Add</button>  -->
			      </div>
					  <br>
					  <label for="list">공유할 친구 리스트:</label>
					  <select class="form-control" id="list" name="list" multiple  style="width:300px;height:100px;">
					  </select>
					  <br> 
<!-- 					  <button id="btnRemove">삭제</button> -->
				  </div>    

                  <label>달력 표시 색 설정</label><div><input type="color" id="s_color" name="s_color"></div>
                  <div class="form-group text-center">
                     <button id="regist" name="regist" class="btn btn-rounded btn-primary"
                        type="button">regist</button> 
                  </div>
               </form>

            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->


   <!-- change modal content -->
   <div id="change-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
               <div class="text-center mt-2 mb-4">
                  
               </div>

               <form name="scheduleChangeForm"   class="pl-3 pr-3">

                  <div class="form-group">
                     <label for="start">시작하는날</label> <input class="form-control"
                        type="text" id="s_startdate" name="s_startdate" autocomplete="off" >
                  </div>

                  <div class="form-group">
                     <label for="end">끝나는날</label> <input class="form-control"
                        type="text" id="s_enddate" name="s_enddate" autocomplete="off" >
                  </div>

                  <div class="form-group">
                     <label for="memo">memo</label> <input name="s_memo" id="s_memo"
                        class="form-control" type="text" required=""
                        placeholder="Enter your memo" autocomplete="off" >
                  </div>

                  <div class="form-group">
                        <input type="checkbox" id="Check" name="change-Check"> <label
                          >알람</label>
                  </div>
                  
                  <input type="hidden" name="mem_no">
                  <input type="hidden" name="s_no">
                  <input type="hidden" name="s_alerttime">
                  

                  
                  <label>달력 표시 색 설정</label><div><input type="color" id="s_color" name="s_color"></div>
                  <div class="form-group text-center">
                     <input id="save" name="save" value="save" class="btn btn-rounded btn-primary"
                        type="submit">
                     <button id="delete" name="delete" class="btn btn-rounded btn-primary"
                        type="button">delete</button>   
                  </div>

               </form>

            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->





<script>

/*---------------------------------- 공유아이디 ----------------------------------- */
const sb = document.querySelector('#list');
const id = document.querySelector('#id');
var name;
$(function(){
	$('#regist').click(function(){
	         var shareId = $("#list option:selected").text(); 
         var array = shareId.split(" "); //배열로 담기
         array.pop(); // 뒤에 하나 지우기
         array.push('${LOGIN_MEMBERINFO.mem_name}'); // 작성자 mem_name
         array.push('${LOGIN_MEMBERINFO.mem_id}'); // 작성자 mem_no
         var schedule = new Object();
		   var arrSchedule = new Array();
			 for(var i=1; i<=array.length; i+=2){ //아이디 갯수만큼 반복
				 $.ajax({
				   	   url     : '${pageContext.request.contextPath}/user/schedule/searchId.do',
				   	   async : false,
				        type    : 'post',
				        dataType: 'json',
				        data : {'mem_id':array[i]},
				        success : function(result) {
					        console.log(result.memberInfo.mem_no); 
							    schedule = new Object();
								schedule.mem_no = result.memberInfo.mem_no;
								schedule.s_memo = $('#regist-modal [name="s_memo"]').val();
								schedule.s_startdate = $('#regist-modal [name="s_startdate"]').val();
								schedule.s_enddate = $('#regist-modal [name="s_enddate"]').val();
								if($("input:checkbox[name=regist-Check]").is(":checked") == true){ //알람 체크시 알람시간에 시작시간 추가
									schedule.s_alerttime = $('#regist-modal [name="s_startdate"]').val();
						         }
						        schedule.s_color = $('#regist-modal [name="s_color"]').val();
						        arrSchedule.push(schedule);
						        $('#regist-modal [name="mem_no"]').val(array[i]); 
				         }
				  	}); 
				  	
			  }

			 $.ajax({
			   	    url     : '${pageContext.request.contextPath}/user/schedule/insertScheduleInfo.do',
			        type    : 'POST',
			        contentType : 'application/json; charset=UTF-8',
			        async: false,
			        data :JSON.stringify(arrSchedule),
			        success : function(result) {
			        }, 
			        error : function(e){
				        console.log(e);
				    }	        
			 });
			location.reload();
       return true;
   });  //서브밋
})
/*---------------------------------- 공유아이디 ----------------------------------- */



var event = [];
var sJson;

    document.addEventListener('DOMContentLoaded', function() {    
       
        $.ajax({
             url     : '${pageContext.request.contextPath}/user/schedule/viewJson.do',
             type    : 'post',
             dataType: 'json',
             data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
             success : function(result) {                      
                $.each(result.json,function(i,v){
                  event.push({
                   title : v.s_memo,
                   start : v.s_startdate,
                   end : v.s_enddate, 
                   id : v.s_no,
                   color : v.s_color
                  });
                });                
                 setCalendar(event);
           }
        });
});


function setCalendar(data){
    var jsonData = data;
    var alerttime;
    var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
        eventClick: function(info) {
           var eventObj = info.event;

	           $.ajax({
		        	 url     : '${pageContext.request.contextPath}/user/schedule/viewJson2.do',
		             type    : 'post',
		             dataType: 'json',
		             data : {'s_no':eventObj.id},
		             success : function(result) {
	  	             substart = (result.json.s_startdate).split("T");
	  	             subend = (result.json.s_enddate).split("T");
	  	           $("input:checkbox[name='change-Check']").prop("checked",false); //초기화
		     	        $('#change-modal [name="s_startdate"]').val(moment(result.json.s_startdate).format('YYYY/MM/DD HH:mm:ss'));
		     	        $('#change-modal [name="s_enddate"]').val(moment(result.json.s_enddate).format('YYYY/MM/DD HH:mm:ss'));
		     	        $('#change-modal [name="s_memo"]').val(result.json.s_memo);
		     	        $('#change-modal [name="s_no"]').val(result.json.s_no);
		     	        $('#change-modal [name="s_color"]').val(result.json.s_color);
		     	        $('#change-modal [name="s_alerttime"]').val(moment(result.json.s_alerttime).format('YYYY/MM/DD HH:mm:ss'));
		     	        $('#change-modal [name="mem_no"]').val(result.json.mem_no);
		     	        if(result.json.s_alerttime != null){
		     	        	$("input:checkbox[name='change-Check']").prop("checked",true); //체크박스 체크
			     	     }
		             }
	  	    	});

	        
	        $("#change-modal").modal("show"); //모달창 띄우기
          
            $('form[name=scheduleChangeForm').submit(function(){
            	if($("input:checkbox[name=change-Check]").is(":checked") == true){ //알람체크 여부 변경
		        	   var startdate = $('#change-modal [name="s_startdate"]').val();
		        	   $('#change-modal [name="s_alerttime"]').val(startdate);	
		       }else{
		            	 $('#change-modal [name="s_alerttime"]').val(""); 
			   }
                $(this).attr('action','${pageContext.request.contextPath }/user/schedule/updateScheduleInfo.do');
              });  //서브밋 

              
            $('#delete').click(function(){
               location.href='${pageContext.request.contextPath}/user/schedule/deleteSchedule.do?s_no='+eventObj.id;
              });  //버튼 클릭
             
         },

         
          initialView: 'dayGridMonth', //초기화면설정
          navLinks: true, 
          weekNumbers: true, //주표시
          selectable: true, //일자선택시 일별로 보이기
          headerToolbar: {
             left: 'prev,next today',
             center: 'title',
             right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          aspectRatio: 2,
          dateClick: function(info) {
              
          $("#regist-modal").modal("show"); //모달창 띄우기
 
       },//클릭
       events:(jsonData)
       
     });//캘린더

     $.ajax({
    	 url     : '${pageContext.request.contextPath}/user/schedule/searchFriends.do',
         type    : 'post',
         dataType: 'json',
         data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
         success : function(result) {
				console.log(result);
	    		 for(var i=0; i<result.json.length; i++){
	    			const option = new Option(result.json[i].mem_name+' '+result.json[i].mem_id+' ');
	    		    sb.add(option, undefined);
	 	   	     }
         }
	});

  	
     calendar.render();
}

   $('#change-modal [name="s_startdate"]').datetimepicker();
   $('#change-modal [name="s_enddate"]').datetimepicker();
   $('#regist-modal [name="s_startdate"]').datetimepicker();
   $('#regist-modal [name="s_enddate"]').datetimepicker();





	
		
		
</script>
