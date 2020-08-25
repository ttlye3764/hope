<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지식관리</title>
<style type="text/css">
#ex_box {
 position: relative; top:0; left:0; 
 width: 100%; height: 40px;  text-align: center; background: #3399ff;
}
</style>
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
	
	var list = new Array();
	var hap = new Array();
	
		<c:forEach items= "${knowledgeList }" var= "knowledgeInfo" varStatus="status">
		// DB에 있는 정답
		list.push("${knowledgeInfo.k_answer}");

		var Chk = $('input:radio[name=radio${status.count }]').is(':checked');
		if (!Chk) {
			document.getElementById("allChk").innerHTML = "체크 되지 않은 것이 있습니다.";
			$('#answer').hide();
			$('#return').hide();
			$('#statistic').hide();

			return;

		}
		// 사용자가 선택한 값
		var radioChk = $('input[name="radio${status.count }"]:checked').val();
		hap.push(radioChk);

        var count = 0;
		for (var i = 0; i < list.length; i++) {
			if(list[i] == hap[i]){
					count++;
				}
			}

			document.getElementById("allChk").innerHTML = "총 맞은 갯수 : " + count;
			document.getElementById("check").innerHTML = "잘하셨어요!";

		</c:forEach>

	}

	$(function() {
		$('#answer').click(function() {
			$(location).attr('href','${pageContext.request.contextPath}/user/knowledge/knowledgeAnswerList.do');

		});

		var i = 0;
		var $output = $("#output");
			
       	var timer = setInterval(function() {
			i++;
			$output.text(i);

       	 	if (i == 80) {
				clearInterval(timer);
	       	 }

          }, 1000);

	});

	// 움직이는 메뉴 스크롤
	$("document").ready(function() {  
	    $(window).scroll(function()  {  
	        $('#scroll').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 350});    
	    });  
	 
	    $('#scroll').click(function() {  
	        $('#scroll').animate({ top:"+=15px",opacity:0 }, "slow");  
	    })
	       
	});  
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
			
			<div style="position:relative; float:right; width:100px;">  
		        <div id="scroll" style="position:absolute;top:0px;left:0px;"> 
			        <p style="margin: 0 auto; text-align: center; color: black;">80초 안에 <br>풀어보세요!</p> 
			           <div id="output" style="margin: 0 auto; text-align: center; font-size: 30px; color: black;">
							<p id="timer" style="font-size: 30px;"></p>
						</div> 
		        </div>  
			</div>
			
			<form name="form">
			<div class="row no-gutters">
				<div class="timeline-top"></div>
				<div class="col-md py-2">
					<c:if test="${empty knowledgeList }" >
					
					<div class="card" style="width: 800px; margin-left: 180px;">
						<div class="card-body" >
							<h4 class="mb-2" style="text-align: center;">등록된 게시글이 존재하지 않습니다!!!</h4>
						</div>
					</div>
					</c:if>
					
					<c:if test="${!empty knowledgeList }">
					<c:forEach items= "${knowledgeList }" var= "knowledgeInfo" varStatus="status">
					<c:set var="radio" value="${radio + 1}" />
					
					<div class="card" style="width: 800px; margin-left: 180px; height:500px;">
						<div class="card-body">
							<h4 class="mb-2">
							<input type="hidden" value="${knowledgeInfo.k_no}" id="k_no"/>
							${knowledgeInfo.rnum }. ${knowledgeInfo.k_title }</h4>
							<div class="form-group">
								${knowledgeInfo.k_content }
							</div>
							
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
									<input type="radio" id="customRadio_${status.count }_1" name="radio${status.count }" value="k_answer1" 
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio_${status.count }_1"><span>01</span>
									${knowledgeInfo.k_answer1 }
									</label>
								</div>								
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio_${status.count }_2" name="radio${status.count }" value="k_answer2" 
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio_${status.count }_2"><span>02</span> 
									${knowledgeInfo.k_answer2 }
									</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio_${status.count }_3" name="radio${status.count }" value="k_answer3" 
									class="custom-control-input">
									<label class="custom-control-label" for="customRadio_${status.count }_3"><span>03</span> 
									${knowledgeInfo.k_answer3 }
									</label>
								</div>
								<div class="custom-control custom-radio" style="padding: 10px">
									<input type="radio" id="customRadio_${status.count }_4" name="radio${status.count }" value="k_answer4" 
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
			
			<br><br>
			
	<!-- =======================
	call to action-->
	<c:if test="${!empty knowledgeList }" >
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
						  		<div class="modal-content" id="modals">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle" ><p id="allChk"></p></h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p id="check"></p>
									</div>
									
									<div class="col-xl-6" >
			                            <div class="card" style="width: 470px; height: 300px; margin-bottom: 30px;" id="statistic">
			                                <div class="card-body">
			                                    <h4 class="header-title mb-4">통계 분석</h4>
			                                    <div class="bar-container-horizontal" style="width: 100%;height: 300px;"></div>
			                                </div>
			                                <!-- end card body-->
			                            </div>
			                            <!-- end card -->
			                        </div>
									
									<div class="modal-footer">
										<button type="button" class="btn btn-light" id="answer">정답보기</button>
										<button type="button" class="btn btn-primary" id="return">다시하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</section>
		</c:if>
		</form>	
		</div>
	</section>
</body>
</html>