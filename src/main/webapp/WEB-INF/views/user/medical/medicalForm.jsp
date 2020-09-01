<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta charset="UTF-8">
<script>
$(function(){
	$('#pill_img').on('change', handleImgFileSelect);
	
	$('#pill_alerttime').change(function(){
		var x = document.getElementById("pill_alerttime").value;
	})
	
	$('#pill_start').change(function (){
		var date = $('#pill_start').val();
        date2 = $('#pill_end').val();
        if(date > date2){
			alert('복용시작일과 복용종료일을 제대로 입력해주세요.');
			$('#pill_count1').val("0");
		}else{			
			var dateString = date; 
			var dateString2 = date2;
			var dateArray = dateString.split("-");
			var dateArray2 = dateString2.split("-");
			var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
			var dateObj2 = new Date(dateArray2[0], Number(dateArray2[1])-1, dateArray2[2]);  
			var betweenDay = (dateObj2.getTime() - dateObj.getTime())/1000/60/60/24;
			$('#pill_count').val(betweenDay);
		}
 	});
	$('#pill_end').change(function (){
		var date = $('#pill_start').val();
		var date2 = $('#pill_end').val();
		if(date > date2){
			alert('복용시작일과 복용종료일을 제대로 입력해주세요.');
			$('#pill_count1').val("0");
		}else{
			var dateString = date; 
			var dateString2 = date2;
			var dateArray = dateString.split("-");
			var dateArray2 = dateString2.split("-");
			var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
			var dateObj2 = new Date(dateArray2[0], Number(dateArray2[1])-1, dateArray2[2]);  
			var betweenDay = (dateObj2.getTime() - dateObj.getTime())/1000/60/60/24;
			$('#pill_count1').val(betweenDay);
			$('#pill_count').val(betweenDay);
		}
	});
	
	$('form[name=contactform]').on('submit', function(){
		
		//기간이 틀렸을경우 전송이 안되게해야함		
        $(this).attr('action','${pageContext.request.contextPath}/user/medical/insertMedicalInfo.do');
        return true;
     });
	
})
    function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지만 업로드 가능합니다.");
				return;
			}
			
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e)	{
					$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

</script>
</head>

<body>
	<section class="contact-page">
		<div class="container" style="">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<h2>약 복용정보 등록</h2>
					</div>
				</div>
			</div>
			<div class="row "  style="margin-left: 25%; width: 100%; display: inline-block;">
				<!-- contact form -->
				<div class="col-md-6">
					<div class="h-100">
						<form class="contact-form" id="contact-form" name="contactform" action="${pageContext.request.contextPath}/user/medical/insertMedicalInfo.do" method="post" enctype="multipart/form-data">			
							<!-- Start main form -->
							<div class="row">
								<div class="col-md-6">
									<!-- name -->
										<label>제품 명 </label><input id="pill_name" name="pill_name" type="text" class="form-control" placeholder="제품명">
										<label>복용일수 </label><input id="pill_count1" name="pill_count1" type="text" class="form-control" disabled>
										<input id="pill_count" name="pill_count" type="hidden" class="form-control">
										<label>복용시작일</label><input type="date" id="pill_start" name="pill_start"  class="form-control">
										<label>복용종료일</label><input type="date" id="pill_end" name="pill_end" class="form-control">
										<label>알림시간설정</label><input type="time" id="pill_alerttime" name="pill_alerttime" class="form-control">
								</div>	
								<div class="col-md-6" style="width: 100px;">
									<div></div>
									<div class="col-md-12 text-center">
									<input type="file" class="btn btn-outline-primary btn-block" style="margin-top: 30px;" id="pill_img" name="pill_img">
									</div>
									<%-- <div style="width: 230px; height: 150px;" ><img src="${pageContext.request.contextPath}/images/thumbs/car-1.jpg" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;"></div> --%>
									
									<div style="width: 230px; height: 150px;" >
									<img id="img" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;">
									</div>
									
									<div class="col-md-12 text-center"><button class="btn btn-outline-primary btn-block" style="margin-top: 60px;">약 상세보기</button></div>
									<label>달력 표시 색 설정</label><div><input type="color" id="pill_color" name="pill_color"></div>
								</div>																							
								<!-- submit button -->
								<div class="col-md-12 text-center">
								<button class="btn btn-outline-grad btn-block" type="submit">등록</button>
								</div>
							</div>
							<!-- End main form -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>	

	<div> <a href="#" class="back-top btn btn-grad"><i class="ti-angle-up"></i></a> </div>

	<!--Global JS-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Google Map -->
	<script src="assets/vendor/map/map.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtF5lHSU7Y7c2BYl_c4-G9bSi44h1X9Ls"></script>

	<!--Template Functions-->
	<script src="assets/js/functions.js"></script>

</body>
</html>