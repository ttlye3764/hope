<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01

 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function chk() {
		var req = document.form.req.checked;
		var num = 0;
		if (req == true) {
			num = 1;
		}
		if (num == 1) {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/member/deleteMember.do',
				dataType : 'json',
				data : {
					mem_id : '${LOGIN_MEMBERINFO.mem_id}'
				},
				success : function(result) {
					alert(result.json);
					LogOut();
				}
	       	});
		} else {
			alert("개인정보 약관에 동의하셔야 합니다.");
		}
	}
	function LogOut(){
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/join/logout.do',
			dataType : 'JSON',
			data : {
			},
			success : function(result) {
				location.href="${pageContext.request.contextPath}/user/main/mainForm.do";
			}
		});
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원탈퇴 신청</title>
</head>
<body>
<div align="center" >
	<form action="${pageContext.request.contextPath}/user/member/memberForm.do" name="form" method="post">
		<table  style="width:900; height:650">
			<tr>
				<td ><br>
					<hr></td>
			</tr>
			<tr>
				<td  align="center">
					<p align="left">
						<span style="padding-left: 160px">
							<h3>자비스 회원탈퇴 신청</h3>
						</span>
					</p> <br> <textarea rows="20" cols="150" style="width:900px; height:350px">가. 수집하는 개인정보의 항목첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
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
				<td align="center" valign="top"><input type="button" value="동의"
					onclick="chk()" /></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
