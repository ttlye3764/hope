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

		} else {
			$('#1').hide();
			$('#2').hide();
			$('#3').hide();
			$('#4').hide();
			$('#5').hide();
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
						<div class="col-md-12" style="padding-left: 300px;">
							<h2 class="mb-3">BMI 측정</h2></div>
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
					</div>
					<br>
					<a class="mb-4 d-block" data-fancybox="portfolio" 
						data-caption="Perfect planning">
						<img style="padding-left: 95px;width: 650px;" src="${pageContext.request.contextPath }/resources/template/assets/images/diet.jpg" alt="">
					</a>
				</div>
				
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