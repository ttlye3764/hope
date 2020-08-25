<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
</head>

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
	      listWeek: { buttonText: 'D-7' },
	      listMonth: { buttonText: 'D-30' }
	    },

	    headerToolbar: {
	      left: 'title',
	      center: '',
	      right: 'listDay,listWeek,listMonth'
	    },

	    events:(jsonData)
	   
	  });

	  calendar.render();
	}
</script>


<body>
      
<div style=" height: auto; width: 1500px; margin: auto; ">

	<div id='calendar' ></div>
</div>


</body>


<script>


</script>

</html>