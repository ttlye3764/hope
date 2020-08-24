<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지식관리</title>
<!--Global JS-->
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!--Vendors-->
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fitvids/jquery.fitvids.js"></script>

<!--Template Functions-->
<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>

<script type="text/javascript">
 function myFucntion(){
	  var allChk = $('input:radio').is(':checked');
	 /*  
	  if(chk && chk2)
	   document.getElementById("check").innerHTML="정답입니다.";
	  else if (!allChk)
	   document.getElementById("check").innerHTML="답을 체크하여 주세요.";
	  else 
	   document.getElementById("check").innerHTML="오답입니다."; */
	   document.getElementById("result").innerHTML=count;
	 }
  
</script>
</head>
<body>

<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">퀴즈 풀기</h1>
					<h6 class="subtitle">두뇌 강화 퀴즈 풀이 입니다 </h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a href="index.html"><i class="ti-home"></i> Home</a></li>
							<li class="breadcrumb-item">Timeline</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<section class="timeline-page">
		<div class="container">
			<div class="row">
				<div class="col-md-8 text-center mx-auto">
					<h2 class="mb-2">Best solutions for your Brain!</h2>
					<p class="mb-5">두뇌를 강화 시켜주는 간단한 아이큐 테스트 입니다. <br>마음을 차분히 하시고 준비가 되면 바로 시작한 뒤, 시험이 끝난 후 정답풀이를 확인해주세요.</p>
				</div>
			</div>
			<form name="form">
			<!-- 1번 문제 -->
			<%-- <div class="row no-gutters">
				<div class="timeline-top"></div>
				<div class="col-md py-2">
					<div class="card">
						<c:if test="${empty knowledgeList }">
							<div class="card" style="width: 800px; margin-left: 150px">
								<div class="card-body">
									<h4 class="mb-2" style="text-align: center;">등록된 문제가 없습니다.</h4>
								</div>
							</div>
						</c:if>
					
						<div class="card-body">
							<c:forEach items="${knowledgeList}" var="knowledgeInfo">
							<c:set var="radio" value="${radio + 1}" />
							
							<h4 class="mb-2">${knowledgeInfo.rnum }. ${knowledgeInfo.k_title }</h4>
							<p>${knowledgeInfo.k_content }</p>
							
							<!-- 파일 -->
							<c:if test="${!empty knowledgeInfo.items }">  
							<div id="image_container" style="width: 300px; height: 200px;">
								<c:forEach items="${knowledgeInfo.items }" var="fileitemInfo">
									<img src="/files/${fileitemInfo.file_save_name }" alt="pic1">
								</c:forEach>
							</div>
							 </c:if> 
							 
							<div class="list-group-number list-unstyled list-group-borderless">
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio1" name="${radio }" value="k_answer1" class="custom-control-input">
									<label class="custom-control-label" for="customRadio1"><span>01</span>${knowledgeInfo.answer1 }</label>
								</div>
								
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio2" name="${radio }" value="k_answer2" class="custom-control-input">
									<label class="custom-control-label" for="customRadio2"><span>02</span>${knowledgeInfo.answer2 }</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio3" name="${radio }" value="k_answer3" class="custom-control-input">
									<label class="custom-control-label" for="customRadio3"><span>03</span>${knowledgeInfo.answer3 }</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio4" name="${radio }" value="k_answer4" class="custom-control-input">
									<label class="custom-control-label" for="customRadio4"><span>04</span>${knowledgeInfo.answer4 }</label>
								</div>
								 
							</div>
					</c:forEach>
						</div>
					</div>
				</div>
			</div> --%>
			
			<div class="row no-gutters">
				<div class="timeline-top"></div>
				<div class="col-md py-2">
					<c:if test="${empty knowledgeList }">
					
					<div class="card" style="width: 800px; margin-left: 150px">
						<div class="card-body">
							<h4 class="mb-2" style="text-align: center;">등록된 게시글이 존재하지 않습니다!!!</h4>
						</div>
					</div>
					</c:if>
					
					<c:if test="${!empty knowledgeList}">
					<c:forEach items="${knowledgeList}" var="knowledgeInfo">
					<c:set var="radio" value="${radio + 1}" />
					
					<div class="card" style="width: 800px; margin-left: 150px">
						<div class="card-body">
							<h4 class="mb-2">
							<input type="hidden" value="${knowledgeInfo.k_no}" id="k_no"/>
							${knowledgeInfo.rnum }. ${knowledgeInfo.k_title }</h4>
							<div class="form-group">
								${knowledgeInfo.k_content }
							</div>
							
							${knowledgeInfo.k_content }
							
							<!-- 파일  -->
							 <c:if test="${!empty knowledgeInfo.items }">  
							<div id="image_container" style="width: 300px; height: 200px;">
								<c:forEach items="${knowledgeInfo.items }" var="fileitemInfo">
									<img src="/files/${fileitemInfo.file_save_name }" alt="pic1">
								</c:forEach>
							</div>
							 </c:if>  

							<div class="list-group-number list-unstyled list-group-borderless">
								
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio1" name="${radio }" value="k_answer1" 
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio1"><span>01</span>
									${knowledgeInfo.k_answer1 }
									</label>
								</div>								
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio2" name="${radio }" value="k_answer2" 
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio2"><span>02</span> 
									${knowledgeInfo.k_answer2 }
									</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio3" name="${radio }" value="k_answer3" 
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio3"><span>03</span> 
									${knowledgeInfo.k_answer3 }
									</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio4" name="${radio }" value="k_answer4" 
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio4"><span>04</span> 
									${knowledgeInfo.k_answer4 }
									</label>							
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					</c:if>
				</div>
			</div>
			
	<!-- =======================
	call to action-->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 text-center mx-auto">
					<h4>퀴즈 문제 결과를 확인하세요!</h4>
					
					<div class="col-md align-self-center text-center">
						<!-- Button trigger modal -->
						<button type="button" id="btn" class="btn btn-outline-light mb-0" data-toggle="modal" 
							data-target="#exampleModalCenter" onclick="myFucntion()">결과 보기
						</button>
	
						<!-- Modal -->
						<div class="modal fade text-left" id="exampleModalCenter" tabindex="-1" role="dialog" 
							aria-labelledby="exampleModalCenter" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
						  		<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle" >총 점수  <p id="allChk"></p></h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p id="check"></p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-light">정답보기</button>
										<button type="button" class="btn btn-primary">다시하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</section>
		</form>	
		</div>
	</section>
</body>
</html>