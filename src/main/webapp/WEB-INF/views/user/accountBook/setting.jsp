<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	$("#kind").hide(); 
	$("#cardRegistBtn").hide(); 
	
	$('#files').on('change', handleImgFileSelect);
	$('#files2').on('change', handleImgFileSelect);

	
	$('#registBtn').click(function(){
		paymentOption = $('#paymentOption option:selected').val();
		paymentMethod = $('#paymentMethod option:selected').val();
		date = $('#date').val();
		item = $('#item').val();
		price = $('#price').val();
		division = $('#division').val();
		
		if(paymentMethod=="카드"){
			paymentMethod = $('#kind').val();
		}
		
	     $.ajax({
	   	 	async    : false,
	        url     : '${pageContext.request.contextPath}/user/accountBook/registTrace.do',
	        type    : 'post',
	        dataType : 'json',
	        data : {'deal_option':paymentOption,'deal_kind':paymentMethod,'deal_date':date,'deal_name':item,'deal_price':price, 'mem_no':${LOGIN_MEMBERINFO.mem_no}, 'deal_division':division},
	        success : function(Result) {
	        //  $('#accountTable').append('<tr><td>'+Result.list.length+'</td><td>'+Result.list[Result.list.length-1].deal_date+'</td><td>'+item+'</td><td>'+price+'</td><td>'+paymentMethod+'</td><td><button id="deleteBtn" type="button">삭제</button></td></tr>');
	        }
	
	   	});  // 등록 
		   	location.reload();
	});


	


	$('#registreceipt').click(function(){
		 $("#regist-modal").modal("show"); //모달창 띄우기
		 $("#img").attr("src", " ");

	}); //영수증 등록

	
	$('#cardRegistBtn').click(function(){
		$('#cardTable').empty();
		 $.ajax({
		   	 	async    : false,
		        url     : '${pageContext.request.contextPath}/user/accountBook/cardList.do',
		        type    : 'post',
		        dataType : 'json',
		        data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
		        success : function(Result) {
			        for(var i=0; i<Result.cardlist.length; i++){
		        		$('#cardTable').append('<tr><td>'+Result.cardlist[i].card_kind+'</td><td><button type="button" value="'+Result.cardlist[i].card_no+'" onclick="deleteCard('+Result.cardlist[i].card_no+')">삭제</button></td></tr>');

				    }
		        }
		
		   	});  // 등록 
		   	
		 $("#centermodal").modal("show"); //모달창 띄우기
	}); //영수증 등록

	
	$('#cardBtn').click(function(){
		card_kind = $('#card_kind').val();
		 $.ajax({
		   	 	async    : false,
		        url     : '${pageContext.request.contextPath}/user/accountBook/registCard.do',
		        type    : 'post',
		        dataType : 'json',
		        data : {'card_kind':card_kind,'mem_no':${LOGIN_MEMBERINFO.mem_no}},
		        success : function(Result) {
			        var card_no = Number(Result.cardlist[Result.cardlist.length-1].card_no);
			        $('#cardTable').append('<tr><td>'+card_kind+'</td><td><button type="button" value="'+card_no+'" onclick="deleteCard('+card_no+')">삭제</button></td></tr>');
		        }
		
		   	});  // 등록 
	}); //카드 등록 액션



	
});


function deleteCard(card_no){

	$.ajax({
   	 	async    : false,
        url     : '${pageContext.request.contextPath}/user/accountBook/deleteCard.do',
        type    : 'post',
        dataType : 'json',
        data : {'card_no':card_no, 'mem_no':${LOGIN_MEMBERINFO.mem_no}},
        success : function(Result) {
	        $('#cardTable').empty();
	        for(var i=0; i<Result.cardlist.length; i++){
        		$('#cardTable').append('<tr><td>'+Result.cardlist[i].card_kind+'</td><td><button type="button" value="'+Result.cardlist[i].card_no+'" onclick="deleteCard('+Result.cardlist[i].card_no+')">삭제</button></td></tr>');

		    }
	        

        }

   	});  // 삭제
   	
	
}

function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지만 업로드 가능합니다.");
			return;
		}
		
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e)	{
				$("#img").attr("src", e.target.result);
				$("#img2").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function categoryChange(e){
	var kind_a = ["체크카드","신용카드"];
    var target = document.getElementById("kind");
    
	if(e.value=="카드"){
    var d = kind_a;
	$("#kind").show(); 
	$("#cardRegistBtn").show(); 
	}else if(e.value=="현금"){
	$("#kind").hide(); 
	$("#cardRegistBtn").hide(); 
	}
	target.options.length = 0;

	for(x in d){
		var opt = document.createElement("option");
		opt.value=d[x];
		opt.innerHTML=d[x];
		target.appendChild(opt);
	}
}

</script>
<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Asset management system</h1>
					<h6 class="subtitle"> Please enter an asset! </h6>
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
		<br>
		<br>
		<br>
		
<div align="center" style="height: auto; margin: auto; ">

                            <div class="col-lg-6">

                                    <div class="card-body">

                                        <ul class="nav nav-tabs nav-bordered mb-3">
                                            
                                            <li class="nav-item">
                                                <a href="#profile-b1" data-toggle="tab" aria-expanded="true" class="nav-link active">
                                                    <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                                    <span class="d-none d-lg-block">거래 등록</span>
                                                </a>
                                            </li>
                                            
                                           
                                        </ul>

                                        <div class="tab-content" align="center">
                                            <div class="tab-pane" id="home-b1">
                                                	
                                            </div>
                                            <div class="tab-pane show active" id="profile-b1">
                                               <div>
                                                	날짜  <input type="date" id="date"> &nbsp;&nbsp;  물품 <input type="text" id="item"> 
                                                	
                                                	금액 <input type="text" id="price"> <br><br>
                                                	구분 <select name="division" id="division" style="width:100px;">
                                                			<option value="       "></option>
                                                			<option value="식비">식비</option>
                                                			<option value="교통비">교통비</option>
                                                			<option value="주거/통신">주거/통신</option>
                                                			<option value="생활용품">생활용품</option>
                                                			<option value="경조사비">경조사비</option>
                                                			<option value="지식문화">지식문화</option>
                                                			<option value="의복,미용">의복,미용</option>
                                                			<option value="의료,건강">의료,건강</option>
                                                			<option value="여가,유흥">여가,유흥</option>
                                                			<option value="세금,이자">세금,이자</option>
                                                			<option value="기타비용">기타비용</option>
                                                		</select>
                                                	거래종류  <select name="paymentOption" id="paymentOption" style="width:100px;">
															    <option value="       "></option>
															    <option value="출금">출금</option>
															    <option value="입금">입금</option>
															</select>
													결제방법  <select name="paymentMethod" id="paymentMethod" onchange="categoryChange(this)" style="width:100px;">
															    <option value="       "></option>
															    <option value="현금">현금</option>
															    <option value="카드">카드</option>
															</select>
															
															<select id="kind" style="width:100px;">
																<option value="       "></option>
															</select>
															<button type="button" id="cardRegistBtn">카드등록</button>
															<br>
                                                	
                                                	<br>&nbsp; &nbsp; <button type="button" id="registBtn">등록</button>
                                                	&nbsp; <button type="button" id="registreceipt">영수증 등록</button>
                                                	
                                                <br>
                                                <br>
                                                <hr color="lightgray">
                                                <br>
                                                <br>


                                                <table id="accountTable" class="table table-sm table-centered mb-0" style="margin: auto; text-align: center;" >
													<thead>
														<tr>
															<th></th>
															<th>날짜</th>
															<th>구분</th>
															<th>물품</th>
															<th>금액</th>
															<th>거래종류</th>
															<th>삭제</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="dealVO" items="${dealList }" varStatus="status">
															<tr>
																<th>${status.count }</th>
									 							<td>${dealVO.deal_date }</td>
									 							<td>${dealVO.deal_division }</td>
									 							<td>${dealVO.deal_name}</td>
									 							<td>${dealVO.deal_price}</td>
									 							<td>${dealVO.deal_kind}</td>
									 							<td><button id="deleteBtn" type="button" value="${dealVO.deal_no }" onclick="deletebtn(${dealVO.deal_no })">삭제</button></td>
									                        </tr>        
														</c:forEach>
													</tbody>	
												</table>
                                               ${pagination } 
                                                	
                                             </div>
                                            </div>
                                        </div>

                                    </div> <!-- end card-body-->

                            </div> <!-- end col -->
                            
                            
                            
                            <!-- SignIn modal content -->
							<div id="regist-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content" style="width:580px; height: 100%;">
										<div class="modal-body">
											<div class="container" style="">
									<div class="row">
										<div class="col-12 col-lg-8 mx-auto">
												<h2 style="border-bottom: 1px solid #d2d2d2; ">Register receipt</h2>
										</div>
									</div>
									<div class="row ">
										<!-- contact form -->
										<div class="col-md-6">
											<div class="h-100" style="width:500px; height: 1500px;">
												<form class="contact-form" id="contact-form" name="contactform2" action="${pageContext.request.contextPath}/" method="post" enctype="multipart/form-data">			
													<!-- Start main form -->
														<div class="" style="width:50%; float: right;">
															<div></div>
															<div class="col-md-12 text-center">
															<input type="file" class="btn btn-outline-primary btn-block" style="margin-top: 10px;" id="files" name="files">
															</div>
															<div style="width: 230px; height: 400px;" >
															<img id="img" style="width: 100%; height: 100%;">
															</div>
														</div>
														<button class="btn btn-outline-grad btn-block" type="submit">등록</button>	
													<!-- End main form -->
												</form>
											</div>
										</div>
									</div>
								</div><!-- 컨테이너 -->
						
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->
	
	
	
						 <!-- Center modal content -->
                                        <div class="modal fade" id="centermodal" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="myCenterModalLabel">Register Your Card</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    </div>
                                                    <div class="modal-body">
                                                    	카드 이름 : <input type="text" id="card_kind">
                                                    	<button type="button" id="cardBtn"> 등록 </button>
                                                    	
                                                    	
                                                    	<table id="cardTable" class="table table-sm table-centered mb-0" style="margin: auto; text-align: center;" >
													<thead>
														<tr>
															<th>카드이름</th>
															<th>삭제</th>
														</tr>
													</thead>
													<tbody>
														
													</tbody>	
												</table>
                                                    	
                                                    </div>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div><!-- /.modal -->
	
	

</div>

