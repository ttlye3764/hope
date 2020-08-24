<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 우리가 쓸려고하는 jstl 태그설정 (c:뭐시기)이거 쓸려고-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- c:url을 이용하여 처리 -->
<c:url var="regustMemberURI" value="/user/member/memberForm.do"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">
<title><spring:message code="cop.memberMngr.login"></spring:message></title>
     <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
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
      </script>
</head>
<body>
   <table width="770" border="0" align="center" cellpadding="0"
      cellspacing="0" style="margin: 90px;">
      <tr>
         <td height="150" align="center"><img src="${pageContext.request.contextPath }/image/p_login.gif" /></td>
      </tr>
      <tr>
         <td height="174"
            style="background: url(${pageContext.request.contextPath }/image/login_bg.jpg); border: 1px solid #e3e3e3;">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td width="260" height="110" align="center"
                     style="border-right: 1px dotted #736357;">
                     <img src="${pageContext.request.contextPath }/image/logo.jpg" />
                  </td>
                  <td>
                     <table border="0" align="center" cellpadding="5"
                        cellspacing="0">
                        <tr>
                           <td width="500"><input type="text" name="mem_id" id="mem_id" class="box" tabindex="3" placeholder="아이디" height="18" /></td>                           
                        </tr>
                        <tr>
                           <td><input type="password" name="mem_pass" id="mem_pass" class="box" tabindex="3" height="18" placeholder="비밀번호" onkeypress="caps_lock(event)"/>              
                           </td>
                        </tr>
                        <tr>                      
                        <td>
<!--                       	 <p id="capslock" style="position:relative; bottom:0px; display:none">&nbsp;<b>CapsLock</b>이 켜져있습니다.&nbsp;</p></td> -->
                      	 <label id="label"></label>
                        </tr>
                        <tr>
                        <td colspan="2">
                              <img src="${pageContext.request.contextPath }/image/login.gif" class="loginBtn" id="loginBtn"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2">
                              <spring:message code="cop.idSave"></spring:message> : <input type="checkbox" name="saveID" />
                              <a href='${regustMemberURI}'><spring:message code="cop.regist.msg"></spring:message></a>
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
   </table>
</body>
</html>