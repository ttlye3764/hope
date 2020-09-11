<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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

	$(function() {
		$('#returnBtn').click(function() {
			$(location).attr('href','${pageContext.request.contextPath}/user/knowledge/knowledgeList.do');

		});
	});


</script>

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
			<div class="row no-gutters">
				<div class="timeline-top"></div>
				<div class="col-md py-2">
					<c:if test="${empty knowledgeList }">
					<div class="card" style="width: 800px;">
						<div class="card-body">
							<h4 class="mb-2" style="text-align: center;">등록된 게시글이 존재하지 않습니다!!!</h4>
						</div>
					</div>
					</c:if>
					
					<c:if test="${!empty knowledgeList }">
					<c:forEach items= "${knowledgeList }" var= "knowledgeInfo" varStatus="status">
					<c:set var="radio" value="${radio + 1}" />
					
					<div class="card" style="width: 800px; margin-left: 180px; height:550px;">
						<div class="card-body">
							<h4 class="mb-2">
							<input type="hidden" value="${knowledgeInfo.k_no}" id="k_no"/>
							${knowledgeInfo.rnum }. ${knowledgeInfo.k_title }</h4>
							<div class="form-group">
								${knowledgeInfo.k_content }
							</div>
							
					<!-- 파일  -->
					 <c:if test="${!empty knowledgeInfo.items[status.index].file_save_name }">  
						<div id="image_container" style="width: 300px; height: 230px;">
								<img src="/files/${knowledgeInfo.items[status.index].file_save_name}" alt="pic1" style="width: 300px; height: 230px;">
	 					</div> 
					 </c:if>   

							<div class="list-group-number list-unstyled list-group-borderless">
								
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio_${status.count }_1" name="radio${status.count }" value="k_answer1" 
									<c:if test="${knowledgeInfo.k_answer eq 'k_answer1'}">checked</c:if>
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio_${status.count }_1"><span>01</span>
									${knowledgeInfo.k_answer1 }
									</label>
								</div>								
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio_${status.count }_2" name="radio${status.count }" value="k_answer2" 
									<c:if test="${knowledgeInfo.k_answer eq 'k_answer2'}">checked</c:if>
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio_${status.count }_2"><span>02</span> 
									${knowledgeInfo.k_answer2 }
									</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio_${status.count }_3" name="radio${status.count }" value="k_answer3" 
									<c:if test="${knowledgeInfo.k_answer eq 'k_answer3'}">checked</c:if>
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio_${status.count }_3"><span>03</span> 
									${knowledgeInfo.k_answer3 }
									</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio_${status.count }_4" name="radio${status.count }" value="k_answer4" 
									<c:if test="${knowledgeInfo.k_answer eq 'k_answer4'}">checked</c:if>
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio_${status.count }_4"><span>04</span> 
									${knowledgeInfo.k_answer4 }
									</label>							
								</div>
							</div>
						</div>
					</div>
					
					<br><br><br><br>
					
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
					<h4>정답 확인 하셨나요? 이제 다시 집중해서 문제를 풀어보세요.</h4>
					
					<div class="col-md align-self-center text-center">
						<!-- Button trigger modal -->
						<button type="button" id="returnBtn" class="btn btn-outline-light mb-0" data-toggle="modal" 
							data-target="#exampleModalCenter">다시 하기
						</button>
	
					
					</div>
					</div>
				</div>
			</div>
		</section>
		</form>	
		</div>
	</section>

</html>