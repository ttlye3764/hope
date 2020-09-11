<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 우리가 쓸려고하는 jstl 태그설정 (c:뭐시기)이거 쓸려고-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- c:url을 이용하여 처리 -->
<c:url var="regustMemberURI" value="/user/member/memberForm.do"></c:url>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/validation.js'></script>
<script type='text/javascript'>
	var big_mem_id;
	function insertPet(){
		$("#insertPet").modal("show");
	}

</script>
<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
      <div class="container">
         <div class="row all-text-white">
            <div class="col-md-12 align-self-center">
               <h1 class="innerpage-title">나의 펫 관리</h1>
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item active"><a href="javascript:insertPet()"><i class="ti-settings"></i> 펫 등록</a></li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </div>
      <br>
      <br>
      <br>

	<div class="preloader">
		<img src="assets/images/preloader.svg" alt="Pre-loader">
	</div>

	<!--Global JS-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!--Template Functions-->
	<script src="assets/js/functions.js"></script>
	
	<!-- Modal -->
	<div class="modal fade text-left" id="insertPet" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">나의 펫 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3" style="width:400px" align="center">
						이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" placeholder="홍길동" id="mem_name" name="mem_name" >
					</div>
					<div class="input-group mb-3" style="width:400px" align="center">
						생년월일&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="mem_birth" name="mem_birth" placeholder="YYYY-MM-DD" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="searchID()">찾기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
