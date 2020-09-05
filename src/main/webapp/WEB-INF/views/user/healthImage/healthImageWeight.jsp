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
		var tall = $('#tall').val();
		var weight = $('#weight').val();

		if (tall == "" || weight == "") {
			alert("키 또는 몸무게를 입력해주세요.");

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
						    <td class="tg-cqae">51</td>
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
						    <td class="tg-cqae">52</td>
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
						    <td class="tg-cqae">53</td>
						    <td class="tg-cqae">48.6</td>
						    <td class="tg-3trw">44.2</td>
						    <td class="tg-3trw">37.6</td>
						    <td class="tg-396i">152cm</td>
						    <td class="tg-3trw">39.8</td>
						    <td class="tg-3trw">46.8</td>
						    <td class="tg-3trw">51.5</td>
						    <td class="tg-3trw"></td>
						  </tr>
						  <tr>
						    <td class="tg-cqae">54.1</td>
						    <td class="tg-cqae">49.6</td>
						    <td class="tg-3trw">45.1</td>
						    <td class="tg-3trw"></td>
						    <td class="tg-396i"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						  </tr>
						  <tr>
						    <td class="tg-cqae">55.1</td>
						    <td class="tg-cqae">50.5</td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-396i"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						  </tr>
						  <tr>
						    <td class="tg-cqae">561</td>
						    <td class="tg-cqae">51.4</td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-396i"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						  </tr>
						  <tr>
						    <td class="tg-cqae">57.1</td>
						    <td class="tg-cqae">52.4</td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-396i"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						  </tr>
						  <tr>
						    <td class="tg-cqae">581</td>
						    <td class="tg-cqae">53.3</td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-396i"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						    <td class="tg-3trw"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">59.2</td>
						    <td class="tg-lboi">54.2</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">60.2</td>
						    <td class="tg-lboi">55.2</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">612</td>
						    <td class="tg-lboi">56.1</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">62.2</td>
						    <td class="tg-lboi">57</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">63.2</td>
						    <td class="tg-lboi">58</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">64.3</td>
						    <td class="tg-lboi">58.9</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">65.3</td>
						    <td class="tg-lboi">59.8</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">66.3</td>
						    <td class="tg-lboi">60.8</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">67.3</td>
						    <td class="tg-lboi">61.7</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">68.3</td>
						    <td class="tg-lboi">62.6</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">69.4</td>
						    <td class="tg-lboi">63.6</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">70.4</td>
						    <td class="tg-lboi">64.5</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">714</td>
						    <td class="tg-lboi">65.5</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">72.4</td>
						    <td class="tg-lboi">66.4</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">73.4</td>
						    <td class="tg-lboi">67.3</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">74.5</td>
						    <td class="tg-lboi">68.3</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">75.5</td>
						    <td class="tg-lboi">69.2</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">76.5</td>
						    <td class="tg-lboi">70.1</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">77.5</td>
						    <td class="tg-lboi">71.1</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">78.5</td>
						    <td class="tg-lboi">72</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">79.6</td>
						    <td class="tg-lboi">72.9</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">80.6</td>
						    <td class="tg-lboi">73.9</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">81.6</td>
						    <td class="tg-lboi">74.8</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">82.6</td>
						    <td class="tg-lboi">75.7</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">83.6</td>
						    <td class="tg-lboi">76.7</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">84.7</td>
						    <td class="tg-lboi">77.6</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">85.7</td>
						    <td class="tg-lboi">78.5</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">86.7</td>
						    <td class="tg-lboi">79.5</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">87.7</td>
						    <td class="tg-lboi">80.4</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">88.7</td>
						    <td class="tg-lboi">81.3</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">89.8</td>
						    <td class="tg-lboi">82.3</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">90.8</td>
						    <td class="tg-lboi">83.2</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						  </tr>
						  <tr>
						    <td class="tg-lboi">91.8</td>
						    <td class="tg-lboi">84.2</td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-y698"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
						    <td class="tg-0pky"></td>
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

</body>
</html>