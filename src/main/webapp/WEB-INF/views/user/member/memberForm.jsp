<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<style>
.fieldName {
	text-align: center;
	background-color: #f4f4f4;
	margin-top : 10px;
}

.tLine {
	background-color: #d2d2d2;
	height: 1px;
}

td {
	text-align: left;
}
.btn{
	color : #4CBD94;
}
.addr{
	width : 250px;
}
.endbtn{
	background-color: #4CBD94; 
	color : white;
	height : 40px;
	width : 150px;
}
table{
	margin-left: 40%;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function idCheck() {
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/member/idCheck.do',
			dataType : 'JSON',
			data : {
				mem_id : $('#mem_id1').val()
			},
			error : function(result) {
				alert(result.json);
			},
			success : function(result) {
				alert(result.json);
				if(result.json == '사용가능한 아이디입니다.'){
					var mem_id = $('#mem_id1').val();
					$('#mem_id').val(mem_id);
					$('#mem_id1').attr("disabled", true)
				}
			}
		});
	};

	function sendsms() {
		var mem_hp = $('select[name=mem_hp1]').val() + '-'
				+ $('input[name=mem_hp2]').val() + '-'
				+ $('input[name=mem_hp3]').val();
		$('input[name=mem_hp]').val(mem_hp);

		hp = $('input[name=mem_hp2]').val();
		hp1 = $('input[name=mem_hp3]').val();

		if(hp=='' || hp1==''){
			alert('올바른 휴대전화 번호를 입력해주세요.');
			return false;
		}
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/sms/sendSms.do',
			dataType : 'JSON',
			data : {
				mem_hp : $('input[name=mem_hp]').val()
			},
			error : function(result) {
				alert(result.json);
			},
			success : function(result) {
				//{ flag : true | false}
				alert(result.json);
			}
		});
	};
	
	function checksms() {
		var mem_hp = $('select[name=mem_hp1]').val() + '-'
				+ $('input[name=mem_hp2]').val() + '-'
				+ $('input[name=mem_hp3]').val();
		$('input[name=mem_hp]').val(mem_hp);

		hp_num = $('input[name=hp_num]').val();
		if(hp_num==''){
			alert('인증번호를 입력해주세요.');
			return false;
		}
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/sms/checkSms.do',
			dataType : 'json',
			data : {
				mem_hp : $('input[name=mem_hp]').val(),
				hp_num : $('input[name=hp_num]').val()
			},
			error : function(result) {
				alert(result.json);
			},
			success : function(result) {
				//{ flag : true | false}
				alert(result.json);
				if(result.json == '인증이 완료되었습니다.'){
					$('select[name=mem_hp1]').attr("disabled", true)
					$('input[name=mem_hp2]').attr("disabled", true)
					$('input[name=mem_hp3]').attr("disabled", true)
					$('input[name=hp_num]').attr("hidden",true)
					$('input[name=hp_btn]').attr("hidden",true)
				}
			}
		});
	};

	function mailSending() {
		var mem_email = $('input[name=mem_mail1]').val() + '@' + $('select[name=mem_mail2]').val();		
		$('input[name=mem_email]').val(mem_email);

		mem_email = $('input[name=mem_mail1]').val();
		if(mem_email==''){
				alert('이메일을 입력해주세요.');
				return false;
			}
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/mail/mailSending.do',
			dataType : 'JSON',
			data : {
				mem_email : $('input[name=mem_email]').val()
			},
			error : function(result) {
				alert(result.json);
			},
			success : function(result) {
				//{ flag : true | false}
				alert(result.json);
			}
		});
	};

	function mailCheck() {
		var mem_email = $('input[name=mem_mail1]').val() + '@' + $('select[name=mem_mail2]').val();		
		$('input[name=mem_email]').val(mem_email);

		var email = $('input[name=mem_mail1]').val();
		if(email==''){
			alert('인증번호를 입력해주세요.');
			return false;
		}
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/mail/mailCheck.do',
			dataType : 'JSON',
			data : {
				mem_email : $('input[name=mem_email]').val(),
				mail_num : $('input[name=mail_num]').val()
			},
			error : function(result) {
				alert(result.json);							
			},
			success : function(result) {
				//{ flag : true | false}
				alert(result.json);
				if(result.json == '인증이 완료되었습니다.'){
					$('input[name=mem_mail1]').attr("disabled", true)
					$('input[name=mail_num]').attr("hidden",true)
					$('input[name=mail_btn]').attr("hidden",true)
				}
			}
		});
	};

	function pwcheck(){
		var pw = $('#pass').val();
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
<body>
	<form name="memberForm" method="post">
	<input type="hidden" name="mem_division" value="0"> 
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>				
				<td class="fieldName" width="100px" height="25">아이디</td>
				<td>
				<input type="hidden" id="mem_id" name="mem_id" />
				<input type="text" id="mem_id1" value="">&nbsp;&nbsp;<b><a
						href="javascript:idCheck();" >[ID 중복검사]</a></b>
				</td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">비밀번호</td>
				<td><input type="password" name="mem_pass" id="pass" value="" onkeyup="pwcheck()"/> 
				<label class="btn">8 ~ 20 자리 영문자 및 숫자 사용</label></td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">비밀번호확인</td>
				<td><input type="password" name="mem_pass_confirm" id="pass2" value="" onkeyup="pwcheck()"/> 
				<label id="passchecklb"></label></td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">성 별</td>
				<td><input type="radio" name="mem_gender" value="m">남              
				<input type="radio" name="mem_gender" value="w">여
				</td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">이 름</td>
				<td><input type="text" name="mem_name" value="" /></td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">닉네임</td>
				<td><input type="text" name="mem_nickname" value="" /></td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">생년월일</td>
				<td><input type="hidden" name="mem_birth" /> <input type="text"
					name="mem_bir1" size="4" value="" />년 <input type="text"
					name="mem_bir2" size="2" value="" />월 <input type="text"
					name="mem_bir3" size="2" value="" />일</td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">이메일</td>
				<td><input type="hidden" name="mem_email" /> <input type="text"
					name="mem_mail1" value="" /> @ <select name="mem_mail2">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
				</select> <a href="javascript:mailSending();">[인증번호 전송]</a><br>
				<input type="text" name="mail_num">
				<input type="button" name="mail_btn" onClick="mailCheck()" class="btn" value="[인증번호 확인]"></a>
				</td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">휴대전화</td>
				<td><input type="hidden" name="mem_hp" /> <select
					name="mem_hp1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
				</select> - <input type="text" name="mem_hp2" size="4" value="" /> - 
				<input	type="text" name="mem_hp3" size="4" value="" />
				<a href="javascript:sendsms();">[인증번호 전송]</a><br>
				<input type="text" name="hp_num"/>
				<input type="button" name="hp_btn" onClick="checksms()" class="btn" value="[인증번호 확인]">
				</td>
			</tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">주소</td>
				<td><input type="hidden" name="mem_zip" /> <input type="text"
					name="mem_zip1" id="mem_zip1" size="3" value="" /> - <input
					type="text" name="mem_zip2" id="mem_zip2" size="3" value="" />
					<button
						class="btn" type="button" onclick="zipcodePopup();">[우편번호검색]</button> <br>
					<input type="text" name="mem_addr1" class="addr" id="mem_add1r" value="" /> <br>
					<input type="text" name="mem_addr2" class="addr" id="mem_addr2" value="" placeholder="상세주소를 입력해주세요"/></td>
			</tr>
			
			<tr>
				<td colspan="2" height="20"></td>
			</tr>
			<tr>
				<td class="btnGroup" colspan="2">
					<button	class="endbtn"
						id="btn1" type="submit">가입하기
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button	class="endbtn"
						id="btn3" type="reset">취소
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=memberForm]').submit(
			function() {
				$(this).attr('action','${pageContext.request.contextPath}/user/member/insertMemberInfo.do');

				var mem_birth = $('input[name=mem_bir1]').val() + '-'
									+ $('input[name=mem_bir2]').val() + '-'
									+ $('input[name=mem_bir3]').val();
							$('input[name=mem_birth]').val(mem_birth);

				var mem_hp = $('select[name=mem_hp1]').val() + '-'
									+ $('input[name=mem_hp2]').val() + '-'
									+ $('input[name=mem_hp3]').val();
							$('input[name=mem_hp]').val(mem_hp);

				var mem_email = $('input[name=mem_mail1]').val()
									+ '@' + $('select[name=mem_mail2]').val();
							$('input[name=mem_email]').val(mem_email);

				var mem_zip = $('input[name=mem_zip1]').val() + '-'
									+ $('input[name=mem_zip2]').val();
							$('input[name=mem_zip]').val(mem_zip);

					return true;
				});

		$('#btn3').click(function() {
			$(location).attr('href','${pageContext.request.contextPath}/user/join/loginForm.do');
		});
	});
</script>
</html>
