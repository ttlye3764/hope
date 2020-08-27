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
});
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

</head>
<body>
<form action='${pageContext.request.contextPath }/user/member/updateMemberInfo.do' method='post'>  
<input type="hidden" name="mem_id" value="${memberInfo.mem_id }">                          
	<table>                                                               
		<tr>                                                              
			<td>아이디</td>                                                  
			<td>                                                          
				<input type='text' id="mem_id" name='mem_id' value='${memberInfo.mem_id }' disabled="disabled"/>                   
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
			<td><input type='hidden' name='mem_birth' value='${memberInfo.mem_birth }'/></td>
			 <td> <input type="text" id="mem_bir1" name="mem_bir1" size="4" value="" />년 
			 	<input type="text"	id="mem_bir2" name="mem_bir2" size="2" value="" />월 
			 	<input type="text"	id="mem_bir3" name="mem_bir3" size="2" value="" />일</td>
		</tr>                                                             
		<tr>                                                              
			<td>우편번호</td>                                                 
			<td><input type='text' name='mem_zip' value='${memberInfo.mem_zip1 }'/></td>
		</tr>                                                             
		<tr>                                                              
			<td>주소</td>                                                   
			<td>                                                          
				<input type='text' name='mem_add1' value='${memberInfo.mem_addr1 }' />-                    
				<input type='text' name='mem_add2' value='${memberInfo.mem_addr2 }' />                     
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>휴대폰번호</td>                                                
			<td><input type='text' name='mem_hp' value='${memberInfo.mem_hp }'></td>                    
		</tr>                                                             
		<tr>                                                              
			<td>이메일</td>                                                  
			<td><input type='text' name='mem_mail' value='${memberInfo.mem_email }'/></td>                
		</tr>                                                             
		<tr>                                                              
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
