<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <style>
 .bmi-calculator{
 	position : absolute;
 	left : 10%;
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
						<h5 class="widget-title" id="dietSide_h5_my">나의 식단 관리</h5>
						<p class="mb-0"> 나만의 식단 관리를 체험해보세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_dayKcal">일일 열량</h5>
						<p class="mb-0">일일 추천 열량과 운동별 열량 소모량을 확인하세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_menuList">칼로리 사전</h5>
						<p class="mb-0">음식별 칼로리를 확인하세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_recommendDiet">추천 식단 리스트</h5>
						<p class="mb-0"> 회원님에게 맞는 식단표를 확인해보세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_bmi">BMI 계산기</h5>
						<p class="mb-0">회원님의 BMI를 확인해보세요!</p>
					</div>
				</aside>
				<!-- sidebar end -->

				
				<div class="col-md-9 order-first order-lg-first">
					<!-- Post item  with image-->
				<div class="col-md-6 mb-4">
					<h5 class="mb-4">BMI 계산법</h5>
					<blockquote class="blockquote bg-grad" cite="#" style="width:600px !important" >
						<h5 class="mb-2 ">BMI지수= 몸무게(kg) ÷ (신장(m) × 신장(m))</h5>
						<cite>– 값이 18.5 이하면 저체중, 18.5~23은 정상, 23~25는 과체중
							,<br>   25~30은 비만, 30이상은 고도비만</cite>
					</blockquote>
				</div>
				
				
				<form name="bmiForm">
				<div class="bmi-calculator">
					<h3 style="margin-bottom: 1em;">당신의 BMI를 계산해보세요!!</h3>
					<div class="bmi-calculator-weight">
						<input class="weight-slider" name="realweight" id="myWeight"
							type="range" min="25" max="180" value="60">
						<p style="margin-top: 1.8em;">
							몸무게 : <input name="Teža" id="inputWeight" type="number"
								value="60" min="25" max="180"
								oninput="showValWeight(this.value)"> <span id="weight"></span>
							kg
						</p>
					</div>
					<div class="bmi-calculator-height">
						<input class="height-slider" name="realheight" id="myHeight"
							type="range" min="100" max="220" value="160">
						<p style="margin-top: 1.8em;">
							키 : <input name="Višina" id="inputHeight" type="number"
								value="160" min="100" max="220"
								oninput="showValHeight(this.value)"> <span id="height"></span>
							cm
						</p>
					</div>
					<input class="gumb" type="button" value="Calculate"
						onclick="calculateBmi()" style="margin-top: 0.5em">
					<p style="margin-top: 1em; font-size: 1.2em;">
						<strong>당신의 BMI 지수:</strong> <span id="yourbmi"
							style="font-size: 1.2em; margin-left: 8px;"> 35.9</span>
					</p>
					<p></p>
					<p>
						<span id="evaluationMessage">YOU'RE A FAT ASS!!!</span>
					</p>
				</div>
			</form>

				</div>

			
			<!-- blog End -->
			</div>
		</div>
	</section>
	
<script type="text/javascript" >
$(function(){

	
})


	// Define variables for range sliders
	// Weight variables
	var weightSlider = document.getElementById("myWeight");
	var weightOutput = document.getElementById("inputWeight");
	// Height variables
	var heightSlider = document.getElementById("myHeight");
	var heightOutput = document.getElementById("inputHeight");
	// Display slider value
	weightOutput.innerHTML = weightSlider.value;
	heightOutput.innerHTML = heightSlider.value;
	// Update sliders in real time while dragging it
	weightSlider.oninput = function () {
	  weightOutput.innerHTML = this.value;
	}
	heightSlider.oninput = function () {
	  heightOutput.innerHTML = this.value;
	}
	// Change weight-slider value on weight-number input
	function showValWeight(newVal) {
	  weightSlider.value=newVal;
	};
	// Change height-slider value on height-number input
	function showValHeight(newVal) {
	  heightSlider.value=newVal;
	};
	// *** Change number input when dragging slider ***
	// Add 2 eventListeners for weight and input sliders
	weightSlider.addEventListener("input", updateValueWeight);
	heightSlider.addEventListener("input", updateValueHeight);
	function updateValueWeight(e) {
	  weightOutput.value = e.srcElement.value;
	}
	function updateValueHeight(e) {
	  heightOutput.value = e.srcElement.value;
	}
	// Calculate BMI
	function calculateBmi() {
	  var weight = document.bmiForm.realweight.value;
	  var height = (document.bmiForm.realheight.value)/100;
	  var realbmi = (weight)/Math.pow(height, 2);
	  var realbmiOutput = document.getElementById("yourbmi");
	  var messageOutput = document.getElementById("evaluationMessage");
	  var roundedBmi = realbmi.toFixed(1);
	  messageOutput.innerHTML = ""; // Clear message before calculating new BMI
	  realbmiOutput.innerHTML = " " + roundedBmi; // Print BMI
	  // Appropriate message for your BMI rating
	  if (roundedBmi > 26) {
	    messageOutput.innerHTML = "YOU'RE A FAT ASS!!!";
	  } else {
	    
	  }
	  // Console loggings
	  console.log('Teža: ' + weight + " kg");
	  console.log('Višina: ' + height + " m");
	  console.log('BMI: ' + realbmi);
	}
</script>