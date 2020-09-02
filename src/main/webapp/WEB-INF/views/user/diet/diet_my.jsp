<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css?family=Baloo|Ubuntu" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/myCSS/dietMy.css" />
<style>
/* body { */
/* 	display: flex; */
/* 	align-items: center; */
/* 	justify-content: center; */
/* 	flex-direction: column; */
/* 	font-family:  "Baloo"; */
/* } */

</style>
    <div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(${pageContext.request.contextPath}/image/food1.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Menu List</h1>
					<h6 class="subtitle">안녕하세요 메뉴 리스트입니다</h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a href="index.html"><i class="ti-home"></i> Home</a></li>
							<li class="breadcrumb-item">Blog</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<section class="blog-page pb-0">
		<div class="container">
			<div class="row">
				<!-- sidebar start -->
				<aside class="col-md-3 sidebar order-last order-md-first">
					<!-- Text Widget -->
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_my">내꺼 내꺼 내</h5>
						<p class="mb-0"> procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_dayKcal">일일 열량</h5>
						<p class="mb-0">R shade in cause.</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_menuList">메뉴 리스트</h5>
						<p class="mb-0">R shade in cause.</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSied_h5_recommendDiet">추천 식단 리스트</h5>
						<p class="mb-0"> procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSied_h5_bmi">BMI 계산기</h5>
						<p class="mb-0">. She procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>
				</aside>
				<!-- sidebar end -->

				<!-- blog start -->
				<div class="col-md-9 order-first order-lg-first">
				
				
				<h5 class="mb-2 mt-5">내꺼 내꺼 내꺼 </h5>
				<div class="divider divider-grad"></div>
				<br>
				
				<h5 class="mb-2 mt-5">내 정보 </h5>
				<div class="divider divider-bold"></div>
				<br>
				<br>
				
				<div class="col-md-6 mb-4">
					<h5>최신 등록 내 정보</h5>
					<ul class="list-group list-group-borderless ">
						<li class="list-group-item">내 키 : ${dietMemLast.height }</li>
						<li class="list-group-item">몸무게 : ${dietMemLast.current_weight }</li>
						<li class="list-group-item">목표 몸무게 : ${dietMemLast.purpose_weight }</li>
						<li class="list-group-item">BMI : ${dietMemLast.bmi }</li>
						<li class="list-group-item">일일 목표 열량 : ${dietMemLast.day_kcal }</li>
					</ul>
				</div>
				
				<!-- 내 정보 상세 시작-->
				<div class="col-md-6 mb-5">
					<div class="accordion accordion-primary" id="accordion2">
						<!-- item -->
						
						<c:forEach items="${dietMemList }" var="dietMemInfo" varStatus="status">
						<div class="accordion-item">
							<div class="accordion-title">
								<a class="h6 mb-0 collapsed" data-toggle="collapse" href="#collapse-${status.count }" aria-expanded="false">${dietMemInfo.dm_date }</a>
							</div>
							<div class="collapse" id="collapse-${status.count }" data-parent="#accordion2" style="">
								<div class="accordion-content">
								키 : <a>${dietMemInfo.height}</a><br>
								체중 : <a>${dietMemInfo.current_weight}</a><br>
								목표 체중 : <a>${dietMemInfo.purpose_weight}</a><br>
								BMI : <a>${dietMemInfo.bmi}</a><br>
								일일 목표 열량 : <a>${dietMemInfo.day_kcal}</a><br>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
				<!-- 내 정보 상세 끝 -->
				<h5 class="mb-2 mt-5">체중 통계 </h5>
				<div class="divider divider-bold"></div>
				
				
				<h5 class="mb-2 mt-5">체중 차트 </h5>
				<div class="divider divider-bold"></div>
				
				<!-- goole chart start-->
				 <div id="curve_chart" style="width: 900px; height: 500px"></div>
				<!-- goole chart end -->
				
				<h5 class="mb-2 mt-5">나의 식단표 </h5>
				<div class="divider divider-bold"></div>
				<br>
				<br>
				<!-- 달력 시작 -->
				
				

<div id="calender-wrapper" style=" margin-left: 50px; width:750px; !important ">
	<div id="calender-title" class="disable-select flex row center-v around">
		<div id="left" class="flex row center-vh"><span><</span></div>
		<p class="flex row center-vh"></p>
		<div id="right" class="flex row center-vh"><span>></span></div>
	</div>
	<div id="days" class="flex row center-vh colorRed disable-select">
		<p>MON</p>
		<p>TUE</p>
		<p>WEDS</p>
		<p>THURS</p>
		<p>FRI</p>
		<p>SAT</p>
		<p>SUN</p>
	</div>
	<div id="calender-content" class="flex row wrap disable-select">
	</div>
	<div id="calender-panel" class="flex row center-v end">
		<div id="info" class="flex column center-vh bgColorDarkRed">
			<div id="info-titles" class="flex row center-vh">
				<p class="flex column center-vh">Start Date</p>
				<p class="flex column center-vh">End Date</p>
			</div>
			<div class="flex row center-vh bgColorRed">
				<p class="flex column center-vh" id="startdate"></p>
				<p class="flex column center-vh" id="enddate"></p>
			</div>
		</div>
		<div id="clear" class="flex column center-vh bgColorDarkRed">
			<p>CLEAR SELECTION</p>
		</div>
	</div>
</div>
	
<div id="calender-buttons" class="flex row center-vh wrap" style=" margin-left: 50px; width:750px; !important ">
	<div id="make-booking" class="flex column center-vh width-half">
		<p>MARK AVAILABLE</p>
	</div>
	<div id="remove-booking" class="flex column center-vh width-half">
		<p>MARK UNAVAILABLE</p>
	</div>
</div>
				
				<!-- 달력 끝 -->
				
				<h5 class="mb-2 mt-5">체중 차트 </h5>
				<div class="divider divider-bold"></div>
				
				<!-- timeLine start -->
					<div class="container">
					<!-- 모달버튼 -->
						<button type="button" id="calendarModal" style="opacity:0" class="btn btn-grad" data-toggle="modal" data-target="#exampleModalCenter">	
					Launch demo modal
					</button>
			<div class="row">
				<div class="col-md-8 text-center mx-auto">
					<h2 class="mb-2">Best solutions for your business!</h2>
					<p class="mb-5">A Full Service Digital Creative Agency Specializing in: Video Production, Web Design, Branding, Brand Strategy, Content Marketing and Aerial Cinematography.</p>
				</div>
			</div>
			<!-- timeline item 1 -->
			<div class="row no-gutters">
				<div class="timeline-top"></div>
				<div class="col-md"> </div>
				<div class="col-md-1 text-center timeline-line flex-column d-none d-md-flex">
					<div class="timeline-dot"></div>
				</div>
				<div class="col-md py-2">
					<div class="card">
						<div class="card-body">
							<div class="float-right small">Jan 9th</div>
							<h4 class="mb-2">Our services reflect our knowledge</h4>
							<p>Wizixo; an innovative Internet marketing solutions company that offers comprehensive web development, SMO services, SEO strategies and various other types of Internet marketing related services.</p>
							<div class="list-group-number list-unstyled list-group-borderless">
								<a href="#" class="list-group-item list-group-item-action"><span>01</span> Creative Ideas</a>
								<a href="#" class="list-group-item list-group-item-action"><span>02</span> Super Responsive for all devices</a>
								<a href="#" class="list-group-item list-group-item-action"><span>03</span> Extensive documentation</a>
								<a href="#" class="list-group-item list-group-item-action"><span>04</span> Excellent features</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- timeline item 2 -->
			<div class="row no-gutters">
				<div class="col-md py-2">
					<div class="card">
						<div class="card-body">
							<div class="float-right small">Jan 10th</div>
							<h4 class="mb-2">An Idea Will Make You Tons Of Cash. Here's How!</h4>
							<p class="mb-0">Sign-up for the lessons and speakers that coincide with your course syllabus. Meet and greet with instructors.</p>
						</div>
						<img class="img-fluid" src="assets/images/service/01.jpg" alt="">
					</div>
				</div>
				<div class="col-md-1 text-center timeline-line flex-column d-none d-md-flex">
					<div class="timeline-dot"></div>
				</div>
				<div class="col-md"></div>
			</div>

			<!-- timeline item 3 -->
			<div class="row no-gutters">
				<div class="col-md"> </div>
				<div class="col-md-1 text-center timeline-line flex-column d-none d-md-flex">
					<div class="timeline-dot"></div>
				</div>
				<div class="col-md py-2">
					<div class="card">
						<div class="card-body">
							<div class="float-right small">Jan 11th</div>
							<h4 class="mb-2">Months had too ham cousin remove far spirit</h4>
						</div>
						<div class="fit-video">
							<div class="fluid-width-video-wrapper" style="padding-top: 56.25%;"><iframe src="https://player.vimeo.com/video/167434033?title=0&amp;byline=0&amp;portrait=0" allowfullscreen="" name="fitvid0"></iframe></div>
						</div>
					</div>
				</div>
			</div>

			<!-- timeline item 4 -->
			<div class="row no-gutters">
				<div class="col-md py-2">
					<div class="card">
						<div class="card-body">
							<div class="float-right small">Jan 12th</div>
							<h4 class="mb-2">7 Great Lessons You Can Learn From Business</h4>
							<p>By expect it result silent in formal of. Ask eat questions abilities described elsewhere assurance. </p>
							<div class="accordion accordion-line toggle-icon-left toggle-icon-round mb-0" id="accordion4">
								<!-- item -->
								<div class="accordion-item">
									<div class="accordion-title">
										<a class="h6 mb-0 collapsed" data-toggle="collapse" href="#collapse-10" aria-expanded="false">How many free samples can i redeem?</a>
									</div>
									<div class="collapse" id="collapse-10" data-parent="#accordion4" style="">
										<div class="accordion-content">Due to the limited quantity, each member's account is only entitled to 1 unique free sample. You can check out up to 4 free samples in each checkout. We take such matters very seriously and will look into individual cases thoroughly. </div>
									</div>
								</div>
								<!-- item -->
								<div class="accordion-item">
									<div class="accordion-title">
										<a class="h6 mb-0 collapsed" data-toggle="collapse" href="#collapse-11" aria-expanded="false">What are the payment methods available?</a>
									</div>
									<div class="collapse" id="collapse-11" data-parent="#accordion4" style="">
										<div class="accordion-content"> At the moment, we only accept Credit/Debit cards and Paypal payments. Paypal is the easiest way to make payments online. While checking out your order. Be sure to fill in correct details for fast &amp; hassle-free payment processing.</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-1 text-center timeline-line flex-column d-none d-md-flex">
					<div class="timeline-dot"></div>
				</div>
				<div class="col-sm"></div>
			</div>

		</div>
		<!-- timeLine end -->
					내 bmi
					
					내 일일 열량
					
					내 식단
					
					내 정보 내 몸무게 / 목표 몸무게
					
					체중 통계
					
					

				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>
	
	
	
	
	
	<!-- 모달 시작 -->
	<div class="modal fade text-left show" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" style="display: none; padding-right: 15px;" aria-modal="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content" style="width:1000px; height:900px; !important">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">식단</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<h3>아침</h3>
									
									<!-- 테이블 시작 -->
									<c:if test="${empty myMenuList1 }">
									등록된 메뉴가 없습니다.
									</c:if>
									<c:if test="${!empty myMenuList1 }">
								<div class="table-responsive-sm">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">메뉴</th>
												<th scope="col">칼로리</th>
											</tr>
										</thead>
										<tbody id="myMenu_tbody">
							<c:forEach items="${myMenuList1 }" var="myMenuInfo">
								<tr>
									<th scope="row" >1</th>
									<td>${myMenuInfo.menu_name }</td>
									<td>${myMenuInfo.menu_kcal }</td> 									
								</tr>
							</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
							<!-- 테이블 종료 -->
									<!--  등록 --> 
									<div class="col-md-6 mb-5" style="width:400px; !important">
				
					<div class="accordion accordion-line toggle-icon-left toggle-icon-round" id="accordion4">
						<!-- item -->
						<div class="accordion-item" style="width:400px; !important">
							<div class="accordion-title" style="width:400px; !important">
								<a class="h6 mb-0" data-toggle="collapse" href="#collapse-10" aria-expanded="true">등록</a>
							</div>
							<div class="collapse hide" id="collapse-10" data-parent="#accordion4" style="">
								<div class="accordion-content"> 
									<input type="text" placeholder="메뉴를 입력해주세요" id="menu_search" onchange="menu_search()">
									<button type="button" class="btn btn-primary" id="insert_diet_day1">등록</button>
									<table id="menu_search_result"></table>
								</div>
							</div>
						</div>
					</div>
				</div>
									<div class="divider divider-dotted"></div>
									
									
									<h3>점심</h3>
									<button type="button" class="btn btn-primary">등록</button>
									<div class="divider divider-dotted"></div>
									
									
									<h3>저녁</h3>
									<button type="button" class="btn btn-primary">등록</button>
									<div class="divider divider-dotted"></div>
									
									총 열량 : 
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">확인</button>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								</div>
							</div>
						</div>
					</div>
	<!-- 모달 끝 -->			
				
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

var selectMenuName;
var selectMenuNo;
var year;
var month;
var day;
$(function() {
	displayCalender(currentMonth)
	$("#date").append(new Date);

	$('#insert_diet_day1').on('click', function(){
		$.ajax({
	 		url : '${pageContext.request.contextPath}/user/diet/insertAllDietDay',
	 		dataType : 'JSON',
	 		data : {
	 			dd_date : year + '-' + month + '-' + day,
	 			dd_info_division : "1",
		 		menu_no : selectMenuNo
	 		},
	 		error : function(result) {
	 			alert(result.status);
	 		},
	 		success : function(result) {

	 		}
	 	});
	})
});

function menu_select(e){
	selectMenuName = $(e).text();
	selectMenuNo = $(e).find('input').val();
	$('#menu_search').val(selectMenuName);
}

function menu_search(){

	var menu_search
	$.ajax({
 		url : '${pageContext.request.contextPath}/user/diet/menuSearch',
 		dataType : 'JSON',
 		data : {
 			menu_search : $('#menu_search').val()
 		},
 		error : function(result) {
 			alert(result.status);
 		},
 		success : function(result) {
 			$('#menu_saerch_result').empty();
 			alert("성공");

 			$('#menu_search_result').append('<tr>')
 			$('#menu_search_result').append('<th>메뉴</td>');
 			$('#menu_search_result').append('<th>칼로리</td>');
 			$('#menu_search_result').append('</tr>');
 			
 			$.each(result.menuSearchList, function(index, item){
 				$('#menu_search_result').append('<tr>');
 				$('#menu_search_result').append('<td onclick="menu_select(this)"><input type="hidden" value="'+item.menu_no+'">'+item.menu_name+'</td>');
 				$('#menu_search_result').append('<td><input type="hidden" value="'+item.menu_no+'">'+item.menu_kcal+'</td>');
 				$('#menu_search_result').append('</tr>');	 
 			 });

 			
 		}
 	});
}
google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }

//       달력
var currentMonth = new Date().getMonth();
var currentYear = new Date().getFullYear();
var clickedDays = 0;
var bookingSteps = 0;
var lastClickedDay;
var startDate = "";
var endDate = "";
var monthNames = ["1월", "2월", "3월", "4월", "5월", "6월",
	"7월", "8월", "9월", "10월", "11월", "12월"
];
var monthShortNames = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
var bookedDates = [];
var selectedDates = [];

Date.prototype.addDays = function(days) {
	var dat = new Date(this.valueOf())
	dat.setDate(dat.getDate() + days);
	return dat;
}
function clearCalender() {
	clickedDays = 0;
	$(".month div").removeClass("clicked");
	$("#startdate").html("");
	$("#enddate").html("");

	startDate = "";
	endDate = "";
	selectedDates = [];
	bookingSteps = 0;
}
function clearBooking() {
	$("#booking-form input").val("");
	$("#booking-form textarea").val("");
	
	$("#booking-wrapper").removeClass("opened");
	$("#make-booking").html("MAKE BOOKING ENQUIRY");
	
	
}
function daysInMonth(month) {
	return new Date(currentYear, month, 0).getDate();
}
function displayCalender() {
	var days = daysInMonth(currentMonth + 1);

	$("#calender-title p").html(monthNames[currentMonth].toUpperCase());
	$("#calender-content").html("");

	for (var i = 1; i < firstDayOffset(new Date()); i++) {
		$("#calender-content").append("<div class='month flex center-vh'></div>");
	}
	for (var i = 1; i <= days; i++) {
		var day = new Date(currentYear, currentMonth, i).getDay();
		var string = "<div class='month'><div id='" + dayNames[day] + "-" + i + "-" + monthNames[currentMonth] + "-" + currentYear + "'class='month-selector flex center-vh clickable' onclick='calendarModal(this.id)' ><p>" + i + "</p></div></div>";
		$("#calender-content").append(string);
	}

	checkSelected();
	checkBookings();
}
// function monthClick(e) {
// 		clickedDays += 1;
		
// 		if (clickedDays == 1) {
// 			$(e).toggleClass("clicked");
// 			startDateIndex = parseInt($(e).attr('id').split('-')[1]);
// 			startDate = new Date(currentYear, currentMonth, startDateIndex);
// 		}
// 		if (clickedDays > 1) {
// 			endDateIndex = parseInt($(e).attr('id').split('-')[1]);
// 			endDate = new Date(currentYear, currentMonth, endDateIndex);
// 		}
// 		if (endDate > startDate) {
// 			var clicked = $(".clicked");
// 			$(clicked).not(clicked[0]).removeClass("clicked");
// 			$(e).toggleClass("clicked");

// 			dateArray = getDates(startDate, endDate);
// 			dateArray = formatDates(dateArray)
// 			selectedDates = dateArray;

// 			for (var i = 0; i < dateArray.length; i++) {
// 				$("#" + dateArray[i]).addClass("clicked");
// 			}
// 		}
// 		$("#startdate").html(startDate.toString().split(' ').slice(0, 4).join(' '));
// 		$("#enddate").html(endDate.toString().split(' ').slice(0, 4).join(' '));
// }
function firstDayOffset(date) {
	return new Date(currentYear, currentMonth, 1).getDay();
}
function checkBookings() {
		
	if (bookedDates != null) {
		for (var i = 0; i < bookedDates.length; i++) {
			var inner = bookedDates[i];
			for (var j = 0; j < inner.length; j++) {
				$("#" + inner[j]).removeClass("clickable").delay(400).addClass("booked");
			}
		}
	}
}
function checkSelected() {
	selectedDates = getDates(startDate, endDate);
	selectedDates = formatDates(selectedDates);
	if (selectedDates != null) {
		for (var i = 0; i < selectedDates.length; i++) {
			$("#" + selectedDates[i]).addClass("clicked");
		}
	}
}
function addBooking() {
	bookedDates.push(dateArray);
	clearCalender();
	displayCalender();
}
function formatDates(dates) {
	if (dates != null) {
		var newDateArray = [];
		for (var i = 0; i < dates.length; i++) {
			var date = "";
			date += dayNames[dates[i].getDay()] + "-";
			date += dates[i].getDate() + "-";
			date += monthNames[dates[i].getMonth()] + "-";
			date += dates[i].getFullYear();
			newDateArray.push(date);
		}
		return newDateArray;
	}
	return null;
}
function getDates(startDate, stopDate) {
	if (startDate != "" && endDate != "") {
		var dateArray = new Array();
		var currentDate = startDate;
		while (currentDate <= stopDate) {
			dateArray.push(new Date(currentDate))
			currentDate = currentDate.addDays(1);
		}
		return dateArray;
	}
	return null;
}



function calendarModal(e){

	var id = e;

	year = id.split('-')[3];
	month = id.split('-')[2].substring(0,1);
	day = id.split('-')[1];
	
	if ( ( id != '') && (id != null))  
	console.log(id)
	
// 	$.ajax({
// 		type : 'POST',
// 		url : '${pageContext.request.contextPath}/user/diet/calendarModal',
// 		dataType : 'JSON',
// 		data : {
// 			calendarDate : $('#mem_name').val()
// 		},
// 		error : function(result) {
// 			alert(result.memberInfo.mem_name);
// 		},
// 		success : function(result) {
// 			alert(result.memberInfo.mem_name);
// 			$('#search_mem_name').val(result.memberInfo.mem_name);
// 		}
// 	});

	$('#calendarModal').trigger("click");

}

$("#left").on("click", function() {
	
	if (currentMonth > 0)
		currentMonth -= 1;
	else {
		currentMonth = 11;
		currentYear -= 1;
	}
	displayCalender();
});
$("#right").on("click", function() {
	if (currentMonth < 11)
		currentMonth += 1;
	else {
		currentMonth = 0;
		currentYear += 1;
	}
	displayCalender();
});
$("#clear").on("click", function() {
	clearCalender();
	clearBooking();
});
$("#make-booking").on("click", function() {
	if(selectedDates != null && selectedDates.length > 0) {
		bookingSteps += 1;
		
		if(bookingSteps == 1) {
			clearBooking();
			addBooking();
		}
	}
});
$("#remove-booking").on("click", function() {
	if(selectedDates != null && selectedDates.length > 0) {
		bookingSteps += 1;
		
		if(bookingSteps == 1) {
			clearBooking();
			addBooking();
		}
	}
});
    </script>