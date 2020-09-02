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
        z-index : 2;
    }
    .display-none{ /*감추기*/
        display:none;
    }
    .input-group mb-3{
       position : relative;
       z-index : 1;
    }

</style>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/validation.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">
$(function(){
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
   $('form[name=memberForm]').submit(function() {
      var idcheck = $('#idlabel').text();
      var emailcheck = $('#emaillabel').text();
      var smscheck = $('#hplabel').text();
      var pass = $('#pass').val();
      var pass2 = $('#pass2').val();
      var passlb = $('#passchecklb').text();

         if(idcheck == '' || idcheck == '이미 존재하는 아이디입니다.' || idcheck == '형식에 맞지 않는 아이디입니다.'){
            alert('아이디를 확인해주세요.');
            return false;
         }   
         if(idcheck == '' || idcheck == '이미 존재하는 닉네임입니다.' || idcheck == '형식에 맞지 않는 닉네임입니다.'){
            alert('닉네임을 확인해주세요.');
            return false;
         }
         if(pass == '' || pass2 == ''){
            alert('비밀번호를 입력해주세요.');
            return false;
         }
         if(pass.length < 8){
            alert('비밀번호는 최소 8자리 이상 입력해주세요.');
            return false;
         }
         if(passlb == '비밀번호가 일치하지 않습니다.'){
            alert('비밀번호를 확인해주세요.');
            return false;
         }

         if(!$('input:radio[name=mem_gender]').is(':checked')){
            alert('성별을 선택해주세요.');
            return false;
         }

//          var name = $('#mem_name').val();
//          if (!name.validationNAME()) {
//             alert('올바른 이름을 입력해주세요.')
//             return false;
//          }
         var mem_birth =   $('input[name=mem_birth]').val();
         
         if (!mem_birth.validationBIR()) {
            alert('올바른 생년월일을 입력해주세요.')
            return false;
         }
         if(emailcheck == ''){
            alert('이메일 인증을 완료해주세요.');
            return false;
         }
         if(smscheck == ''){
            alert('휴대폰 인증을 완료해주세요.');
            return false;
         }
         var zip = $('input[name=mem_zip1]').val();

         if(zip == ''){
            alert('우편번호를 입력해주세요.');
            return false;
         }

         var addr2 = $('input[name=mem_addr2]').val();

         if(addr2 == ''){
            alert('상세주소를 입력해주세요.');
            return false;
         }
      
         $(this).attr('action','${pageContext.request.contextPath}/user/member/insertMemberInfo.do');

         var mem_zip = $('input[name=mem_zip1]').val();
            $('input[name=mem_zip1]').val(mem_zip);
            $('input[name=mem_zip2]').val(mem_zip);

         var mem_addr = $('#mem_addr1').val();
            $('input[name=mem_addr1]').val(mem_addr);

            return true;
         });
      $('#btn3').click(function() {
         $(location).attr('href','${pageContext.request.contextPath}/user/join/loginForm.do');
      });
   });

   function idCheck() {
      var id = $('#mem_id').val();

      if (!id.validationID()) {
         $('#idlabel').text("형식에 맞지 않는 아이디입니다.");
         $('#idlabel').css('color', 'red');
         return false;
      }
      
      $.ajax({
         type : 'POST',
         url : '${pageContext.request.contextPath}/user/member/idCheck.do',
         dataType : 'JSON',
         data : {
            mem_id : $('#mem_id').val()
         },
         success : function(result) {
            $('#idlabel').text(result.json);
            if(result.json == '사용가능한 아이디입니다.'){
               $('#idlabel').css('color', 'blue');
            }else{
               $('#idlabel').css('color', 'red');
            }
         }
      });
   };

   function nickCheck() {
      var nick = $('#nickname').val();

      if(nick==''){
         $('#nicklb').text("");
         return false;
      }

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
            }
         },
         error : function(result){
            $('#nicklb').text(result.json);
            if(result.json == '사용가능한 닉네임입니다.'){
               $('#nicklb').css('color', 'blue');
            }else{
               $('#nicklb').css('color', 'red');
            }
         }
      });
   };

   function sendsms() {
      var mem_hp = $('input[name=mem_hp]').val();
      
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
      var mem_hp = $('input[name=mem_hp]').val();

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
      var mem_email = $('input[name=mem_email]').val();   

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
            alert(result.json);
         }
      });
   };

   function mailCheck() {
      var mem_email = $('input[name=mem_email]').val();
      
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
   
   function smschange(){
      $('#hplabel').text("");
      $('input[name=hp_num]').removeAttr("disabled");
   }
   function mailchange(){
      $('#emaillabel').text("");
      $('input[name=mail_num]').removeAttr("disabled");
   }
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
<body>
<div class="wrap-loading display-none">
    <div><img src="../../image/Progress_Loading.gif"/></div>
</div> 
   <form name="memberForm" method="post">
   <input type="hidden" name="mem_division" value="0"> 
      <table style="border: none" align="center">
         <tr>
            <td colspan="3" align="center"><h3>회원가입</h3></td>
         </tr>
         <tr>            
            <td width="150px" height="25" class="idright">아이디</td>
            <td>
            <input type="text" class="form-control" id="mem_id" name="mem_id" onkeyup="idCheck()"/>&nbsp;<label id="idlabel"></label>
            </td>
            <td width="150px"></td>
         </tr>
         <tr>
            <td width="150px" height="25" class="idright">비밀번호</td>
            <td><input type="password" class="form-control" name="mem_pass" id="pass" value="" onkeyup="pwcheck()"/> 
            <label>8 ~ 20 자리 영문자 및 숫자 사용</label></td>
         </tr>
         
         <tr>
            <td width="150px" height="25" class="idright">비밀번호확인</td>
            <td><input type="password" name="mem_pass_confirm" class="form-control"  id="pass2" value="" onkeyup="pwcheck()"/> 
            <label id="passchecklb"></label></td>
         </tr>
         
         <tr>
            <td width="150px" height="25" class="idright">성 별</td>
            <td>
               <input type="radio" id="man" name="mem_gender" value="m">남              
               <input type="radio" id="woman" name="mem_gender" value="w">여<br>
            </td>
         </tr>
         
         <tr>
            <td width="150px" height="25" class="idright">이 름</td>
            <td><input type="text" class="form-control" name="mem_name" id="mem_name" value="" /><br></td>
         </tr>
         
         <tr>
            <td width="150px" height="25" class="idright">닉네임</td>
            <td><input type="text" class="form-control" name="mem_nickname" onkeyup="nickCheck()" id="nickname" />&nbsp;<label id="nicklb"></label></td>
         </tr>
         
         <tr>
            <td width="150px" height="25" class="idright">생년월일</td>
            <td><input type="text" name="mem_birth" class="form-control" placeholder="YYYY-MM-DD"/><br>
         </tr>
         
         <tr>
            <td width="150px" height="25" class="idright">이메일</td>
            <td>
            <div class="input-group mb-3" style="width:350px">
            <input type="text" name="mem_email" class="form-control" onkeydown="mailchange()" placeholder="exam@jabis.com"/> 
            <a href="javascript:mailSending();">[인증번호 전송]</a></div>
            <input type="text" name="mail_num" class="form-control" onkeyup="mailCheck()"/>
            <label id="emaillabel"></label>
            </td>
         </tr>
         
         <tr>
            <td width="150px" height="25" class="idright">휴대전화</td>
            <td>
            <div class="input-group mb-3" style="width:350px">
            <input type="text" name="mem_hp" id="mem_hp" class="form-control" placeholder="- 빼고 입력" onchange="smschange()"/> 
            <a href="javascript:sendsms();">[인증번호 전송]</a></div>
            <input type="text" class="form-control" name="hp_num" onkeyup="checksms()"/>
            <label id="hplabel"></label>
            </td>
         </tr>
         
         <tr>
            <td width="150px" height="25" class="idright">주소</td>
            <td width="300px">
            <input type="hidden" name="mem_zip1" /> 
            <input type="hidden" name="mem_zip2" /> 
            <div class="input-group mb-3" style="width:200px">
            <input placeholder="우편번호" class="form-control" id="mem_zip1" type="text" disabled="disabled" style="width:100px">
                <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i></button>
                </div>
                <input type="hidden" name="mem_addr1"/>
                <input style="width:350px" class="form-control" placeholder="도로명 주소" id="mem_addr1" type="text" disabled="disabled" /><br>
                <input style="width:350px" class="form-control" placeholder="상세주소" name="mem_addr2" id="mem_addr2" type="text"  />
             </td>
         </tr>
         
         <tr>
            <td colspan="2" height="20"></td>
         </tr>
         <tr>
            <td class="btnGroup" colspan="3" align="center">
               <input id="btn1" type="submit" value="가입"/>               
               &nbsp;&nbsp;&nbsp;&nbsp;
               <button   id="btn3" type="button">취소
               </button>
            </td>
         </tr>
      </table>
   </form>
</body>
</html>