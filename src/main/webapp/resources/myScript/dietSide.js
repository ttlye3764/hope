$(function(){
	$('#dietSide_h5_menuList').click(function(){
			$(location).attr('href', 'menuList?titleName=오늘 당신이 먹은 혹은 먹을 음식의 칼로리를 확인해보세요!')
		});
	$('#dietSide_h5_my').click(function(){
			$(location).attr('href', 'diet_my?titleName=나의 식단관리에 대한 모든 것을 확인해보세요!')
		});
	$('#dietSide_h5_recommendDiet').click(function(){
			$(location).attr('href', 'recommendDiet?titleName=추천 식단을 확인해보세요')
		});
	$('#dietSide_h5_bmi').click(function(){
			$(location).attr('href', 'bmi?titleName=당신의 BMI는!!?')
		});			
	$('#dietSide_h5_dayKcal').click(function(){
			$(location).attr('href', 'dayKcal?titleName=당신에게 맞는 하루 열량과 그에 따른 운동을 확인해보세요!')
		});	
})


