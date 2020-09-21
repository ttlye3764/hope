<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>






<script>

window.onload = function () {
    if (window.Notification) {
        Notification.requestPermission();
    }
}



function notify(message) {
    if (Notification.permission !== 'granted') {
        alert('notification is disabled');
    }
    else {
        var notification = new Notification(message, {
            icon: 'http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
            body: '클릭하면 스케줄로 들어갑니다',
        });

        notification.onclick = function () {
            window.open('http://localhost/lastProject/user/schedule/schedule.do');
        };
    }
}

function notifymedical(message) {
    if (Notification.permission !== 'granted') {
        alert('notification is disabled');
    }
    else {
        var notification = new Notification(message, {
            icon: 'http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
            body: '클릭하면 약 스케줄로 들어갑니다',
        });

        notification.onclick = function () {
            window.open('http://localhost/lastProject/user/medical/medicalMain.do');
        };
    }
}




function LogOut(){
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/join/logout.do',
		dataType : 'JSON',
		data : {
		},
		success : function(result) {
			location.reload(true);
		}
	});
}


var timer = setInterval(function(){
	   var html;
			   $.ajax({
		           url     : '${pageContext.request.contextPath}/user/schedule/alarm.do',
		           type    : 'post',
		           dataType: 'json',
		           success : function(result) {  
			           for(var i=0; i<result.json.length; i++){
		             		notify(result.json[i].s_memo);
				       }
				       for(var i=0; i<result.medicaljson.length; i++){
							notifymedical(result.medicaljson[i].pill_name);
					   }                    
		           	}
		        });                
		    },60000) //일정 알림주기

// 챗봇스타트

$(function() {

	$('.chatbot').slideToggle(300, 'swing');
	$('.chatbot-message-counter').fadeToggle(300, 'swing');

	$('#live-chat header').on('click', function() {

		$('.chatbot').slideToggle(300, 'swing');
		$('.chatbot-message-counter').fadeToggle(300, 'swing');

	});

	$('.chatbot-close').on('click', function(e) {

		e.preventDefault();
		$('#live-chat').fadeOut(300);

	});
}) 
var chatbotInput;
function sendChatbotBTN(){

	chatbotInput = $('#chatbotInput').val();
	$('#chatbotInput').val("");

	var chatbot_answer = '<div class="chatbot-message clearfix">';
	chatbot_answer += '<img src="http://lorempixum.com/32/32/people" alt="" width="32" height="32">';
	chatbot_answer += '<div class="chatbot-message-content clearfix">';
	chatbot_answer += '<span class="chatbot-time">13:35</span>';
	chatbot_answer += '<h5>${LOGIN_MEMBERINFO.mem_name}</h5>';
	chatbot_answer += '<p>'+chatbotInput+'</p>';
	chatbot_answer += '</div>';
	chatbot_answer += '</div>';
	chatbot_answer += '<hr>';

	$('.chatbot-history').append(chatbot_answer);

	$.ajax({
		url : '${pageContext.request.contextPath}/user/chat/chatbot',
		data : {
			chatbotInput : chatbotInput
			},
		success : function(result){
			
			var chatbot_answer = '<div class="chatbot-message clearfix">';
			chatbot_answer += '<img src="http://lorempixum.com/32/32/people" alt="" width="32" height="32">';
			chatbot_answer += '<div class="chatbot-message-content clearfix">';
			chatbot_answer += '<span class="chatbot-time">13:35</span>';
			chatbot_answer += '<h5>chatbot</h5>';
			chatbot_answer += '<p>'+result.answer+'</p>';
			chatbot_answer += '</div>';
			chatbot_answer += '</div>';
			chatbot_answer += '<hr>';

			$('.chatbot-history').append(chatbot_answer);
		},
		error : function(result){
			alert('챗봇 실패')
		}
	})

}

//챗봇 앤드
		    
</script>


	<div class="preloader">
		<img src="${pageContext.request.contextPath }/resources/template/assets/images/preloader.svg" alt="Pre-loader">
	</div>

	<!-- =======================
	header Start-->
	<header class="header-static navbar-sticky navbar-light">
		<!-- Search -->
		<div class="top-search collapse bg-light" id="search-open" data-parent="#search">
			<div class="container">
				<div class="row position-relative">
					<div class="col-md-8 mx-auto py-5">
						<form>
							<div class="input-group">
								<input class="form-control border-radius-right-0 border-right-0" type="text" name="search" autofocus placeholder="What are you looking for?">
								<button type="button" class="btn btn-grad border-radius-left-0 mb-0">Search</button>
							</div>
						</form>
						<p class="small mt-2 mb-0"><strong>e.g.</strong>Template, Wizixo, WordPress theme </p>
					</div>
					<a class="position-absolute top-0 right-0 mt-3 mr-3" data-toggle="collapse" href="#search-open"><i class="fa fa-window-close"></i></a>
				</div>
			</div>
		</div>
		<!-- End Search -->

		<!-- Navbar top start-->
		<div class="navbar-top d-none d-lg-block">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<!-- navbar top Left-->
					<div class="d-flex align-items-center">
						<!-- Language -->
					</div>

					<!-- navbar top Right-->
					<div class="d-flex align-items-center">
						<!-- Top Account -->
						<div class="dropdown">
							<c:if test="${LOGIN_MEMBERINFO==null}">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/user/join/loginForm.do" role="button" aria-haspopup="true" aria-expanded="false"><i class="ti-user mr-2"></i>로그인</a>
							</c:if>
							<c:if test="${LOGIN_MEMBERINFO!=null}">
							    <a class="dropdown-toggle" href="#" role="button" id="dropdownAccount" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ti-user mr-2"></i>${LOGIN_MEMBERINFO.mem_nickname } </a>
							</c:if>
						  <div class="dropdown-menu mt-2 shadow" aria-labelledby="dropdownAccount">
						  		<a class="dropdown-item" href="${pageContext.request.contextPath}/user/member/checkPassForm.do">나의 정보 관리</a>
						  	<a class="dropdown-item" href="${pageContext.request.contextPath}/user/member/myBoard.do">내가 작성한 게시글</a>
							<a class="dropdown-item" href="javascript:LogOut();">로그아웃</a>
						  </div>
						</div>
						<!-- top social -->
					</div>
				</div>
			</div>
		</div>
		<!-- Navbar top End-->

		<!-- Logo Nav Start -->
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<!-- Logo -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/user/main/mainForm.do">
					<!-- SVG Logo Start -->
					
						<img src="../../image/logo.png" style="width: 80%; height: 80%;"/>
					
					<!-- SVG Logo End -->
				</a>
				<!-- Menu opener button -->
				<button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"> </span>
			  </button>
				<!-- Main Menu Start -->
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav ml-auto">
						<!-- Menu item 2 Blog-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/user/medical/medicalMain.do">복용관리</a>
							<ul class="dropdown-menu" aria-labelledby="blogMenu">
								<li class="dropdown-submenu">
								

									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/medical/medicalMain.doo">알약정보</a>
								</li>
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/medical/medicalMain.do">내 주변 병원/약국</a>

								</li>
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/medical/coronaMain.do">코로나</a>
								</li>
							</ul>
						</li>
						<!-- 건강관리 -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">건강관리</a>
							<ul class="dropdown-menu" aria-labelledby="blogMenu">
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/healthImage/healthImageList.do'>운동법 리스트</a></li>
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/healthImage/healthImageCal.do'>운동 계산기</a></li>
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/healthImage/healthImageMap.do'>내 주변 헬스장</a></li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/menuList?titleName=오늘 당신이 먹은 혹은 먹을 음식의 칼로리를 확인해보세요!">칼로리 사전</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/recommendDiet?titleName=추천 식단을 확인해보세요">추천 식단 리스트</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/diet_my?titleName=나의 식단관리에 대한 모든 것을 확인해보세요!">나의 식단관리</a> </li>
							</ul>
						</li>
						
						<!-- 지식 관리 -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="pagesMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">지식관리</a>
							<ul class="dropdown-menu" aria-labelledby="pagesMenu">
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/knowledge/knowledgeList.do'>퀴즈 풀이</a></li>
							</ul>
						</li>
						<!-- Menu item 4 Portfolio-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/user/schedule/schedule.do" >일정관리</a>
							<ul class="dropdown-menu" aria-labelledby="portfolioMenu">
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/schedule/dday.do">일정리스트</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/schedule/bis.do">버스&지하철</a> </li>
								
							</ul>
						</li>
						
						<!-- 내 차 관리 -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/user/car/carMain.do">내차관리</a>
						</li>
						<!-- Menu item 5 Elements-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="elementsMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">금전관리</a>
							<ul class="dropdown-menu" aria-labelledby="portfolioMenu">
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/accountBook/setting.do">거래 등록</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/accountBook/accountList.do">거래 내역 보기</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/accountBook/accountStatistics.do">거래 내역 통계</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/accountBook/accountMap.do">내 주변 은행</a> </li>
								
							</ul>
						</li>
						<!-- Menu item 6 Docs-->
						<%-- <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath }/user/diet/dietMain" id="docMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">식단관리</a>
							<ul class="dropdown-menu" aria-labelledby="docMenu">
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/dietMain">dietMain</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/dayKcal?titleName=당신에게 맞는 하루 열량과 그에 따른 운동을 확인해보세요!">일일 열량</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/bmi?titleName=당신의 BMI는!!?">BMI 계산기</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/menuList?titleName=오늘 당신이 먹은 혹은 먹을 음식의 칼로리를 확인해보세요!">칼로리 사전</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/recommendDiet?titleName=추천 식단을 확인해보세요">추천 식단 리스트</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/diet_my?titleName=나의 식단관리에 대한 모든 것을 확인해보세요!">나의 식단관리</a> </li>
							</ul>
						</li> --%>
						<!-- Menu item 8 board-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="blogMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
							<ul class="dropdown-menu" aria-labelledby="blogMenu">
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=2">공지사항</a>
								</li>
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=3">건의사항</a>
								</li>
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=1">자유게시판</a>
								</li>
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=4">QNA</a>
								</li>
							</ul>
						</li>
						<!-- Menu item 7 chat-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/user/car/oil.do">가까운 거리</a>
						</li>
						
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/user/chat/chat.do" id="docMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">채팅</a>
							<ul class="dropdown-menu" aria-labelledby="docMenu">
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/chat/chat">채팅하기</a> </li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- Main Menu End -->
				<!-- Header Extras Start-->
				<div class="navbar-nav">
					<!-- extra item Search-->
					<div class="nav-item search border-0 pl-3 pr-0 px-lg-2" id="search">
						<a class="nav-link" data-toggle="collapse" href="#search-open"><i class="ti-search"> </i></a>
					</div>
					<!-- extra item Btn-->
				</div>
				<!-- Header Extras End-->
			</div>
		</nav>
		<!-- Logo Nav End -->
	</header>
	<!-- =======================
	header End-->

	<!-- chatbot start-->
	
	<div id="chatbot-body">
	<div id="live-chat">
		
		<header class="clearfix">
			
			<h4>무엇이든지 물어보세요</h4>

			<span class="chat-message-counter"></span>

		</header>

		<div class="chatbot">
			
			<div class="chatbot-history">
				
				

			</div> <!-- end chat-history -->

			<form action="#" method="post">

				<fieldset>
					
					<input id="chatbotInput" class="chatbotInput" type="text" placeholder="Type your message…" autofocus="">
					

				</fieldset>

			</form>
			<button id="chatbotInputBTN" onclick="sendChatbotBTN();" type="button">보내기</button>
		</div> <!-- end chat -->

	</div>
	</div>
	<!-- chatbot end -->

	<div> <a href="#" class="back-top btn btn-grad"><i class="ti-angle-up"></i></a> </div>

	
