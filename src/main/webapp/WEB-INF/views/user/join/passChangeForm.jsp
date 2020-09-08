<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- c:url을 이용하여 처리 -->
<c:url var="regustMemberURI" value="/user/member/memberForm.do"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Wizixo | Creative Multipurpose Bootstrap Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Creative Multipurpose Bootstrap Template">

	<!-- Favicon -->
	<link rel="shortcut icon" href="assets/images/favicon.ico">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CPlayfair+Display:400,400i,700,700i%7CRoboto:400,400i,500,700" rel="stylesheet">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="assets/vendor/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="assets/vendor/themify-icons/css/themify-icons.css" />
	<link rel="stylesheet" type="text/css" href="assets/vendor/animate/animate.min.css" />

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript'>
$(function(){
	$('#btn1').click(function(){
		if($('#passchecklb').text()=="비밀번호가 일치하지 않습니다."){
			swal("","비밀번호를 확인해주세요.", "warning");
			return false;
		}
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/join/passChange.do',
			dataType : 'json',
			data : {
				mem_pass : $('#mem_pass').val()
			},
			success : function(result) {
				//{ flag : true | false}
				$(location).attr('href','${pageContext.request.contextPath}/user/main/mainForm.do');
			}
		});
	});
		
	$('#btn3').click(function() {
		$(location).attr('href','${pageContext.request.contextPath}/user/join/loginForm2.do');
	});
});
function pwcheck(){
	var pw = $('#mem_pass').val();
	var pw2 = $('#pass2').val();

	if(pw=='' || pw2==''){
		$('#passchecklb').text("");
		return false;
	}

	if(pw==pw2){
		$('#passchecklb').text("비밀번호가 일치합니다.");
		$('#passchecklb').css('color', 'blue');
	}else{
		$('#passchecklb').text("비밀번호가 일치하지 않습니다.");
		$('#passchecklb').css('color', 'red');
	}
}
</script>
<style>
.endbtn{
	background-color: #4CBD94; 
	color : white;
	height : 30px;
	width : 80px;
}
tr{
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
	margin : 10px;
	padding : 10px;
}
td{
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
	margin : 10px;
	padding : 10px;
}
.idright{
	text-align:right;
}
</style>
</head>
<body>
<div align="center">
<h3>비밀번호 변경</h3>
	<table width="500px">
		<tr>
			<td class="fieldName" width="120px" height="25" class="idright">비밀번호</td>
			<td><input type="password" name="mem_pass" id="mem_pass" onkeyup="pwcheck()" 
			class="form-control"/></td>
		</tr>

		<tr>
			<td class="fieldName" width="120px" height="25" class="idright">비밀번호확인</td>
			<td><input type="password" name="mem_pass_confirm" id="pass2" onkeyup="pwcheck()" 
			class="form-control"/> <label id="passchecklb"></label></td>
		</tr>
	</table>
	<input id="btn1" type="submit" value="변경">
					&nbsp;&nbsp;&nbsp;&nbsp;
	<button	id="btn3" type="button">취소 </button>
</div>
</body>
</html>