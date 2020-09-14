<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/validation.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
	$('table tr:gt(0)').on('click',function(){
		var car_no = $(this).find('td:eq(0)').text();
		$(location).attr('href','${pageContext.request.contextPath}/user/car/carView.do?car_no='+car_no);
	});
});

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
   <div class="col-sm-12 mb-5">
			<div class="table-responsive-sm">
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
					<c:forEach items="${carInfo }" var="car">
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
		<button id="btn3" type="button">등록 </button>
