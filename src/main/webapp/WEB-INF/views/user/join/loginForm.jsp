<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 우리가 쓸려고하는 jstl 태그설정 (c:뭐시기)이거 쓸려고-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- c:url을 이용하여 처리 -->
<c:url var="regustMemberURI" value="/user/member/memberForm.do"></c:url>
	
<style>
.btn{
	color : #4CBD94;
}
.tLine {
		background-color: #d2d2d2;
		height: 1px;
		margin: 5px;
}
.endbtn{
	background-color: #4CBD94; 
	color : white;
	height : 40px;
	width : 110px;
}
.di{
	width : 200px;
}
</style>
	

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/validation.js'></script>
<script type='text/javascript'>
	var big_mem_id;
      $(function(){
            $("#mem_id").keyup(function(e){if(e.keyCode == 13) login();});
            $("#mem_pass").keyup(function(e){if(e.keyCode == 13) login();});
      });

      function login(){
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

          if (!mem_id.validationID()) {
	  			$('#label').text("아이디를 확인해주세요.");
	  			$('#label').css('color', 'red');
	  			return false;
	  	  }  

	  	  if(mem_pass.length < 4){
		  		$('#label').text("비밀번호는 최소 4자리 이상 입력해주세요.");
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
        			$(location).attr('href', '${pageContext.request.contextPath}/user/main/mainForm.do');
        		}else if(result.json==2){
        			swal({
        	      	    title: "",
        	      	    text: "임시비밀번호로 로그인하셨습니다. \n비밀번호 변경창으로 이동합니다.",
        	      	    type: "success"
        	      	}).then(function() {
        	      		$(location).attr('href', '${pageContext.request.contextPath}/user/join/passChangeForm.do');
        	      	});
            	}else if(result.json==0){
            		swal({
        	      	    title: "",
        	      	    text: "관리자님 환영합니다!",
        	      	    type: "success"
        	      	}).then(function() {
						$(location).attr('href', '${pageContext.request.contextPath}/admin/main/mainForm.do');
        	      	});
                }
            	else{
            		$('#label').text(result.json);
        			$('#label').css('color', 'red');
                }
        	}
       	});
      };
      
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

      function search_id_modal(){
    	  $("#search_id_modal").modal("show"); //모달창 띄우기
      }

      function search_pw_modal(){
    	  $("#search_id_modal_result").modal("hide");
    	  $("#search_pw_modal").modal("show"); //모달창 띄우기
      }

      function sendsms() {
    	var mem_hp = $('input[name=mem_hp_pw]').val();

  		if (!mem_hp.validationHP()) {
  			swal("","휴대전화번호를 바르게 입력해주세요.", "warning");
  			return false;
  		}
  		
  		$.ajax({
  			type : 'POST',
  			url : '${pageContext.request.contextPath}/sms/sendSms.do',
  			dataType : 'JSON',
  			data : {
  				mem_hp : $('input[name=mem_hp_pw]').val()
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
		var mem_hp = $('input[name=mem_hp_pw]').val();
		hp_num = $('input[name=hp_num]').val();
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/sms/checkSms.do',
			dataType : 'json',
			data : {
				mem_hp : $('input[name=mem_hp_pw]').val(),
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
      
    function searchID(){
		if($('#mem_name').val()==''){
			swal("","이름을 입력해주세요.", "warning");
			return false;
		}
		
    	var mem_birth = $('#mem_birth').val();

    	if (!mem_birth.validationBIR()) {
			swal("","올바른 생년월일을 입력해주세요.", "warning");
			return false;
		}

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/member/searchID.do',
			dataType : 'json',
			data : {
				mem_name : $('#mem_name').val(),
				mem_birth : $('#mem_birth').val()
			},
			success : function(result) {
				if(result.json=='' || result.json==null){
					big_mem_id = '일치하는 사용자가 없습니다.';
				}else{
					big_mem_id = '아이디 : ' + result.json;
				}
				$("#search_id_modal").modal("hide");
				searchIDResult();
			}
		});
	};

	function searchPW(){
		var mem_hp = $('input[name=mem_hp_pw]').val();

		if($('#mem_id_pw').val()==''){
			swal("","아이디를 입력해주세요.", "warning");
			return false;
		}
		
		if($('#mem_name_pw').val()==''){
			swal("","이름을 입력해주세요.", "warning");
			return false;
		}

		var mem_birth = $('#mem_birth_pw').val();

    	if (!mem_birth.validationBIR()) {
			swal("","올바른 생년월일을 입력해주세요.", "warning");
			return false;
		}

		var hp = $('#hplabel').text();
		if(hp == ''){
			swal("","휴대전화 인증을 해주세요.", "warning");
			return false;
		}

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/member/searchPW.do',
			dataType : 'json',
			data : {
				mem_id : $('#mem_id_pw').val(),
				mem_name : $('#mem_name_pw').val(),
				mem_birth : $('#mem_birth_pw').val(),
				mem_hp : $('#mem_hp_pw').val()
			},
			success : function(result) {
				if(result.json=='' || result.json==null){
					big_mem_id = '일치하는 사용자가 없습니다.';
				}else{
					big_mem_id = '임시비밀번호 : ' + result.json;
				}
				$("#search_pw_modal").modal("hide");
				searchPWResult();
			}
		});
	};
	
	function searchIDResult(){
		$("#search_id_modal_result").modal("show");
		$('#IDresult').text(big_mem_id);
	}

	function searchPWResult(){
		$("#search_pw_modal_result").modal("show");
		$('#PWresult').text(big_mem_id);
	}

	function smschange(){
		$('#hplabel').text("");
		$('input[name=hp_num]').removeAttr("disabled");
	}

	function delete1(){
		$(location).attr('href', '${pageContext.request.contextPath}/user/member/delete.do');
	}
</script>
	<div class="preloader">
		<img src="assets/images/preloader.svg" alt="Pre-loader">
	</div>

	<!-- =======================
	Sign in -->
	<section class="p-0 d-flex align-items-center">
		<div class="container-fluid">
			<div class="row">
				<!-- left -->
				<div class="col-12 col-md-5 col-lg-4 d-md-flex align-items-center bg-grad h-sm-100-vh">
					<div class="w-100 p-3 p-lg-5 all-text-white">
						<div class="justify-content-center align-self-center">
							<!-- SVG Logo Start -->
							<svg class="logo-auth mb-4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMinYMid" width="325.656" height="100" viewBox="0 0 325.656 100">
							  <g><path d="M320.187,75.278 C316.545,78.817 312.335,80.585 307.558,80.585 C302.721,80.585 298.497,78.830 294.885,75.322 C291.271,71.813 289.466,67.749 289.466,63.129 L289.466,55.058 C289.466,50.440 291.243,46.404 294.797,42.953 C298.351,39.503 302.605,37.778 307.558,37.778 C312.393,37.778 316.617,39.488 320.231,42.909 C323.843,46.330 325.650,50.381 325.650,55.058 L325.650,63.129 C325.650,67.690 323.828,71.740 320.187,75.278 ZM316.473,55.086 C316.473,52.763 315.583,50.671 313.807,48.813 C312.029,46.954 309.946,46.023 307.558,46.023 C305.111,46.023 303.013,46.954 301.265,48.813 C299.517,50.671 298.643,52.763 298.643,55.086 L298.643,63.103 C298.643,65.485 299.517,67.620 301.265,69.507 C303.013,71.396 305.111,72.339 307.558,72.339 C309.946,72.339 312.029,71.396 313.807,69.507 C315.583,67.620 316.473,65.485 316.473,63.103 L316.473,55.086 ZM285.184,76.023 C285.184,77.018 284.513,78.027 283.173,79.050 C281.832,80.072 280.551,80.585 279.328,80.585 C278.220,80.585 277.434,80.234 276.968,79.532 L267.529,65.058 L258.090,79.532 C257.565,80.234 256.749,80.585 255.642,80.585 C254.535,80.585 253.296,80.087 251.928,79.094 C250.558,78.100 249.874,77.076 249.874,76.023 C249.874,75.440 250.078,74.883 250.486,74.357 L261.323,58.743 L251.010,44.006 C250.602,43.480 250.398,42.953 250.398,42.427 C250.398,41.374 251.083,40.337 252.452,39.313 C253.821,38.290 255.147,37.778 256.429,37.778 C257.478,37.778 258.206,38.129 258.614,38.830 L267.529,52.865 L276.444,38.918 C276.909,38.159 277.667,37.778 278.716,37.778 C279.881,37.778 281.163,38.290 282.562,39.313 C283.960,40.337 284.659,41.374 284.659,42.427 C284.659,42.896 284.454,43.422 284.047,44.006 L273.647,58.830 L284.572,74.357 C284.979,74.883 285.184,75.440 285.184,76.023 ZM238.687,27.865 C237.230,27.865 235.978,27.383 234.929,26.418 C233.880,25.453 233.356,24.328 233.356,23.041 C233.356,21.696 233.880,20.556 234.929,19.620 C235.978,18.685 237.230,18.216 238.687,18.216 C240.143,18.216 241.397,18.685 242.445,19.620 C243.494,20.556 244.019,21.696 244.019,23.041 C244.019,24.328 243.494,25.453 242.445,26.418 C241.397,27.383 240.143,27.865 238.687,27.865 ZM224.617,79.883 L197.435,79.883 C196.387,79.883 195.585,79.560 195.032,78.910 C194.477,78.260 194.202,77.512 194.202,76.665 C194.202,75.659 194.726,74.416 195.775,72.935 L214.478,45.673 L197.872,45.673 C197.115,45.673 196.444,45.307 195.862,44.572 C195.279,43.837 194.988,42.963 194.988,41.946 C194.988,40.930 195.250,40.069 195.775,39.364 C196.299,38.658 196.998,38.304 197.872,38.304 L223.131,38.304 C224.005,38.304 224.748,38.573 225.360,39.109 C225.972,39.646 226.277,40.422 226.277,41.437 C226.277,42.680 225.810,43.954 224.879,45.256 L206.088,72.515 L224.617,72.515 C225.432,72.515 226.131,72.868 226.714,73.574 C227.296,74.280 227.588,75.169 227.588,76.241 C227.588,77.258 227.311,78.119 226.758,78.825 C226.204,79.531 225.491,79.883 224.617,79.883 ZM182.753,27.865 C181.295,27.865 180.043,27.383 178.994,26.418 C177.946,25.453 177.421,24.328 177.421,23.041 C177.421,21.696 177.946,20.556 178.994,19.620 C180.043,18.685 181.295,18.216 182.753,18.216 C184.208,18.216 185.462,18.685 186.511,19.620 C187.560,20.556 188.084,21.696 188.084,23.041 C188.084,24.328 187.560,25.453 186.511,26.418 C185.462,27.383 184.208,27.865 182.753,27.865 ZM158.544,78.918 C158.077,80.146 156.853,80.760 154.873,80.760 C152.891,80.760 151.639,80.175 151.115,79.006 L143.511,56.374 L135.994,78.743 C135.470,80.087 134.159,80.760 132.061,80.760 C130.139,80.760 128.915,80.087 128.391,78.743 L114.844,43.304 C114.610,42.602 114.494,42.106 114.494,41.813 C114.494,40.760 115.134,39.854 116.417,39.094 C117.698,38.334 119.009,37.953 120.350,37.953 C121.806,37.953 122.738,38.510 123.147,39.620 L132.848,66.901 L140.277,42.690 C140.684,41.345 141.763,40.673 143.511,40.673 C145.259,40.673 146.336,41.345 146.745,42.690 L154.086,67.076 L163.875,39.620 C164.225,38.510 165.127,37.953 166.584,37.953 C167.865,37.953 169.163,38.334 170.474,39.094 C171.785,39.854 172.440,40.790 172.440,41.901 C172.440,42.369 172.323,42.837 172.091,43.304 L158.544,78.918 ZM182.753,38.304 C184.092,38.304 185.200,38.582 186.074,39.137 C186.948,39.694 187.385,40.409 187.385,41.287 L187.385,76.813 C187.385,77.574 186.933,78.275 186.030,78.918 C185.126,79.562 184.034,79.883 182.753,79.883 C181.470,79.883 180.393,79.562 179.519,78.918 C178.645,78.275 178.208,77.574 178.208,76.813 L178.208,41.287 C178.208,40.409 178.630,39.694 179.475,39.137 C180.319,38.582 181.412,38.304 182.753,38.304 ZM238.687,38.304 C240.027,38.304 241.134,38.582 242.008,39.137 C242.882,39.694 243.319,40.409 243.319,41.287 L243.319,76.813 C243.319,77.574 242.867,78.275 241.965,78.918 C241.061,79.562 239.968,79.883 238.687,79.883 C237.405,79.883 236.327,79.562 235.453,78.918 C234.579,78.275 234.142,77.574 234.142,76.813 L234.142,41.287 C234.142,40.409 234.564,39.694 235.410,39.137 C236.254,38.582 237.346,38.304 238.687,38.304 Z" class="fill-white"/>
							    <circle cx="50.047" cy="50" r="50.047" class="fill-white"/>
							    <path d="M86.607,38.585 L55.868,69.317 C53.678,71.508 50.126,71.508 47.936,69.317 C45.745,67.127 45.745,63.577 47.936,61.387 L78.674,30.654 C80.865,28.464 84.416,28.464 86.607,30.654 C88.797,32.844 88.797,36.395 86.607,38.585 ZM26.806,69.317 C25.679,70.444 24.193,70.981 22.716,70.948 C22.636,70.953 22.560,70.972 22.478,70.972 L20.552,70.972 C18.108,70.972 16.128,68.992 16.128,66.548 L16.128,33.452 C16.128,31.008 18.108,29.028 20.552,29.028 L22.478,29.028 C24.922,29.028 26.902,31.008 26.902,33.452 L26.902,53.359 L49.612,30.654 C51.802,28.464 55.354,28.464 57.544,30.654 C59.735,32.844 59.735,36.395 57.544,38.585 L26.806,69.317 Z" class="fill-dark"/>
							  </g>
							</svg>
							<!-- SVG Logo End -->
						</div>
						<h3 class="font-weight-light">We connect you with the world largest community</h3>
						<ul class="list-group list-group-borderless mt-4">
							<li class="list-group-item text-white"><i class="fa fa-check"></i>Connect with your community via Wizixo</li>
							<li class="list-group-item text-white"><i class="fa fa-check"></i>Discover the best experience with fellowship</li>
							<li class="list-group-item text-white"><i class="fa fa-check"></i>Create your wishlist and enjoy to best experience</li>
						</ul>
					</div>
				</div>
				<!-- Right -->
				<div class="col-12 col-md-7 col-xl-8 mx-auto my-5">
					<div class="row h-100">
						<div class="col-12 col-md-10 col-lg-5 text-left mx-auto d-flex align-items-center">
							<div class="w-100">
								<h2 class="">Login</h2>
								<h5 class="font-weight-light">쟈비스에 로그인하여 더 많은 기능을 이용해보세요!</h5>
								<div class="form mt-4 ">
									<div>
										<p class="text-left mb-2">아이디</p>
										<span class="form-group"><input type="text" class="form-control" id="mem_id" placeholder="User ID"></span>
									</div>
									<div>
										<div class="d-flex justify-content-between align-items-center">
											<p class="text-left mb-2">패스워드</p>											
										</div>
										<span class="form-group"><input type="password" id="mem_pass" class="form-control" placeholder="*********" onkeypress="caps_lock(event)"></span>
									</div>
									<div class="row align-items-center no-gutters m-0">
										<div class="col-6 col-md-8"><label id="label"></label></div>
										<div class="col-6 col-md-8"><span class="text-muted">회원이 아니신가요?  
										<a href="${pageContext.request.contextPath}/user/join/joinChoiceForm.do">Signup</a></span></div>
										<div class="col-6 col-md-8">
											<input type="button" name="hp_btn" onClick="search_id_modal()" class="btn" value="아이디찾기"> / 
											<input type="button" name="hp_btn" onClick="search_pw_modal()" class="btn" value="비밀번호찾기">
										</div>
										<div class="col-6 col-md-4 text-right"><button class="btn btn-dark" id="loginBtn" onclick="login()">로그인</button></div>
										<div id="naver_id_login" style="text-align: center">
										<a href="${url}"> <img width="223"
											src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- =======================
	Sign in -->

	<!--Global JS-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!--Template Functions-->
	<script src="assets/js/functions.js"></script>
	
	<!-- Modal -->
	<div class="modal fade text-left" id="search_id_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">아이디찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3" style="width:400px" align="center">
						이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" placeholder="홍길동" id="mem_name" name="mem_name" >
					</div>
					<div class="input-group mb-3" style="width:400px" align="center">
						생년월일&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="mem_birth" name="mem_birth" placeholder="YYYY-MM-DD" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="searchID()">찾기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade text-left" id="search_id_modal_result" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">아이디찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label id="IDresult"></label>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="search_pw_modal()">비밀번호 찾기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade text-left" id="search_pw_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3" style="width:400px" align="center">
						아&nbsp;&nbsp;이&nbsp;&nbsp;디&nbsp;&nbsp;&nbsp; <input type="text" id="mem_id_pw" name="mem_id_pw" class="form-control">
					</div>
					<div class="input-group mb-3" style="width:400px" align="center">
						이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" placeholder="홍길동" id="mem_name_pw" name="mem_name_pw" >
					</div>
					<div class="input-group mb-3" style="width:400px" align="center">
						생년월일&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="mem_birth_pw" name="mem_birth_pw" placeholder="YYYY-MM-DD" >
					</div>
					<div class="input-group mb-3" style="width:400px" align="center">
						휴대전화&nbsp;&nbsp;&nbsp;
						<input type="text" class="form-control" id="mem_hp_pw" name="mem_hp_pw" placeholder="010-1234-5678" onchange="smschange()" ><a href="javascript:sendsms();">[인증번호 전송]</a>
					</div>
					<div class="input-group mb-3" style="width:400px" align="center">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" class="form-control" name="hp_num" onkeyup="checksms()"/>
						<label id="hplabel"></label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="searchPW()">찾기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade text-left" id="search_pw_modal_result" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label id="PWresult"></label>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
