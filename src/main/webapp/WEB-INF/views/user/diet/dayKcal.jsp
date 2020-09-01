<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

				
				<div class="col-sm-12 col-md-6">
					<h5 class="mb-4">Tab default</h5>
					<ul class="nav nav-tabs" style="width:650px; !important">
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-1-1"> 열량표 </a> </li>
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#tab-1-2"> 열량에 따른 운동 </a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-1-3"> Develop </a> </li>
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
						
						<section class="py-4 counter counter-grad-text counter-light counter-small">
		<div class="container">
			<div class="row">
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<i class="counter-item-icon ti-write"></i>
						<h2 id="kcal_jump" class="counter-item-digit" data-from="0" data-to="3000" data-speed="3000" data-refresh-interval="10">3000</h2>
						<p class="counter-item-text">줄넘기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<i class="counter-item-icon ti-truck"></i>
						<h2 id="kcal_walking" class="counter-item-digit" data-from="0" data-to="865" data-speed="3000" data-refresh-interval="10">865</h2>
						<p class="counter-item-text">걷기</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<i class="counter-item-icon ti-face-smile"></i>
						<h2 id="kcal_swimming" class="counter-item-digit" data-from="0" data-to="127" data-speed="3000" data-refresh-interval="10">127</h2>
						<p class="counter-item-text">수영</p>
					</div>
				</div>
				<!-- count item -->
				<div class="col-md-3 col-6">
					<div class="counter-item text-center">
						<i class="counter-item-icon ti-cup"></i>
						<h2 id="kcal_stairs" class="counter-item-digit" data-from="0" data-to="16" data-speed="3000" data-refresh-interval="10">16</h2>
						<p class="counter-item-text">계단 오르기</p>
					</div>
				</div>
			</div>
		</div>
		<form>
			<div class="input-group">
				<input type="text" id="kcal_kcal" class="form-control" placeholder="Enter your Email..." style="width:300px; !important">
					<span class="input-group-btn">
						<button type="button" id="kcal_calculate" class="btn btn-grad mb-0"><i class="fa fa-paper-plane m-0"></i></button>
					</span>
			</div>
		</form>
	</section>
						</div>
						<div class="tab-pane" id="tab-1-3">
							화이팅
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
		var walking = $('#kcal_kcal').val() / 4
		var jump = $('#kcal_kcal').val() / 10
		var swimming = $('#kcal_kcal').val() / 9
		var stairs = $('#kcal_kcal').val() / 7

		$('#kcal_walking').text(walking);
		$('#kcal_jump').text(jump);
		$('#kcal_swimming').text(swimming);
		$('#kcal_stairs').text(stairs);
	})
})
</script>