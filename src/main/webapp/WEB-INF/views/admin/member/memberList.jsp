<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('table tr:gt(0)').on('click',function(){
			var mem_id = $(this).find('td:eq(1)').text();
			$(location).attr('href','${pageContext.request.contextPath}/admin/member/memberView.do?mem_id='+mem_id);
		});
		mem_division = '${LOGIN_MEMBERINFO.mem_division}';
// 		if(mem_division != 1){
// 			alert('잘못된 접근입니다.');
// 			$(location).attr('href','${pageContext.request.contextPath}/user/main/mainForm.do');
// 		}
	});
</script>
</head>
<body>
<div class="col-sm-12 mb-5">
<h3 class="text-center mb-4">회원관리</h3>
	<div class="table-responsive-sm">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col" >회원번호</th>
					<th scope="col" >이  름</th>
					<th scope="col" >아이디</th>
					<th scope="col" >전화번호</th>
					<th scope="col" >이메일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${memberList }" var="member">
				<tr>
					<th scope="row">${member.mem_no }</th>
					<td>${member.mem_name }</td>
					<td>${member.mem_id }</td>
					<td>${member.mem_hp }</td>
					<td>${member.mem_email }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>