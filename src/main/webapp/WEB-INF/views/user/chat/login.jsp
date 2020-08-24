<%@page import="kr.or.ddit.utiles.CryptoGenerator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 요청할 때마다 공개키, 비밀키가 새로 만들어짐                                                                              세션에 계속 갱신
	//pageContext.setAttribute("publicKeyMap", publicKeyMap); 한거나 마찬가지?	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.js"></script>
<script type ="text/javascript">
	$(function(){
		$('#loginBtn').click(function(){
				var sol_num = $('input[name=sol_num]').val();
				var sol_pass = $('input[name=sol_pass]').val();
				
				
				/* if(!sol_num.validationID()){
					alert("군번을 바르게 입력해주세요");
					$('input[name=sol_num]').focus();
					return false;
				}
				
				if(!sol_pass.validationPWD()){
					alert("비밀번호를 바르게 입력해주세요");
					$('input[name=sol_pass]').focus();
					return false;
				} */
	   
	            var $frm = $('<form action="/user/logincheck.do" method="post"></form>');
	            var $inputID = $('<input type="hidden" value="' sol_num+ '" name="sol_num" />');
	            var $inputPWD = $('<input type="hidden" value="' +sol_pass+ '" name="sol_pass" />');
	            $frm.append($inputID);
	            $frm.append($inputPWD);
	            $(document.body).append($frm);
	            $frm.submit();

			});
		
	});
</script>
    <style>
    	
        .main-box {
            display: flex;
            width: 100%;
            height: 800px;
            justify-content: center;
            align-items: center;
        }

        video {
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 400px;
            width: auto;
            height: auto;
            z-index: -1;
        }

        .login-box {
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid white;
            width: 500px;
            height: 350px;
            animation: showLogin 3s;
        }

        button {
            display: inline-flex;
            color: white;
            font-weight: bold;
            outline: none;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            background: #0e572a;

            align-items: center;

            height: 2.25rem;
            padding-left: 1rem;
            padding-right: 1rem;
            font-size: 1rem;

            width: 100%;
            justify-content: center;
        }

        button:hover {
            background: #4eaaf1;
        }
        button:active {
            background: #4795d5;
        }

        @keyframes showLogin {
            0% {
                opacity: 0;
                transform: translateY(-500px);
            }
            100% {
                opacity: 1;
                transform: translateY(0px);
            }
        }
        #join{
        	color:white;
        }
    </style>
</head>
<body>

<div class="main-box">
    <div>
        <video rowspan="2" src="${pageContext.request.contextPath }/image/army_video.mp4" width="100%" autoplay muted loop></video> -->
    </div>
    
    <div class="login-box">
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 90px;">
            <tr>
                <td height="150" align="center">
                    <img src="${pageContext.request.contextPath }/image/logo.png"/> 
                </td>
            </tr>
            <tr>
                <td height="174">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table border="0" align="center" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <b style="color: white">군번</b>
                                        </td>
                                        <td>
                                            <input type="text" name="sol_num" class="box" tabindex="3" height="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b id="123" style="color: white">패스워드</b>
                                        </td>
                                        <td>
                                            <input type="password" name="sol_pass" class="box" tabindex="3" height="18"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <button type="submit" id ="loginBtn">로그인</button>                                            
                                        </td>                                        
                                    </tr>
                                    <tr>
                                    	<td colspan="4" align="center"><a href="/user/memberjoinForm.do" id="join">회원가입</a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    
</div>

</body>
</html>