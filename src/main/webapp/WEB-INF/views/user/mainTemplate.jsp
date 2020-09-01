<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function LogOut(){
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/join/logout.do',
		dataType : 'JSON',
		data : {
		},
		success : function(result) {
			location.reload(true);
		}
	});
}
</script>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/fancybox/css/jquery.fancybox.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/owlcarousel/css/owl.carousel.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/swiper/css/swiper.min.css" />
	
	<!-- chat CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/chat.css">
<%-- 	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/myCSS/chatMain.css"> --%>

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/css/style.css" />

	 <link rel="shortcut icon" href="assets/favicon.ico">  
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- FontAwesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.1.1/js/all.js" integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/documentation/assets/css/bootstrap.min.css">   
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/documentation/assets/css/prism.css">
    <link id="theme-style" rel="stylesheet" href="${pageContext.request.contextPath }/resources/documentation/assets/css/styles.css"> 
    
    <!-- script -->
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <!--Global JS-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!--Vendors-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fancybox/js/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/owlcarousel/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/swiper/js/swiper.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/wow/wow.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-countTo/jquery.countTo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-appear/jquery.appear.js"></script>

	<!--Template Functions-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
	
	<!-- Main Javascript -->          
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/documentation/assets/js/jquery-3.3.1.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/documentation/assets/js/jquery.scrollTo.min.js"></script>      
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/documentation/assets/js/stickyfill.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/documentation/assets/js/prism.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/documentation/assets/js/main.js"></script>

	<!-- dietSide javascript -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/dietSide.js"></script>
	
</head>

<body>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<div id="wrapper">
	<tiles:insertAttribute name="left"></tiles:insertAttribute>
	<div id="page-wrapper">
		<%-- <tiles:insertAttribute name="content_header"></tiles:insertAttribute> --%>
		<div class="page-content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</div>

</body>
</html>