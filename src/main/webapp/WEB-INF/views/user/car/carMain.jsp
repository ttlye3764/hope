<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type='text/javascript' src='<%=request.getContextPath()%>/js/validation.js'></script>
<script type="text/javascript">
$(function(){
	$('table tr:gt(0)').on('click',function(){
		var no = $(this).find('td:eq(0)').text();
		$('#hid').val(no);
		
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
	         error : function(result){
	        	 $('#updateCar').modal("show");
	        	 $('#ud_car_kinds').val(result.carInfo.car_kinds);
	        	 $('#ud_car_no').val(result.carInfo.car_no);
	        	 $('#ud_car_no_hd').val(result.carInfo.car_no);
	        	 $('#ud_car_date').val(result.carInfo.car_date);
	        	 $('#ud_car_oil').val(result.carInfo.car_oil);
		     }
	      });
	});
	$('#btn3').click(function(){
		$(location).attr('href','${pageContext.request.contextPath}/user/car/carForm.do');
	});
	$('#del').click(function(){
		var car_no = $('#ud_car_no_hd').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/car/deleteMycar.do?car_no='+car_no);
	});
});
function insertCar(){
	  $("#insertCar").modal("show"); //모달창 띄우기
}
</script>
<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
      <div class="container">
         <div class="row all-text-white">
            <div class="col-md-12 align-self-center">
               <h1 class="innerpage-title">내 차 관리</h1>
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/user/main/mainForm.do"><i class="ti-home"></i> Home</a></li>
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
      
   <div align="center">
   <div class="col-sm-12 mb-5" style="width:50%">
			<div class="table-responsive-sm">
				<div align="right">
					<button type="button" onClick="insertCar()" class="btn">등록</button>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" >차량번호</th>
							<th scope="col" >차 종</th>
							<th scope="col" >출고년도</th>
							<th scope="col" >유종구분</th>
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
		
		<!-- 내 차 등록 Modal -->
	<div class="modal fade text-left" id="insertCar" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form name="carForm" method="post" action="${pageContext.request.contextPath}/user/car/insertMycar.do">
				     <div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">내 차 등록</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="hid">
						<div class="input-group mb-3" style="width:400px" align="center">
							차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="car_kinds" name="car_kinds"/>
						</div>
						<div class="input-group mb-3" style="width:400px" align="center">
							차량번호&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="car_no" name="car_no"/>
						</div>
						<div class="input-group mb-3" style="width:400px" align="center">
							출고년도&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="car_date" name="car_date"/>
						</div>
						<div class="input-group mb-3" style="width:400px" align="center">
							유종구분&nbsp;&nbsp;&nbsp;<select id="search_keycode" name="car_oil" class="custom-select select-big">
										<option value="휘발유" selected="selected">휘발유</option>
										<option value="경유">경유</option>
										<option value="LPG">LPG</option>
									</select>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" value="등록">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
			   </form>
			</div>
		</div>
	</div>
	
	<!-- 내 차 수정 Modal -->
	<div class="modal fade text-left" id="updateCar" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form name="carForm" method="post" action="${pageContext.request.contextPath}/user/car/updateMycar.do">
				     <div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">내 차 수정</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="input-group mb-3" style="width:400px" align="center">
							차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="ud_car_kinds" name="car_kinds"/>
						</div>
						<div class="input-group mb-3" style="width:400px" align="center">
							<input type="hidden" name="car_no" id="ud_car_no_hd">
							차량번호&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="ud_car_no" disabled="disabled"/>
						</div>
						<div class="input-group mb-3" style="width:400px" align="center">
							출고년도&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="ud_car_date" name="car_date"/>
						</div>
						<div class="input-group mb-3" style="width:400px" align="center">
							유종구분&nbsp;&nbsp;&nbsp;<select id="ud_car_oil" name="car_oil" class="custom-select select-big">
										<option value="휘발유" selected="selected">휘발유</option>
										<option value="경유">경유</option>
										<option value="LPG">LPG</option>
									</select>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-secondary" value="수정">
						<button type="button" class="btn btn-secondary" id="del">삭제</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
			   </form>
			</div>
		</div>
	</div>
