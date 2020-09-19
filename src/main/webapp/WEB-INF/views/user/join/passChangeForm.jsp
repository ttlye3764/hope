<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- c:url을 이용하여 처리 -->
<c:url var="regustMemberURI" value="/user/join/joinForm.do"></c:url>
	
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
		$(location).attr('href','${pageContext.request.contextPath}/user/main/mainForm.do');
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
<div class="innerpage-banner center bg-overlay-dark-7 py-7"
		style="background: url(assets/images/bg/04.jpg) no-repeat; background-size: cover; background-position: center center;">
      <div class="container">
         <div class="row all-text-white">
            <div class="col-md-12 align-self-center">
               <h3 class="innerpage-title">비밀번호 변경</h3>
               <div align="center">
	               <table width="400px">
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
					<button	id="btn3" type="button">다음에 변경하기 </button>
				</div>
            </div>
         </div>
      </div>
   </div>
</div>
