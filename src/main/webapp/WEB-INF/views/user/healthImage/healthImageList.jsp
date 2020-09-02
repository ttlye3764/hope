<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Health Management</h1>
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
					<div class="nav justify-content-center">
						<ul class="nav-tabs nav-tabs-style-3 text-center px-2 p-md-0 m-0 mb-4">
							<li class="nav-filter active" data-filter="all" onclick="all();">전체</li>
							<li class="nav-filter" data-filter="shoulder" onclick="shoulder();"><input type="hidden" value="어깨" id="shoulder"/>어깨</li>
							<li class="nav-filter" data-filter="back" onclick="back();"><input type="hidden" value="등" id="back"/>등</li>
							<li class="nav-filter" data-filter="chest" onclick="chest();"><input type="hidden" value="가슴" id="chest"/>가슴</li>
							<li class="nav-filter" data-filter="arm" onclick="arm();"><input type="hidden" value="팔" id="arm"/>팔</li>
							<li class="nav-filter" data-filter="leg" onclick="leg();"><input type="hidden" value="다리" id="leg"/>다리</li>
						</ul>
					</div>
					 <div class="col-sm-8" style="float: right;">
                     	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
                          <div class="text-sm-right">
                              <button type="button" class="btn btn-light mb-2 mr-1" id="excel">Excel</button>
                          </div>
                     	</form>
                     </div><!-- end col-->
                                            
					<div class="form-group" style="margin: auto">
							<label for="exampleFormControlFile1">File input</label>
							<input type="file" class="form-control-file" id="exampleFormControlFile1">
						</div>
						
					
					<div class="portfolio-wrap grid items-4 items-padding">
					<c:forEach items= "${healthImageList }" var= "healthInfo" varStatus="status">
						<!-- portfolio-card -->
						<div class="portfolio-card isotope-item digital">
							<div class="portfolio-card-body">
							
								<!-- 파일 -->
								 <c:if test="${!empty healthInfo.items[status.index].file_save_name }">  
									<div class="portfolio-card-header" id="image_container" style="width: 300px; height: 230px;">
										<img src="/files/${healthInfo.items[status.index].file_save_name}" alt="pic1" style="width: 300px; height: 230px;">
				 					</div> 
								 </c:if>  
								
								<div class="portfolio-card-footer" id="healthCard">
									<a class="full-screen" data-toggle="modal" data-target="#exampleModalCenter"
										 data-fancybox="portfolio" data-caption="title">
									<i class="ti-fullscreen"></i></a>
										<h6 class="info-title">
											<a id="title">
												<input type="hidden" value="${healthInfo.healthImage_no}" id="healthImage_no"/>
													${healthInfo.healthImage_title}
											</a>
											
											<!-- 모달 -->
											<div class="modal fade text-left" id="exampleModalCenter" 
												tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered" role="document">
											  		<div class="modal-content" id="modals" style="text-align: center;">
														<div class="modal-header" style="text-align: center;">
															<h5 class="modal-title" id="exampleModalLongTitle" style="margin-left: 185px;">
															<p>${healthInfo.healthImage_title}</p>
															</h5>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body" style="text-align: center;">
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
											
						
										</h6>
									
									<c:if test="${healthInfo.healthImage_difficulty eq '상'}">
                                         <span class="badge badge-danger">${healthInfo.healthImage_difficulty}</span>
                                     </c:if>
                                     
                                     <c:if test="${healthInfo.healthImage_difficulty eq '중'}">
                                         <span class="badge badge-warning">${healthInfo.healthImage_difficulty}</span>
                                     </c:if>
                                     
                                     <c:if test="${healthInfo.healthImage_difficulty eq '하'}">
                                         <span class="badge badge-success">${healthInfo.healthImage_difficulty}</span>
                                     </c:if>
								</div>
							</div>
						</div>
						<!-- portfolio-card -->
					</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
	</section>
	<!-- =======================
	Portfolio -->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

	<!--Vendors-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fancybox/js/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/isotope/isotope.pkgd.min.js"></script>

	<!--Template Functions-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
<script type="text/javascript">

			$(function(){
				// 등록
				$('#regBtn').click(function(){	
					$(location).attr('href','${pageContext.request.contextPath}/user/healthImage/healthImageForm.do');
					
				});

				// 수정
				$('#list tr').click(function(){
					var healthImage_no = $(this).find('td:eq(0) input').val();
					$(location).attr('href','${pageContext.request.contextPath}/user/healthImage/healthImageView.do?healthImage_no=' + healthImage_no);
				});

				// 엑셀
				$('#excel').click(function(){
					$(location).attr('href','${pageContext.request.contextPath}/user/healthImage/excelDown.do');
				}); 

			});

			
			function shoulder() {
				  var choose = $('#shoulder').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/chooseList.do?choose=' + choose;
			}
			
			function back() {
				  var choose = $('#back').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/chooseList.do?choose=' + choose;
			}
			
			function chest() {
				  var choose = $('#chest').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/chooseList.do?choose=' + choose;
			}
			
			function arm() {
				  var choose = $('#arm').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/chooseList.do?choose=' + choose;
			}
			
			function leg() {
				  var choose = $('#leg').val();	
				  location.href = '${pageContext.request.contextPath}/user/healthImage/chooseList.do?choose=' + choose;
			}

			function all() {
				  location.href = '${pageContext.request.contextPath}/user/healthImage/healthImageList.do';
			}

			
			
		</script>
</body>
</html>