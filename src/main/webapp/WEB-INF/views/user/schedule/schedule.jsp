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


<script>

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
                   id : v.s_no
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
    var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
        
        eventClick: function(info) {
           var eventObj = info.event;
               // alert('Clicked : ' + eventObj.title + '//StartDate : ' + eventObj.start + '//EndDate : ' +eventObj.end + '//Id : '+eventObj.id);
               //$('#change-modal [name="s_startdate"]').val(eventObj.start);
               $('#change-modal [name="s_startdate"]').val(moment(eventObj.start).format('YYYY/MM/DD HH:mm:ss'));
               $('#change-modal [name="s_enddate"]').val(moment(eventObj.end).format('YYYY/MM/DD HH:mm:ss'));
               $('#change-modal [name="s_memo"]').val(eventObj.title);
               $('#change-modal [name="s_no"]').val(eventObj.id);
           $("#change-modal").modal("show"); //모달창 띄우기
           
            $('form[name=scheduleChangeForm').submit(function(){
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
              
          $('form[name=scheduleForm]').submit(function(){
                 $(this).attr('action','${pageContext.request.contextPath }/user/schedule/insertScheduleInfo.do');
                 return true;
            });  //서브밋
       },//클릭
       events:(jsonData)
     });//캘린더
     calendar.render();
}

    </script>
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
                        src="${pageContext.request.contextPath }/resources/dist/assets/images/logo-dark.png"
                        alt="" height="18"></span>
                  </a>
               </div>

               <form name="scheduleForm"
                  action="${pageContext.request.contextPath }/user/schedule/insertScheduleInfo.do"
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
                        <input type="checkbox" id="Check"> <label
                           class="custom-control-label">알람</label>
                     </div>
                  </div>
                  
                  <input type="hidden" name="mem_no" value=2>
                  
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
                        src="${pageContext.request.contextPath }/resources/dist/assets/images/logo-dark.png"
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
                        <input type="checkbox" id="Check"> <label
                           class="custom-control-label">알람</label>
                     </div>
                  </div>
                  
                  <input type="hidden" name="mem_no" value=2>
                  <input type="hidden" name="s_no">
                  
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
   $('#change-modal [name="s_startdate"]').datetimepicker();
   $('#change-modal [name="s_enddate"]').datetimepicker();
   $('#regist-modal [name="s_startdate"]').datetimepicker();
   $('#regist-modal [name="s_enddate"]').datetimepicker();

</script>

</html>