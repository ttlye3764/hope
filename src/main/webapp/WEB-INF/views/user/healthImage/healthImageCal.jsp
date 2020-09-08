<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
li {
	display: inline;
	margin-right: -4px;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-lboi {
	border-color: inherit;
	text-align: left;
	vertical-align: middle
}

.tg .tg-396i {
	background-color: #efefef;
	border-color: inherit;
	font-family: Arial, Helvetica, sans-serif !important;;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	vertical-align: top
}

.tg .tg-guxg {
	background-color: #cbcefb;
	border-color: inherit;
	font-family: Arial, Helvetica, sans-serif !important;;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	vertical-align: top
}

.tg .tg-3trw {
	border-color: inherit;
	font-family: Arial, Helvetica, sans-serif !important;;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	vertical-align: top
}

.tg .tg-cqae {
	border-color: inherit;
	font-family: Arial, Helvetica, sans-serif !important;;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	vertical-align: middle
}

.tg .tg-6ykz {
	background-color: #ffccc9;
	border-color: inherit;
	font-family: Arial, Helvetica, sans-serif !important;;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	vertical-align: top
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top
}

.tg .tg-y698 {
	background-color: #efefef;
	border-color: inherit;
	text-align: left;
	vertical-align: top
}
</style>
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!--Vendors-->
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/sticky-kit/sticky-kit.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!--Template Functions-->
<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
<script type="text/javascript">

$(function(){
	$('#btn').click(function(){
		var time = $('#time').val();
		var weight = $('#weight').val();

		if (time == "" || weight == "") {
			swal("warning","몸무게 또는 운동시간을 입력해주세요.", "warning");

			return false;
		}

		// 몸무게 * 시간 * 3.5 * met * 5 
		var select  = $("#exercise option:selected").val();
		
			if(select == 'TV시청') {
			var cal = ((weight * time * 3.5) * 1.0 * 5) * 0.001;

			} else if (select == '걷기') {
			var cal = ((weight * time * 3.5) * 3.3 * 5) * 0.001;

			} else if (select == '체조') {
			var cal = ((weight * time * 3.5) * 3.5 * 5) * 0.001;

			} else if (select == '배드민턴') {
			var cal = ((weight * time * 3.5) * 4.5 * 5) * 0.001;

			} else if (select == '골프') {
			var cal = ((weight * time * 3.5) * 4.5 * 5) * 0.001;

			} else if (select == '농구') {
			var cal = ((weight * time * 3.5) * 6.5 * 5) * 0.001;

			} else if (select == '에어로빅') {
			var cal = ((weight * time * 3.5) * 6.0 * 5) * 0.001;

			} else if (select == '책벅지') {
			var cal = ((weight * time * 3.5) * 7 * 5) * 0.001;

			} else if (select == '줌바') {
			var cal = ((weight * time * 3.5) * 7 * 5) * 0.001;

			} else if (select == '조깅') {
			var cal = ((weight * time * 3.5) * 7 * 5) * 0.001;

			} else if (select == '등산') {
			var cal = ((weight * time * 3.5) * 7.5 * 5) * 0.001;

			} else if (select == '실내 자전거') {
			var cal = ((weight * time * 3.5) * 8 * 5) * 0.001;

			} else if (select == '축구') {
			var cal = ((weight * time * 3.5) * 8 * 5) * 0.001;

			} else if (select == '스피닝') {
			var cal = ((weight * time * 3.5) * 8 * 5) * 0.001;

			} else if (select == '줄넘기') {
			var cal = ((weight * time * 3.5) * 10 * 5) * 0.001;

			} else if (select == '킥복싱') {
			var cal = ((weight * time * 3.5) * 10 * 5) * 0.001;

			}  else if (select == '수영') {
			var cal = ((weight * time * 3.5) * 11 * 5) * 0.001;

			} else if (select == '런닝') {
			var cal = ((weight * time * 3.5) * 15 * 5) * 0.001;

			} else if (select == '계단오르기') {
			var cal = ((weight * time * 3.5) * 15 * 5) * 0.001;

			} 
		
		document.getElementById("content").innerHTML = cal.toFixed(1) + "Kcal"; 		

		
	});
});

</script>
</head>
<body>

<%@ page import="com.google.cloud.vision.v1.ImageAnnotatorClient" %>
<%@ page import="com.google.cloud.vision.v1.AnnotateImageRequest" %>
<%@ page import="com.google.cloud.vision.v1.AnnotateImageResponse" %>
<%@ page import="com.google.cloud.vision.v1.BatchAnnotateImagesResponse" %>
<%@ page import="com.google.cloud.vision.v1.Feature" %>
<%@ page import="com.google.cloud.vision.v1.Feature.Type" %>
<%@ page import="com.google.cloud.vision.v1.EntityAnnotation" %>
<%@ page import="com.google.cloud.vision.v1.Image" %>
<%@ page import="com.google.protobuf.ByteString" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
 
<div class="innerpage-banner center bg-overlay-dark-7 py-7" 
	style="background:url(${pageContext.request.contextPath }/resources/template/assets/images/bg/04.jpg) no-repeat; background-size:cover; 
		background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Health</h1>
					<h6 class="subtitle">Show your awesome work in Health style</h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active">
							<a href='${pageContext.request.contextPath}/user/healthImage/healthImageCal.do'><i class="ti-home"></i> Home</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
<section>
		<div class="container">
			<div class="row">
				<!-- Job positions -->
				<div class="col-md-8" style="margin: auto">
					<!-- Apply form -->
					<div class="row mt-5">
						<div class="col-md-12" style="margin: auto">
							<h2 class="mb-3" style="padding-left: 55px;">칼로리 계산기</h2></div>
						<div class="col-md-3" style="margin: auto">
							<select class="custom-select select-big mb-3" id="exercise">
								<option selected="운동">운동 선택</option>
								<option value="TV시청">TV시청</option>
								<option value="걷기">걷기</option>
								<option value="체조">체조</option>
								<option value="배드민턴">배드민턴</option>
								<option value="골프">골프</option>
								<option value="농구">농구</option>
								<option value="에어로빅">에어로빅</option>
								<option value="책벅지">책벅지</option>
								<option value="줌바">줌바</option>
								<option value="조깅">조깅(빠른걸음)</option>
								<option value="등산">등산</option>
								<option value="실내 자전거">실내 자전거</option>
								<option value="축구">축구</option>
								<option value="스피닝">스피닝</option>
								<option value="줄넘기">줄넘기</option>
								<option value="킥복싱">킥복싱</option>
								<option value="수영">수영</option>
								<option value="런닝">런닝</option>
								<option value="계단오르기">계단오르기</option>
							</select>
							 몸무게 <span class="form-group"> 
							 <input style="margin-top: 10px;" type="text" id="weight" class="form-control" placeholder="kg">
							 </span>
							   운동 시간(분)<span class="form-group"> 
							<input type="text" class="form-control" id="time" placeholder="time">
							</span>
						 <button class="btn-block btn btn-dark" style="margin-top: 15px;" id="btn">확인</button>
						</div>
						
						<div class="col-md-5" style="margin: auto">
						<p>* 소모되는 칼로리는 운동강도에 따라 달라질 수 있습니다.
						</p>
						<p>* 운동별 소모에너지는 평균적인 값으로 계산됩니다.</p>
						<strong><h5 id="content" style="text-align: center;"></h5></strong>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	
	<section>
		<div class="container">
			<div class="row">
				<!-- Job positions -->
				<div class="col-md-8">
					<h2 class="mb-2">소모에너지</h2>
					<p>운동의 종류와 시간에 따른 체중별 칼로리 소모량입니다. 평균적인 값에 의해 계산되는 표이므로 개인의 차이에 따라 달라 질 수 있습니다. <br> 
					(* 50kg - 60kg - 70kg 순으로 소모되는 칼로리)</p>
					<div class="accordion accordion-line toggle-icon-left toggle-icon-round" id="accordion1">
						<!-- item -->
						<div class="accordion-item">
							<div class="accordion-title">
								<h6><a data-toggle="collapse" href="#collapse-1">가벼운 운동</a></h6></div>
							<div class="collapse show" id="collapse-1" data-parent="#accordion1">
								<div class="accordion-content">
									<p class="pt-2">
									산책하기 : 22, 26, 30<br>
									스트레칭 체조 : 31, 34, 43<br>
									춤추기 : 34, 41, 48<br>
									요가 : 21, 25, 29<br>
									볼링 : 25, 33, 35<br>
									</p>
									<h6 class="mb-2">운동 소요 시간 : 10분</h6>
								</div>
							</div>
						</div>

						<!-- item -->
						<div class="accordion-item">
							<div class="accordion-title">
								<a class="collapsed" data-toggle="collapse" href="#collapse-2">중간정도의 운동</a>
							</div>
							<div class="collapse" id="collapse-2" data-parent="#accordion1">
								<div class="accordion-content">
									<p class="pt-2">
									에어로빅 : 42, 52, 59<br>
									계단 오르내리기 : 48, 58, 68<br>
									팔 굽혀 펴기 : 32, 42, 49<br>
									자전거타기 : 37, 44, 52<br>
									테니스 : 60, 72, 84<br>
									배드민턴 : 59, 70, 82<br>
									배구 : 59, 70, 82<br>
									</p>
									<h6 class="mb-2">운동 소요 시간 : 10분</h6>
								</div>
							</div>
						</div>

						<!-- item -->
						<div class="accordion-item">
							<div class="accordion-title">
								<a class="collapsed" data-toggle="collapse" href="#collapse-3">힘든 운동</a>
							</div>
							<div class="collapse" id="collapse-3" data-parent="#accordion1">
								<div class="accordion-content">
									<p class="pt-2">
									수영(자유형) : 145, 174, 204<br>
									수영(접형) : 184, 220, 258<br>
									농구 : 67, 80, 93<br>
									윗몸 일으키기 : 72, 86, 101<br>
									줄넘기 : 75, 89, 104<br>
									</p>
									<h6 class="mb-2">운동 소요 시간 : 10분</h6>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</section>

</body>
</html>