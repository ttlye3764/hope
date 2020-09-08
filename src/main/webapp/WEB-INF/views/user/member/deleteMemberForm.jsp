<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 우리가 쓸려고하는 jstl 태그설정 (c:뭐시기)이거 쓸려고-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- c:url을 이용하여 처리 -->
<c:url var="regustMemberURI" value="/user/member/memberForm.do"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Wizixo | Creative Multipurpose Bootstrap Template</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Creative Multipurpose Bootstrap Template">

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CPlayfair+Display:400,400i,700,700i%7CRoboto:400,400i,500,700"
	rel="stylesheet">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/vendor/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="assets/vendor/themify-icons/css/themify-icons.css" />
<link rel="stylesheet" type="text/css"
	href="assets/vendor/animate/animate.min.css" />

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="assets/css/style.css" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/validation.js'></script>
<script type='text/javascript'>
	$(function() {
		var id = '${LOGIN_MEMBERINFO.mem_id}';
		if (id == '') {
			swal("","로그인 후 이용해주세요.", "warning");
			$(location).attr('href',
					'${pageContext.request.contextPath}/user/main/mainForm.do');
		}
	});
	function chk() {
			$.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/user/member/deleteMember.do',
						dataType : 'json',
						data : {
							mem_id : '${LOGIN_MEMBERINFO.mem_id}'
						},
						success : function(result) {
							swal("",result.json, "warning");
							LogOut();
						}
					});
	}
	function LogOut() {
		$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/user/join/logout.do',
					dataType : 'JSON',
					data : {},
					success : function(result) {
						location.href = "${pageContext.request.contextPath}/user/main/mainForm.do";
					}
				});
	}
	function delete_modal() {
		var req = document.form.req.checked;
		var num = 0;
		if (req == true) {
			num = 1;
		}
		if (num == 1) {
			$("#delete_modal").modal("show"); //모달창 띄우기
		} else {
			swal("","개인정보 약관에 동의하셔야 합니다.", "warning");
		}
	}
</script>
</head>

<body>
	<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
      <div class="container">
         <div class="row all-text-white">
            <div class="col-md-12 align-self-center">
               <h1 class="innerpage-title">회원 탈퇴 신청</h1>
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
<div align="center" >
	<form action="${pageContext.request.contextPath}/user/member/memberForm.do" name="form" method="post">
		<table  style="width:900; height:650">
			<tr>
				<td  align="center">
					<br> <textarea rows="20" cols="150" style="width:900px; height:350px">가. 수집하는 개인정보의 항목첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
1. 회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.
회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.
거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.
유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.
유효기간 내 사용하지 못한 미사용 쿠폰은 구매금액의 70%를 캐시로 적립해 드리나, 탈퇴시 적립 받을 수 없습니다.
보유하셨던 캐시는 탈퇴와 함께 삭제되며 환불되지 않습니다.
회원탈퇴 후 서비스에 입력하신 게시글 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.
게시글 및 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.
   </textarea> <br> 
   <input type="checkbox" name="req"> 회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td align="center" valign="top"><button type="button" onclick="delete_modal()" >동의</button></td>
			</tr>
		</table>
	</form>
</div>

<!-- Modal -->
	<div class="modal fade text-left" id="delete_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">정말 탈퇴하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label id="PWresult"><b>탈퇴 후 회원정보가 모두 삭제됩니다.</b><br>
  메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, <br>삭제된 데이터는 복구되지 않습니다.</label>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="chk()">탈퇴</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</body>
</html>