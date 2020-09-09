<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- c:url을 이용하여 처리 -->
<c:url var="regustMemberURI" value="/user/member/memberForm.do"></c:url>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript'>
$(function(){
	$("#mem_pass").keyup(function(e){if(e.keyCode == 13) checkpass();});
		
	$('#btn3').click(function() {
		$(location).attr('href','${pageContext.request.contextPath}/user/main/mainForm.do');
	});
	var id = '${LOGIN_MEMBERINFO.mem_id}';
	var social = '${LOGIN_MEMBERINFO.mem_join_addr}';
	if(social=='n'){
		swal({
      	    title: "",
      	    text: "소셜 로그인 사용자는 이용할 수 없습니다.",
      	    type: "warning"
      	}).then(function() {
      		window.history.back();
      	});
	   }else if(id==''){
		   swal({
	      	    title: "",
	      	    text: "로그인 후 이용해주세요.",
	      	    type: "warning"
	      	}).then(function() {
	      		$(location).attr('href','${pageContext.request.contextPath}/user/main/mainForm.do');
	      	});
	   }
});
function checkpass(){
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/member/passCheck.do',
		dataType : 'json',
		data : {
			mem_pass : $('#mem_pass').val()
		},
		success : function(result) {
			if(result.json == '1'){
				$(location).attr('href','${pageContext.request.contextPath}/user/member/myPage.do');
			}else{
				$('#lb').css('color', 'red');
		        $("#lb").text("잘못된 비밀번호 입니다.");
			}
		}
	});
}
</script>
<style>
.endbtn {
	background-color: #4CBD94;
	color: white;
	height: 30px;
	width: 80px;
}

tr {
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
	margin: 10px;
	padding: 10px;
}

td {
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
	margin: 10px;
	padding: 10px;
}

.idright {
	text-align: right;
}
</style>
	<div class="innerpage-banner center bg-overlay-dark-7 py-7"
		style="background: url(assets/images/bg/04.jpg) no-repeat; background-size: cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">비밀번호 확인</h1>
					<h6 class="subtitle">현재 비밀번호를 입력해주세요.</h6>
					<div align="center">
						<table width="500px">
							<tr>
								<td width="280px"><input type="password" name="mem_pass" id="mem_pass"
									class="form-control" /></td>
							</tr>
							<tr><td><label id="lb"></label></td></tr>
						</table>
						<button id="btn1" type="button" onclick="checkpass()">확인</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="btn3" type="button">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
