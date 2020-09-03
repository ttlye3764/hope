<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){

	$('#files').on('change', handleImgFileSelect);
	$('#files2').on('change', handleImgFileSelect);

	
	$('#registBtn').click(function(){
		paymentOption = $('#paymentOption option:selected').val();
		paymentMethod = $('#paymentMethod option:selected').val();
		date = $('#date').val();
		item = $('#item').val();
		price = $('#price').val();
		
	     $.ajax({
	   	 	async    : false,
	        url     : '${pageContext.request.contextPath}/user/accountBook/registTrace.do',
	        type    : 'post',
	        dataType : 'json',
	        data : {'deal_option':paymentOption,'deal_kind':paymentMethod,'deal_date':date,'deal_name':item,'deal_price':price, 'mem_no':${LOGIN_MEMBERINFO.mem_no}},
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

	
});

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

</script>
<div align="center" style="height: auto; margin: auto; ">

                            <div class="col-lg-6">

                                    <div class="card-body">

                                        <h4 class="header-title mb-3">자산관리</h4>

                                        <ul class="nav nav-tabs nav-bordered mb-3">
                                            
                                            <li class="nav-item">
                                                <a href="#profile-b1" data-toggle="tab" aria-expanded="true" class="nav-link active">
                                                    <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                                    <span class="d-none d-lg-block">거래 등록</span>
                                                </a>
                                            </li>
                                            
                                           
                                        </ul>

                                        <div class="tab-content">
                                            <div class="tab-pane" id="home-b1">
                                                	
                                            </div>
                                            <div class="tab-pane show active" id="profile-b1">
                                               <div>
                                                	날짜  <input type="text" id="date"> 아이템 <input type="text" id="item"> 
                                                	<br><br>
                                                	금액 <input type="text" id="price"> 
                                                	거래종류  <select name="paymentOption" id="paymentOption">
															    <option value="">거래종류</option>
															    <option value="minus">출금</option>
															    <option value="plus">입금</option>
															</select>
													결제방법  <select name="paymentMethod" id="paymentMethod">
															    <option value="">결제방법</option>
															    <option value=" cash">현금</option>
															    <option value="card">카드</option>
															</select>
                                                	
                                                	<button type="button" id="registBtn">등록</button>
                                                	<button type="button" id="registreceipt">영수증 등록</button>
                                                	
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
															<th>아이템</th>
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
	
	

</div>

