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
<style>
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
}

    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
    .display-none{ /*감추기*/
        display:none;
    }
</style>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/validation.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">
$(function(){
	var gender = '${memberInfo.mem_gender}';
	if(gender == 'm' || gender == 'M'){
		$('#man').prop('checked', true);
	}else{
		$('#woman').prop('checked', true);
	}
	
	$('form[name=myPage]').submit(function(){
			var userpass = '${memberInfo.mem_pass}';
			var inputpass = $('#pass').val();
			var emailcheck = $('#emaillabel').text();
			var smscheck = $('#hplabel').text();

			if(inputpass == ''){
				alert('현재 비밀번호를 입력해주세요.');
				return false;
			}

			if(userpass == inputpass){}
			else{
				alert('현재 비밀번호가 일치하지 않습니다.');
				return false;
			}
			var passchecklb = $('#passchecklb').text();
			if(passchecklb == '비밀번호가 일치하지 않습니다.' || passchecklb == '비밀번호는 최소 8자리 이상 입력해주세요.'){
				alert('새로운 비밀번호를 확인해주세요.');
				return false;
			}
			var nicklb = $('#nicklb').text();
			if(nicklb == '형식에 맞지 않는 닉네임입니다.' || nicklb == '이미 존재하는 닉네임입니다.'){
				alert('닉네임을 확인해주세요.');
				return false;
			}

			var mem_email = $('input[name=mem_mail1]').val()
						+ '@' + $('select[name=mem_mail2]').val();
			$('input[name=mem_email]').val(mem_email);

			if(!(mem_email == '${memberInfo.mem_email}')){
				if(emailcheck == ''){
					alert('이메일 인증을 완료해주세요.');
					return false;
				}
			}

			var mem_hp = $('select[name=mem_hp1]').val() + '-'
						+ $('input[name=mem_hp2]').val() + '-'
						+ $('input[name=mem_hp3]').val();
			$('input[name=mem_hp]').val(mem_hp);

			if(!(mem_hp == '${memberInfo.mem_hp}')){
				if(smscheck == ''){
					alert('휴대폰 인증을 완료해주세요.');
					return false;
				}
			}

			var addr2 = $('input[name=mem_addr2]').val();
			if(addr2 == ''){
				alert('상세주소를 입력해주세요.');
				return false;
			}
			
			$(this).attr('action','${pageContext.request.contextPath}/user/member/updateMemberInfo.do');
			
			var mem_zip = $('input[name=mem_zip1]').val();
			$('input[name=mem_zip1]').val(mem_zip);
			$('input[name=mem_zip2]').val(mem_zip);

			var mem_addr = $('#mem_addr1').val();
			$('input[name=mem_addr1]').val(mem_addr);

			return true;
	});	
	
	var id = '${memberInfo.mem_id}';
	var social = '${memberInfo.mem_join_addr}';
	if(social=='n'){
		alert('소셜 로그인 사용자는 이용할 수 없습니다.');
		window.history.back();
	}else if(id==''){
		alert('로그인 후 이용해주세요.');
		$(location).attr('href','${pageContext.request.contextPath}/user/main/mainForm.do');
	}
	
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
});

function smschange(){
	$('#hplabel').text("");
	$('input[name=hp_num]').removeAttr("disabled");
}
function mailchange(){
	$('#emaillabel').text("");
	$('input[name=mail_num]').removeAttr("disabled");
}

function sendsms() {
	var mem_hp = $('select[name=mem_hp1]').val() + '-'
			+ $('input[name=mem_hp2]').val() + '-'
			+ $('input[name=mem_hp3]').val();
	$('input[name=mem_hp]').val(mem_hp);

	if (!mem_hp.validationHP()) {
		alert('휴대전화번호를 바르게 입력해주세요.');
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
	
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/sms/checkSms.do',
		dataType : 'json',
		data : {
			mem_hp : $('input[name=mem_hp]').val(),
			hp_num : $('input[name=hp_num]').val()
		},
		success : function(result) {
			//{ flag : true | false}
			if(result.json == '인증이 완료되었습니다.'){
				$('#hplabel').text(result.json);
				$('input[name=hp_num]').attr("disabled",true);
			}
		}
	});
};

function mailSending() {
	var mem_email = $('input[name=mem_mail1]').val() + '@' + $('select[name=mem_mail2]').val();		
	$('input[name=mem_email]').val(mem_email);

	if (!mem_email.validationMAIL()) {
		alert('이메일을 바르게 입력해주세요.');
		return false;
	}

	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/mail/mailSending.do',
		dataType : 'JSON',
		data : {
			mem_email : $('input[name=mem_email]').val()
		},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
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
	
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/mail/mailCheck.do',
		dataType : 'JSON',
		data : {
			mem_email : $('input[name=mem_email]').val(),
			mail_num : $('input[name=mail_num]').val()
		},
		success : function(result) {
			//{ flag : true | false}
			if(result.json == '인증이 완료되었습니다.'){
				$('#emaillabel').text(result.json);
				$('input[name=mail_num]').attr("disabled",true);
			}
		}
	});
};

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

	if(pw2.length < 8){
		$('#passchecklb').text("비밀번호는 최소 8자리 이상 입력해주세요.");
		$('#passchecklb').css('color', 'red');
	}
}
function nickCheck() {
	var nick = $('#nickname').val();

	if (!nick.validationNICKNAME()) {
		$('#nicklb').text("형식에 맞지 않는 닉네임입니다.");
		$('#nicklb').css('color', 'red');
		return false;
	}
	
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/member/nickCheck.do',
		dataType : 'JSON',
		data : {
			mem_nickname : $('#nickname').val()
		},
		success : function(result) {
			$('#nicklb').text(result.json);
			if(result.json == '사용가능한 닉네임입니다.'){
				$('#nicklb').css('color', 'blue');
			}else{
				$('#nicklb').css('color', 'red');
				if(nick == '${memberInfo.mem_nickname}'){
					$('#nicklb').text("");
				}
			}
		},
		error : function(result){
			$('#nicklb').text(result.json);
			if(result.json == '사용가능한 닉네임입니다.'){
				$('#nicklb').css('color', 'blue');
			}else{
				$('#nicklb').css('color', 'red');
				if(nick == '${memberInfo.mem_nickname}'){
					$('#nicklb').text("");
				}
			}
		}
	});

	if(nick == '${memberInfo.mem_nickname}'){
		$('#nicklb').text("");
	}
};
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           $("#mem_zip1").val(data.zonecode);
           $("#mem_addr1").val(fullRoadAddr);
           $("[name=mem_zip1]").val(data.zonecode);
           $("[name=mem_zip2]").val(data.zonecode);
           $("[name=mem_addr1]").val(fullRoadAddr);
       }
    }).open();
}
</script>

</head>
<body>
<div class="wrap-loading display-none">
    <div><img src="../../image/Progress_Loading.gif"/></div>
</div> 
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
			<td><input type="radio" id="man" name="mem_gender" value="m" disabled="disabled">남              
			<input type="radio" id="woman" name="mem_gender" value="w" disabled="disabled">여
			</td>
		</tr>                                                         
		<tr>                                                              
			<td>이름</td>                                                   
			<td><input type='text' name='mem_name' value='${memberInfo.mem_name }' disabled="disabled"/></td>
		</tr>                                                             
		<tr>                                                              
			<td>닉네임</td>                                               
			<td>                                                          
				<input type='text' name='mem_nickname' id="nickname" onkeyup="nickCheck()" value='${memberInfo.mem_nickname }'/> &nbsp;<label id="nicklb"></label>       
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>생년월일</td>                                                 
			 <td> <input type="text" id="mem_bir1" name="mem_bir1" size="4" value="" disabled="disabled"/>년 
			 	<input type="text"	id="mem_bir2" name="mem_bir2" size="2" value="" disabled="disabled"/>월 
			 	<input type="text"	id="mem_bir3" name="mem_bir3" size="2" value="" disabled="disabled"/>일</td>
		</tr>       
		<tr>
				<td class="fieldName" width="100px" height="25">이메일</td>
				<td><input type="hidden" name="mem_email" value='${memberInfo.mem_email}'/> <input type="text"
					name="mem_mail1" onkeydown="mailchange()" /> @ <select name="mem_mail2" onchange="mailchange()">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
				</select> <a href="javascript:mailSending();">[인증번호 전송]</a><br>
				<input type="text" name="mail_num" onkeyup="mailCheck()">
				<label id="emaillabel"></label>
				</td>
			</tr>                                                             
		<tr>   
		<tr>
				<td class="fieldName" width="100px" height="25">휴대전화</td>
				<td><input type="hidden" name="mem_hp" value='${memberInfo.mem_hp}'/> <select
					name="mem_hp1" onchange="smschange()">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
				</select> - <input type="text" name="mem_hp2" size="4" onchange="smschange()"/> - 
				<input	type="text" name="mem_hp3" size="4" onchange="smschange()" />
				<a href="javascript:sendsms();">[인증번호 전송]</a><br>
				<input type="text" name="hp_num" onkeyup="checksms()"/>
				<label id="hplabel"></label>
				</td>
			</tr>                                                       
		<tr>                                                              
			<td class="fieldName" width="100px" height="25">주소</td>
				<td>
				<input type="hidden" name="mem_zip1" value="${memberInfo.mem_zip1 }"/> 
				<input type="hidden" name="mem_zip2" value="${memberInfo.mem_zip1 }"/> 
				<input placeholder="우편번호" id="mem_zip1" type="text" disabled="disabled" value="${memberInfo.mem_zip1 }">
   				 <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button><br>
   				 <input type="hidden" name="mem_addr1" value="${memberInfo.mem_addr1 }"/>
   				 <input style="width:350px" placeholder="도로명 주소" id="mem_addr1" type="text" disabled="disabled" value="${memberInfo.mem_addr1 }"/><br>
   				 <input style="width:350px" placeholder="상세주소" name="mem_addr2" id="mem_addr2" type="text" value="${memberInfo.mem_addr2 }" />
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
