<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<!-- Moment -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

</head>
<body>

   <div id='calendar'></div>


   <!-- SignIn modal content -->
   <div id="regist-modal" class="modal fade" tabindex="-1" role="dialog"
      aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-body">
               <div class="text-center mt-2 mb-4">
                  <a href="index.html" class="text-success"> <span><img
                        src="${pageContext.request.contextPath }/resources/html/dist/assets/images/logo-dark.png"
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
                     <div class="custom-control custom-checkbox">
                        <input type="checkbox" id="Check" name="regist-Check"> <label
                           class="custom-control-label">알람</label>
                     </div>
                  </div>
                  
                  <div class="form-group">
                  <input type="hidden" name="s_alerttime">
                  <input type="hidden" name="mem_no">
                  				
				  <div>
					  <label for="name">공유할 아이디:</label>
					  <input class="form-control" type="text" id="id" placeholder="Enter a Id" autocomplete="off">
					  <br> 
					  <button id="btnAdd">Add</button>
			      </div>
					  <br>
					  <label for="list">아이디 리스트:</label>
					  <select class="form-control" id="list" name="list" multiple  style="width:300px;height:100px;">
					  </select>
					  <br> 
					  <button id="btnRemove">삭제</button>
				  </div>    

                  <label>달력 표시 색 설정</label><div><input type="color" id="s_color" name="s_color"></div>
                  <div class="form-group text-center">
                     <button id="regist" class="btn btn-rounded btn-primary"
                        type="submit">regist</button>
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
   <div id="change-modal" class="modal fade" tabindex="-1" role="dialog"
      aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-body">
               <div class="text-center mt-2 mb-4">
                  <a href="index.html" class="text-success"> <span><img
                        src="${pageContext.request.contextPath }/resources/html/dist/assets/images/logo-dark.png"
                        alt="" height="18"></span>
                  </a>
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
                     <div class="custom-control custom-checkbox">
                        <input type="checkbox" id="Check" name="change-Check"> <label
                           class="custom-control-label">알람</label>
                     </div>
                  </div>
                  
                  <input type="hidden" name="mem_no">
                  <input type="hidden" name="s_no">
                  <input type="hidden" name="s_alerttime">
                  

                  
                  <label>달력 표시 색 설정</label><div><input type="color" id="s_color" name="s_color"></div>
                  <div class="form-group text-center">
                     <button id="save" name="save" class="btn btn-rounded btn-primary"
                        type="submit">save</button>
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





</body>

<script>

/*---------------------------------- 공유아이디 ----------------------------------- */
const btnAdd = document.querySelector('#btnAdd');
const btnRemove = document.querySelector('#btnRemove');
const sb = document.querySelector('#list');
const id = document.querySelector('#id');
var name;


//add selected option
btnAdd.onclick = (e) => {
    e.preventDefault();
     $.ajax({
   	   url     : '${pageContext.request.contextPath}/user/schedule/searchId.do',
        type    : 'post',
        dataType: 'json',
        data : {'mem_id':id.value},
        success : function(result) {
	            if(result.memberInfo==null){
					alert("존재하지 않는 아이디 입니다.");
	            }
	            else{
		            alert(result.memberInfo.mem_name+"님 공유 목록에 추가하였습니다.");
	   	    		const option = new Option(result.memberInfo.mem_id+' ', result.memberInfo.mem_id+' ');
	   	    		sb.add(option, undefined);
		        }
        },
        		error : function(request,status,error){
				alert("에러입니다.");
        }
 	}); 
    name.value = '';
};

// remove selected option
btnRemove.onclick = (e) => {
    e.preventDefault();

    // save the selected option
    let selected = [];

    for (let i = 0; i < sb.options.length; i++) {
        selected[i] = sb.options[i].selected;
    }

    // remove all selected option
    let index = sb.options.length;
    while (index--) {
        if (selected[index]) {
            sb.remove(index);
        }
    }
};
/*---------------------------------- 공유아이디 ----------------------------------- */



var event = [];
var sJson;

    document.addEventListener('DOMContentLoaded', function() {    
       
        $.ajax({
             url     : '${pageContext.request.contextPath}/user/schedule/viewJson.do',
             type    : 'post',
             dataType: 'json',
             data : {'mem_no':2},
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
                console.log(result);
                console.log(event);  
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
                return true;
              });  //서브밋 

              
            $('#delete').click(function(){
               location.href='${pageContext.request.contextPath}/user/schedule/deleteSchedule.do?s_no='+eventObj.id;
                return true;
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
          /* themeSystem: 'bootstrap', */
          
          
          dateClick: function(info) {
          $("#regist-modal").modal("show"); //모달창 띄우기

          $('form[name=scheduleForm]').submit(function(e){
        	  e.preventDefault();
        	  
              	
		           var shareId = $("#list option:selected").text(); 
		           var array = shareId.split(" "); //배열로 담기
		           var memNo = [];//memNo를 담을 배열 선언
		           array.pop(); // 뒤에 하나 지우기
		           array.push('user'); // 작성자 mem_id
		           var schedule = new Object();
				   var arrSchedule = new Array();
			           
					 for(var i=0; i<array.length; i++){ //아이디 갯수만큼 반복
						$.ajax({
						   	   url     : '${pageContext.request.contextPath}/user/schedule/searchId.do',
						   	   async : false,
						        type    : 'post',
						        dataType: 'json',
						        data : {'mem_id':array[i]},
						        success : function(result) {
							        console.log("--------------------------"+result.memberInfo.mem_no);
							        alert(result.memberInfo.mem_no);
						        	memNo.push(result.memberInfo.mem_no); //memNo라는 배열에 담았다.

						        	for(var i=0; i<array.length; i++){

										schedule = new Object();
										schedule.mem_no = memNo[i];
										schedule.s_memo = $('#regist-modal [name="s_memo"]').val();
										schedule.s_startdate = $('#regist-modal [name="s_startdate"]').val();
										schedule.s_enddate = $('#regist-modal [name="s_enddate"]').val();
										if($("input:checkbox[name=regist-Check]").is(":checked") == true){ //알람 체크시 알람시간에 시작시간 추가
											schedule.s_alerttime = $('#regist-modal [name="s_startdate"]').val();
								         }
								        schedule.s_color = $('#regist-modal [name="s_color"]').val();
								        arrSchedule.push(schedule);
								        $('#regist-modal [name="mem_no"]').val(arrSchedule[i].mem_no);
								       // location.href='${pageContext.request.contextPath }/user/schedule/insertScheduleInfo.do';
									}

									console.log(arrSchedule);
									console.log(arrSchedule.length);
									console.log(arrSchedule[0].mem_no);
									console.log("----------------");

									

				 					$.ajax({
				 					   	    url     : '${pageContext.request.contextPath}/user/schedule/insertScheduleInfo.do',
				 					        type    : 'post',
				 					        //dataType: 'json',
				 					        contentType : 'application/json',
				 					        data : arrSchedule,
				 					        success : function(result) {
				 						        alert("성공");
				 					        },
				 					        error : function(e){
					 					        console.log(e);
					 					    }	        
				 					 });

						        }
						  	}); 
					  } 

					        				 
                 return true;
            });  //서브밋
       },//클릭
       events:(jsonData)
     });//캘린더
     calendar.render();
}

   $('#change-modal [name="s_startdate"]').datetimepicker();
   $('#change-modal [name="s_enddate"]').datetimepicker();
   $('#regist-modal [name="s_startdate"]').datetimepicker();
   $('#regist-modal [name="s_enddate"]').datetimepicker();



   
</script>

</html>