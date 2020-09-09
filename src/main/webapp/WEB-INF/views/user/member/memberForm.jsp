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
    }
    .display-none{ /*감추기*/
        display:none;
    }
    
    #loading{
       z-index : 900;
    }

</style>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/validation.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
   $('form[name=memberForm]').submit(function() {
      var idcheck = $('#idlabel').text();
      var emailcheck = $('#emaillabel').text();
      var smscheck = $('#hplabel').text();
      var pass = $('#pass').val();
      var pass2 = $('#pass2').val();
      var passlb = $('#passchecklb').text();
      var nickcheck = $('#nicklb').text();

         if(idcheck == '' || idcheck == '이미 존재하는 아이디입니다.' || idcheck == '형식에 맞지 않는 아이디입니다.'){
            swal("","아이디를 확인해주세요.", "warning");
            return false;
         }   
         if(pass == '' || pass2 == ''){
        	swal("","비밀번호를 입력해주세요.", "warning");
            return false;
         }
         if(pass.length < 4){
        	swal("","비밀번호는 최소 4자리 이상 입력해주세요.", "warning");
            return false;
         }
         if(passlb == '비밀번호가 일치하지 않습니다.'){
	       	swal("","비밀번호를 확인해주세요.", "warning");
            return false;
         }

         if(!$('input:radio[name=mem_gender]').is(':checked')){
            swal("","성별을 선택해주세요.", "warning");
            return false;
         }
         var name = $('#mem_name').val();
         if (name == '') {
        	 swal("","이름을 입력해주세요.", "warning");
            return false;
         }

         if(nickcheck == '' || nickcheck == '이미 존재하는 닉네임입니다.' || nickcheck == '형식에 맞지 않는 닉네임입니다.'){
             swal("","닉네임을 확인해주세요.", "warning");
             return false;
          }
         
         var mem_birth =   $('input[name=mem_birth]').val();
         
         if (!mem_birth.validationBIR()) {
            swal("","올바른 생년월일을 입력해주세요.", "warning");
            return false;
         }
         if(emailcheck == ''){
            swal("","이메일 인증을 완료해주세요.", "warning");
            return false;
         }
         if(smscheck == ''){
            swal("","휴대폰 인증을 완료해주세요.", "warning");
            return false;
         }
         var zip = $('input[name=mem_zip1]').val();

         if(zip == ''){
        	swal("","우편번호를 입력해주세요,", "warning");
            return false;
         }

         var addr2 = $('input[name=mem_addr2]').val();

         if(addr2 == ''){
            swal("","상세주소를 입력해주세요.", "warning");
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
    	 swal("","휴대전화번호를 바르게 입력해주세요.", "warning");
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
        	swal("",result.json, "success");
         },
         success : function(result) {
        	swal("",result.json, "success");
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
    	 swal("","이메일 바르게 입력해주세요.", "warning");
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
        	swal("",result.json, "success");
         },
         success : function(result) {
        	swal("",result.json, "success");
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
   function setThumbnail(event) { 
		var reader = new FileReader(); 
		var img;
		reader.onload = function(event) {
				img = document.createElement("img"); 
				
				img.setAttribute("src", event.target.result); 
				
				document.querySelector("div#image_container").appendChild(img); 
				
				img.style.height = '100px';
			    img.style.width = '100px';
			}; 
			reader.readAsDataURL(event.target.files[0]);

			document.querySelector("div#image_container").addEventListener('click', function() {
				//document.querySelector("div#image_container").style.display = 'none';
				document.querySelector("div#image_container").removeChild(img);
			});
		};

</script>
<body>
<div id="loading" class="wrap-loading display-none">
    <div><img src="../../image/Progress_Loading.gif"/></div>
</div> 
<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
      <div class="container">
         <div class="row all-text-white">
            <div class="col-md-12 align-self-center">
               <h1 class="innerpage-title">회원 가입</h1>
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/user/main/mainForm.do"><i class="ti-home"></i> Home</a></li>
                     <li class="breadcrumb-item">Timeline</li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </div>
      <br>
      <br>
      <br>
   <form name="memberForm" method="post" enctype="multipart/form-data">
   <input type="hidden" name="mem_division" value="0"> 
      <table style="border: none" align="center">
      	<tr>
			<td>사진등록</td>
			<td>
				<div id="image_container"></div>
				<div class="form-group">
					<label for="exampleFormControlFile1"></label>
					<input type="file" class="form-control-file" name="files"
					  id="exampleFormControlFile1" onchange="setThumbnail(event);"/>
				</div>
			</td>
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
            <td><input type="text" name="mem_birth" id="mem_birth" class="form-control" placeholder="YYYY-MM-DD"/><br>
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
            <input type="text" name="mem_hp" id="mem_hp" class="form-control" placeholder="010-1234-5678" onchange="smschange()"/> 
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