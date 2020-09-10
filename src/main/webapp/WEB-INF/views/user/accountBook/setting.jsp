<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Calendar cal = Calendar.getInstance();
%>
<script>
$(function(){
	$("#cardRegistBtn").hide(); 
	$("#kind").hide();
	
	$('#files').on('change', handleImgFileSelect);
	$('#files2').on('change', handleImgFileSelect);


	// 엑셀
	$('#excel').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/accountBook/excelDown.do');
	}); 
	// 영수증 제출 버튼 클릭
	$('#receipt').click(function(){
		
		   var form = $("#files")[0];
	        var formData = new FormData(form);
	        formData.append("message", "ajax로 파일 전송하기");
	        formData.append("file", $("#files")[0].files[0]);

	        jQuery.ajax({
	              url : "${pageContext.request.contextPath}/user/accountBook/ocr.do"
	            , type : "POST"
	            , processData : false
	            , contentType : false
	            , data : formData
	            ,beforeSend:function(){
	                $('.wrap-loading').removeClass('display-none');
	            },
	            complete:function(){
	                $('.wrap-loading').addClass('display-none');
	            }
	            , success:function(result) {
			       	console.log(result.dealInfo.deal_date);
			       	$('#receiptdate').val(result.dealInfo.deal_date);
			       	$('#receiptitem').val(result.dealInfo.deal_name);
			       	$('#receiptprice').val(result.dealInfo.deal_price);

	            }
	        });
	}); 

	
	$('#registBtn').click(function(){
		paymentOption = $('#paymentOption option:selected').val();
		paymentMethod = $('#paymentMethod option:selected').val();
		date = $('#date').val();
		item = $('#item').val();
		price = $('#price').val();
		division = $('#division').val();
		deal_fix_revenue = 0;
		deal_fix_expenditure = 0;
		
		if(paymentMethod=="카드"){
			deal_card_name = $('#kind').val();
		}
		if(paymentMethod=="현금"){
			deal_card_name = '현금';
		}
		
	     $.ajax({
	   	 	async    : false,
	        url     : '${pageContext.request.contextPath}/user/accountBook/registTrace.do',
	        type    : 'post',
	        dataType : 'json',
	        data : {'deal_option':paymentOption,'deal_kind':paymentMethod,'deal_card_name':deal_card_name,'deal_date':date,'deal_name':item,'deal_price':price, 'mem_no':${LOGIN_MEMBERINFO.mem_no}, 'deal_division':division, 'deal_fix_revenue':deal_fix_revenue, 'deal_fix_expenditure':deal_fix_expenditure},
	        success : function(Result) {
	        //  $('#accountTable').append('<tr><td>'+Result.list.length+'</td><td>'+Result.list[Result.list.length-1].deal_date+'</td><td>'+item+'</td><td>'+price+'</td><td>'+paymentMethod+'</td><td><button id="deleteBtn" type="button">삭제</button></td></tr>');
	        }
	
	   	});  // 등록 
		   	location.reload();
	});
	
	$('#staticregistBtn').click(function(){
		staticpaymentOption = $('#staticpaymentOption option:selected').val();
		staticpaymentMethod = $('#staticpaymentMethod option:selected').val();
		staticdate = <%=cal.get(Calendar.YEAR)%>+'-'+<%=cal.get(Calendar.MONTH)+1 %>+'-'+$('#staticdate').val();
		staticitem = $('#staticitem').val();
		staticprice = $('#staticprice').val();
		staticdivision = $('#staticdivision').val();
		
		if(staticpaymentMethod=="카드"){
			staticcard_name = $('#statickind').val();
		}
		if(staticpaymentMethod=="현금"){
			staticcard_name = '현금';
		}

		if(staticpaymentOption=="입금"){
			staticdeal_fix_revenue = 1;
			staticdeal_fix_expenditure = 0;
		}else{
			staticdeal_fix_revenue = 0;
			staticdeal_fix_expenditure = 1;
	    }
		
	     $.ajax({
	   	 	async    : false,
	        url     : '${pageContext.request.contextPath}/user/accountBook/staticregistTrace.do',
	        type    : 'post',
	        dataType : 'json',
	        data : {'deal_option':staticpaymentOption,'deal_kind':staticpaymentMethod,'deal_date':staticdate,'deal_name':staticitem,'deal_price':staticprice, 'mem_no':${LOGIN_MEMBERINFO.mem_no}, 'deal_division':staticdivision, 'deal_fix_revenue':staticdeal_fix_revenue, 'deal_fix_expenditure':staticdeal_fix_expenditure, 'deal_card_name':staticcard_name},
	        success : function(Result) {
	        	$('#staticTable').append('<tr><td>'+Result.list[Result.list.length-1].deal_name+'</td><td>'+Result.list[Result.list.length-1].deal_date+'</td><td>'+Result.list[Result.list.length-1].deal_price+'</td><td><button type="button" value="'+Result.list[Result.list.length-1].deal_no+'" onclick="deleteStaticDeal('+Result.list[Result.list.length-1].deal_no+')">삭제</button></td></tr>');
	        }
	
	   	});  // 고정 수입 지출 등록 
	});
	
	$('#receiptregistBtn').click(function(){
		receiptpaymentOption = $('#receiptpaymentOption option:selected').val();
		receiptpaymentMethod = $('#receiptpaymentMethod option:selected').val();
		receiptdateA = $('#receiptdate').val();
		receiptdateB = receiptdateA.split(".");
		receiptdate = receiptdateB[0]+'-'+receiptdateB[1]+'-'+receiptdateB[2];
		receiptitem = $('#receiptitem').val();
		receiptpriceA = $('#receiptprice').val();
		var receiptprice ;
		receiptprice = receiptpriceA.replace(/,/,""); //금액 , 지우기
		receiptdivision = $('#receiptdivision').val();
		
		if(receiptpaymentMethod=="카드"){
			receiptcard_name = $('#receiptkind').val();
		}
		if(receiptpaymentMethod=="현금"){
			receiptcard_name = '현금';
		}

			receiptdeal_fix_revenue = 0;
			receiptdeal_fix_expenditure = 0;
				
	     $.ajax({
	   	 	async    : false,
	        url     : '${pageContext.request.contextPath}/user/accountBook/receiptregistTrace.do',
	        type    : 'post',
	        dataType : 'json',
	        data : {'deal_option':receiptpaymentOption,'deal_kind':receiptpaymentMethod,'deal_date':receiptdate,'deal_name':receiptitem,'deal_price':receiptprice, 'mem_no':${LOGIN_MEMBERINFO.mem_no}, 'deal_division':receiptdivision, 'deal_fix_revenue':receiptdeal_fix_revenue, 'deal_fix_expenditure':receiptdeal_fix_expenditure, 'deal_card_name':receiptcard_name},
	        success : function(Result) {
	        }
	
	   	});  // 영수증 수입 지출 등록 
	     location.reload();
	});


	


	$('#staticTrace').click(function(){
		$('#staticTable').empty();
		 $.ajax({
		   	 	async    : false,
		        url     : '${pageContext.request.contextPath}/user/accountBook/staticList.do',
		        type    : 'post',
		        dataType : 'json',
		        data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
		        success : function(Result) {
		        	$('#staticTable').append('<thead>');
		        	$('#staticTable').append('<tr>');
		        			$('#staticTable').append('	<th>고정 지출 명</th>');
		        					$('#staticTable').append('<th>고정 거래 일</th>');
		        							$('#staticTable').append('<th>고정 거래 금액</th>');
		        									$('#staticTable').append('	<th>삭제</th>');
		        											$('#staticTable').append('</tr>');
		        													$('#staticTable').append('</thead>');
			        for(var i=0; i<Result.staticList.length; i++){
				        console.log(Result);
		        	$('#staticTable').append('<tr><td>'+Result.staticList[i].deal_name+'</td><td>'+Result.staticList[i].deal_date+'</td><td>'+Result.staticList[i].deal_price+'</td><td><button type="button" value="'+Result.staticList[i].deal_no+'" onclick="deleteStaticDeal('+Result.staticList[i].deal_no+')">삭제</button></td></tr>');

				    }
		        }
		
		   	});  
		$("#statickind").hide(); 
		 $("#staticModal").modal("show"); //모달창 띄우기

	}); //고정 거래 등록 버튼 클릭

	

	$('#registreceipt').click(function(){
		$("#receiptkind").hide(); 
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
		
		   	});  
		   	
		 $("#centermodal").modal("show"); //모달창 띄우기
	}); //카드 리스트 보기

	
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
		
		   	});  // 카드등록 
		
		   	
	}); //카드 등록 액션



	
});

function deletebtn(deal_no){
	
	$.ajax({
   	 	async    : false,
        url     : '${pageContext.request.contextPath}/user/accountBook/deletedeal.do',
        type    : 'post',
        dataType : 'json',
        data : {'deal_no':deal_no, 'mem_no':${LOGIN_MEMBERINFO.mem_no}},
        success : function(Result) {
            
        }

   	});  // 삭제

   	location.reload();
   	
   		
}

function deleteStaticDeal(deal_no){
	$.ajax({
   	 	async    : false,
        url     : '${pageContext.request.contextPath}/user/accountBook/deletedeal.do',
        type    : 'post',
        dataType : 'json',
        data : {'deal_no':deal_no, 'mem_no':${LOGIN_MEMBERINFO.mem_no}},
        success : function(Result) {
	        $('#staticTable').empty();
	    	$('#staticTable').append('<thead>');
        	$('#staticTable').append('<tr>');
        			$('#staticTable').append('	<th>고정 지출 명</th>');
        					$('#staticTable').append('<th>고정 거래 일</th>');
        							$('#staticTable').append('<th>고정 거래 금액</th>');
        									$('#staticTable').append('	<th>삭제</th>');
        											$('#staticTable').append('</tr>');
        													$('#staticTable').append('</thead>');
	        for(var i=0; i<Result.staticList.length; i++){
	        	$('#staticTable').append('<tr><td>'+Result.staticList[i].deal_name+'</td><td>'+Result.staticList[i].deal_date+'</td><td>'+Result.staticList[i].deal_price+'</td><td><button type="button" value="'+Result.staticList[i].deal_no+'" onclick="deleteStaticDeal('+Result.staticList[i].deal_no+')">삭제</button></td></tr>');

		    }
            
        }

   	});  // 삭제

	
}
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

	var kind_a = [];
	
	$.ajax({
   	 	async    : false,
        url     : '${pageContext.request.contextPath}/user/accountBook/cardList.do',
        type    : 'post',
        dataType : 'json',
        data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
        success : function(Result) {
	        for(var i=0; i<Result.cardlist.length; i++){
				kind_a[i] = Result.cardlist[i].card_kind;
		    }
        }

   	});  // 등록 
	
   	
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


function staticcategoryChange(e){
	var statickind_a = [];
	
	$.ajax({
   	 	async    : false,
        url     : '${pageContext.request.contextPath}/user/accountBook/cardList.do',
        type    : 'post',
        dataType : 'json',
        data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
        success : function(Result) {
	        for(var i=0; i<Result.cardlist.length; i++){
	        	statickind_a[i] = Result.cardlist[i].card_kind;
		    }
        }

   	});  // 등록 
	
   	
    var target = document.getElementById("statickind");
    
	if(e.value=="카드"){
    var d = statickind_a;
	$("#statickind").show(); 
	$("#staticcardRegistBtn").show(); 
	}else if(e.value=="현금"){
	$("#statickind").hide(); 
	$("#staticcardRegistBtn").hide(); 
	}
	target.options.length = 0;

	for(x in d){
		var opt = document.createElement("option");
		opt.value=d[x];
		opt.innerHTML=d[x];
		target.appendChild(opt);
	}
		
	
}


function receiptcategoryChange(e){
	var receiptkind_a = [];
	
	$.ajax({
   	 	async    : false,
        url     : '${pageContext.request.contextPath}/user/accountBook/cardList.do',
        type    : 'post',
        dataType : 'json',
        data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
        success : function(Result) {
	        for(var i=0; i<Result.cardlist.length; i++){
	        	receiptkind_a[i] = Result.cardlist[i].card_kind;
		    }
        }

   	});  // 등록 
	
   	
    var target = document.getElementById("receiptkind");
    
	if(e.value=="카드"){
    var d = receiptkind_a;
	$("#receiptkind").show(); 
	$("#receiptcardRegistBtn").show(); 
	}else if(e.value=="현금"){
	$("#receiptkind").hide(); 
	$("#receiptcardRegistBtn").hide(); 
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
                                                	&nbsp; <button type="button" id="staticTrace">고정 거래 등록</button>
                                                	
                                                <br>
                                                <br>
                                                <hr color="lightgray">
                                                <br>
                                                <br>

											<div align="left">
	                                            <button type="button" class="btn btn-light mb-2 mr-1" id="excel">Excel</button>
											</div>
                                                <table id="accountTable" class="table table-sm table-centered mb-0" style="margin: auto; text-align: center;" >
													<thead>
														<tr>
															<th></th>
															<th>날짜</th>
															<th>구분</th>
															<th>물품</th>
															<th>금액</th>
															<th>거래종류</th>
															<th>거래방법</th>
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
									 							<td>${dealVO.deal_option}</td>
									 							<td>${dealVO.deal_kind }
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
										<div class="" style="width:100%; float: left ; padding: 40px;">
										 	날짜 : <input type="text" id="receiptdate" size=10 maxlength=8><br><br>
										 	물품 : <input type="text" id="receiptitem" size=10 maxlength=8><br><br>
										 	금액 : <input type="text" id="receiptprice" size=10 maxlength=8><br><br>
										 	
                                                	구분 : <select name="receiptdivision" id="receiptdivision" style="width:60px;">
                                                			<option value="    "></option>
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
                                                		</select><br><br>
                                                	거래종류 : <select name="receiptpaymentOption" id="receiptpaymentOption" style="width:60px;">
															    <option value="  "></option>
															    <option value="출금">출금</option>
															    <option value="입금">입금</option>
															</select><br><br>
													결제방법 : <select name="receiptpaymentMethod" id="receiptpaymentMethod" onchange="receiptcategoryChange(this)" style="width:60px;">
															    <option value="  "></option>
															    <option value="현금">현금</option>
															    <option value="카드">카드</option>
															</select><br><br>
															
															<select id="receiptkind" style="width:100px;">
																<option value="       "></option>
															</select>
                                                	<br><br>
                                                	<br><button type="button" id="receiptregistBtn">등록</button>
										</div>
											<div class="h-100" style="width:500px; height: 1500px;">
												<form class="contact-form" id="files" name="file" method="post" enctype="multipart/form-data">			
													<!-- Start main form -->
														<div class="" style="width:50%; float: right;">
															<div></div>
															<div class="col-md-12 text-center">
															<label for="exampleFormControlFile1">영수증 파일을 넣어주세요.</label>
															<input type="file" name="files" class="btn btn-outline-primary btn-block" style="margin-top: 10px;" id="files" >
															</div>
															<div style="width: 230px; height: 400px;" >
															<img id="img" style="width: 100%; height: 100%;">
															</div>
														</div>
														<button class="btn btn-outline-grad btn-block" type="button" id="receipt">제출</button>	
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
							<!-- /.영수증 등록 modal --> 
	
	
	
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
                                                    	<button type="button" id="cardBtn"> 등록 </button><br><br>
                                                    	
                                                  <div style="overflow: auto; overflow-x:hidden; height:300px;">
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
                                                    	
                                                    </div>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div><!-- /.카드 등록 modal -->
	
	
	
						 <!-- Center modal content -->
                                        <div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="myCenterModalLabel">고정 거래 등록</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    </div>
                                                    <div class="modal-body">
                                                    	 <div>
                                                    	 
                                                    	 
                                                	결제일  <input type="text" id="staticdate" size=8 maxlength=8> &nbsp;&nbsp;
                                                	물품 <input type="text" id="staticitem"size=8 maxlength=8> &nbsp;&nbsp;
													금액 <input type="text" id="staticprice" size=10 maxlength=8>
                                                	<br><br>
                                                	구분 <select name="staticdivision" id="staticdivision" style="width:50px;">
                                                			<option value="    "></option>
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
                                                	거래종류  <select name="staticpaymentOption" id="staticpaymentOption" style="width:50px;">
															    <option value="  "></option>
															    <option value="출금">출금</option>
															    <option value="입금">입금</option>
															</select>
													결제방법  <select name="staticpaymentMethod" id="staticpaymentMethod" onchange="staticcategoryChange(this)" style="width:50px;">
															    <option value="  "></option>
															    <option value="현금">현금</option>
															    <option value="카드">카드</option>
															</select>
															
															<select id="statickind" style="width:100px;">
																<option value="       "></option>
															</select>
                                                	<br>
                                                	<br><button type="button" id="staticregistBtn">등록</button>
                                                	</div>
                                                	<br>
                                                	
                                                	
                                                	<div style="overflow: auto; overflow-x:hidden; height:300px;">
                                                    	<table id="staticTable" class="table table-sm table-centered mb-0" style="margin: auto; text-align: center;" >
													
													<tbody>
														
													</tbody>	
												</table>
												</div>
                                                	
                                                    	
                                                    </div>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div><!-- /.고정 거래 등록 modal -->
                                         
	
	

</div>

