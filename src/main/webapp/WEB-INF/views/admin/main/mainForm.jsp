<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
	<title>Wizixo | Creative Multipurpose Bootstrap Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Creative Multipurpose Bootstrap Template">

	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/template/assets/images/favicon.ico">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CPlayfair+Display:400,400i,700,700i%7CRoboto:400,400i,500,700" rel="stylesheet">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/themify-icons/css/themify-icons.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/animate/animate.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/owlcarousel/css/owl.carousel.min.css" />

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/css/style.css" />
	
	<script>
		function LogOut(){
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/join/logout.do',
				dataType : 'JSON',
				data : {
				},
				success : function(result) {
					$(location).attr('href','${pageContext.request.contextPath}/user/join/loginForm.do');
				}
			});
		}
</script>
</head>
	<!-- =======================
	service  -->
	<section class="bg-light" style="margin-left:250px">
		<div class="container">
			<div class="row">
				<div class="col-md-8 mx-auto text-center mb-5">
					<h2 class="h1 font-weight-bold">관리자 메인페이지</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-lg-3 mb-4 mb-lg-0">
					<div class="shadow-hover h-100 bg-white px-5 pt-0 pb-5 text-center up-on-hover">
						<a class="h5" href="${pageContext.request.contextPath}/admin/member/memberList.do">
						<span class="alt-font text-light-gray display-2 font-italic opacity-2">01</span>
						<span class="d-block mb-4"><img src="../../image/member.png" style="width:174px; height:125px;"></span>
						MemberList</a>
					</div>
				</div>
				<div class="col-sm-6 col-lg-3 mb-4 mb-lg-0">
					<div class="shadow-hover h-100 bg-white px-5 pt-0 pb-5 text-center up-on-hover">
						<a class="h5" href="${pageContext.request.contextPath}/admin/healthImage/healthImageList.do">
						<span class="alt-font text-light-gray display-2 font-italic opacity-2">02</span>
						<span class="d-block mb-4"><img src="../../image/health.png" style="width:180px; height:130px;"></span>
						Health</a>
					</div>
				</div>
				<div class="col-sm-6 col-lg-3 mb-4 mb-lg-0">
					<div class="shadow-hover h-100 bg-white px-5 pt-0 pb-5 text-center up-on-hover">
						<a class="h5" href="${pageContext.request.contextPath}/admin/knowledge/knowledgeList.do">
						<span class="alt-font text-light-gray display-2 font-italic opacity-2">03</span>
						<span class="d-block mb-4"><img src="../../image/knowledge.png" style="width:174px; height:125px;"></span>
						Knowledge</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto text-center mt-5">
					<a class="btn btn-dark" href="javascript:LogOut();">로그아웃</a>
				</div>
			</div>
		</div>
	</section>
	<!-- =======================
	service  -->

	<div> <a href="#" class="back-top btn btn-grad"><i class="ti-angle-up"></i></a> </div>

	<!--Global JS-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!--Vendors-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fancybox/js/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/owlcarousel/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/swiper/js/swiper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jarallax/jarallax.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/animated-headline/main.js"></script>

	<!--Template Functions-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>

</body>
</html>