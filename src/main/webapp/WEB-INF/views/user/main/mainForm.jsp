<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<div class="preloader">
		<img src="assets/images/preloader.svg" alt="Pre-loader">
	</div>


	<!-- =======================
	Main Banner -->
	<section class="p-0">
		<div class="swiper-container height-700-responsive swiper-arrow-hover swiper-slider-fade">
			<div class="swiper-wrapper">
				<!-- slide 1-->
				<div class="swiper-slide bg-overlay-dark-2" style="background-image:url(${pageContext.request.contextPath }/resources/template/assets/images/banner/05.jpg); background-position: center center; background-size: cover;">
					<div class="container h-100">
						<div class="row d-flex h-100">
							<div class="col-lg-8 col-xl-6 mr-auto slider-content justify-content-center align-self-center align-items-start text-left">
								<h2 class="animated fadeInUp dealy-500 display-6 display-md-4 display-lg-3 font-weight-bold text-white">We provide personalized service for one person.</h2>
								<h3 class="animated fadeInUp dealy-1000 text-white display-8 display-md-7 alt-font font-italic mb-2 my-md-4">Welcome</h3>
								<div class="animated fadeInUp mt-3 dealy-1500"><a href="#" class="btn btn-grad">Try it Now!</a> <a href="#" class="btn btn-link text-white">Thank you!</a></div>
							</div>
						</div>
					</div>
				</div>
				<!-- slide 2-->
				<div class="swiper-slide bg-overlay-dark-2" style="background-image:url(${pageContext.request.contextPath }/resources/template/assets/images/banner/02.jpg); background-position: center top; background-size: cover;">
					<div class="container h-100">
						<div class="row d-flex h-100">
							<div class="col-md-8 justify-content-center align-self-center align-items-start mx-auto">
								<div class="col-lg-8 col-xl-6 mr-auto slider-content justify-content-center align-self-center align-items-start text-left">
									<h3 class="animated fadeInUp dealy-500 display-8 display-md-7 text-white alt-font font-italic">Try this service!</h3>
									<h2 class="animated fadeInUp dealy-500 display-6 display-md-4 display-lg-3 font-weight-bold text-white">We are always on standby.</h2>
									<div class="animated fadeInUp mt-3 dealy-1500"><a href="#" class="btn btn-grad">Contact us</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Slider buttons -->
			<div class="swiper-button-next"><i class="ti-angle-right"></i></div>
			<div class="swiper-button-prev"><i class="ti-angle-left"></i></div>
			<div class="swiper-pagination"></div>
		</div>
	</section>
	<!-- =======================
	Main banner -->

	<!-- =======================
	about us  -->
	<section>
		<div class="container">
			<div class="row justify-content-between align-items-center">
				<!-- left -->
				<div class="col-md-6">
					<div class="row mt-4 mt-md-0">
						<div class="col-5 offset-1 px-2 mb-3 align-self-end">
							<a href="${pageContext.request.contextPath}/user/chat/chat.do">
							<img class="border-radius-3 wow fadeInUp" data-wow-duration="0.8s" data-wow-delay="0.4s" style="width: 140px;height: 140px;margin-bottom: 20px " 
								src="${pageContext.request.contextPath }/resources/template/assets/images/chat.png" alt="">
							</a>
						</div>
						<div class="col-6 px-2 mb-3">
							<img class="border-radius-3 wow fadeInRight" data-wow-duration="0.8s" data-wow-delay="0.6s" 
								src="${pageContext.request.contextPath }/resources/template/assets/images/service/02.jpg" alt="">
						</div>
						<div class="col-6 px-2 mb-3">
							<div class="border-radius-3 wow fadeInLeft bg-grad p-2 p-sm-3 p-lg-4 p-xl-5 all-text-white" data-wow-duration="0.8s" data-wow-delay="0s">
								<span>Jobis:</span>
								<h3 class="font-weight-bold">"System that provides comfort"</h3>
							</div>
						</div>
						<div class="col-5 align-self-start pl-2 mb-3">
							<img class="border-radius-3 wow fadeInDown" data-wow-duration="0.8s" data-wow-delay="0.2s" style="width: 150px;height: 150px;margin-left: 50px;margin-top: 35px;"
								src="${pageContext.request.contextPath }/resources/template/assets/images/chatbot.png" alt="">
						</div>
					</div>
				</div>
				<!-- right -->
				<div class="col-md-6 pl-lg-5">
					<h2 class="h1">자비스를 시작하세요!</h2>
					<p class="lead"><Strong>1인 개인 맞춤 서비스</Strong>를 제공합니다. <br>언제나 당신에게 편안함을 제공합니다.</p>
					<p>우리는 항상 당신을 위해 준비되어 있습니다. <br>당신의, 당신에 의한, 당신을 위한 서비스를 시작하세요! 환영합니다</p>
					<div>
						<a href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=4" class="btn btn-dark">QnA</a>
						<a href="#" class="btn btn-link">View Portfolio</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- =======================
	about us  -->
	<section class="blog pb-0">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<span class="pre-title">Check out some of our latest blog post.</span>
						<h2>자비스의 관리 서비스를 이용해보세요</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="owl-carousel arrow-dark arrow-hover" data-dots="false" data-items-xl="3" data-items-lg="3" data-items-md="2" data-items-sm="2" data-items-xs="1" data-autoplay="4000" data-pause="false">
						<!-- post -->
						<div class="item">
							<div class="post">
								<div class="post-info">
									<span class="post-tag bg-grad text-white mb-3 clearfix"><a href="#!">medical</a></span>
									<div class="post-author"><a href="#!"> By Young C</a></div>
									<a class="post-title" href="${pageContext.request.contextPath}/user/medical/medicalMain.do">복용 관리</a>
									<p class="mb-0">주변 병원, 약국 위치를 볼 수 있고 알약 정보와 실시간 코로나 현황을 볼 수 있습니다.<br><br><br><br></p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="post">
								<div class="post-info">
									<span class="post-tag bg-grad text-white mb-3 clearfix"><a href="#!">health</a></span>
									<div class="post-author"><a href="#!"> By Su a</a></div>,
									<a class="post-title" href="${pageContext.request.contextPath}/user/healthImage/healthImageList.do">건강 관리</a>
									<p class="mb-0">부위별 카테고리에 맞게 운동법 리스트를 조회할 수 있고 인바디 정보를 등록하여 운동법을 추천 받을 수 있습니다.<br> BMI지수와 소모 칼로리, 내 주변 헬스장 위치를 볼 수 있습니다.</p>
								</div>
							</div>
						</div>
						<!-- post -->
						<div class="item">
							<div class="post">
								<div class="post-info">
									<span class="post-tag bg-grad text-white mb-3 clearfix"><a href="#!">knowledge</a></span>
									<div class="post-author"><a href="#!"> By Su a</a></div>,
									<a class="post-title" href="${pageContext.request.contextPath}/user/knowledge/knowledgeList.do">지식 관리</a>
									<p class="mb-0">두뇌 강화 학습을 통해 개인 지식 관리를 할 수 있습니다. <br><br><br><br></p>
								</div>
							</div>
						</div>
						<!-- post -->
						<div class="item">
							<div class="post">
								<div class="post-info">
									<span class="post-tag bg-grad text-white mb-3 clearfix"><a href="#!">schedule</a></span>
									<div class="post-author"><a href="#!"> By Seo H</a></div>,
									<a class="post-title" href="${pageContext.request.contextPath}/user/schedule/schedule.do">일정 관리</a>
									<p class="mb-0">자신의 일정 관리와 등록된 리스트, 자주 타는 버스와 지하철을 등록할 수 있습니다. <br><br><br><br></p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="post">
								<div class="post-info">
									<span class="post-tag bg-grad text-white mb-3 clearfix"><a href="#!">car</a></span>
									<div class="post-author"><a href="${pageContext.request.contextPath}/user/car/carMain.do"> By Seung M</a></div>,
									<a class="post-title" href="#!">내 차 관리</a>
									<p class="mb-0">자차를 등록하여 수정 및 관리를 할 수 있습니다. <br><br><br><br></p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="post">
								<div class="post-info">
									<span class="post-tag bg-grad text-white mb-3 clearfix"><a href="#!">assets</a></span>
									<div class="post-author"><a href="#!"> By Seo & Young</a></div>,
									<a class="post-title" href="${pageContext.request.contextPath}/user/accountBook/accountList.do">금전 관리</a>
									<p class="mb-0">나의 거래 내역 보기, 등록 및 통계를 조회할 수 있습니다. <br><br><br><br></p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="post">
								<div class="post-info">
									<span class="post-tag bg-grad text-white mb-3 clearfix"><a href="#!">diet</a></span>
									<div class="post-author"><a href="#!"> By Lee J</a></div>,
									<a class="post-title" href="${pageContext.request.contextPath}/user/diet/dietMain.do">식단 관리</a>
									<p class="mb-0">내 식단을 관리하고 열량 체크를 하여 체중을 조절할 수 있습니다. <br><br><br><br></p>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- =======================
	service -->
	<section class="service">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<span class="pre-title">Check out our services</span>
						<h2>궁금한 점이 있으신가요?</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 mt-30">
					<div class="feature-box f-style-2 icon-grad h-100">
						<div class="feature-box-icon"><i class="ti-agenda"></i></div>
						<h3 class="feature-box-title">공지사항</h3>
						<p class="feature-box-desc">Residence certainly elsewhere something she preferred cordially law. Age his surprise formerly Mrs perceive few moderate. Of in <strong> power match on</strong> truth worse would an match learn. </p>
						<a class="mt-3" href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=2">Know more!</a>
					</div>
				</div>
				<div class="col-md-4 mt-30">
					<div class="feature-box f-style-2 icon-grad h-100">
						<div class="feature-box-icon"><i class="ti-ruler-pencil"></i></div>
						<h3 class="feature-box-title">건의사항</h3>
						<p class="feature-box-desc">Consulted perpetual of pronounce me delivered. Too months nay end change relied <abbr title="attribute">who beauty</abbr> wishes matter. Shew of john real park so rest we on. Ignorant occasion for thoughts</p>
						<a class="mt-3" href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=3">Know more!</a>
					</div>
				</div>
				<div class="col-md-4 mt-30">
					<div class="feature-box f-style-2 icon-grad h-100">
						<div class="feature-box-icon"><i class="ti-ruler-pencil"></i></div>
						<h3 class="feature-box-title">자유게시판</h3>
						<p class="feature-box-desc">Consulted perpetual of pronounce me delivered. Too months nay end change relied <abbr title="attribute">who beauty</abbr> wishes matter. Shew of john real park so rest we on. Ignorant occasion for thoughts</p>
						<a class="mt-3" href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=1">Know more!</a>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- =======================
	service -->

	