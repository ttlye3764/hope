<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function chk() {
		var req = document.form.req.checked;
		var num = 0;
		if (req == true) {
			num = 1;
		}
		if (num == 1) {
			document.form.submit();
		} else {
			swal("","�������� ����� �����ϼž� �մϴ�.", "warning");
		}
	}
	function nochk() {
		swal("","�������� ������ �����Ͻ� �� �����ϴ�.", "warning");
		location.href = "${pageContext.request.contextPath}/user/main/mainForm.do";
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ �������</title>
<div align="center" style="width:100%">
	<form action="${pageContext.request.contextPath}/user/member/memberForm.do" name="form" method="post">
		<table width="900" height="650">
			<tr>
				<td width="100%" height="50%" align="center">
					<p align="left">
						<span style="padding-left: 160px">
							<h3>�ں� ȸ������ ��� ����</h3>
						</span>
					</p> <br> <textarea rows="20" cols="150">��. �����ϴ� ���������� �׸�ù°, ȸ��� ȸ������, ��Ȱ�� �����, ���� ������ ������ ���� ���� ȸ������ ��� �Ʒ��� ���� �ּ����� ���������� �ʼ��׸����� �����ϰ� �ֽ��ϴ�.
ȸ������
- �̸�, �������, ����, ���̵�, ��й�ȣ, ����, ����ó(�����ּ�, �޴��� ��ȣ �� ����), ������������
��14�� �̸� �Ƶ� ȸ������
- �̸�, �������, ����, �����븮�� ����, ���̵�, ��й�ȣ, ����ó (�����ּ�, �޴��� ��ȣ �� ����), ������������
��ü���̵� ȸ������
- ��ü���̵�, ȸ���, ��ǥ�ڸ�, ��ǥ ��ȭ��ȣ, ��ǥ �̸��� �ּ�, ��ü�ּ�, ������ ���̵�, ������ ����ó, ������ �μ�/����
- �����׸� : ��ǥ Ȩ������, ��ǥ �ѽ���ȣ
��°, ���� �̿�����̳� ���ó�� �������� �Ʒ��� ���� �������� �ڵ����� �����Ǿ� ������ �� �ֽ��ϴ�.
- IP Address, ��Ű, �湮 �Ͻ�, ���� �̿� ���, �ҷ� �̿� ���
��°, ���̹� ���̵� �̿��� �ΰ� ���� �� ����� ���� �̿� �Ǵ� �̺�Ʈ ���� �������� �ش� ������ �̿��ڿ� ���ؼ��� �������� �߰� ������ �߻��� �� ������, �̷��� ��� ������ ���Ǹ� �޽��ϴ�.
��°, ����������, ����/���� �� �Ϻ� ���� �̿�� ���� ���� �ؼ��� ���� ���������� �ʿ��� ���, �Ʒ��� ���� �������� ������ �� �ֽ��ϴ�.
- �̸�, �������, ����, �ߺ�����Ȯ������(DI), ��ȣȭ�� ������ �ĺ�����(CI), �޴��� ��ȣ(����), ������ ��ȣ(������ �̿��), ��/�ܱ��� ����
�ټ�°, ���� ���� �̿� �������� �Ʒ��� ���� ���� �������� ������ �� �ֽ��ϴ�.
- �ſ�ī�� ������ : ī����, ī���ȣ ��
- �޴���ȭ ������ : �̵���ȭ��ȣ, ��Ż�, �������ι�ȣ ��
- ������ü�� : �����, ���¹�ȣ ��
- ��ǰ�� �̿�� : ��ǰ�� ��ȣ
��. �������� �������ȸ��� ������ ���� ������� ���������� �����մϴ�.
- Ȩ������, ������, �ѽ�, ��ȭ, ��� �Խ���, �̸���, �̺�Ʈ ����, ��ۿ�û
- ����ȸ��κ����� ����
- �������� ���� ���� ���� ����
   </textarea> <br> 
   <input type="checkbox" name="req"> �������� ���� �� �̿뿡 �����մϴ�.
				</td>
			</tr>
			<tr>
				<td align="center" valign="top"><button type="button"
					onclick="chk()">����</button>&nbsp;&nbsp;&nbsp; 
					<button type="button" onclick="nochk()" >�������� �ʽ��ϴ�.</button></td>
			</tr>
		</table>
	</form>
</div>
