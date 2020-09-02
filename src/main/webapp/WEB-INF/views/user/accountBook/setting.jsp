<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
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
	        data : {'deal_option':paymentOption,'deal_kind':paymentMethod,'deal_date':date,'deal_name':item,'deal_price':price, 'mem_no':2},
	        success : function(Result) {
	          $('#accountTable').append('<tr><td>'+Result.list.length+'</td><td>'+Result.list[Result.list.length-1].deal_date+'</td><td>'+item+'</td><td>'+price+'</td><td>'+paymentMethod+'</td><td><button id="deleteBtn" type="button">삭제</button></td></tr>');
	        }
	
	   	});  //내가자주타는 버스 등록 
	});
});

</script>
<div align="center" style="height: auto; margin: auto; ">

                            <div class="col-lg-6">

                                    <div class="card-body">

                                        <h4 class="header-title mb-3">자산관리</h4>

                                        <ul class="nav nav-tabs nav-bordered mb-3">
                                            <li class="nav-item">
                                                <a href="#home-b1" data-toggle="tab" aria-expanded="false" class="nav-link">
                                                    <i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
                                                    <span class="d-none d-lg-block">거래 입력</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#profile-b1" data-toggle="tab" aria-expanded="true" class="nav-link active">
                                                    <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                                    <span class="d-none d-lg-block">거래 내역</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#settings-b1" data-toggle="tab" aria-expanded="false" class="nav-link">
                                                    <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                                    <span class="d-none d-lg-block">환경 설정</span>
                                                </a>
                                            </li>
                                        </ul>

                                        <div class="tab-content">
                                            <div class="tab-pane" id="home-b1">
                                                	<div>
                                                	날짜  <input type="text" id="date"> 아이템 <input type="text" id="item"> 금액 <input type="text" id="price"> 
                                                	거래종류  <select name="paymentOption" id="paymentOption">
															    <option value="">거래종류 선택</option>
															    <option value="minus">출금</option>
															    <option value="plus">입금</option>
															</select>
													결제방법  <select name="paymentMethod" id="paymentMethod">
															    <option value="">결제방법 선택</option>
															    <option value=" cash">현금</option>
															    <option value="card">카드</option>
															</select>
                                                	
                                                	<button type="button" id="registBtn">등록</button>
                                                
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
                                                
                                                	
                                             </div>
                                            </div>
                                            <div class="tab-pane show active" id="profile-b1">
                                                <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
                                                <p class="mb-0">Leggings occaecat dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
                                            </div>
                                            <div class="tab-pane" id="settings-b1">
                                                <p>Food truck quinoa dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
                                                <p class="mb-0">Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
                                            </div>
                                        </div>

                                    </div> <!-- end card-body-->

                            </div> <!-- end col -->

</div>

