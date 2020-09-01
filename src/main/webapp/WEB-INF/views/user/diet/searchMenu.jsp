<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="search_menu">
		<input type="text"/>
		<button type="button" id="javascript">검색</button>
		<button type="button" id="java">검색</button>
		test
	</form>
</body>
<script type="text/javascript">
$(function(){
	$('#javascript').click(function(){
		$.ajax({
			type : 'get',
			url : 'http://openapi.foodsafetykorea.go.kr/api/2ea6cf2e26314645b965/I2790/json/1/5',
			
			success : function(result){
				console.log(result)
				},
			error : function(result){
				console.log(result.state)
			}
			})

		})

		$('#java').click(function(){
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/user/diet/searchAjax',
			success : function(reuslt){
				console.log(result)
				},
			error : function(result){
				console.log(result.state)
			}
			})

		})
			
	})
</script>
</html>