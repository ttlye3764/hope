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
	
	$('input[value=회원목록]').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/member/memberList.do');
	});
});
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
			<td>패스워드</td>                                                 
			<td>                                                          
				<input type='password' id="pass" name='mem_pass'/>                      
			</td>                                                         
		</tr>   
		<tr>                                                              
			<td>패스워드</td>                                                 
			<td>                                                          
				<input type='password' id="pass2" name='mem_pass_confirm'/>                      
			</td>                                                         
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
				<input type='text' name='mem_regno1' value='${memberInfo.mem_nickname }' disabled="disabled"/>        
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>생년월일</td>                                                 
			<td><input type='text' name='mem_bir' value='${memberInfo.mem_birth }'/></td> 
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
				<input type='submit' value='수정' />                      
				<input type='button' value='탈퇴' />                      
				<input type='reset' value='취소' />                         
			</td>                                                         
		</tr>                                                             
	</table>                                                              
</form>                                                                  
</body>                                                                  
</html>                                                                  
