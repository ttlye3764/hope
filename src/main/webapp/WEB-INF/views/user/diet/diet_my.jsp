<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="https://fonts.googleapis.com/css?family=Baloo|Ubuntu"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/myCSS/dietMy.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/myCSS/dietMem.css" />


<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(${pageContext.request.contextPath}/image/food1.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">${param.titleName }</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/user/diet/dietMain"><i class="ti-home"></i> Home</a></li>
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
						<h5 class="widget-title" id="dietSide_h5_my">나의 식단 관리</h5>
						<p class="mb-0"> 나만의 식단 관리를 체험해보세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_dayKcal">일일 열량</h5>
						<p class="mb-0">일일 추천 열량과 운동별 열량 소모량을 확인하세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_menuList">칼로리 사전</h5>
						<p class="mb-0">음식별 칼로리를 확인하세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_recommendDiet">추천 식단 리스트</h5>
						<p class="mb-0"> 회원님에게 맞는 식단표를 확인해보세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_bmi">BMI 계산기</h5>
						<p class="mb-0">회원님의 BMI를 확인해보세요!</p>
					</div>
				</aside>
			<!-- sidebar end -->

			<!-- blog start -->
			<div class="col-md-9 order-first order-lg-first">


				<h5 class="mb-2 mt-5">나의 식단 관리</h5>
				<div class="divider divider-grad"></div>
				<br>

				<h5 class="mb-2 mt-5">내 정보</h5>
				<div class="divider divider-bold"></div>
				<br> <br>

				<div id="div_dietMem">
					<div id="div_dietMem_left" style="overflow: auto;">
						<div class="col-md-6 mb-4" style="width: 390px; !important">
							<h5>최신 등록 내 정보</h5>
							<ul class="list-group list-group-borderless " id="lastDietMem">
								<li class="list-group-item">내 키 : ${dietMemLast.height }</li>
								<li class="list-group-item">몸무게 :
									${dietMemLast.current_weight }</li>
								<li class="list-group-item">목표 몸무게 :
									${dietMemLast.purpose_weight }</li>
								<li class="list-group-item">BMI : ${dietMemLast.bmi }</li>
								<li class="list-group-item">일일 목표 열량 :
									${dietMemLast.day_kcal }</li>
							</ul>
						</div>

						<!-- 내 정보 상세 시작-->
						<div class="col-md-6 mb-5" style="width: 390px; !important">
							<div class="accordion accordion-primary" id="dietMemDetail"
								style="width: 390px; !important">
								<!-- item -->

								<c:forEach items="${dietMemList }" var="dietMemInfo" varStatus="status">
									<div class="accordion-item">
										<div class="accordion-title">
											<a class="h6 mb-0 collapsed" data-toggle="collapse"
												href="#collapse-${status.count }" aria-expanded="false">${dietMemInfo.dm_date }</a>
										</div>
										<div class="collapse" id="collapse-${status.count }"
											data-parent="#dietMemDetail" style="">
											<div class="accordion-content">
												키 : <a class="height">${dietMemInfo.height}</a><br> 체중 : <a class="weight">${dietMemInfo.current_weight}</a><br>
												목표 체중 : <a class="purpose_weight">${dietMemInfo.purpose_weight}</a><br> BMI :
												<a class="bmi">${dietMemInfo.bmi}</a><br> 일일 목표 열량 : <a class="day_kcal">${dietMemInfo.day_kcal}</a><br>
											</div>
											<div>
												<input type="hidden" value="${dietMemInfo.dm_no }">
												<button id="updateDietMemBTN" class="btn btn-grad" onclick="updateDietMemForm(this);">수정</button>
												<button id="deleteDietMemBTN" class="btn btn-grad" onclick="deleteDietMem(this);">삭제</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div id="div_dietMem_right">
						<button id="insertDietMem" class="btn btn-grad"
							onclick="insertDietMemBTN();">등록</button>
					</div>
				</div>
				<!-- 내 정보 상세 끝 -->
				
				<h5 class="mb-2 mt-5">열량 차트</h5>
				<div class="divider divider-bold"></div>
				<!-- goole chart star 구글차트-->
				<div id="Line_Controls_Chart">
					<!-- 라인 차트 생성할 영역 -->
					<div id="lineChartArea" style="padding: 0px 20px 0px 0px;"></div>
					<!-- 컨트롤바를 생성할 영역 -->
					<div id="controlsArea" style="padding: 0px 20px 0px 0px;"></div>
				</div>
				<!-- goole chart end -->

				<h5 class="mb-2 mt-5">나의 식단표</h5>
				<div class="divider divider-bold"></div>
				<br> <br>
				<!-- 달력 시작 -->

				<div id="calender-wrapper"
					style="margin-left: 50px; width: 750px; !important ">
					<div id="calender-title"
						class="disable-select flex row center-v around">
						<div id="left" class="flex row center-vh">
							<span><</span>
						</div>
						<p class="flex row center-vh"></p>
						<div id="right" class="flex row center-vh">
							<span>></span>
						</div>
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
					
				</div>
				<button type="button" id="calendarModal" style="opacity: 0"
					class="btn btn-grad" data-toggle="modal"
					data-target="#exampleModalCenter">Launch demo modal</button>
				

				<!-- 달력 끝 -->
				
				<h5 class="mb-2 mt-5">다이어트 일기장</h5>
				<div class="divider divider-bold"></div>

				<!-- timeLine start -->
				<div class="container">
					<!-- 모달버튼 -->

					<div class="row">
						<div class="col-md-8 text-center mx-auto">
							<h2 class="mb-2">당신의 식단관리에 대한 모든것을 기록해 보세요!!</h2>
							<p class="mb-5">할 수 없었기에 포기했던 것이 아니라 포기했기에 할 수 없었던 것입니다</p>
						</div>
					</div>
					<div id="timelineBtn" style="text-align: right;">
						<button type="button" id="dietBoardControl" onclick="updateDietBoardForm();" class="btn btn-grad">관리</button>
						<button type="button" id="dietBoardAddBtn" onclick="insertDietBoard();" style="opacity:0" disabled="disabled" class="btn btn-grad">추가</button>
					</div>
					<div id="dietBoard_div" >	
					</div>
				</div>
				<!-- timeLine end -->
			</div>
			<!-- blog End -->
		</div>
	</div>
</section>





<!-- 모달 시작 -->
<div class="modal fade text-left show" id="exampleModalCenter"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter"
	style="display: none; padding-right: 15px;" aria-modal="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content"
			style="width: 1000px; height: 900px; overflow: auto; !important">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">식단</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<h3>아침</h3>
				<!-- 테이블 시작 -->
				<div class="table-responsive-sm">
					<table class="table table-hover" id="dietDayInfoTable">
						<thead id="dietDayInfo_thead1">

						</thead>
						<tbody id="dietDayInfo_tbody1">
						</tbody>
					</table>
				</div>
				<!-- 테이블 종료 -->

				<!--  등록 -->
				<div class="col-md-6 mb-5" style="width: 400px; !important">
					<div
						class="accordion accordion-line toggle-icon-left toggle-icon-round"
						id="accordion3">
						<!-- item -->
						<div class="accordion-item" style="width: 400px; !important">
							<div class="accordion-title" style="width: 400px; !important">
								<a class="h6 mb-0" data-toggle="collapse" href="#collapse-1"
									aria-expanded="true">등록</a>
							</div>
							<div class="collapse hide" id="collapse-1"
								data-parent="#accordion3" style="">
								<div class="accordion-content">
									<input type="text" placeholder="메뉴를 입력해주세요" id="menu_search1"
										onchange="menu_search1()">
									<button type="button" class="btn btn-primary"
										id="insert_diet_day1">등록</button>
									<table id="menu_search_result1"></table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="divider divider-dotted"></div>


				<h3>점심</h3>
				<!-- 테이블 시작 -->
				<div class="table-responsive-sm">
					<table class="table table-hover" id="dietDayInfoTable2">
						<thead id="dietDayInfo_thead2">

						</thead>
						<tbody id="dietDayInfo_tbody2">
						</tbody>
					</table>
				</div>
				<!-- 테이블 종료 -->

				<!--  등록 -->
				<div class="col-md-6 mb-5" style="width: 400px; !important">
					<div
						class="accordion accordion-line toggle-icon-left toggle-icon-round"
						id="accordion4">
						<!-- item -->
						<div class="accordion-item" style="width: 400px; !important">
							<div class="accordion-title" style="width: 400px; !important">
								<a class="h6 mb-0" data-toggle="collapse" href="#collapse-2"
									aria-expanded="true">등록</a>
							</div>
							<div class="collapse hide" id="collapse-2"
								data-parent="#accordion4" style="">
								<div class="accordion-content">
									<input type="text" placeholder="메뉴를 입력해주세요" id="menu_search2"
										onchange="menu_search2()">
									<button type="button" class="btn btn-primary"
										id="insert_diet_day2">등록</button>
									<table id="menu_search_result2"></table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="divider divider-dotted"></div>


				<h3>저녁</h3>
				<!-- 테이블 시작 -->
				<div class="table-responsive-sm">
					<table class="table table-hover" id="dietDayInfoTable3">
						<thead id="dietDayInfo_thead3">

						</thead>
						<tbody id="dietDayInfo_tbody3">
						</tbody>
					</table>
				</div>
				<!-- 테이블 종료 -->

				<!--  등록 -->
				<div class="col-md-6 mb-5" style="width: 400px; !important">
					<div
						class="accordion accordion-line toggle-icon-left toggle-icon-round"
						id="accordion5">
						<!-- item -->
						<div class="accordion-item" style="width: 400px; !important">
							<div class="accordion-title" style="width: 400px; !important">
								<a class="h6 mb-0" data-toggle="collapse" href="#collapse-3"
									aria-expanded="true">등록</a>
							</div>
							<div class="collapse hide" id="collapse-3"
								data-parent="#accordion5" style="">
								<div class="accordion-content">
									<input type="text" placeholder="메뉴를 입력해주세요" id="menu_search3"
										onchange="menu_search3()">
									<button type="button" class="btn btn-primary"
										id="insert_diet_day3">등록</button>
									<table id="menu_search_result3"></table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="divider divider-dotted"></div>

				총 열량 :
				<div id="dd_kcal"></div>
			</div>
			<div class="modal-footer">
				<button id="dietInfoComplete" type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/myScript/dietMem.js"></script>
<script type="text/javascript">
var selectMenuName;
var selectMenuNo;
var year;
var month;
var day;
var dd_date;
var dd_no;



// updateDietBoard
function updateDietBoardForm(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/dietBoardList',
		success : function(result){
			if(result.dietBoardList == null){
				alert('등록된게 없습니다.');
			}
		$('#dietBoard_div').empty();
			var dietBoardList="";
			var count = 0;
			
			$.each(result.dietBoardList, function(index, item){
				
				if(Number(item.diet_board_seq)%2 ==0){
					// 0이면 왼쪽	
					dietBoardList += '<div class="row no-gutters" ><input type="hidden" class="diet_board_no" value="'+item.diet_board_no+'">';
					dietBoardList += '<div class="col-md py-2">';
					dietBoardList += '<div class="card">';
					dietBoardList += '<div class="card-body">';
					dietBoardList += '<div class="float-right small">'+item.diet_board_date.split(' ')[0].split('-')[1]+' / '+item.diet_board_date.split(' ')[0].split('-')[2]+'</div>';
					dietBoardList += '<h4 class="mb-2"><textarea class="diet_board_title" style="background-color:transparent">'+item.diet_board_title+'</textarea></h4>';
					dietBoardList += '<p class="mb-0"><textarea class="diet_board_content" style="background-color:transparent">'+item.diet_board_content+'</textarea></p>';
					dietBoardList += '</div>';
					dietBoardList += '</div>';
					dietBoardList += '</div>';
					dietBoardList += '<div class="col-md-1 text-center timeline-line flex-column d-none d-md-flex">';
					dietBoardList += '<div class="timeline-dot"></div>';
					dietBoardList += '</div>';
					dietBoardList += '<div class="col-md"></div>';
					dietBoardList += '</div>';					
				}else{
					// 0이 아니면 오른쪽
					dietBoardList += '<div class="row no-gutters"><input type="hidden" class="diet_board_no" value="'+item.diet_board_no+'">';
					dietBoardList += '<div class="timeline-top"></div>';
					dietBoardList += '<div class="col-md"> </div>';
					dietBoardList += '<div class="col-md-1 text-center timeline-line flex-column d-none d-md-flex">';
					dietBoardList += '<div class="timeline-dot"></div>';
					dietBoardList += '</div>';
					dietBoardList += '<div class="col-md py-2">';
					dietBoardList += '<div class="card">';
					dietBoardList += '<div class="card-body">';
					dietBoardList += '<div class="float-right small">'+item.diet_board_date.split(' ')[0].split('-')[1]+' / '+item.diet_board_date.split(' ')[0].split('-')[2]+'</div>';
					dietBoardList += '<h4 class="mb-2"><textarea class="diet_board_title" style="background-color:transparent">'+item.diet_board_title+'</textarea></h4>';
					dietBoardList += '<p><textarea class="diet_board_content" style="background-color:transparent">'+item.diet_board_content+'</textarea></p>';
					dietBoardList += '</div>';
					dietBoardList += '</div>';
					dietBoardList += '</div>';
					dietBoardList += '</div>';
				}
			})
			$('#dietBoard_div').append(dietBoardList);
			$('#dietBoardControl').text('완료');
			$('#dietBoardControl').attr('onclick', 'updateDietBoardComplete();');
			$('#dietBoardAddBtn').attr('disabled', false);
			$('#dietBoardAddBtn').css('opacity', '100');
			
		},
		error : function(result){
			alert('updateDietBoardForm 실패');
		}
	})
}




//dietBoard
function dietBoardList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/dietBoardList',
		success : function(result){

			$('#dietBoard_div').empty();
			
			var dietBoardList="";	
			
			if(result.dietBoardList.length == 0){
				alert('등록된게 없습니다.');
				dietBoardList += '<div>';
				dietBoardList += '<button type="button" id="dietBoardStartBtn" onclick="insertDietBoardFirst();" class="btn btn-grad">시작하기</button>';
				dietBoardList += '</div>';
				$('#dietBoard_div').append(dietBoardList);
			}else{	
				$.each(result.dietBoardList, function(index, item){
					
					if(Number(item.diet_board_seq)%2 ==0){
						// 0이면 왼쪽	
						dietBoardList += '<div class="row no-gutters">';
						dietBoardList += '<div class="col-md py-2">';
						dietBoardList += '<div class="card">';
						dietBoardList += '<div class="card-body">';
						dietBoardList += '<div class="float-right small">'+item.diet_board_date.split(' ')[0].split('-')[1]+' / '+item.diet_board_date.split(' ')[0].split('-')[2]+'</div>';
						dietBoardList += '<h4 class="mb-2">'+item.diet_board_title+'</h4>';
						dietBoardList += '<p class="mb-0">'+item.diet_board_content+'</p>';
						dietBoardList += '</div>';
						dietBoardList += '</div>';
						dietBoardList += '</div>';
						dietBoardList += '<div class="col-md-1 text-center timeline-line flex-column d-none d-md-flex">';
						dietBoardList += '<div class="timeline-dot"></div>';
						dietBoardList += '</div>';
						dietBoardList += '<div class="col-md"></div>';
						dietBoardList += '</div>';					
					}else{
						// 0이 아니면 오른쪽
						dietBoardList += '<div class="row no-gutters">';
						dietBoardList += '<div class="timeline-top"></div>';
						dietBoardList += '<div class="col-md"> </div>';
						dietBoardList += '<div class="col-md-1 text-center timeline-line flex-column d-none d-md-flex">';
						dietBoardList += '<div class="timeline-dot"></div>';
						dietBoardList += '</div>';
						dietBoardList += '<div class="col-md py-2">';
						dietBoardList += '<div class="card">';
						dietBoardList += '<div class="card-body">';
						dietBoardList += '<div class="float-right small">'+item.diet_board_date.split(' ')[0].split('-')[1]+' / '+item.diet_board_date.split(' ')[0].split('-')[2]+'</div>';
						dietBoardList += '<h4 class="mb-2">'+item.diet_board_title+'</h4>';
						dietBoardList += '<p>'+item.diet_board_content+'</p>';
						dietBoardList += '</div>';
						dietBoardList += '</div>';
						dietBoardList += '</div>';
						dietBoardList += '</div>';
					}
					
				})
				$('#dietBoard_div').append(dietBoardList);
			}

			
			
		},
		error : function(){
			
		}
	})
}



function updateDietBoardComplete(){
	var diet_board_title_class = $('.diet_board_title');
	var diet_board_content_class = $('.diet_board_content');
	var diet_board_no_class = $('.diet_board_no');

	
	var diet_board_list = new Array();
	
	// list<Map<String, String>>
	
	for(var i = 0; i < diet_board_title_class.length; i++){
		var data = new Object();
		data.diet_board_title = diet_board_title_class.eq(i).val();
		data.diet_board_content = diet_board_content_class.eq(i).val();
		data.diet_board_no = diet_board_no_class.eq(i).val();

		diet_board_list.push(data);
	}
	var jsonData = JSON.stringify(diet_board_list) ;
		alert(jsonData);

	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/diet/updateDietBoard',
		contentType : 'application/json; charset=UTF-8',
		async: false,
		data : jsonData,
		success : function(){
			alert('성공');
			dietBoardList();
			$('#dietBoardControl').text('관리');
			$('#dietBoardControl').attr('onclick', 'updateDietBoardForm();');
			$('#dietBoardAddBtn').attr('disalbed', '');
			$('#dietBoardAddBtn').css('opacity', '0');
			
		},
		error : function(){
			alert('실패');
		}
	
	})
	
}


function insertDietBoardFirst(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/insertDietBoardFirst',
		success : function(result){
			updateDietBoardForm();
		},
		erorr : function(result){
			alert('dietBoardInsert 실패');
		}
	})
}

function insertDietBoard(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/insertDietBoard',
		success : function(result){
			updateDietBoardForm();
		},
		erorr : function(result){
			alert('dietBoardInsert 실패');
		}
	})
	
}

//차트
var chartDrowFun = {

 chartDrow : function(e){

     // 보낼 데이터 - mem_no, 

     // 필요한거 dietMem의 dm_date, day_kcal
     
     // diet_day의 dd_kcal 
     var chartData = '';
     //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
     var chartDateformat     = 'MM월dd일';
     //라인차트의 라인 수
     var chartLineCount    = 10;
     //컨트롤러 바 차트의 라인 수
     var controlLineCount    = 10;


     function drawDashboard() {

       var data = new google.visualization.DataTable();
       //그래프에 표시할 컬럼 추가
       data.addColumn('datetime' , '날짜');
       data.addColumn('number'   , '섭취 열량');
       data.addColumn('number'   , '목표 열량');
       

       //그래프에 표시할 데이터
       var dataRow = [];

       for(var i = 0; i < e.dietDayMemList.length; i++){ //데이터 삽입
           
     	  var dd_kcal = e.dietDayMemList[i].dd_kcal;
          var day_kcal = e.dietDayMemList[i].day_kcal;

           dataRow = [new Date(e.dietDayMemList[i].dd_date.split('-')[0], e.dietDayMemList[i].dd_date.split('-')[1] -1,e.dietDayMemList[i].dd_date.split('-')[2], '00'), Number(dd_kcal), Number(day_kcal)];
           data.addRow(dataRow);
       }
         var chart = new google.visualization.ChartWrapper({
           chartType   : 'LineChart',
           containerId : 'lineChartArea', //라인 차트 생성할 영역
           options     : {
                           isStacked   : 'percent',
                           focusTarget : 'category',
                           height          : 500,
                           width           : 1150,
							  chartArea: {left:30,top:20, bottom:50, top : 100},
                           legend          : { position: "top", textStyle: {fontSize: 13}},
                           pointSize        : 5,
                           tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                           hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                               years : {format: ['yyyy년']},
                                                               months: {format: ['MM월']},
                                                               days  : {format: ['dd일']},
                                                               hours : {format: ['HH시']}}
                                                             },textStyle: {fontSize:12}},
             vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
             animation        : {startup: true,duration: 1000,easing: 'in' },
             annotations    : {pattern: chartDateformat,
                             textStyle: {
                             fontSize: 15,
                             bold: true,
                             italic: true,
                             color: '#871b47',
                             auraColor: '#d799ae',
                             opacity: 0.8,
                             pattern: chartDateformat
                           }
                         }
           }
         });

         var control = new google.visualization.ControlWrapper({
           controlType: 'ChartRangeFilter',
           containerId: 'controlsArea',  //control bar를 생성할 영역
           options: {
               ui:{
                     chartType: 'LineChart',
                     chartOptions: {
                     chartArea: {'width': '70%','height' : 130},
                       hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                         gridlines:{count:controlLineCount,units: {
                               years : {format: ['yyyy년']},
                               months: {format: ['MM월']},
                               days  : {format: ['dd일']},
                               hours : {format: ['HH시']}}
                         }}
                     }
               },
                 filterColumnIndex: 0
             }
         });

         var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
         date_formatter.format(data, 0);

         var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
         window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
         dashboard.bind([control], [chart]);
         dashboard.draw(data);

     }
       google.charts.setOnLoadCallback(drawDashboard);

   }
 }



$(function() {
	 //google.charts.load('current', {'packages':['line','controls']});
	  //chartDrowFun.chartDrow(); //chartDrow() 실행
	
	graph();

	dietBoardList();

	$('#dietInfoComplete').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/diet/diet_my');
	})

// 	현재
	displayCalender(currentMonth)
	$("#date").append(new Date);

	$('#insert_diet_day1').on('click', function(){
		if(month < 10){
			month = '0'+month;
		}
		if(day < 10){
			day = '0'+day;
		}
		$.ajax({
	 		url : '${pageContext.request.contextPath}/user/diet/insertAllDietDay',
	 		dataType : 'JSON',
	 		data : {
	 			dd_date : year + '-' + month + '-' + day,
	 			dd_info_division : "1",
		 		menu_no : selectMenuNo,
		 		dd_no : dd_no
	 		},
	 		error : function(result) {
	 			alert(result.status);
	 		},
	 		success : function(result) {
 	 			$('#menu_search1').val("");
 	 			$('#menu_search_result1').empty();
 	 			dietDayInfoList();
	 		}
	 	});
		
	})

	$('#insert_diet_day2').on('click', function(){
		if(month < 10){
			month = '0'+month;
		}
		if(day < 10){
			day = '0'+day;
		}
		$.ajax({
	 		url : '${pageContext.request.contextPath}/user/diet/insertAllDietDay',
	 		dataType : 'JSON',
	 		data : {
	 			dd_date : year + '-' + month + '-' + day,
	 			dd_info_division : "2",
		 		menu_no : selectMenuNo,
		 		dd_no : dd_no
	 		},
	 		error : function(result) {
	 			alert(result.status);
	 		},
	 		success : function(result) {
	 			$('#menu_search2').val("");
 	 			$('#menu_search_result2').empty();
 	 			dietDayInfoList();
	 		}
	 	});	
	})

	$('#insert_diet_day3').on('click', function(){
		if(month < 10){
			month = '0'+month;
		}
		if(day < 10){
			day = '0'+day;
		}
		$.ajax({
	 		url : '${pageContext.request.contextPath}/user/diet/insertAllDietDay',
	 		dataType : 'JSON',
	 		data : {
	 			dd_date : year + '-' + month + '-' + day,
	 			dd_info_division : "3",
		 		menu_no : selectMenuNo,
		 		dd_no : dd_no
	 		},
	 		error : function(result) {
	 			alert(result.status);
	 		},
	 		success : function(result) {
	 			$('#menu_search3').val("");
 	 			$('#menu_search_result3').empty();
 	 			dietDayInfoList();
	 		}
	 	});	
	})
});

function menu_select1(e){
	selectMenuName = $(e).text();
	selectMenuNo = $(e).find('input').val();
	$('#menu_search1').val(selectMenuName);
}

function menu_select2(e){
	selectMenuName = $(e).text();
	selectMenuNo = $(e).find('input').val();
	$('#menu_search2').val(selectMenuName);
}

function menu_select3(e){
	selectMenuName = $(e).text();
	selectMenuNo = $(e).find('input').val();
	$('#menu_search3').val(selectMenuName);
}


function calendarModal(e){

	var id = e;

	year = id.split('-')[3];
	month = id.split('-')[2].substring(0,1);
	day = id.split('-')[1];

	if(month <10){
		month = '0'+month;
	}
	if(day < 10){
		day = '0'+day;
	}
	
	dd_date = year + '-' + month + '-' + day;
	
	dietDayInfoList();



	$('#calendarModal').trigger("click");

}

function menu_search1(){
	var menu_search;
	
	$.ajax({
 		url : '${pageContext.request.contextPath}/user/diet/menuSearch',
 		dataType : 'JSON',
 		data : {
 			menu_search : $('#menu_search1').val()
 		},
 		error : function(result) {
 			alert(result.status);
 		},
 		success : function(result) {
 	 		
 			$('#menu_search_result1').empty();

 			$('#menu_search_result1').append('<tr>')
 			$('#menu_search_result1').append('<th>메뉴</td>');
 			$('#menu_search_result1').append('<th>칼로리</td>');
 			$('#menu_search_result1').append('</tr>');
 			
 			$.each(result.menuSearchList, function(index, item){
 				$('#menu_search_result1').append('<tr>');
 				$('#menu_search_result1').append('<td onclick="menu_select1(this)"><input type="hidden" value="'+item.menu_no+'">'+item.menu_name+'</td>');
 				$('#menu_search_result1').append('<td><input type="hidden" value="'+item.menu_no+'">'+item.menu_kcal+'</td>');
 				$('#menu_search_result1').append('</tr>');	 
 			 });

 			
 		}
 	});	
}
function menu_search2(){
	var menu_search;
	$.ajax({
 		url : '${pageContext.request.contextPath}/user/diet/menuSearch',
 		dataType : 'JSON',
 		data : {
 			menu_search : $('#menu_search2').val()
 		},
 		error : function(result) {
 			alert(result.status);
 		},
 		success : function(result) {
 			$('#menu_search_result2').empty();

 			$('#menu_search_result2').append('<tr>')
 			$('#menu_search_result2').append('<th>메뉴</td>');
 			$('#menu_search_result2').append('<th>칼로리</td>');
 			$('#menu_search_result2').append('</tr>');
 			
 			$.each(result.menuSearchList, function(index, item){
 				$('#menu_search_result2').append('<tr>');
 				$('#menu_search_result2').append('<td onclick="menu_select2(this)"><input type="hidden" value="'+item.menu_no+'">'+item.menu_name+'</td>');
 				$('#menu_search_result2').append('<td><input type="hidden" value="'+item.menu_no+'">'+item.menu_kcal+'</td>');
 				$('#menu_search_result2').append('</tr>');	 
 			 });

 			
 		}
 	});	
}
function menu_search3(){
	var menu_search;
	$.ajax({
 		url : '${pageContext.request.contextPath}/user/diet/menuSearch',
 		dataType : 'JSON',
 		data : {
 			menu_search : $('#menu_search3').val()
 		},
 		error : function(result) {
 			alert(result.status);
 		},
 		success : function(result) {
 			$('#menu_search_result3').empty();

 			$('#menu_search_result3').append('<tr>')
 			$('#menu_search_result3').append('<th>메뉴</td>');
 			$('#menu_search_result3').append('<th>칼로리</td>');
 			$('#menu_search_result3').append('</tr>');
 			
 			$.each(result.menuSearchList, function(index, item){
 				$('#menu_search_result3').append('<tr>');
 				$('#menu_search_result3').append('<td onclick="menu_select3(this)"><input type="hidden" value="'+item.menu_no+'">'+item.menu_name+'</td>');
 				$('#menu_search_result3').append('<td><input type="hidden" value="'+item.menu_no+'">'+item.menu_kcal+'</td>');
 				$('#menu_search_result3').append('</tr>');	 
 			 });

 			
 		}
 	});	
}


function dietDayInfoList(){
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/diet/calendarModal',
		dataType : 'JSON',
		data : {
			dd_date : dd_date
		},
		error : function(result) {
			alert("실패");
		},
		success : function(result) {

			$('#dietDayInfo_thead1').empty();
			$('#dietDayInfo_tbody1').empty();
			$('#dietDayInfo_thead2').empty();
			$('#dietDayInfo_tbody2').empty();
			$('#dietDayInfo_thead3').empty();
			$('#dietDayInfo_tbody3').empty();
			
			var itemIndex = 1;
			
 			dd_no = result.dietDay.dd_no;

			$('#dietDayInfo_thead1').append('<tr>');
			$('#dietDayInfo_thead1').append('<th scope="col">#</th>');
			$('#dietDayInfo_thead1').append('<th scope="col">메뉴</th>');
			$('#dietDayInfo_thead1').append('<th scope="col">칼로리</th>');
			$('#dietDayInfo_thead1').append('<th scope="col"></th>');

			$('#dietDayInfo_thead2').append('<tr>');
			$('#dietDayInfo_thead2').append('<th scope="col">#</th>');
			$('#dietDayInfo_thead2').append('<th scope="col">메뉴</th>');
			$('#dietDayInfo_thead2').append('<th scope="col">칼로리</th>');
			$('#dietDayInfo_thead2').append('<th scope="col"></th>');

			$('#dietDayInfo_thead3').append('<tr>');
			$('#dietDayInfo_thead3').append('<th scope="col">#</th>');
			$('#dietDayInfo_thead3').append('<th scope="col">메뉴</th>');
			$('#dietDayInfo_thead3').append('<th scope="col">칼로리</th>');
			$('#dietDayInfo_thead3').append('<th scope="col"></th>');

			if(result.dietDayInfoList1 != null){
				$.each(result.dietDayInfoList1, function(index, item){
	 				$('#dietDayInfo_tbody1').append('<tr>')
	 				$('#dietDayInfo_tbody1').append('<td><input type="hidden" value="'+item.dd_no +'">'+itemIndex++ +'</td>'); 				
	 				$('#dietDayInfo_tbody1').append('<td>'+item.menu_name+'</td>');
	 				$('#dietDayInfo_tbody1').append('<td>'+item.menu_kcal+'</td>');
	 				$('#dietDayInfo_tbody1').append('<td><button class="btn btn-success" onclick="menu_delete1(this)"><input type="hidden" value="'+item.ddi_no +'">삭제</button></td>');
	 				$('#dietDayInfo_tbody1').append('</tr>');
	 			 });
			}

			if(result.dietDayInfoList2 != null){
				$.each(result.dietDayInfoList2, function(index, item){
	 				$('#dietDayInfo_tbody2').append('<tr>')
	 				$('#dietDayInfo_tbody2').append('<td><input type="hidden" value="'+item.dd_no +'">'+itemIndex++ +'</td>'); 				
	 				$('#dietDayInfo_tbody2').append('<td>'+item.menu_name+'</td>');
	 				$('#dietDayInfo_tbody2').append('<td>'+item.menu_kcal+'</td>');
	 				$('#dietDayInfo_tbody2').append('<td><button class="btn btn-success" onclick="menu_delete2(this)"><input type="hidden" value="'+item.ddi_no +'">삭제</button></td>');
	 				$('#dietDayInfo_tbody2').append('</tr>')	 
	 			 });	
			}

			if(result.dietDayInfoList3 != null){
				$.each(result.dietDayInfoList3, function(index, item){
	 				$('#dietDayInfo_tbody3').append('<tr>')
	 				$('#dietDayInfo_tbody3').append('<td><input type="hidden" value="'+item.dd_no +'">'+itemIndex++ +'</td>'); 				
	 				$('#dietDayInfo_tbody3').append('<td>'+item.menu_name+'</td>');
	 				$('#dietDayInfo_tbody3').append('<td>'+item.menu_kcal+'</td>');
	 				$('#dietDayInfo_tbody3').append('<td><button class="btn btn-success" onclick="menu_delete3(this)"><input type="hidden" value="'+item.ddi_no +'">삭제</button></td>');
	 				$('#dietDayInfo_tbody3').append('</tr>');	 
	 			 });
			}
			
 			$('#dd_kcal').empty();
 			
			$('#dd_kcal').append('<div>'+result.dietDay.dd_kcal+'</div>');
		}
	});
}


function menu_delete1(e){
	ddi_no = $(e).find('input').val();
	
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/diet/deleteDietDayInfo',
		dataType : 'JSON',
		data : {
			ddi_no : ddi_no,
			dd_info_division : "1",
			dd_no : dd_no
		},
		error : function(result) {
			alert("실패");
		},
		success : function(result) {
			dietDayInfoList();
		}
	});
}

function menu_delete2(e){
	ddi_no = $(e).find('input').val();
	
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/diet/deleteDietDayInfo',
		dataType : 'JSON',
		data : {
			ddi_no : ddi_no,
			dd_info_division : "2",
			dd_no : dd_no
		},
		error : function(result) {
			alert("실패");
		},
		success : function(result) {
			dietDayInfoList();
		}
	});
}

function menu_delete3(e){
	ddi_no = $(e).find('input').val();
	
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/diet/deleteDietDayInfo',
		dataType : 'JSON',
		data : {
			ddi_no : ddi_no,
			dd_info_division : "3",
			dd_no : dd_no
		},
		error : function(result) {
			alert("실패");
		},
		success : function(result) {
			dietDayInfoList();
		}
	});
}



function graph(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/dietMemGraphList',
		error : function(result){
			alert('dietMemGraphList 에러');
		},
		success : function(result){
			

// 			$('#chart_chart').empty();
			
			google.charts.load('current', {'packages':['line','controls']});
			chartDrowFun.chartDrow(result);		
		}
	})	
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

	for (var i = 1; i <= firstDayOffset(new Date()); i++) {
		console.log(firstDayOffset(new Date()));
		$("#calender-content").append("<div class='month flex center-vh'></div>");
	}
	for (var i = 1; i <= days; i++) {
		var day = new Date(currentYear, currentMonth, i).getDay();
		var string = "<div class='month'><div id='" + dayNames[day] + "-" + i + "-" + monthNames[currentMonth] + "-" + currentYear + "'class='month-selector flex center-vh clickable' onclick='calendarModal(this.id)' ><p>" + i + "</p></div></div>";
		$("#calender-content").append(string);
	}

}
function firstDayOffset(date) {
	return new Date(currentYear, currentMonth, 1).getDay();
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