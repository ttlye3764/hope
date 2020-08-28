<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type="text/javascript">
$(function(){
	$('input[value=탈퇴]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/member/deleteMemberInfo/${memberInfo.mem_id}.do');
	});
	
	$('#cancel').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/main/mainForm.do');
	});

	var mem_birth = '${memberInfo.mem_birth }';
	mem_birth = mem_birth.split("-");

	var mem_day = mem_birth[2].split(" ");
	$('#mem_bir1').val(mem_birth[0]);
	$('#mem_bir2').val(mem_birth[1]);
	$('#mem_bir3').val(mem_day[0]);
	$('#mem_birth').val(mem_birth[0]+"-"+mem_birth[1]+"-"+mem_day[0]);

	var mem_email = '${memberInfo.mem_email}';
	mem_email = mem_email.split("@");

	$('input[name=mem_mail1]').val(mem_email[0]);
	$('select[name=mem_mail2]').val(mem_email[1]);

	var mem_hp = '${memberInfo.mem_hp}';
	mem_hp = mem_hp.split("-");

	$('select[name=mem_hp1]').val(mem_hp[0]);
	$('input[name=mem_hp2]').val(mem_hp[1]);
	$('input[name=mem_hp3]').val(mem_hp[2]);

	var flag = 1;
	$('form[name=myPage]').submit(
			function() {
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/user/member/passCheck.do',
					dataType : 'JSON',
					data : {
						mem_pass : $('#pass').val()
					},
					error : function(result){
						if(result.json == '0'){
							alert('비밀번호가 일치하지 않습니다.');
							flag = 0;
						}
					},
					success : function(result) {
						if(result.json == '0'){
							alert('비밀번호가 일치하지 않습니다.');
							flag = 0;
						}
					}
				});

				if(flag==0){
					alert('hi!');
					return false;
				}else {
					$(this).attr('action','${pageContext.request.contextPath}/user/member/updateMemberInfo.do');

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
				}
			});	
});

function pwcheck(){
	var pw = $('#newPass').val();
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

</head>
<body>
<form method='post' name='myPage'>  
<input type="hidden" name="mem_id" value="${memberInfo.mem_id }">                          
	<table>                                                               
		<tr>                                                              
			<td>아이디</td>                                                  
			<td>                                                          
				<input type='text' id="mem_id" name='mem_id' value='${memberInfo.mem_id }' disabled="disabled"/>                   
			</td>                                                         
		</tr> 
		<tr>
			<td class="fieldName" width="100px" height="25">현재 비밀번호</td>
			<td><input type="password" id="pass" value=""/> 
		</tr>
		                                                            
		<tr>
			<td class="fieldName" width="100px" height="25">새로운 비밀번호</td>
			<td><input type="password" name="mem_pass" id="newPass" value="" onkeyup="pwcheck()"/> 
			<label class="btn">8 ~ 20 자리 영문자 및 숫자 사용</label></td>
		</tr>
			
		<tr>
			<td class="fieldName" width="100px" height="25">비밀번호확인</td>
			<td><input type="password" name="mem_pass_confirm" id="pass2" value="" onkeyup="pwcheck()"/> 
			<label id="passchecklb"></label></td>
		</tr> 
		<tr>
			<td>성 별</td>
			<td><input type="radio" name="mem_gender" value="m">남              
			<input type="radio" name="mem_gender" value="w">여
			</td>
		</tr>                                                         
		<tr>                                                              
			<td>이름</td>                                                   
			<td><input type='text' name='mem_name' value='${memberInfo.mem_name }' disabled="disabled"/></td>
		</tr>                                                             
		<tr>                                                              
			<td>닉네임</td>                                               
			<td>                                                          
				<input type='text' name='mem_nickname' value='${memberInfo.mem_nickname }'/>        
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>생년월일</td>                                                 
			 <td> <input type="text" id="mem_bir1" name="mem_bir1" size="4" value="" />년 
			 	<input type="text"	id="mem_bir2" name="mem_bir2" size="2" value="" />월 
			 	<input type="text"	id="mem_bir3" name="mem_bir3" size="2" value="" />일</td>
			<td><input type='hidden' name='mem_birth' id='mem_birth'/></td>
		</tr>       
		<tr>
				<td class="fieldName" width="100px" height="25">이메일</td>
				<td><input type="hidden" name="mem_email" value='${memberInfo.mem_email}'/> <input type="text"
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
		<tr>
				<td class="fieldName" width="100px" height="25">휴대전화</td>
				<td><input type="hidden" name="mem_hp" value='${memberInfo.mem_hp}'/> <select
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
			<td>우편번호</td>                                                 
			<td><input type="hidden" name="mem_zip" value="${memberInfo.mem_zip1 }-${memberInfo.mem_zip2 }"/> <input type="text"
					name="mem_zip1" id="mem_zip1" size="3" value="${memberInfo.mem_zip1 }" /> - <input
					type="text" name="mem_zip2" id="mem_zip2" size="3" value="${memberInfo.mem_zip2 }" /></td>
		</tr>                                                             
		<tr>                                                              
			<td>주소</td>                                                   
			<td>                                                          
				<input type='text' name='mem_addr1' value='${memberInfo.mem_addr1 }' /><br>                  
				<input type='text' name='mem_addr2' value='${memberInfo.mem_addr2 }' />                     
			</td>                                                         
		</tr>                                                             
			<td colspan='2'>                                              
				<input type='submit' id="fix" value='수정' />                      
				<input type='button' id="out" value='탈퇴' />                      
				<input type='button' id="cancel" value='취소' />                         
			</td>                                                         
		</tr>                                                             
	</table>                                                              
</form>                                                                  
</body>                                                                  
</html>                                                                  
