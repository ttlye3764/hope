<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/validation.js'></script>
<script type="text/javascript">
	$(function() {
		$('#lt_btn').click(function(){
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/car/carView.do',
				dataType : 'JSON',
				data : {
					car_no : $('#hid').val()
				},
				success : function(result) {
					$('#updateCar').modal("show");
					$('#ud_car_kinds').val(result.carInfo.car_kinds);
					$('#ud_car_no').val(result.carInfo.car_no);
					$('#ud_car_no_hd').val(result.carInfo.car_no);
					$('#ud_car_date').val(result.carInfo.car_date);
					$('#ud_car_oil').val(result.carInfo.car_oil);
				},
				error : function(result) {
					$('#updateCar').modal("show");
					$('#ud_car_kinds').val(result.carInfo.car_kinds);
					$('#ud_car_no').val(result.carInfo.car_no);
					$('#ud_car_no_hd').val(result.carInfo.car_no);
					$('#ud_car_date').val(result.carInfo.car_date);
					$('#ud_car_oil').val(result.carInfo.car_oil);
				}
			});
		});
			
		$('table tr:gt(0)').on('click', function() {
			var no = $(this).find('td:eq(0)').text();
			$('#hid').val(no);
			$('#collapse-1').collapse('show');

			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/car/carView.do',
				dataType : 'JSON',
				data : {
					car_no : $('#hid').val()
				},
				success : function(result) {
					$('#lt_car_kinds').val(result.carInfo.car_kinds);
					$('#lt_car_no').val(result.carInfo.car_no);
					$('#lt_car_no_hd').val(result.carInfo.car_no);
					$('#lt_car_date').val(result.carInfo.car_date);
					$('#lt_car_oil').val(result.carInfo.car_oil);
					console.log(result);
				},
				error : function(result) {
					$('#lt_car_kinds').val(result.carInfo.car_kinds);
					$('#lt_car_no').val(result.carInfo.car_no);
					$('#lt_car_no_hd').val(result.carInfo.car_no);
					$('#lt_car_date').val(result.carInfo.car_date);
					$('#lt_car_oil').val(result.carInfo.car_oil);
				}
			});
		});
		$('#btn3').click(function() {
			$(location).attr('href','${pageContext.request.contextPath}/user/car/carForm.do');
		});
		$('#del').click(function() {
			var car_no = $('#ud_car_no_hd').val();
			$(location).attr('href','${pageContext.request.contextPath}/user/car/deleteMycar.do?car_no='+ car_no);
		});
	});
	function insertCar() {
		$("#insertCar").modal("show"); //모달창 띄우기
	}
</script>
<div class="innerpage-banner center bg-overlay-dark-7 py-7"
	style="background: url(assets/images/bg/04.jpg) no-repeat; background-size: cover; background-position: center center;">
	<div class="container">
		<div class="row all-text-white">
			<div class="col-md-12 align-self-center">
				<h1 class="innerpage-title">내 차 관리</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a
							href="${pageContext.request.contextPath}/user/main/mainForm.do"><i
								class="ti-home"></i> Home</a></li>
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

<!-- 내 차 등록 Modal -->
<div class="modal fade text-left" id="insertCar" tabindex="-1"
	role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="carForm" method="post"
				action="${pageContext.request.contextPath}/user/car/insertMycar.do">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">내 차 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="hid">
					<div class="input-group mb-3" style="width: 400px" align="center">
						차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="text" class="form-control" id="car_kinds" name="car_kinds" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						차량번호&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="car_no" name="car_no" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						출고년도&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="car_date" name="car_date" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						유종구분&nbsp;&nbsp;&nbsp;<select id="search_keycode" name="car_oil"
							class="custom-select select-big">
							<option value="휘발유" selected="selected">휘발유</option>
							<option value="경유">경유</option>
							<option value="LPG">LPG</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" value="등록">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div align="center">
	<div class="col-sm-12 mb-5" style="width: 50%">
		<div class="table-responsive-sm">
			<h3>내 차 리스트</h3>
			<div align="right">
				<button type="button" onClick="insertCar()" class="btn">등록</button>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">차량번호</th>
						<th scope="col">차 종</th>
						<th scope="col">출고년도</th>
						<th scope="col">유종구분</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${carList }" var="car">
						<tr>
							<td>${car.car_no }</td>
							<td>${car.car_kinds }</td>
							<td>${car.car_date }</td>
							<td>${car.car_oil }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div align="center">
	<div class="col-sm-12 mb-5" style="width: 50%">
		<div class="row" align="center">
			<!-- Job positions -->
			<div class="col-md-8" style="margin-left:140px">
<!-- 				<h3 class="mb-3">내 차 세부정보</h3> -->
				<div class="accordion accordion-line toggle-icon-left toggle-icon-round"
					id="accordion1">
					<!-- item -->
					<div class="accordion-item">
						<div class="accordion-title">
							<a class="collapsed" data-toggle="collapse" href="#collapse-1">세부 정보</a>
						</div>
								<div class="collapse" id="collapse-1"	data-parent="#accordion1">
									<div class="accordion-content">
									<div class="input-group mb-3" style="width: 400px" align="center">
										차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" class="form-control" id="lt_car_kinds" disabled="disabled"/>
								</div>
								<div class="input-group mb-3" style="width: 400px" align="center">
									차량번호&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
										id="lt_car_no" disabled="disabled" />
								</div>
								<div class="input-group mb-3" style="width: 400px" align="center">
									출고년도&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
										id="lt_car_date" disabled="disabled"/>
								</div>
								<div class="input-group mb-3" style="width: 400px" align="center">
									유종구분&nbsp;&nbsp;&nbsp;<select id="lt_car_oil"
										class="custom-select select-big" disabled="disabled">
										<option value="휘발유" selected="selected">휘발유</option>
										<option value="경유">경유</option>
										<option value="LPG">LPG</option>
									</select>
								</div>
								<div class="input-group mb-3" style="width:400px; align:center;">
									<button type="button" id="lt_btn" style="margin:0px 0px 0px 170px">수정</button>
								</div>
							</div>
						</div>
					</div>
					
					<!-- item -->
					<div class="accordion-item">
						<div class="accordion-title">
							<a class="collapsed" data-toggle="collapse" href="#collapse-2">주행거리 기록</a>
						</div>
						<div class="collapse" id="collapse-2"	data-parent="#accordion1">
							<div class="accordion-content">
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">차량번호</th>
											<th scope="col">차 종</th>
											<th scope="col">출고년도</th>
											<th scope="col">유종구분</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${carList }" var="car">
											<tr>
												<td>${car.car_no }</td>
												<td>${car.car_kinds }</td>
												<td>${car.car_date }</td>
												<td>${car.car_oil }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- item -->
					<div class="accordion-item">
						<div class="accordion-title">
							<a class="collapsed" data-toggle="collapse" href="#collapse-3">엔진오일 교환 기록</a>
						</div>
						<div class="collapse" id="collapse-3" data-parent="#accordion1">
							<div class="accordion-content">
								<p class="pt-2">
									에어로빅 : 42, 52, 59<br> 계단 오르내리기 : 48, 58, 68<br> 팔 굽혀
									펴기 : 32, 42, 49<br> 자전거타기 : 37, 44, 52<br> 테니스 : 60,
									72, 84<br> 배드민턴 : 59, 70, 82<br> 배구 : 59, 70, 82<br>
								</p>
								<h6 class="mb-2">운동 소요 시간 : 10분</h6>
							</div>
						</div>
					</div>

					<!-- item -->
					<div class="accordion-item">
						<div class="accordion-title">
							<a class="collapsed" data-toggle="collapse" href="#collapse-4">브레이크오일 교환 기록</a>
						</div>
						<div class="collapse" id="collapse-4" data-parent="#accordion1">
							<div class="accordion-content">
								<p class="pt-2">
									수영(자유형) : 145, 174, 204<br> 수영(접형) : 184, 220, 258<br>
									농구 : 67, 80, 93<br> 윗몸 일으키기 : 72, 86, 101<br> 줄넘기 :
									75, 89, 104<br>
								</p>
								<h6 class="mb-2">운동 소요 시간 : 10분</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 내 차 수정 Modal -->
<div class="modal fade text-left" id="updateCar" tabindex="-1"
	role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="carForm" method="post"
				action="${pageContext.request.contextPath}/user/car/updateMycar.do">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">내 차 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3" style="width: 400px" align="center">
						차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="text" class="form-control" id="ud_car_kinds"
							name="car_kinds" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						<input type="hidden" name="car_no" id="ud_car_no_hd">
						차량번호&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="ud_car_no" disabled="disabled" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						출고년도&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="ud_car_date" name="car_date" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						유종구분&nbsp;&nbsp;&nbsp;<select id="ud_car_oil" name="car_oil"
							class="custom-select select-big">
							<option value="휘발유" selected="selected">휘발유</option>
							<option value="경유">경유</option>
							<option value="LPG">LPG</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-secondary" value="수정">
					<button type="button" class="btn btn-secondary" id="del">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
