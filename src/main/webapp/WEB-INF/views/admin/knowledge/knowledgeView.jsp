<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지식관리 수정</title>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!--Vendors-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fitvids/jquery.fitvids.js"></script>

	<!--Template Functions-->
	<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
	$('form[name=knowledgeView]').on('submit', function(){	

		swal("UPDATE","수정 완료", "success");
	    var k_answer = $('input[name="k_answer"]:checked').val();
		$(this).append('<input type="hidden" name="k_no" value="${knowledgeInfo.k_no}"/>');
     	$(this).attr('action','${pageContext.request.contextPath}/admin/knowledge/updateKnowledgeInfo.do?k_answer=' + k_answer);
	        
	        return true;
	});

	$('#cancelBtn').click(function(){	
		$(location).attr('href','${pageContext.request.contextPath}/admin/knowledge/knowledgeList.do');
		
	});

});
 function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#image_container").appendChild(img); 
			
			img.style.height = '300px';
		    img.style.width = '300px';
			}; 
			reader.readAsDataURL(event.target.files[0]);

			document.querySelector("div#image_container").addEventListener('click', function() {
				document.querySelector("div#image_container").remove();
			});
		};
		
	
</script>
</head>
<body>
<div class="wrapper">
	<div id="vertical-topbar-placeholder"></div>
		<div id="horizontal-topbar-placeholder"></div>
		<div class="content-page">
            <div class="content">

                <div id="vertical-topbar-placeholder"></div>
                    <div id="horizontal-topbar-placeholder"></div>
                    

<!-- 탑 메뉴 -->
<!-- <div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
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
	</div> -->
	
	<!-- 문제 -->
<form name="knowledgeView" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
	<section class="timeline-page">
		<div class="container">
			<div class="row">
				<div class="col-md-8 text-center mx-auto">
					<h2 class="mb-2">Best solutions for your Brain!</h2>
					<p class="mb-5">두뇌를 강화 시켜주는 간단한 아이큐 테스트 입니다. <br>마음을 차분히 하시고 준비가 되면 바로 시작하시고 시험이 끝난 후 정답풀이를 확인해주세요.</p>
				</div>
			</div>
			<!-- 문제 -->
			<div class="row no-gutters">
				<div class="timeline-top"></div>
				<div class="col-md py-2">
					<div class="card">
						<div class="card-body">
								<h4 class="mb-2">
									<input type="text" size="30px" id="k_title" name="k_title" value="${knowledgeInfo.k_title}">
								</h4>
							<div class="form-group">
								<textarea class="form-control" rows="5" placeholder="내용을 입력하세요." id="k_content" name="k_content"
								>${knowledgeInfo.k_content}</textarea>
							</div>
							
							<c:forEach items="${knowledgeInfo.itemsInfo }" var="fileitemInfo" varStatus="status">
								<div id="image_container" style="width: 300px; height: 200px;">
									<img src="/files/${knowledgeInfo.itemsInfo[status.index].file_save_name }" alt="pic1" style="width: 300px; height: 200px;">
								</div>
							</c:forEach>

							<div class="list-group-number list-unstyled list-group-borderless">
								      
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio1" name="k_answer" value="k_answer1" 
									<c:if test="${knowledgeInfo.k_answer eq 'k_answer1'}">checked</c:if>
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio1"><span>01</span>
									<input type="text" size="30px" id="k_answer1" name="k_answer1" value="${knowledgeInfo.k_answer1}">
									</label>
								</div>
								
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio2" name="k_answer" value="k_answer2" 
									<c:if test="${knowledgeInfo.k_answer eq 'k_answer2'}">checked</c:if>
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio2"><span>02</span> 
									<input type="text" size="30px" id="k_answer2" name="k_answer2" value="${knowledgeInfo.k_answer2}">
									</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio3" name="k_answer" value="k_answer3" 
									<c:if test="${knowledgeInfo.k_answer eq 'k_answer3'}">checked</c:if>
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio3"><span>03</span> 
									<input type="text" size="30px" id="k_answer3" name="k_answer3" value="${knowledgeInfo.k_answer3}">
									</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio4" name="k_answer" value="k_answer4" 
									<c:if test="${knowledgeInfo.k_answer eq 'k_answer4'}">checked</c:if>
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio4"><span>04</span> 
									<input type="text" size="30px" id="k_answer4" name="k_answer4" value="${knowledgeInfo.k_answer4}">
									</label>
								</div>
								
							</div>
								<div class="form-group">
									<label for="exampleFormControlFile1"></label>
									<input type="file" class="form-control-file" name="files"
									  id="exampleFormControlFile1" onchange="setThumbnail(event);"/>
								</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			</section>
			
			<!-- 버튼 -->
			<section class="py-5">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 text-center mx-auto">
							<button type="submit" class="btn btn-primary" value="수정" id="regBtn">수정</button>
							<button type="button" class="btn btn-light" value="취소" id="cancelBtn">취소</button>
						</div>
					</div>
				</div>
			</section>
			
			<!-- end form -->
			</form>
		</div>
	</div>
</div>

</body>
</html>