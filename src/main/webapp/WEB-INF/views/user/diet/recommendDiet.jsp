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
					
				<div class="col-md-6 mb-5">
					<div class="accordion toggle-icon-round" id="accordion5" style="width:700px;">
						<!-- item -->
						<c:forEach items="${dietList}" var="dietInfo" varStatus="status">
						<div class="accordion-item">
							<div class="accordion-title" >
								<a class="h6 mb-0 collapsed" data-toggle="collapse" href="#collapse-${status.count }" aria-expanded="false" onclick="recommendDietInfo(this);">${dietInfo.diet_name } <input type="hidden" class="diet_no" value="${dietInfo.diet_no }"></a>
								&nbsp&nbsp&nbsp&nbsp${dietInfo.diet_kcal }Kcal
							</div>
							<div class="collapse" id="collapse-${status.count }" data-parent="#accordion5" style="">
								<div class="accordion-content">
								
								</div>
							</div>
						</div>
						</c:forEach>
						<!-- item -->
					</div>
				</div>
							<!--  
							 diet_no 가지고 총열량, diet_info 테이블에서 식사 시기와 메뉴 번호 가지고 가서 인설트 / 순서는 diet_day 테이블 만들고 만들어진 dd_no로 diet_info 테이블에서 가져온거 삽입
							   
							 주의 사항 // 일자로 검색해서  이미 해당 일자의 식단이 잇을때 그 해당 일자의 diet_day를 cascade로 삭제하고 새로 insert create 안해주고 / 없을 때는 그냥 인설트 -->							
					
				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>
	
	
	
	
<script type="text/javascript">

function dietInsertToDietDay(e){
	var dietNo = $(e).parents('div.accordion-item').find('input').val();
		
	var dietDate = $(e).parent().prev().find('input').val();

	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/dietInsertToDietDay',
		data : {
			diet_no : dietNo,
			diet_date : dietDate
		},
		success : function(result){
			alert('추가 완료');
		},
		error : function(result){
			alert('추가 실패')
		}
	})

	
}
function recommendDietInfo(e){
	
	var dietNo = $(e).find('input').val();
	
	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/recommendDietInfo',
		data : {
			diet_no : dietNo 
		},
		success : function(result){
			$(e).closest('div').next().find('div').empty();
			var dietInfo ='<div class="callout-block callout-warning">';
			dietInfo += '<div class="content ml-0">';
			dietInfo += '<h4 class="callout-title"> 아침</h4>';

			$.each(result.dietInfoList1, function(index, item){
				dietInfo += '<p class="text-dark mt-3">'+item.menu_name+ ' ('+item.menu_kcal+'kcal)</p>';
			})
			dietInfo += '<br><h4 class="callout-title"> 점심</h4>';
			$.each(result.dietInfoList2, function(index, item){
				dietInfo += '<p class="text-dark mt-3">'+item.menu_name+ ' ('+item.menu_kcal+'kcal)</p>';
			})
			dietInfo += '<br><h4 class="callout-title"> 저녁</h4>';
			$.each(result.dietInfoList3, function(index, item){
				dietInfo += '<p class="text-dark mt-3">'+item.menu_name+' ('+ item.menu_kcal+'kcal)</p>';
			})
				
			dietInfo += '</div>';
			dietInfo += '<div class="flex_justify-end diet_date"><input style="flex-basis: 30px;" type="date" class="form-control"></div>';
			dietInfo += '<div class="flex_justify-end"><button type="button" onclick="dietInsertToDietDay(this)">내 식단에 추가하기</button></div>'
				
			dietInfo += '</div>';
		
			$(e).closest('div').next().find('div').append(dietInfo);		
		},
		erorr: function(result){
			alert('상세조회 실패')
		}
	})
	
}
</script>