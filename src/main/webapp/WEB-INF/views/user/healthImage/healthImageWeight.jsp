<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--Vendors-->
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/sticky-kit/sticky-kit.min.js"></script>

<!--Template Functions-->
<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
<script type="text/javascript">

$(function(){
	$('#btn').click(function(){
		var tall = $('#tall').val();
		var weight = $('#weight').val();

		if (tall == "" || weight == "") {
			swal("warning","키 또는 몸무게를 입력해주세요.", "warning");

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
							<a href='${pageContext.request.contextPath}/user/healthImage/healthImageWeight.do'><i class="ti-home"></i> Home</a></li>
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
							<h2 class="mb-3" style="padding-left: 55px;">BMI 측정</h2></div>
						<div class="col-md-3" style="margin: auto">
							키 <span class="form-group"> 
							<input type="text" class="form-control" id="tall" placeholder="cm">
							</span>
							 몸무게 <span class="form-group"> 
							 <input style="margin-top: 10px;" type="text" id="weight" class="form-control" placeholder="kg">
							 </span>
						 <button class="btn-block btn btn-dark" style="margin-top: 15px;" id="btn"
						 data-toggle="modal" data-target="#exampleModalCenter">확인</button>
						 <button class="btn-block btn btn-dark" style="margin-top: 15px;" id="btn">내 정보 불러오기</button>
						</div>
						
						<div class="col-md-5" style="margin: auto">
						<p><strong>체질량 지수(BMI)란?</strong></p>
						<br>
						<p>키와 몸무게를 이용하여 지방의 양을 추정하는 비만 측정법으로 자신의 몸무게(kg)를 키(m)의 제곱으로 나눈 값입니다. <br><br>
						BMI = 체중(kg) / 키(m) x 키(m)
						</p>
						</div>
					</div>
					<br>
					 <a class="mb-4 d-block" data-fancybox="portfolio" 
						data-caption="Perfect planning">
						<img style="padding-left: 80px;width: 700px;" 
							src="${pageContext.request.contextPath }/resources/template/assets/images/diet.jpg" alt="">
					</a> 
					
					 <table class="tg" style="width: 650px;margin: auto;">
                  <thead>
                    <tr>
                      <th class="tg-6ykz" colspan="4">여성</th>
                      <th class="tg-396i" rowspan="2">신장</th>
                      <th class="tg-guxg" colspan="4">남성</th>
                    </tr>
                    <tr>
                      <td class="tg-3trw">비만</td>
                      <td class="tg-3trw">과체중</td>
                      <td class="tg-3trw">표준</td>
                      <td class="tg-3trw">저체중</td>
                      <td class="tg-3trw">저체중</td>
                      <td class="tg-3trw">표준</td>
                      <td class="tg-3trw">과체중</td>
                      <td class="tg-3trw">비만</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="tg-cqae">51.0</td>
                      <td class="tg-cqae">46.8</td>
                      <td class="tg-3trw">42.5</td>
                      <td class="tg-3trw">36.1</td>
                      <td class="tg-396i">150cm</td>
                      <td class="tg-3trw">38.3</td>
                      <td class="tg-3trw">45.0</td>
                      <td class="tg-3trw">49.5</td>
                      <td class="tg-3trw">54.0</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">52.0</td>
                      <td class="tg-cqae">47.7</td>
                      <td class="tg-3trw">43.4</td>
                      <td class="tg-3trw">36.8</td>
                      <td class="tg-396i">151cm</td>
                      <td class="tg-3trw">39.0</td>
                      <td class="tg-3trw">45.9</td>
                      <td class="tg-3trw">50.5</td>
                      <td class="tg-3trw">55.1</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">53.0</td>
                      <td class="tg-cqae">48.6</td>
                      <td class="tg-3trw">44.2</td>
                      <td class="tg-3trw">37.6</td>
                      <td class="tg-396i">152cm</td>
                      <td class="tg-3trw">39.8</td>
                      <td class="tg-3trw">46.8</td>
                      <td class="tg-3trw">51.5</td>
                      <td class="tg-3trw">56.2</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">54.1</td>
                      <td class="tg-cqae">49.6</td>
                      <td class="tg-3trw">45.1</td>
                      <td class="tg-3trw">38.3</td>
                      <td class="tg-396i">153cm</td>
                      <td class="tg-3trw">40.5</td>
                      <td class="tg-3trw">47.7</td>
                      <td class="tg-3trw">52.5</td>
                      <td class="tg-3trw">57.2</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">55.1</td>
                      <td class="tg-cqae">50.5</td>
                      <td class="tg-3trw">45.9</td>
                      <td class="tg-3trw">39.0</td>
                      <td class="tg-396i">154cm</td>
                      <td class="tg-3trw">41.3</td>
                      <td class="tg-3trw">48.6</td>
                      <td class="tg-3trw">53.5</td>
                      <td class="tg-3trw">58.3</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">56.1</td>
                      <td class="tg-cqae">51.4</td>
                      <td class="tg-3trw">46.8</td>
                      <td class="tg-3trw">39.7</td>
                      <td class="tg-396i">155cm</td>
                      <td class="tg-3trw">42.1</td>
                      <td class="tg-3trw">49.5</td>
                      <td class="tg-3trw">54.5</td>
                      <td class="tg-3trw">59.4</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">57.1</td>
                      <td class="tg-cqae">52.4</td>
                      <td class="tg-3trw">47.6</td>
                      <td class="tg-3trw">40.5</td>
                      <td class="tg-396i">156cm</td>
                      <td class="tg-3trw">42.8</td>
                      <td class="tg-3trw">50.4</td>
                      <td class="tg-3trw">55.4</td>
                      <td class="tg-3trw">60.5</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">58.1</td>
                      <td class="tg-cqae">53.3</td>
                      <td class="tg-3trw">48.5</td>
                      <td class="tg-3trw">41.2</td>
                      <td class="tg-396i">157cm</td>
                      <td class="tg-3trw">43.6</td>
                      <td class="tg-3trw">51.3</td>
                      <td class="tg-3trw">56.4</td>
                      <td class="tg-3trw">61.6</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">59.2</td>
                      <td class="tg-cqae">54.2</td>
                      <td class="tg-3trw">49.3</td>
                      <td class="tg-3trw">41.9</td>
                      <td class="tg-396i">158cm</td>
                      <td class="tg-3trw">44.4</td>
                      <td class="tg-3trw">52.2</td>
                      <td class="tg-3trw">57.4</td>
                      <td class="tg-3trw">62.6</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">60.2</td>
                      <td class="tg-cqae">55.2</td>
                      <td class="tg-3trw">50.2</td>
                      <td class="tg-3trw">42.6</td>
                      <td class="tg-396i">159cm</td>
                      <td class="tg-3trw">45.1</td>
                      <td class="tg-3trw">53.1</td>
                      <td class="tg-3trw">58.4</td>
                      <td class="tg-3trw">63.7</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">61.2</td>
                      <td class="tg-cqae">56.1</td>
                      <td class="tg-3trw">56.1</td>
                      <td class="tg-3trw">51.0</td>
                      <td class="tg-396i">160cm</td>
                      <td class="tg-3trw">45.9</td>
                      <td class="tg-3trw">54.0</td>
                      <td class="tg-3trw">59.4</td>
                      <td class="tg-3trw">64.8</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">62.2</td>
                      <td class="tg-cqae">57</td>
                      <td class="tg-3trw">51.9</td>
                      <td class="tg-3trw">44.8</td>
                      <td class="tg-396i">161cm</td>
                      <td class="tg-3trw">46.7</td>
                      <td class="tg-3trw">54.9</td>
                      <td class="tg-3trw">60.4</td>
                      <td class="tg-3trw">65.9</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">63.2</td>
                      <td class="tg-cqae">58.0</td>
                      <td class="tg-3trw">52.7</td>
                      <td class="tg-3trw">44.8</td>
                      <td class="tg-396i">162cm</td>
                      <td class="tg-3trw">47.4</td>
                      <td class="tg-3trw">55.8</td>
                      <td class="tg-3trw">61.4</td>
                      <td class="tg-3trw">67.0</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">64.3</td>
                      <td class="tg-cqae">58.9</td>
                      <td class="tg-3trw">53.6</td>
                      <td class="tg-3trw">45.5</td>
                      <td class="tg-396i">163cm</td>
                      <td class="tg-3trw">48.2</td>
                      <td class="tg-3trw">56.7</td>
                      <td class="tg-3trw">62.4</td>
                      <td class="tg-3trw">68.0</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">65.3</td>
                      <td class="tg-cqae">59.8</td>
                      <td class="tg-3trw">54.4</td>
                      <td class="tg-3trw">46.2</td>
                      <td class="tg-396i">164cm</td>
                      <td class="tg-3trw">49.0</td>
                      <td class="tg-3trw">57.6</td>
                      <td class="tg-3trw">63.4</td>
                      <td class="tg-3trw">69.1</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">66.3</td>
                      <td class="tg-cqae">60.8</td>
                      <td class="tg-3trw">55.3</td>
                      <td class="tg-3trw">47.0</td>
                      <td class="tg-396i">165cm</td>
                      <td class="tg-3trw">49.7</td>
                      <td class="tg-3trw">58.5</td>
                      <td class="tg-3trw">64.4</td>
                      <td class="tg-3trw">70.2</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">67.3</td>
                      <td class="tg-cqae">61.7</td>
                      <td class="tg-3trw">56.1</td>
                      <td class="tg-3trw">47.7</td>
                      <td class="tg-396i">166cm</td>
                      <td class="tg-3trw">50.5</td>
                      <td class="tg-3trw">59.4</td>
                      <td class="tg-3trw">65.3</td>
                      <td class="tg-3trw">71.3</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">68.3</td>
                      <td class="tg-cqae">62.6</td>
                      <td class="tg-3trw">57.0</td>
                      <td class="tg-3trw">48.4</td>
                      <td class="tg-396i">167cm</td>
                      <td class="tg-3trw">51.3</td>
                      <td class="tg-3trw">60.3</td>
                      <td class="tg-3trw">66.3</td>
                      <td class="tg-3trw">72.4</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">69.4</td>
                      <td class="tg-cqae">63.6</td>
                      <td class="tg-3trw">57.8</td>
                      <td class="tg-3trw">49.1</td>
                      <td class="tg-396i">168cm</td>
                      <td class="tg-3trw">52.0</td>
                      <td class="tg-3trw">61.2</td>
                      <td class="tg-3trw">67.3</td>
                      <td class="tg-3trw">73.4</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">70.4</td>
                      <td class="tg-cqae">64.5</td>
                      <td class="tg-3trw">58.7</td>
                      <td class="tg-3trw">49.9</td>
                      <td class="tg-396i">169cm</td>
                      <td class="tg-3trw">52.8</td>
                      <td class="tg-3trw">62.1</td>
                      <td class="tg-3trw">68.3</td>
                      <td class="tg-3trw">74.5</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">71.4</td>
                      <td class="tg-cqae">65.5</td>
                      <td class="tg-3trw">59.5</td>
                      <td class="tg-3trw">50.6</td>
                      <td class="tg-396i">170cm</td>
                      <td class="tg-3trw">53.6</td>
                      <td class="tg-3trw">63.0</td>
                      <td class="tg-3trw">69.3</td>
                      <td class="tg-3trw">75.6</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">72.4</td>
                      <td class="tg-cqae">66.4</td>
                      <td class="tg-3trw">60.4</td>
                      <td class="tg-3trw">51.3</td>
                      <td class="tg-396i">171cm</td>
                      <td class="tg-3trw">54.3</td>
                      <td class="tg-3trw">63.9</td>
                      <td class="tg-3trw">70.3</td>
                      <td class="tg-3trw">76.7</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">73.4</td>
                      <td class="tg-cqae">67.3</td>
                      <td class="tg-3trw">61.2</td>
                      <td class="tg-3trw">52.0</td>
                      <td class="tg-396i">172cm</td>
                      <td class="tg-3trw">55.1</td>
                      <td class="tg-3trw">64.8</td>
                      <td class="tg-3trw">71.3</td>
                      <td class="tg-3trw">77.8</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">74.5</td>
                      <td class="tg-cqae">68.3</td>
                      <td class="tg-3trw">62.1</td>
                      <td class="tg-3trw">52.7</td>
                      <td class="tg-396i">173cm</td>
                      <td class="tg-3trw">55.8</td>
                      <td class="tg-3trw">65.7</td>
                      <td class="tg-3trw">72.3</td>
                      <td class="tg-3trw">79.9</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">75.5</td>
                      <td class="tg-cqae">69.2</td>
                      <td class="tg-3trw">62.9</td>
                      <td class="tg-3trw">53.5</td>
                      <td class="tg-396i">174cm</td>
                      <td class="tg-3trw">56.6</td>
                      <td class="tg-3trw">66.6</td>
                      <td class="tg-3trw">73.3</td>
                      <td class="tg-3trw">79.9</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">76.5</td>
                      <td class="tg-cqae">70.1</td>
                      <td class="tg-3trw">63.8</td>
                      <td class="tg-3trw">54.2</td>
                      <td class="tg-396i">175cm</td>
                      <td class="tg-3trw">57.4</td>
                      <td class="tg-3trw">67.5</td>
                      <td class="tg-3trw">74.3</td>
                      <td class="tg-3trw">81.0</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">77.5</td>
                      <td class="tg-cqae">71.1</td>
                      <td class="tg-3trw">64.6</td>
                      <td class="tg-3trw">54.9</td>
                      <td class="tg-396i">176cm</td>
                      <td class="tg-3trw">58.1</td>
                      <td class="tg-3trw">68.4</td>
                      <td class="tg-3trw">75.2</td>
                      <td class="tg-3trw">82.1</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">78.5</td>
                      <td class="tg-cqae">72.0</td>
                      <td class="tg-3trw">65.5</td>
                      <td class="tg-3trw">55.6</td>
                      <td class="tg-396i">177cm</td>
                      <td class="tg-3trw">58.9</td>
                      <td class="tg-3trw">69.3</td>
                      <td class="tg-3trw">76.2</td>
                      <td class="tg-3trw">83.2</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">79.6</td>
                      <td class="tg-cqae">72.9</td>
                      <td class="tg-3trw">66.3</td>
                      <td class="tg-3trw">56.4</td>
                      <td class="tg-396i">178cm</td>
                      <td class="tg-3trw">59.7</td>
                      <td class="tg-3trw">70.2</td>
                      <td class="tg-3trw">77.2</td>
                      <td class="tg-3trw">84.2</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">80.6</td>
                      <td class="tg-cqae">73.9</td>
                      <td class="tg-3trw">67.2</td>
                      <td class="tg-3trw">57.1</td>
                      <td class="tg-396i">179cm</td>
                      <td class="tg-3trw">60.4</td>
                      <td class="tg-3trw">71.1</td>
                      <td class="tg-3trw">78.2</td>
                      <td class="tg-3trw">85.3</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">81.6</td>
                      <td class="tg-cqae">74.8</td>
                      <td class="tg-3trw">68.0</td>
                      <td class="tg-3trw">57.8</td>
                      <td class="tg-396i">180cm</td>
                      <td class="tg-3trw">61.2</td>
                      <td class="tg-3trw">72.0</td>
                      <td class="tg-3trw">79.2</td>
                      <td class="tg-3trw">86.4</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">82.6</td>
                      <td class="tg-cqae">75.7</td>
                      <td class="tg-3trw">68.9</td>
                      <td class="tg-3trw">58.5</td>
                      <td class="tg-396i">181cm</td>
                      <td class="tg-3trw">62.0</td>
                      <td class="tg-3trw">72.9</td>
                      <td class="tg-3trw">80.2</td>
                      <td class="tg-3trw">87.5</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">83.6</td>
                      <td class="tg-cqae">76.6</td>
                      <td class="tg-3trw">69.7</td>
                      <td class="tg-3trw">59.2</td>
                      <td class="tg-396i">182cm</td>
                      <td class="tg-3trw">62.7</td>
                      <td class="tg-3trw">73.8</td>
                      <td class="tg-3trw">81.2</td>
                      <td class="tg-3trw">88.6</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">84.7</td>
                      <td class="tg-cqae">77.6</td>
                      <td class="tg-3trw">70.6</td>
                      <td class="tg-3trw">60.0</td>
                      <td class="tg-396i">183cm</td>
                      <td class="tg-3trw">63.5</td>
                      <td class="tg-3trw">74.7</td>
                      <td class="tg-3trw">82.2</td>
                      <td class="tg-3trw">89.6</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">85.7</td>
                      <td class="tg-cqae">78.5</td>
                      <td class="tg-3trw">71.4</td>
                      <td class="tg-3trw">60.7</td>
                      <td class="tg-396i">184cm</td>
                      <td class="tg-3trw">64.3</td>
                      <td class="tg-3trw">75.6</td>
                      <td class="tg-3trw">83.2</td>
                      <td class="tg-3trw">90.7</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">86.7</td>
                      <td class="tg-cqae">79.5</td>
                      <td class="tg-3trw">72.3</td>
                      <td class="tg-3trw">61.4</td>
                      <td class="tg-396i">185cm</td>
                      <td class="tg-3trw">65.0</td>
                      <td class="tg-3trw">76.5</td>
                      <td class="tg-3trw">84.2</td>
                      <td class="tg-3trw">91.8</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">87.7</td>
                      <td class="tg-cqae">80.4</td>
                      <td class="tg-3trw">73.1</td>
                      <td class="tg-3trw">62.1</td>
                      <td class="tg-396i">186cm</td>
                      <td class="tg-3trw">65.8</td>
                      <td class="tg-3trw">77.4</td>
                      <td class="tg-3trw">85.1</td>
                      <td class="tg-3trw">92.9</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">88.7</td>
                      <td class="tg-cqae">81.3</td>
                      <td class="tg-3trw">74.0</td>
                      <td class="tg-3trw">62.9</td>
                      <td class="tg-396i">187cm</td>
                      <td class="tg-3trw">66.6</td>
                      <td class="tg-3trw">78.3</td>
                      <td class="tg-3trw">86.1</td>
                      <td class="tg-3trw">94.0</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">89.8</td>
                      <td class="tg-cqae">82.3</td>
                      <td class="tg-3trw">74.8</td>
                      <td class="tg-3trw">63.6</td>
                      <td class="tg-396i">188cm</td>
                      <td class="tg-3trw">67.3</td>
                      <td class="tg-3trw">79.2</td>
                      <td class="tg-3trw">87.1</td>
                      <td class="tg-3trw">95.0</td>
                    </tr>
                    <tr>
                      <td class="tg-cqae">90.8</td>
                      <td class="tg-cqae">83.2</td>
                      <td class="tg-3trw">75.7</td>
                      <td class="tg-3trw">64.3</td>
                      <td class="tg-396i">189cm</td>
                      <td class="tg-3trw">68.1</td>
                      <td class="tg-3trw">80.1</td>
                      <td class="tg-3trw">88.1</td>
                      <td class="tg-3trw">96.1</td>
                    </tr>
           <tr>
                      <td class="tg-cqae">91.8</td>
                      <td class="tg-cqae">84.2</td>
                      <td class="tg-3trw">76.5</td>
                      <td class="tg-3trw">65.0</td>
                      <td class="tg-396i">190cm</td>
                      <td class="tg-3trw">68.9</td>
                      <td class="tg-3trw">81.0</td>
                      <td class="tg-3trw">89.1</td>
                      <td class="tg-3trw">97.2</td>
                    </tr>
                  </tbody>
               </table>   
				</div>
				
				<!-- 모달 -->
				<div class="modal fade text-left" id="exampleModalCenter" tabindex="-1" role="dialog" 
							aria-labelledby="exampleModalCenter" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
				  		<div class="modal-content" id="modals">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle" ><p>표준 몸무게 확인 지표</p></h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<br>
								 <ul style="padding-left: 60px;">
							      <li class="p-3 mb-2 text-dark" style="background-color: #CEF6CE">저체중</li>
							      <li class="p-3 mb-2 text-dark" style="background-color: #F3E2A9">정상</li>
							      <li class="p-3 mb-2 text-dark" style="background-color: #FFBF00">과체중</li>
							      <li class="p-3 mb-2 text-dark" style="background-color: #FA8258">비만</li>
							      <li class="p-3 mb-2 text-dark" style="background-color: #FA5858">고도비만</li>
							    </ul>
							    <br>
							    <ul style="padding-left: 60px;">
							      <img id="1" style="padding-left: 25px;" src="${pageContext.request.contextPath }/resources/template/assets/images/triangle.png" alt="">
							      <img id="2" style="padding-left: 90px;" src="${pageContext.request.contextPath }/resources/template/assets/images/triangle.png" alt="">
							      <img id="3" style="padding-left: 155px;" src="${pageContext.request.contextPath }/resources/template/assets/images/triangle.png" alt="">
							      <img id="4" style="padding-left: 225px;" src="${pageContext.request.contextPath }/resources/template/assets/images/triangle.png" alt="">
							      <img id="5" style="padding-left: 300px;" src="${pageContext.request.contextPath }/resources/template/assets/images/triangle.png" alt="">
							    </ul>
							    <br>
							    <p id="content" style="text-align: center;"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</html>