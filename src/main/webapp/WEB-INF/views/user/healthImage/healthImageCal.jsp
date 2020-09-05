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

<!--Template Functions-->
<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
<script type="text/javascript">

$(function(){
	$('#btn').click(function(){
		var time = $('#time').val();
		var weight = $('#weight').val();

		if (time == "" || weight == "") {
			alert("몸무게 또는 운동시간을 입력해주세요.");

			return false;
		}

		var bmi = (weight / (tall * tall)) * 10000;
	
		document.getElementById("content").innerHTML = "현재 BMI 지수는 " + bmi.toFixed(1) + "입니다.<br/><br/>"; 		
		document.getElementById("content").innerHTML += "18.5 이하 : 저체중<br/>"; 
		document.getElementById("content").innerHTML += "18.5~22.9 : 정상<br/>"; 
		document.getElementById("content").innerHTML += "23~24.9 : 과체중<br/>";
		document.getElementById("content").innerHTML += "25~30 : 비만<br/>"; 
		document.getElementById("content").innerHTML += "31 이상 : 고도비만<br/>";

		if (bmi <= 18.5) {
			$('#1').show();
			$('#2').hide();
			$('#3').hide();
			$('#4').hide();
			$('#5').hide();

		} else if (18.5 < bmi && bmi < 23) {
			$('#1').hide();
			$('#2').show();
			$('#3').hide();
			$('#4').hide();
			$('#5').hide();

		} else if (23 <= bmi && bmi < 25) {
			$('#1').hide();
			$('#2').hide();
			$('#3').show();
			$('#4').hide();
			$('#5').hide();

		} else if (25 <= bmi && bmi < 31) {
			$('#1').hide();
			$('#2').hide();
			$('#3').hide();
			$('#4').show();
			$('#5').hide();

		} else if (31 <= bmi) {
			$('#1').hide();
			$('#2').hide();
			$('#3').hide();
			$('#4').hide();
			$('#5').show();

		} 
	});
});

</script>
</head>
<body>
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
							 몸무게 <span class="form-group"> 
							 <input style="margin-top: 10px;" type="text" id="weight" class="form-control" placeholder="kg">
							 </span>
							   운동 시간(분)<span class="form-group"> 
							<input type="text" class="form-control" id="time" placeholder="time">
							</span>
						 <button class="btn-block btn btn-dark" style="margin-top: 15px;" id="btn">확인</button>
						</div>
						
						<div class="col-md-5" style="margin: auto">
						<p>소모되는 칼로리는 운동강도에 따라 달라질 수 있습니다. <br><br>
						</p>
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
					<h2 class="mb-2">Job positions</h2>
					<p>like what you saw? If you're ready to test your earning potential, join us today and become the latest member of team Wizixo.</p>
					<div class="accordion accordion-line toggle-icon-left toggle-icon-round" id="accordion1">
						<!-- item -->
						<div class="accordion-item">
							<div class="accordion-title">
								<h6><a data-toggle="collapse" href="#collapse-1">Account manager - technologies</a></h6></div>
							<div class="collapse show" id="collapse-1" data-parent="#accordion1">
								<div class="accordion-content">
									<p class="pt-2"> We are excited about an opportunity we have within the Technologies team in London. We’re on the lookout for an Account Manager to join wizixo top performing team for 2 years in a row! We want to hear from talented and ambitious sales professionals who have a passion for work.</p>
									<h6 class="mb-2">Location: London</h6>
									<a class="d-block" href="careers-single.html">Read More</a>
								</div>
							</div>
						</div>

						<!-- item -->
						<div class="accordion-item">
							<div class="accordion-title">
								<a class="collapsed" data-toggle="collapse" href="#collapse-2">Recruitment consultant education Sydney</a>
							</div>
							<div class="collapse" id="collapse-2" data-parent="#accordion1">
								<div class="accordion-content">
									<p class="pt-2"> Do you enjoy a sales environment with little administration? Enjoy using the latest recruitment technology without losing the ‘Human Touch’? Do you want to work for a company who believes in supporting your career and personal growth? Want to work for a division that has a boutique feel. </p>
									<h6 class="mb-2">Location: Sydney</h6>
									<a class="d-block" href="careers-single.html">Read More</a>
								</div>
							</div>
						</div>

						<!-- item -->
						<div class="accordion-item">
							<div class="accordion-title">
								<a class="collapsed" data-toggle="collapse" href="#collapse-3">Senior PHP software developer</a>
							</div>
							<div class="collapse" id="collapse-3" data-parent="#accordion1">
								<div class="accordion-content">
									<p class="pt-2"> This is a great opportunity to join a Wizixo start up in the IT industry. We provide a number of services to our clients in both England and Australia. Our services ensures our clients achieves energy efficiencies, accurate reporting whilst saving time. </p>
									<h6 class="mb-2">Location: Melbourne</h6>
									<a class="d-block" href="careers-single.html">Read More</a>
								</div>
							</div>
						</div>

						<!-- item -->
						<div class="accordion-item">
							<div class="accordion-title">
								<a class="collapsed" data-toggle="collapse" href="#collapse-4">Digital Marketing Executive</a>
							</div>
							<div class="collapse" id="collapse-4" data-parent="#accordion1">
								<div class="accordion-content">
									<p class="pt-2"> We provide a number of services to our clients in both England and Australia. Our services ensures our clients achieves energy efficiencies, accurate reporting whilst saving time. This is a great opportunity to join a Wizixo start up in the IT industry.</p>
									<h6 class="mb-2">Location: New York</h6>
									<a class="d-block" href="careers-single.html">Read More</a>
								</div>
							</div>
						</div>

						<!-- item -->
						<div class="accordion-item">
							<div class="accordion-title">
								<a class="collapsed" data-toggle="collapse" href="#collapse-6">Engineering Manager - Android Application Infrastructure</a>
							</div>
							<div class="collapse" id="collapse-6" data-parent="#accordion1">
								<div class="accordion-content">
									<p class="pt-2">Join a Wizixo start up in the IT industry. We provide a number of services to our clients in both England and Australia. Our services ensures our clients achieves energy efficiencies, accurate reporting whilst saving time. </p>
									<h6 class="mb-2">Location: Los Angeles</h6>
									<a class="d-block" href="careers-single.html">Read More</a>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- Sidebar -->
				<div class="col-md-4 sidebar">
					<h2>Refine your search</h2>
					<div class="widget widget-newsletter border-0 p-0">
						<ul class="list-group border-0 mb-4">
							<li class="d-flex align-items-center font-weight-bold text-light-gray">Available jobs <span class="badge bg-light badge-pill ml-2">14</span>
							</li>
						</ul>
						<form>
							<div class="input-group mb-3">
								<input class="form-control border-radius-right-0 border-right-0" type="text" name="search" placeholder="Search">
								<span class="input-group-btn">
								<button type="button" class="btn btn-grad border-radius-left-0 mb-0"><i class="ti-search m-0"></i></button>
							</span>
							</div>
						</form>
						<select class="custom-select select-big mb-3">
						<option selected="">All locations</option>
						<option value="location1">Chicago, US</option>
						<option value="location2">New York, US</option>
						<option value="location3">Seattle/Kirkland, US</option>
						<option value="location4">Los Angles, US</option>
						<option value="location5">Moscow, Russia</option>
						<option value="location6">Sydney, Australia</option>
						<option value="location7">Birmingham, UK</option>
						<option value="location7">Manchester, UK</option>
						<option value="location8">Beijing, China</option>
					</select>
						<select class="custom-select select-big">
						<option selected="">All locations</option>
						<option value="location1">Chicago, US</option>
						<option value="location2">New York, US</option>
						<option value="location3">Seattle/Kirkland, US</option>
						<option value="location4">Los Angles, US</option>
						<option value="location5">Moscow, Russia</option>
						<option value="location6">Sydney, Australia</option>
						<option value="location7">Birmingham, UK</option>
						<option value="location7">Manchester, UK</option>
						<option value="location8">Beijing, China</option>
					</select>
					</div>
					<div class="widget bg-light border-0 p-3 border-radius-3">
						<h4>Have any question? </h4>
						<p>If you need to send us mail regarding job opportunities, please write to us at <a class="text-primary" href="mailto:contact@example.com">career@wizixo.com</a> for more information.</p> or call us <a class="display-8 text-dark primary-hover" href="#">@(251) 854-6308</a>
					</div>
				</div>
				<!-- Sidebar end-->

			</div>
		</div>
	</section>

</body>
</html>