<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    <div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(${pageContext.request.contextPath}/image/food1.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">${param.titleName }</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/user/diet/dietMain"><i class="ti-home"></i> Home</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<section class="blog-page pb-0">
		<div class="container">
			<div class="row">
				<!-- sidebar start -->
				<aside class="col-md-3 sidebar order-last order-md-first">
					<!-- Text Widget -->
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_my">나의 식단 관리</h5>
						<p class="mb-0"> 나만의 식단 관리를 체험해보세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_dayKcal">일일 열량</h5>
						<p class="mb-0">일일 추천 열량과 운동별 열량 소모량을 확인하세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_menuList">칼로리 사전</h5>
						<p class="mb-0">음식별 칼로리를 확인하세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_recommendDiet">추천 식단 리스트</h5>
						<p class="mb-0"> 회원님에게 맞는 식단표를 확인해보세요!</p>
					</div>
					<div class="widget">
						<h5 class="widget-title" id="dietSide_h5_bmi">BMI 계산기</h5>
						<p class="mb-0">회원님의 BMI를 확인해보세요!</p>
					</div>
				</aside>
				<!-- sidebar end -->

				<!-- blog start -->
				<div class="col-md-9 order-first order-lg-first">
					<!-- Post item  with image-->
					
					
							<!--검색 시작-->
				<form>
					<h5 class="widget-title">메뉴 리스트</h5>
					<div class="input-group">
						<h2>열량</h2><input type="text" class="form-control" id="searchKcalMin" name="search_kcal_min" placeholder="최소 열량을 입력해주세요"><h2>~</h2>
						<input type="text" class="form-control" id="searchKcalMax" name="search_kcal_max" placeholder="최대 열량을 입력해주세요">
						<h2>메뉴명 : </h2><input type="text" class="form-control" id="searchMenuName" name="search_menu_name" placeholder="메뉴명을 입력해주세요"> 
						<span class="input-group-btn">
							<button type="button" class="btn btn-grad mb-0" onclick="searchMenu();">
								<i class="fa fa-paper-plane m-0"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- 검색 불 -->
							 
							 
							
					<table class="table table-lg table-noborder table-striped">
							<thead class="all-text-white bg-grad">
								<tr>
									<th scope="col">#</th>
									<th scope="col">메뉴이름</th>
									<th scope="col">열량</th>
								</tr>
							</thead>
							<tbody id="menu_list_tbody">
							<c:forEach items="${menuList }" var="menuInfo" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td>${menuInfo.menu_name }</td>
									<td>${menuInfo.menu_kcal }Kcal</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
					<!-- pagination -->
					<div class="container mb-6" id="pagination" style="align-content: center;">
						${pagination }
					</div>
					<!-- pagination -->

				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>
	
	
	
	
<script type="text/javascript">
$(function(){
})
	
function searchMenu(){
	
	var searchMenuName = $('#searchMenuName').val();
	var searchKcalMin = $('#searchKcalMin').val();
	var searchKcalMax = $('#searchKcalMax').val();

	if(searchMenuName.length < 1){
		searchMenuName = null;
	} 

	if(searchKcalMin.length < 1){
		searchKcalMin = null;
	}

	if(searchKcalMax.length < 1){
		searchKcalMax = null;
	}

	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/menuList',
		data : {
			search_menu_name : searchMenuName,
			search_kcal_min : searchKcalMin,
			search_kcal_max : searchKcalMax,
			ajax : "true"
		},
		success : function(result){
			$('#menu_list_tbody').empty();
			$('#pagination').empty();
			var menuList="";
			var count =1;
			$.each(result.menuList, function(index, item){
				
				menuList += '<tr>';
				menuList += '<th scope="row">'+count+'</th>';
				menuList += '<td>'+item.menu_name+'</td>';
				menuList += '<td>'+item.menu_kcal+'kcal</td>';
				menuList += '</tr>';
				count ++;
			})
			$('#menu_list_tbody').append(menuList);
			$('#pagination').append(result.pagination);
			
		},	
		error : function(result){
			alert('실패');
		}
	
	}) 
	
}

function callAjax(i){


	var searchMenuName = $('#searchMenuName').val();
	var searchKcalMin = $('#searchKcalMin').val();
	var searchKcalMax = $('#searchKcalMax').val();

	if(searchMenuName.length < 1){
		searchMenuName = null;
	} 

	if(searchKcalMin.length < 1){
		searchKcalMin = null;
	}

	if(searchKcalMax.length < 1){
		searchKcalMax = null;
	}
	
	 $.ajax({
		 url : '${pageContext.request.contextPath}/user/diet/menuList',
			data : {
				search_menu_name : searchMenuName,
				search_kcal_min : searchKcalMin,
				search_kcal_max : searchKcalMax,
				ajax : "ture",
				currentPage : i
			},
			success : function(result){
				$('#menu_list_tbody').empty();
				$('#pagination').empty();
				var menuList="";
				var count =1;
				$.each(result.menuList, function(index, item){
					
					menuList += '<tr>';
					menuList += '<th scope="row">'+count+'</th>';
					menuList += '<td>'+item.menu_name+'</td>';
					menuList += '<td>'+item.menu_kcal+'Kcal</td>';
					menuList += '<td>@mdo</td>';
					menuList += '</tr>';
					count ++;
				})
				$('#menu_list_tbody').append(menuList);
				$('#pagination').append(result.pagination);
				
			},	
			error : function(result){
				alert('실패');
			}
				
	});
}
</script>