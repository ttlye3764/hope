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
			alert("�������� ����� �����ϼž� �մϴ�.");
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
<title>ȸ��Ż�� ��û</title>
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
							<h3>�ں� ȸ��Ż�� ��û</h3>
						</span>
					</p> <br> <textarea rows="20" cols="150" style="width:900px; height:350px">��. �����ϴ� ���������� �׸�ù°, ȸ��� ȸ������, ��Ȱ�� �����, ���� ������ ������ ���� ���� ȸ������ ��� �Ʒ��� ���� �ּ����� ���������� �ʼ��׸����� �����ϰ� �ֽ��ϴ�.
1. ȸ��Ż�� ��, ���ǻ����� Ȯ���� �ֽñ� �ٶ��ϴ�.
ȸ��Ż�� �� ȸ������ �� ���� �̿��� �Ұ��մϴ�.
�ŷ������� �ִ� ���, ���ڻ�ŷ� ����� �Һ��� ��ȣ�� ���� ������ ���� ��� �Ǵ� û��öȸ�� ���� ���, ��ݰ��� �� ��ȭ ���� ���޿� ���� ����� 5�⵿�� �����˴ϴ�.
��ȿ�Ⱓ�� ������� ���� �̻�� �������� ������ ��ȿ�Ⱓ �����ϱ��� �����Ǹ�, Ż�� �Ŀ��� ��ȿ�Ⱓ �� ����Ͻ� �� �ֽ��ϴ�.
��ȿ�Ⱓ �� ������� ���� �̻�� ������ ���űݾ��� 70%�� ĳ�÷� ������ �帮��, Ż��� ���� ���� �� �����ϴ�.
�����ϼ̴� ĳ�ô� Ż��� �Բ� �����Ǹ� ȯ�ҵ��� �ʽ��ϴ�.
ȸ��Ż�� �� ���񽺿� �Է��Ͻ� �Խñ� �� ����� �������� ������, ȸ������ ������ ���� �ۼ��� ������ Ȯ���� �� ���� ���� �� ����ó���� ��õ������ �Ұ��� �մϴ�.
�Խñ� �� ��� ������ ���Ͻô� ��쿡�� ���� �ش� �Խù��� �����Ͻ� �� Ż�� ��û�Ͻñ� �ٶ��ϴ�.
   </textarea> <br> 
   <input type="checkbox" name="req"> ȸ��Ż�� �� ó������ �ȳ��� Ȯ���Ͽ����� �����մϴ�.
				</td>
			</tr>
			<tr>
				<td align="center" valign="top"><input type="button" value="����"
					onclick="chk()" /></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
