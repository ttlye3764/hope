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

	$("#mem_hp").keyup(function(e){
		if(e.keyCode == 8){
			var code = $('input[name=mem_hp]').val();
			var lastChar = code.charAt(code.length-1);
			if(lastChar == '-'){
				code = code.substr(0,code.length-1);
				$('input[name=mem_hp]').val(code);
			}
		}else{
			var hp = $('input[name=mem_hp]').val();
			if(hp.length == 3 || hp.length == 8){
				$('input[name=mem_hp]').val(hp + "-");
			}
		}
	});
	
	$('form[name=memView]').submit(function(){
			$(this).attr('action','${pageContext.request.contextPath}/admin/member/updateMemberInfo.do');

			var mem_birth =	$('input[name=mem_birth]').val();
			
			if (!mem_birth.validationBIR()) {
				alert('생년월일을 바르게 입력해주세요.');
				return false;
			}

			var mem_email = $('input[name=mem_email]').val();	

			if (!mem_email.validationMAIL()) {
				alert('이메일을 바르게 입력해주세요.');
				return false;
			}

			var mem_hp = $('input[name=mem_hp]').val();
			
			if (!mem_hp.validationHP()) {
				alert('휴대전화번호를 바르게 입력해주세요.');
				return false;
			}
			
			var mem_zip = $('#mem_zip1').val();
			$('input[name=mem_zip1]').val(mem_zip);
			$('input[name=mem_zip2]').val(mem_zip);

			var mem_addr = $('#mem_addr1').val();
			$('input[name=mem_addr1]').val(mem_addr);

			return true;
	});	
	
	$('#out').click(function(){
		mem_id = $('input[name=mem_id]').val();
		$(location).attr('href', '${pageContext.request.contextPath}/admin/member/deleteMember.do?mem_id='+mem_id);
	});
	
	$('#cancel').click(function(){
		var keycode = '${param.search_keycode}';
		var keyword = '${param.search_keyword}';
		var currentPage = '${param.currentPage}';
		$(location).attr('href','${pageContext.request.contextPath}/admin/member/memberList.do?search_keycode='+keycode+'&search_keyword='+keyword+'&currentPage='+currentPage);
	});

	var mem_birth = '${memberInfo.mem_birth }';
	mem_birth = mem_birth.split(" ");
	$('#mem_birth').val(mem_birth[0]);

});

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
<form method='post' name='memView'>  
<input type="hidden" name="mem_id" value="${memberInfo.mem_id }">                          
	<table style="border: none" align="center">
		<tr>
			<td colspan="3" align="center"><h3>회원 정보 수정</h3><br></td>
		</tr>
		<tr>				
			<td width="150px" height="25" class="idright">아이디</td>
			<td>
				<input type="text" class="form-control" id="mem_id" disabled="disabled" value='${memberInfo.mem_id }'/><br>
			</td>
			<td width="150px"></td>
		</tr>
		                                                            
		<tr>
			<td class="fieldName" width="100px" height="25">비밀번호</td>
			<td><input type="password" class="form-control" name="mem_pass" id="newPass" value="" onkeyup="pwcheck()"/> <br>
		</tr>
			
		<tr>
			<td>성 별</td>
			<td><input type="radio" id="man" name="mem_gender" value="m" disabled="disabled">남              
			<input type="radio" id="woman" name="mem_gender" value="w" disabled="disabled">여<br>
			</td>
		</tr>    
			
			<tr>
				<td width="150px" height="25" class="idright">이 름</td>
				<td><br><input type="text" class="form-control" name="mem_name" id="mem_name" value='${memberInfo.mem_name }' /><br></td>
			</tr>
			
			<tr>
				<td width="150px" height="25" class="idright">닉네임</td>
				<td><input type="text" class="form-control" name="mem_nickname" onkeyup="nickCheck()" id="nickname" value='${memberInfo.mem_nickname }'/>&nbsp;<label id="nicklb"></label></td>
			</tr>
			
			<tr>
				<td width="150px" height="25" class="idright">생년월일</td>
				<td><input type="text" name="mem_birth" class="form-control" id="mem_birth" placeholder="YYYY-MM-DD" /><br>
			</tr>
			
			<tr>
				<td width="150px" height="25" class="idright">이메일</td>
				<td>
				<div class="input-group mb-3" style="width:350px">
				<input type="text" name="mem_email" class="form-control" onkeydown="mailchange()" placeholder="exam@jabis.com" value='${memberInfo.mem_email }'/> 
				</div>
				</td>
			</tr>
			
			<tr>
				<td width="150px" height="25" class="idright">휴대전화</td>
				<td>
				<div class="input-group mb-3" style="width:350px">
				<input type="text" name="mem_hp" class="form-control" id="mem_hp" placeholder="- 빼고 입력" onchange="smschange()" value='${memberInfo.mem_hp }'/> 
				</div>
				</td>
			</tr>
			
			<tr>
				<td width="150px" height="25" class="idright">주소</td>
				<td width="300px">
				<input type="hidden" name="mem_zip1" /> 
				<input type="hidden" name="mem_zip2" /> 
				<div class="input-group mb-3" style="width:200px">
				<input placeholder="우편번호" class="form-control" id="mem_zip1" type="text" disabled="disabled" style="width:100px" value='${memberInfo.mem_zip1 }'>
   				 <button type="button" class="btn btn-primary" onclick="execPostCode();">검색</button>
   				 </div>
   				 <input type="hidden" name="mem_addr1"/>
   				 <input style="width:350px" class="form-control" placeholder="도로명 주소" id="mem_addr1" type="text" disabled="disabled" value='${memberInfo.mem_addr1 }' /><br>
   				 <input style="width:350px" class="form-control" placeholder="상세주소" name="mem_addr2" id="mem_addr2" type="text" value='${memberInfo.mem_addr2 }'  />
    			</td>
			</tr>
			
			<tr>
				<td colspan="2" height="20"></td>
			</tr>
			<tr>                                                             
			<td colspan="3" align="center">                                              
				<input type='submit' class="btn btn-primary" id="fix" value='수정' />                      
				<button type='button' class="btn btn-primary" id="out">탈퇴</button>             
				<button type='button' class="btn btn-light" id="cancel">취소</button>                
			</td>                                                         
		</tr>                                                             
	</table>                                                              
</form>                                                                  
</body>                                                                  
</html>                                                                  
