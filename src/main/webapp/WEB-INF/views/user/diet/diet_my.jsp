<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				
				<h5 class="mb-2 mt-5">체중 차트 </h5>
				<div class="divider divider-bold"></div>
				
				<!-- timeLine start -->
					<div class="container">
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
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
    </script>