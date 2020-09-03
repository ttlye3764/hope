<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Asset management system</h1>
					<h6 class="subtitle"> Manage your money smartly! </h6>
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

                                        <h4 class="header-title mb-3">거래 내역</h4>

                                        <ul class="nav nav-tabs nav-bordered mb-3">
                                            
                                            <li class="nav-item">
                                                <a href="#profile-b1" data-toggle="tab" aria-expanded="true" class="nav-link active">
                                                    <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                                    <span class="d-none d-lg-block">거래 내역</span>
                                                </a>
                                            </li>
                                            
                                           
                                        </ul>

                                        <div class="tab-content">
                                            <div class="tab-pane" id="home-b1">
                                                	
                                            </div>
                                            <div class="tab-pane show active" id="profile-b1">
                                               <div>
                                                	
                                                	
                                           

                                                <table id="accountTable" class="table table-sm table-centered mb-0" style="margin: auto; text-align: center;" >
													<thead>
														<tr>
															<th></th>
															<th>날짜</th>
															<th>아이템</th>
															<th>금액</th>
															<th>입/출</th>
															<th>잔액</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="dealVO" items="${dealList }" varStatus="status">
															<tr>
																<th>${status.count }</th>
									 							<td>${dealVO.deal_date }</td>
									 							<td>${dealVO.deal_name}</td>
									 							<td>${dealVO.deal_price}</td>
									 							<td>${dealVO.deal_option}</td>
									 							<td>잔액</td>
									 							<%-- <c:if test="${dealVO.deal_method eq '출금'}">
																    <td>-</td>
																</c:if>
									 							<c:if test="${dealVO.deal_method eq '입금'}">
																    <td>+</td>
																</c:if> --%>
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
                            
                            
                           
	
	

</div>

