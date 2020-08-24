<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 우리가 쓸려고하는 jstl 태그설정 (c:뭐시기)이거 쓸려고-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- c:url을 이용하여 처리 -->
<c:url var="regustMemberURI" value="/user/member/memberForm.do"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css"
	type="text/css">
<title><spring:message code="cop.memberMngr.login"></spring:message></title>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-latest.js'></script>
<style>
	.box{
  	  border-color : gray;
  	  width : 330px;
  	  height : 45px;
     }
	.tLine {
		background-color: #d2d2d2;
		height: 1px;
		margin: 5px;
	}
 	#loginimg{ 
 		padding-right : 2px;  
 	} 
</style>
<script type='text/javascript'>
      $(function(){
            if(eval('${!empty param.message}')){
               alert('${param.message}');
            }

            $('#loginBtn').click(function(){
          	  	var mem_id = $('#mem_id').val();
                var mem_pass = $('#mem_pass').val();

                if(mem_id==''){
             	   	$('#label').text("아이디를 입력해주세요.");
             	  	$('#label').css('color', 'red');
             	  	return false;
                }
                if(mem_pass==''){
      				$('#label').text("비밀번호를 입력해주세요.");
      				$('#label').css('color', 'red');
      				return false;
                }    
                
                $.ajax({
        			type : 'POST',
        			url : '${pageContext.request.contextPath}/user/join/loginCheck.do',
        			dataType : 'json',
        			data : {
        				mem_id : $('#mem_id').val(),
        				mem_pass : $('#mem_pass').val()
        			},
        			error : function(result) {
        				$('#label').text(result.json);
        				$('#label').css('color', 'red');
        			},
        			success : function(result) {
        				//{ flag : true | false}
        				if(result.json==1){
        					$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardForm.do');
        				}else{
        					$('#label').text(result.json);
        					$('#label').css('color', 'red');
                		}
        			}
        		});
        	});
      });

      function caps_lock(e) {
              var keyCode = 0;
              var shiftKey = false;
              keyCode = e.keyCode;
              shiftKey = e.shiftKey;
              if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                      || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
                  show_caps_lock();
                  setTimeout("hide_caps_lock()", 3500);
              } else {
                  hide_caps_lock();
              }
          }
   
      function show_caps_lock() {
    	  $('#label').css('color', 'red');
           $("#label").text("CapsLock이 켜져있습니다.");
      }
   
      function hide_caps_lock() {
           $("#label").text("");
      }

      function mover(){
			$("#loginBtn").attr("src", "${pageContext.request.contextPath }/image/login1.png");
      }
      function mout(){
    	  $("#loginBtn").attr("src", "${pageContext.request.contextPath }/image/login.png");
      }
      </script>
</head>
<body>
	<table width="95%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="150" align="center"><img
				src="${pageContext.request.contextPath }/image/p_login.gif" /></td>
		</tr>
		<tr>
			<td>
				<table border="0" align="center" cellpadding="1" cellspacing="0" >
					<tr>
						<td width="500" align="center">
						<input type="text" name="mem_id" id="mem_id" class="box" tabindex="3" height="18" placeholder="아이디"/></td>
					</tr>
					<tr>
						<td width="500" align="center">
						<input type="password" name="mem_pass" id="mem_pass" class="box" tabindex="3" height="18" placeholder="비밀번호"
							width="300" onkeypress="caps_lock(event)" /></td>
					</tr>
					<tr>
						<td align="center">
							<label id="label"></label>
						<td>
					</tr>
					<tr>
						<td colspan="2" align="center" id="loginimg">
						<img src="${pageContext.request.contextPath }/image/login.png" class="loginBtn" id="loginBtn" onmouseover="mover()" onmouseout="mout()"/></td>
					</tr>
					<tr><td class="tLine" colspan="2"></td></tr>
					<tr>
						<td align="center" ><spring:message code="cop.idSave"></spring:message>
							: <input type="checkbox" name="saveID" /> 
							<a href='${regustMemberURI}' ><spring:message
									code="cop.regist.msg"></spring:message></a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>