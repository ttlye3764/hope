<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Webestica.com">
<meta name="description" content="Creative Multipurpose Bootstrap Template">

<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/template/assets/images/favicon.ico">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CPlayfair+Display:400,400i,700,700i%7CRoboto:400,400i,500,700" rel="stylesheet">
<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/themify-icons/css/themify-icons.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/vendor/animate/animate.min.css" /><!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/template/assets/css/style.css" />
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
    
    #loading{
       z-index : 900;
    }
</style>
<div class="innerpage-banner center bg-overlay-dark-7 py-7" 
	style="background:url(${pageContext.request.contextPath }/resources/template/assets/images/bg/04.jpg) no-repeat; background-size:cover; 
		background-position: center center;">
		<div id="loading" class="wrap-loading display-none">
    		<div><img src="../../image/Progress_Loading.gif"/></div>
		</div>
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Health</h1>
					<h6 class="subtitle">Show your awesome work in Health style</h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active">
							<a href='${pageContext.request.contextPath}/user/healthImage/healthImageList.do'><i class="ti-home"></i> Home</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- =======================
	Banner innerpage -->

	<!-- =======================
	Portfolio -->
	<section class="portfolio pb-0">
		<div class="container">
			<div class="row">
				<div class="col-md-12 p-0">
						<div class="col-sm-12 col-md-12">
							<h5 class="mb-4">Tab line</h5>
							<ul class="nav nav-tabs tab-line">
								<li class="nav-item"> 
									<a class="nav-link" href="#tab-3-1" data-toggle="tab" id="all">
										전체
									</a>
								</li>
								<li class="nav-item"> 
									<a class="nav-link" data-toggle="tab" href="#tab-3-1" onclick="shoulder();">
										<input type="hidden" value="어깨" id="shoulder"/>어깨
									</a>
								</li>
								<li class="nav-item"> 
									<a class="nav-link" data-toggle="tab" href="#tab-3-1" onclick="back();">
										<input type="hidden" value="등" id="back"/>등
									</a>
								</li>
								<li class="nav-item"> 
									<a class="nav-link" data-toggle="tab" href="#tab-3-1" onclick="chest();">
										<input type="hidden" value="가슴" id="chest"/>가슴
									</a>
								</li>
								<li class="nav-item"> 
									<a class="nav-link" data-toggle="tab" href="#tab-3-1" onclick="arm();">
										<input type="hidden" value="팔" id="arm"/>팔
									</a>
								</li>
								<li class="nav-item"> 
									<a class="nav-link" data-toggle="tab" href="#tab-3-1" onclick="leg();">
										<input type="hidden" value="다리" id="leg"/>다리
									</a>
								</li>
								 <div class="col-sm-8" style="float: right;">
			                     	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
			                          <div class="text-sm-right">
			                              <button type="button" class="btn btn-light mb-2 mr-1" id="Inbody" data-toggle="modal" data-target="#exampleModal">Inbody</button>
			                              <button type="button" class="btn btn-light mb-2 mr-1" id="excel">Excel</button>
			                          </div>
			                     	</form>
			                     </div><!-- end col-->
							</ul>
						</div>
                        <br> 
					<div class="portfolio-wrap grid items-4 items-padding">
					<c:forEach items= "${healthImageList }" var= "healthInfo" varStatus="status">
						<!-- portfolio-card -->
						<div class="portfolio-card isotope-item digital">
							<div class="portfolio-card-body">
							
								<!-- 파일 -->
								<c:forEach items="${healthInfo.items }" var="fileitemInfo" varStatus="stat">
								 <c:if test="${!empty healthInfo.items}">  
									<div class="portfolio-card-header" id="image_container" style="width: 235px; height: 160px;">
										<img src="/files/${fileitemInfo.file_save_name}" alt="pic1" 
										onError="this.src='${pageContext.request.contextPath }/resources/image/playBtn.jpeg';"
										style="width: 233px; height: 160px;">
				 					</div> 
								 </c:if> 
								 
								
								<div class="portfolio-card-footer">
									<a href="#" class="full-screen" data-toggle="modal" data-target="#exampleModalCenter${status.index}"
										 data-fancybox="portfolio" data-caption="title">
										<i class="ti-fullscreen"></i>
									</a>
										<h6 class="info-title" style="font-size: 15px;">
											<a title="">${healthInfo.healthImage_title}</a>
										</h6>
									
									<c:if test="${healthInfo.healthImage_difficulty eq '상'}">
                                         <span class="badge badge-danger" >${healthInfo.healthImage_difficulty}</span>
                                     </c:if>
                                     
                                     <c:if test="${healthInfo.healthImage_difficulty eq '중'}">
                                         <span class="badge badge-warning" >${healthInfo.healthImage_difficulty}</span>
                                     </c:if>
                                     
                                     <c:if test="${healthInfo.healthImage_difficulty eq '하'}">
                                         <span class="badge badge-success" >${healthInfo.healthImage_difficulty}</span>
                                     </c:if>
								</div>
								
									<!-- 모달1 이미지 상세보기-->
									<div class="modal fade text-left" id="exampleModalCenter${status.index}"
										tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
									  		<div class="modal-content" id="modals" style="text-align: center;">
												<div class="modal-header" style="text-align: center;vertical-align: middle">
													
													<!-- 동영상일 때 -->
													<c:set var="fileName" value="${fn:split(fileitemInfo.file_save_name,'.') }" />
													  <c:if test="${fileName[1] eq 'mp4'}">  
														  <video id="myVideo" oncontextmenu="return false;" width="640" controls autoplay="autoplay">
														    <source src="/files/${fileitemInfo.file_save_name}" type="video/mp4">
														</video>
													 </c:if> 
													 
													<!-- 파일일 때 --> 
													<c:set var="fileName" value="${fn:split(fileitemInfo.file_save_name,'.') }" />
													  <c:if test="${fileName[1] eq 'jpg' || fileName[1] eq 'png'}">    
														<div class="portfolio-card-header" id="image_container" style="width: 235px; height: 160px;margin-left: 25%">
															<img src="/files/${fileitemInfo.file_save_name}" 
															alt="pic1" style="width: 233px; height: 160px;margin: auto;">
									 					</div> 
													 </c:if>
													
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body" style="text-align: center;">
													<p>운동명 : ${healthInfo.healthImage_title}</p>
													<p>카테고리 : ${healthInfo.healthImage_category}</p>
													<p>추천 연령 : ${healthInfo.healthImage_age}</p>
													<p>운동법 : ${healthInfo.healthImage_diet}</p>
													<p>적정 시간 : ${healthInfo.healthImage_time}분</p>
													<c:if test="${!empty healthInfo.healthImage_content}">  
														<p>설명 : ${healthInfo.healthImage_content}</p>
									 				</c:if>
												</div>
											</div>
										</div>
									</div>
									</c:forEach> 
									
									<!-- 모달2 inbody -->
									<div class="modal fade text-left" id="exampleModal" tabindex="-1" role="dialog" 
												aria-labelledby="exampleModal" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
									  		<div class="modal-content" id="modals">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLongTitle" ><p>My Inbody</p></h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form id="files" name="file" method="post">
														<div class="form-group">
															<label for="exampleFormControlFile1">인바디 파일을 넣어주세요.</label>
															<input type="file" name="files" class="form-control-file" id="fileName">
														</div>
 													<button type="button" class="btn btn-light" onClick="ajaxFileUpload();" style="margin: 0px 0px 0px 190px;">제출</button>
													</form>
													
														<div class="form-group" style="display: inline;">
														체중<input class="form-control form-control-sm" type="text" style="width: 100px;" id="inbody_weight">
														골격근량<input class="form-control form-control-sm" type="text" style="width: 100px;" id="inbody_bone">
														체지방<input class="form-control form-control-sm" type="text" style="width: 100px;" id="inbody_fat">
														근육량<input class="form-control form-control-sm" type="text" style="width: 100px;" id="inbody_muscle">
														</div>
 													<button type="button" class="btn btn-light" id="inbody" style="margin: 0px 0px 0px 190px;">제출</button>
												</div>
											</div>
										</div>
									</div>
				
									
							</div>
						</div>
						<!-- portfolio-card -->
					</c:forEach>
					</div>
						<div style="margin: auto;">${pagination }</div>
				</div>
			</div>
		</div>
	</section>
	

	<!-- =======================
	Portfolio -->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!--Vendors-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fancybox/js/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/isotope/isotope.pkgd.min.js"></script>

	<!--Template Functions-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">

			$(function(){

				// 엑셀
				$('#excel').click(function(){
					$(location).attr('href','${pageContext.request.contextPath}/user/healthImage/excelDown.do');
				}); 

				// 전체
				$('#all').click(function(){
					$(location).attr('href','${pageContext.request.contextPath}/user/healthImage/healthImageList.do');
				}); 

				 
				 // 인바디 정보 등록
				$('#inbody').click(function(){
					var files = $('#fileName').val();
					if(files == ""){
						swal("FILE","파일을 넣어주세요.", "warning");

						return false;
					}

					
					
				});  


				/* $("#playBtn").on("click", function() {
			        $("#myVideo").trigger("play");

			    });

			    $("#fullBtn").on("click", function() {
			        var elem = document.getElementById("myVideo");

			        if(elem.requestFullscreen) {
			            elem.requestFullscreen();

			        } else if(elem.mozRequestFullScreen) {
			            elem.mozRequestFullScreen();

			        } else if (elem.webkitRequestFullscreen) {
			            elem.webkitRequestFullscreen();

			        } else if (elem.msRequestFullscreen) {
			            elem.msRequestFullscreen();
			        }

			    });

			    $("#myVideo").on("ended", function() {
			         console.log("Video Finished");

			    }); */

			});

			// 파일 ocr 등록
			 function ajaxFileUpload() {

				 var files = $('#fileName').val();
					if(files == ""){
						swal("FILE","파일을 넣어주세요.", "warning");

						return false;
					}

			        var form = $("#files")[0];
			        var formData = new FormData(form);
			        formData.append("message", "ajax로 파일 전송하기");
			        formData.append("file", $("#files")[0].files[0]);

			        $.ajax({
			              url : "${pageContext.request.contextPath}/user/healthImage/ocr.do"
			            , type : "POST"
			            , processData : false
			            , contentType : false
			            , data : formData
			            // 로딩 화면
			            ,beforeSend : function(){
			                $('.wrap-loading').removeClass('display-none');
			            },
			            complete : function(){
			                $('.wrap-loading').addClass('display-none');
			            }
			            // 성공시 
			            , success : function(result) {
					        $('#inbody_weight').val(result.inbodyInfo.inbody_weight);
					        $('#inbody_bone').val(result.inbodyInfo.inbody_bone);
					        $('#inbody_fat').val(result.inbodyInfo.inbody_fat);
					        $('#inbody_muscle').val(result.inbodyInfo.inbody_muscle);

			            }
			        });

			    }

			function setThumbnail(event) { 
				var reader = new FileReader(); 
				reader.onload = function(event) { 
					var img = document.createElement("img"); 
					
					img.setAttribute("src", event.target.result); 
					document.querySelector("div#image_container").appendChild(img); 
					
					img.style.height = '230px';
				    img.style.width = '160px';
					}; 
					reader.readAsDataURL(event.target.files[0]);

					document.querySelector("div#image_container").addEventListener('click', function() {
					document.querySelector("div#image_container").remove();
					});
				};

			
			function shoulder() {
				  var choose = $('#shoulder').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/healthImageList.do?choose=' + choose;
			}
			
			function back() {
				  var choose = $('#back').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/healthImageList.do?choose=' + choose;
			}
			
			function chest() {
				  var choose = $('#chest').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/healthImageList.do?choose=' + choose;
			}
			
			function arm() {
				  var choose = $('#arm').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/healthImageList.do?choose=' + choose;
			}
			
			function leg() {
				  var choose = $('#leg').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/healthImageList.do?choose=' + choose;
			}

		    $("#myVideo").on("ended", function() {
		         console.log("Video Finished");

		    });


</script>
</html>