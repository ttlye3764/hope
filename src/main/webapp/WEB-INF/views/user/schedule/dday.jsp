<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<script type="text/javascript">

var event = [];
document.addEventListener('DOMContentLoaded', function() {
	 initialView: 'listWeek',
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
  
      },
   });
});


	   
	function setCalendar(data){
	    var jsonData = data;
	   
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    timeZone: 'UTC',
	    initialView: 'listWeek',

	    // customize the button names,
	    // otherwise they'd all just say "list"
	    views: {
	      listDay: { buttonText: 'D-DAY' },
	      listWeek: { buttonText: 'weekend' },
	      listMonth: { buttonText: 'month' }
	    },

	    headerToolbar: {
	      left: 'title',
	      center: '',
	      right: 'listDay,listWeek,listMonth'
	    },

	    events:(jsonData),
	    eventClick: function(info) {
	        alert('Event: ' + info.event.title);
	        alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
	        alert('View: ' + info.view.type);

	        // change the border color just for fun
	        info.el.style.borderColor = 'red';
	      }
	    
	   
	  });

	  calendar.render();
	}
</script>


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

      
<div style=" height: auto; width: 1200px; margin: auto; ">

	<div id='calendar' ></div>
</div>






</html>