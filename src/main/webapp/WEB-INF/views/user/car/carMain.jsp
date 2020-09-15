<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/validation.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#lt_btn').click(function(){
			var kind = $('#lt_car_kinds_hd').val();

			if(kind == ''){
				swal("","수정할 자동차를 선택해주세요.", "warning");
				return false;
			}
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
			$('#km_car_no').val(no);
			$('#km_car_no2').val(no);
			$('#eg_car_no').val(no);
			$('#eg_car_no2').val(no);
			$('#bk_car_no').val(no);
			$('#bk_car_no2').val(no);
			$('#collapse-1').collapse('show');
			$('#kmtb').empty();
			$('#enginetb').empty();
			$('#breaktb').empty();

			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/car/carView.do',
				dataType : 'JSON',
				data : {
					car_no : $('#hid').val()
				},
				success : function(result) {
					$('#lt_car_kinds').val(result.carInfo.car_kinds);
					$('#lt_car_kinds_hd').val(result.carInfo.car_kinds);
					$('#lt_car_no').val(result.carInfo.car_no);
					$('#lt_car_no_hd').val(result.carInfo.car_no);
					$('#lt_car_date').val(result.carInfo.car_date);
					$('#lt_car_oil').val(result.carInfo.car_oil);

					$('#kmtb').append('<thead><tr><th>차량번호</th><th>총 키로수</th><th>입력날짜</th></tr></thead>');
		            $('#kmtb').append('<tbody>');
		            if(result.kmList.length == 0){
						$('#kmtb').append('<tr><td>등록된 키로수가 없습니다.</td></tr>');
			        }
					for(var i = 0 ; i < result.kmList.length ; i++){
						$('#kmtb').append('<tr><td>'+result.kmList[i].car_no+'</td><td>'+result.kmList[i].md_km+'km</td><td>'+result.kmList[i].md_date+'</td></tr>');
					}
		            $('#kmtb').append('</tbody>')
// 			엔진오일
		            $('#enginetb').append('<thead><tr><th>차량번호</th><th>총 키로수</th><th>교환날짜</th></tr></thead>');
		            $('#enginetb').append('<tbody>');
		            if(result.engineList.length == 0){
						$('#enginetb').append('<tr><td>등록된 교환 기록이 없습니다.</td></tr>');
			        }
		            for(var i = 0 ; i < result.engineList.length ; i++){
		            	$('#enginetb').append('<tr><td>'+result.engineList[i].car_no+'</td><td>'+result.engineList[i].md_km+'km</td><td>'+result.engineList[i].md_engine+'</td></tr>');
		            }
		            $('#enginetb').append('</tbody>')

// 		            브레이크
		            $('#breaktb').append('<thead><tr><th>차량번호</th><th>총 키로수</th><th>교환날짜</th></tr></thead>');
		            $('#breaktb').append('<tbody>');
		            if(result.engineList.length == 0){
						$('#breaktb').append('<tr><td>등록된 교환 기록이 없습니다.</td></tr>');
			        }
		            for(var i = 0 ; i < result.breakList.length ; i++){
		            	$('#breaktb').append('<tr><td>'+result.breakList[i].car_no+'</td><td>'+result.breakList[i].md_km+'km</td><td>'+result.breakList[i].md_brake+'</td></tr>');
		            }
		            $('#breaktb').append('</tbody>')
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
	function insertKm(){
		var kind = $('#lt_car_kinds_hd').val();

		if(kind == ''){
			swal("","등록할 자동차를 선택해주세요.", "warning");
			return false;
		}
		$("#insertKm").modal("show");
	}
	function insertEngine(){
		var kind = $('#lt_car_kinds_hd').val();

		if(kind == ''){
			swal("","등록할 자동차를 선택해주세요.", "warning");
			return false;
		}
		$("#insertEngine").modal("show");
	}
	function insertBreak(){
		var kind = $('#lt_car_kinds_hd').val();

		if(kind == ''){
			swal("","등록할 자동차를 선택해주세요.", "warning");
			return false;
		}
		$("#insertBreak").modal("show");
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

<!-- 키로수 Modal -->
<div class="modal fade text-left" id="insertKm" tabindex="-1"
	role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="carForm" method="post"
				action="${pageContext.request.contextPath}/user/car/insertMycarkm.do">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">내 차 키로수 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="hid">
					<div class="input-group mb-3" style="width: 400px" align="center">
						<input type="hidden" name="car_no" id="km_car_no">
						차량번호&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="km_car_no2" disabled="disabled"/>
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						등록날짜&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="date" class="form-control" id="md_date" name="md_date" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						총 키로수&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="md_km" name="md_km" />
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

<!-- 엔진오일 Modal -->
<div class="modal fade text-left" id="insertEngine" tabindex="-1"
	role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="carForm" method="post"
				action="${pageContext.request.contextPath}/user/car/insertMycarEg.do">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">엔진오일 교환 일자 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="hid">
					<div class="input-group mb-3" style="width: 400px" align="center">
						<input type="hidden" name="car_no" id="eg_car_no">
						차량번호&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="eg_car_no2" disabled="disabled"/>
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						교환날짜&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="date" class="form-control" id="md_date" name="md_engine" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						총 키로수&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="md_km" name="md_km" />
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

<!-- 브레이크오일 Modal -->
<div class="modal fade text-left" id="insertBreak" tabindex="-1"
	role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="carForm" method="post"
				action="${pageContext.request.contextPath}/user/car/insertMycarBk.do">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">브레이크오일 교환 일자 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="hid">
					<div class="input-group mb-3" style="width: 400px" align="center">
						<input type="hidden" name="car_no" id="bk_car_no">
						차량번호&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="bk_car_no2" disabled="disabled"/>
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						교환날짜&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="date" class="form-control" id="md_date" name="md_brake" />
					</div>
					<div class="input-group mb-3" style="width: 400px" align="center">
						총 키로수&nbsp;&nbsp;&nbsp;<input type="text" class="form-control"
							id="md_km" name="md_km" />
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
									<input type="hidden" id="lt_car_kinds_hd">
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
								<div align="right">
									<button type="button" onClick="insertKm()" class="btn">주행거리 등록</button>
								</div>
								<table id="kmtb" class="table table-hover">
									
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
								<div align="right">
									<button type="button" onClick="insertEngine()" class="btn">엔진오일 교환 등록</button>
								</div>
								<table id="enginetb" class="table table-hover">
									
								</table>
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
								<div align="right">
									<button type="button" onClick="insertBreak()" class="btn">브레이크 오일 교환 등록</button>
								</div>
								<table id="breaktb" class="table table-hover">
									
								</table>
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
