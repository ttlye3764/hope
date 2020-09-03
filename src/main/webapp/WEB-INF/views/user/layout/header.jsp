<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
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
						<div class="dropdown">
						  <a class="dropdown-toggle" href="#" role="button" id="dropdownLanguage" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <img class="dropdown-item-icon" src="assets/images/flags/uk.svg" alt=""> English </a>
						  <div class="dropdown-menu mt-2 shadow" aria-labelledby="dropdownLanguage">
						  	<span class="dropdown-item-text">Select language</span>
						  	<div class="dropdown-divider"></div>
						    <a class="dropdown-item" href="#"><img class="dropdown-item-icon" src="assets/images/flags/sp.svg" alt=""> EspaÃ±ol</a>
						    <a class="dropdown-item" href="#"><img class="dropdown-item-icon" src="assets/images/flags/fr.svg" alt=""> FranÃ§ais</a>
						    <a class="dropdown-item" href="#"><img class="dropdown-item-icon" src="assets/images/flags/gr.svg" alt=""> Deutsch</a>
						  </div>
						</div>
						<!-- Top info -->
						<ul class="nav list-unstyled ml-3">
							<li class="nav-item mr-3">
								<a class="navbar-link" href="#"><strong>Phone:</strong> 010-6634-3764</a>
							</li>
							<li class="nav-item mr-3">
								<a class="navbar-link" href="#"><strong>Email:</strong> Notnullove@jobis.com</a>
							</li>
						</ul>
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
						<ul class="social-icons">
							<li class="social-icons-item social-facebook m-0">
								<a class="social-icons-link w-auto px-2" href="#"><i class="fa fa-facebook"></i></a>
							</li>
							<li class="social-icons-item social-instagram m-0">
								<a class="social-icons-link w-auto px-2" href="#"><i class="fa fa-instagram"></i></a>
							</li>
							<li class="social-icons-item social-twitter m-0">
								<a class="social-icons-link w-auto pl-2" href="#"><i class="fa fa-twitter"></i></a>
							</li>
						</ul>
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
					
						<img src="../../image/logo.png" style="width: 100%; height: 100%;"/>
					
					<!-- SVG Logo End -->
				</a>
				<!-- Menu opener button -->
				<button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"> </span>
			  </button>
				<!-- Main Menu Start -->
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav ml-auto">
						<!-- Menu item 1 Demos-->
						<li class="nav-item dropdown active">
							<a class="nav-link dropdown-toggle" href="#" id="demosMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Demos</a>
							<div class="dropdown-menu pb-3 pb-lg-0" aria-labelledby="demosMenu" >
								<div class="d-block d-sm-flex">
									<ul class="list-unstyled w-100 w-sm-50 pr-0 pr-lg-5">
										<li class="dropdown-header">Business Homepages</li>
										<li> <a class="dropdown-item active" href="index.html">Classic Default<span class="badge badge-success ml-2">Hot</span></a> </li>
										<li> <a class="dropdown-item" href="index-2.html">Corporate Start-Up</a> </li>
										<li> <a class="dropdown-item" href="index-3.html">Landing Trendy</a> </li>
										<li> <a class="dropdown-item" href="index-4.html">Portfolio Modern</a> </li>
										<li> <a class="dropdown-item" href="index-5.html">Agency Start-Up</a> </li>
									</ul>
									<ul class="list-unstyled w-100 w-sm-50 pr-0 pr-lg-5">
										<li class="dropdown-header mt-3 mt-sm-0">Classic Homepages</li>
										<li> <a class="dropdown-item" href="index-6.html">Classic Corporate</a> </li>
										<li> <a class="dropdown-item" href="index-7.html">Creative agency</a> </li>
										<li> <a class="dropdown-item" href="index-8.html">Home Elegant</a> </li>
										<li> <a class="dropdown-item" href="index-9.html">Marketplace</a> </li>
										<li> <a class="dropdown-item" href="index-10.html">Personal Portfolio</a> </li>
									</ul>
								</div>
								<!-- mega menu Bottom -->
								<div class="w-100 bg-grad pattern-overlay-2 p-4 mt-3 all-text-white d-none d-lg-flex">
									<div class="align-self-center mr-4">
										<h4 class="mb-0">Checkout the doc!</h4>
										<p class="mb-0 small">For better understanding of theme standard</p>
									</div>
									<a href="https://wizixo.webestica.com/documentation/" target="_blank" class="btn btn-outline-white btn-sm mb-0 align-self-center ml-auto">Read more!</a>
								</div>
							</div>
						</li>
						<!-- Menu item 2 Blog-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="blogMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Medical</a>
							<ul class="dropdown-menu" aria-labelledby="blogMenu">
								<li class="dropdown-submenu">
								
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/medical/medicalListMain.do">복용관리</a>

								</li>
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/medical/medicalMapMain.do">내 주변 병원/약국 위치보기</a>
								</li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/medical/searchPill.do">알약 정보보기</a></li>
								<li class="dropdown-submenu">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/user/medical/coronaMain.do">코로나</a>
								</li>
							</ul>
						</li>
						<!-- 건강관리 -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="pagesMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Health</a>
							<ul class="dropdown-menu" aria-labelledby="pagesMenu">
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/healthImage/healthImageList.do'>운동법 리스트</a></li>
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/healthImage/healthImageWeight.do'>표준몸무게</a></li>
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/healthImage/healthImageMap.do'>내 주변 헬스장</a></li>
							</ul>
						</li>
						
						<!-- 지식 관리 -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="pagesMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Knowledge</a>
							<ul class="dropdown-menu" aria-labelledby="pagesMenu">
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/knowledge/knowledgeList.do'>퀴즈 풀이</a></li>
								<li> <a class="dropdown-item" href='${pageContext.request.contextPath}/user/knowledge/knowledgeList.do'>최신 뉴스</a></li>
							</ul>
						</li>
						<!-- Menu item 4 Portfolio-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="portfolioMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Schedule</a>
							<ul class="dropdown-menu" aria-labelledby="portfolioMenu">
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/schedule/schedule.do">일정관리</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/schedule/dday.do">일정리스트</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/schedule/bis.do">자주타는 버스</a> </li>
								
							</ul>
						</li>
						<!-- Menu item 5 Elements-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="elementsMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Asset management</a>
							<ul class="dropdown-menu" aria-labelledby="portfolioMenu">
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/accountBook/setting.do">거래 등록</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/accountBook/accountList.do">거래 내역 보기</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/">거래 내역 통계</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/">가까운 은행보기</a> </li>
								
							</ul>
						</li>
						<!-- Menu item 6 Docs-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath }/user/diet/dietMain" id="docMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">diet</a>
							<ul class="dropdown-menu" aria-labelledby="docMenu">
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/dietMain">dietMain</a> </li>
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath }/user/diet/diet_my">내꺼</a> </li>
								<li> <a class="dropdown-item" href="https://wizixo.webestica.com/documentation/#installation-section">Gulp</a> </li>
								<li> <a class="dropdown-item" href="https://wizixo.webestica.com/documentation/#edit-section">Customization</a> </li>
								<li> <a class="dropdown-item" href="https://wizixo.webestica.com/documentation/#faqs">FAQs</a> </li>
								<li class="dropdown-divider"></li>
								<li> <a class="dropdown-item" href="http://support.webestica.com/" target="_blank">Support</a> </li>
							</ul>
						</li>
						<!-- Menu item 8 board-->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="blogMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">board</a>
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
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/user/chat/chat.do" id="docMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">chat</a>
							<ul class="dropdown-menu" aria-labelledby="docMenu">
								<li> <a class="dropdown-item" href="${pageContext.request.contextPath}/user/chat/chat">chat</a> </li>
								<li> <a class="dropdown-item" href="https://wizixo.webestica.com/documentation/">Introduction</a> </li>
								<li> <a class="dropdown-item" href="https://wizixo.webestica.com/documentation/#getting-started-section">Directory structure</a> </li>
								<li> <a class="dropdown-item" href="https://wizixo.webestica.com/documentation/#installation-section">Gulp</a> </li>
								<li> <a class="dropdown-item" href="https://wizixo.webestica.com/documentation/#edit-section">Customization</a> </li>
								<li> <a class="dropdown-item" href="https://wizixo.webestica.com/documentation/#faqs">FAQs</a> </li>
								<li class="dropdown-divider"></li>
								<li> <a class="dropdown-item" href="http://support.webestica.com/" target="_blank">Support</a> </li>
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

	

	<div> <a href="#" class="back-top btn btn-grad"><i class="ti-angle-up"></i></a> </div>

	
