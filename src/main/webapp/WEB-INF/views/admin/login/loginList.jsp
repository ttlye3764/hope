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
			
		});
		mem_division = '${LOGIN_MEMBERINFO.mem_division}';
// 		if(mem_division != 1){
// 			alert('잘못된 접근입니다.');
// 			$(location).attr('href','${pageContext.request.contextPath}/user/main/mainForm.do');
// 		}

		var keycode = '${param.search_keycode}';
		var keyword = '${param.search_keyword}';
		if(keycode == '' || keycode == null){
			keycode = 'TOTAL';
		}
		if(keyword == null){
			keyword = '';
		} 
		$('select[name=search_keycode]').val(keycode);
		$('input[name=search_keyword]').val(keyword);
	});
</script>
</head>
<body>
<div class="card" style="margin-left:280px; margin-right:30px; margin-top:50px;">
	<div class="card-body">
		<div class="sidebar" style="margin-bottom: 10px;">
				<div class="widget widget-newsletter border-0 p-0"
					style="display: flex; justify-content: space-between;">
					<div>
						<form action="${pageContext.request.contextPath}/admin/member/memberList.do" method="post">
							<div class="input-group mb-0">
								<div style="width: 110px; margin: 0px 5px 0px 0px; display: flex; justify-content: center; align-items: center;">
									<select id="search_keycode" name="search_keycode" class="custom-select select-big">
										<option value="TOTAL" selected="selected">전체</option>
										<option value="NAME">이름</option>
										<option value="ID">아이디</option>
										<option value="PHONE">전화번호</option>
									</select>
								</div>
								<div class="input-group-btn">
									<input id="search_keyword"
									class="form-control border-radius-right-0 border-right-0 mb-0"
									style="height: 45px; display: inline-block;" type="text" name="search_keyword"
									placeholder="Search" size="35px">
								</div>
								<span class="input-group-btn">
									<input type="submit" id="searchBTN" 
										class="btn btn-primary" value="검색"/>
								</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		<div class="col-sm-12 mb-5">
			<div class="table-responsive-sm">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" >접속ip</th>
							<th scope="col" >아이디</th>
							<th scope="col" >접속시간</th>
							<th scope="col" >접속여부</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${loginList }" var="login">
						<tr>
							<th scope="row">${login.lg_ip }</th>
							<td>${login.mem_id }</td>
							<td>${login.lg_time }</td>
							<td>${login.lg_status }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>