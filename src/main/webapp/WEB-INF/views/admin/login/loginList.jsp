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

		var start = '${param.start_time}';
		var end = '${param.end_time}';

		$('#start_time').val(start);
		$('#end_time').val(end);
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
						<form method="post" name="date1" action="${pageContext.request.contextPath}/admin/login/loginList.do">
							<div class="input-group mb-0">
								<div class="input-group-btn">
									<h5>검색조건</h5>
									<div class="input-group mb-0">
										<input type="date" class="form-control border-radius-right-0 border-right-0 mb-0" 
										style="height: 45px; width:200px;" size="35px" name="start_time" id="start_time"> <h3>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;  </h3> 
										<input type="date" class="form-control border-radius-right-0 border-right-0 mb-0" 
										style="height: 45px; width:200px;" size="35px" name="end_time" id="end_time">
										<span class="input-group-btn">
											<input type="submit" id="searchBTN" 
												class="btn btn-primary" value="검색"/>
											<input type="reset" class="btn btn-primary" value="초기화">
										</span>
                                   </div>
								</div>
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
							<th scope="col" >접속시간</th>
							<th scope="col" >접속ip</th>
							<th scope="col" >컴퓨터이름</th>
							<th scope="col" >시도한 아이디</th>
							<th scope="col" >접속여부</th>
							<th scope="col" >시도횟수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${loginList }" var="login">
						<tr>
							<td>${login.lg_time }</td>
							<td>${login.lg_ip }</td>
							<td>${login.lg_comname }</td>
							<td>${login.mem_id }</td>
							<td>${login.lg_status }</td>
							<td>${login.lg_count }</td>
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