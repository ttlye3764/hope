<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.diet_img {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
  width: 150px;
  height: 100px;
}

.diet_img:hover {
  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}
</style>
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
						<h5 class="widget-title" id="dietSide_h5_recommendDiet">추천 식단 리스트</h5>
						<p class="mb-0"> procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_bmi">BMI 계산기</h5>
						<p class="mb-0">. She procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>
				</aside>
				<!-- sidebar end -->

				
				<div class="col-sm-12 col-md-6">
					<h5 class="mb-4">Tab default</h5>
					<ul class="nav nav-tabs" style="width:650px; !important">
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-1-1"> 열량표 </a> </li>
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#tab-1-2"> 열량에 따른 운동 </a> </li>

					</ul>
					<div class="tab-content" style="width:650px; !important">
						<div class="tab-pane show" id="tab-1-1">
<div class="col-sm-12 mb-5">
					<h5 class="text-center mb-4">일일 권장 칼로리</h5>
					<div class="table-responsive-sm">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">나이</th>
									<th scope="col">남자</th>
									<th scope="col">여자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">0~5개월</th>
									<td>550Kcal</td>
									<td>550Kcal</td>
								</tr>
								<tr>
									<th scope="row">6~11개월</th>
									<td>700Kcal</td>
									<td>700Kcal</td>
								</tr>
								<tr>
									<th scope="row">1~2세</th>
									<td>1000Kcal</td>
									<td>1000Kcal</td>
								</tr>
								<tr>
									<th scope="row">3~5세</th>
									<td>1400Kcal</td>
									<td>1400Kcal</td>
								</tr>
								<tr>
									<th scope="row">6~8세</th>
									<td>1700Kcal</td>
									<td>1500Kcal</td>
								</tr>
								<tr>
									<th scope="row">9~11세</th>
									<td>2100Kcal</td>
									<td>1800Kcal</td>
								</tr>
								<tr>
									<th scope="row">12~14세</th>
									<td>2500Kcal</td>
									<td>2000Kcal</td>
								</tr>
								<tr>
									<th scope="row">15~18세</th>
									<td>2700Kcal</td>
									<td>2000Kcal</td>
								</tr>
								<tr>
									<th scope="row">19~29세</th>
									<td>2600Kcal</td>
									<td>2100Kcal</td>
								</tr>
								<tr>
									<th scope="row">30~49세</th>
									<td>2400Kcal</td>
									<td>1900Kcal</td>
								</tr>
								<tr>
									<th scope="row">50~64세</th>
									<td>2200Kcal</td>
									<td>1800Kcal</td>
								</tr>
								<tr>
									<th scope="row">65~74세</th>
									<td>2000Kcal</td>
									<td>1600Kcal</td>
								</tr>
								<tr>
									<th scope="row">75세 이상</th>
									<td>2000Kcal</td>
									<td>1600Kcal</td>
								</tr>
								<tr>
									<th scope="row">임산부</th>
									<td>-</td>
									<td>+0~450Kcal</td>
								</tr>
								<tr>
									<th scope="row">수유부</th>
									<td>-</td>
									<td>+340</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>						</div>
						<div class="tab-pane active" id="tab-1-2">
						
						
			<form>
			<div class="input-group">
				<input type="text" id="kcal_kcal" class="form-control" placeholder="칼로리를 입력해주세요!!" style="width:300px; !important">
									<span class="input-group-btn">
						<button type="button" id="kcal_calculate" class="btn btn-grad mb-0"><i class="fa fa-paper-plane m-0"></i></button>
					</span>
			</div>
		</form>	
		<br>					
						단위 : 분
		<section class="py-4 counter counter-grad-text counter-light counter-small">
		
		<!-- 첫번째 줄-->
		<div class="container">
			<div class="row">
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/ring.jpg">
						<h2 id="kcal_jump" class="counter-item-digit" data-from="0" data-to="${kcal.ring }" data-speed="3000" data-refresh-interval="10">${kcal.ring }</h2>
						<p class="counter-item-text">줄넘기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/waking.jpg">
						<h2 id="kcal_walking" class="counter-item-digit" data-from="0" data-to="${kcal.waking }" data-speed="3000" data-refresh-interval="10">${kcal.waking }</h2>
						<p class="counter-item-text">걷기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/swimming.jpg">
						<h2 id="kcal_swimming" class="counter-item-digit" data-from="0" data-to="${kcal.swimming }" data-speed="3000" data-refresh-interval="10">${kcal.swimming }</h2>
						<p class="counter-item-text">수영</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/stairs.jpg">
						<h2 id="kcal_stairs" class="counter-item-digit" data-from="0" data-to="${kcal.stairs }" data-speed="3000" data-refresh-interval="10">${kcal.stairs }</h2>
						<p class="counter-item-text">계단 오르기</p>
					</div>
				</div>
			</div>
		</div>
		
		<!--  두번째 줄 -->
		<section class="py-4 bg-light counter counter-light counter-small">
		<div class="container">
			<div class="row">
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/tenis.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.tenis }" data-speed="3000" data-refresh-interval="10">${kcal.tenis }</h2>
						<p class="counter-item-text">테니스</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/hiking.jpeg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.hiking }" data-speed="3000" data-refresh-interval="10">${kcal.hiking }</h2>
						<p class="counter-item-text">하이킹</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/takgu.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.takgu }" data-speed="3000" data-refresh-interval="10">${kcal.takgu }</h2>
						<p class="counter-item-text">탁구</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/cycle.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.cycle }" data-speed="3000" data-refresh-interval="10">${kcal.cycle }</h2>
						<p class="counter-item-text">사이클</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	</section>
	
	
	<!-- 세번째 줄 -->
	<section class="py-4 counter counter-grad-text counter-light counter-small">
		<div class="container">
			<div class="row">
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/joging.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.joging }" data-speed="3000" data-refresh-interval="10">${kcal.joging }</h2>
						<p class="counter-item-text">조깅</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/ski.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.ski }" data-speed="3000" data-refresh-interval="10">${kcal.ski }</h2>
						<p class="counter-item-text">스키</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/mealpreparation.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.mealPreparation }" data-speed="3000" data-refresh-interval="10">${kcal.mealPreparation }</h2>
						<p class="counter-item-text">식사 준비</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/blanket.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.blanket }" data-speed="3000" data-refresh-interval="10">${kcal.blanket }</h2>
						<p class="counter-item-text">이불개기</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 네번째 줄 -->
	<section class="py-4 counter bg-dark counter-small">
		<div class="container">
			<div class="row">
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/dressing.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.dreesing } " data-speed="3000" data-refresh-interval="10">${kcal.dreesing }</h2>
						<p class="counter-item-text">옷 입기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/talk.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.talk }" data-speed="3000" data-refresh-interval="10">${kcal.talk }</h2>
						<p class="counter-item-text">잡담</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/clean.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.clean}" data-speed="3000" data-refresh-interval="10">${kcal.clean }</h2>
						<p class="counter-item-text">청소</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/bath.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.bath }" data-speed="3000" data-refresh-interval="10">${kcal.bath }</h2>
						<p class="counter-item-text">목욕</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<!-- 다섯번째  --> 
	<section class="py-4 bg-grad counter counter-small">
		<div class="container">
			<div class="row">
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/Ironing.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.ironing } " data-speed="3000" data-refresh-interval="10">${kcal.ironing }</h2>
						<p class="counter-item-text">Lines of code</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/sleep.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.sleep }" data-speed="3000" data-refresh-interval="10">${kcal.sleep }</h2>
						<p class="counter-item-text">잠자기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/look.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.look }" data-speed="3000" data-refresh-interval="10">${kcal.look }</h2>
						<p class="counter-item-text">신문보기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/cleanshoes.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.cleanshoes }" data-speed="3000" data-refresh-interval="10">${kcal.cleanshoes }</h2>
						<p class="counter-item-text">구두닦이</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 여섯번째 -->
	<section class="py-4 bg-dark-grad counter counter-small">
		<div class="container">
			<div class="row">
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/tv.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.tv }" data-speed="3000" data-refresh-interval="10">${kcal.tv }</h2>
						<p class="counter-item-text">TV 보기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/makeup.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.makeup }" data-speed="3000" data-refresh-interval="10">${kcal.makeup }</h2>
						<p class="counter-item-text">화장하기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/washh.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="${kcal.wash }" data-speed="3000" data-refresh-interval="10">${kcal.wash }</h2>
						<p class="counter-item-text">빨래하기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<img class="diet_img" src="${pageContext.request.contextPath }/image/.jpg">
						<h2 class="counter-item-digit" data-from="0" data-to="16" data-speed="3000" data-refresh-interval="10">16</h2>
						<p class="counter-item-text">Awards won</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
						</div>
						
					</div>
				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>
<script type="text/javascript">
$(function(){
	$("#kcal_calculate").click(function(){
		var kcal = $('#kcal_kcal').val();
		$(location).attr('href', '${pageContext.request.contextPath}/user/diet/kcalCalculate?kcal='+kcal);
		
// 		var walking = $('#kcal_kcal').val() / 4
// 		var jump = $('#kcal_kcal').val() / 10
// 		var swimming = $('#kcal_kcal').val() / 9
// 		var stairs = $('#kcal_kcal').val() / 7

// 		$('#kcal_walking').text(walking);
// 		$('#kcal_walking').attr('data-to', walking);
// 		$('#kcal_jump').text(jump);
// 		$('#kcal_swimming').text(swimming);
// 		$('#kcal_stairs').text(stairs);
	})
})

</script>