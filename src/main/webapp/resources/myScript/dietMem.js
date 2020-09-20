function insertDietMemBTN(){
	$('#div_dietMem_right').empty();

	var insertDietMemForm = '<div id ="insertDietMemForm">';
		insertDietMemForm += '키 : <input type="text" id="height" placeholder="키를 입력해주세요"><br><br>';
		insertDietMemForm += '몸무게 : <input type="text" id="current_weight" placeholder="현재 몸무게를 입력해주세요"><br><br>';
		insertDietMemForm += '목표 몸무게 : <input type="text" id="purpose_weight" placeholder="목표 몸무게를 입력해주세요"><br><br>';
		insertDietMemForm += '<div class="form-check">';
		insertDietMemForm += '<div>';
		insertDietMemForm += '<input class="form-check-input" type="radio" name="activity" value="25" checked="">';
		insertDietMemForm += '<label class="form-check-label" >';			
		insertDietMemForm += '활동량 적음'; 				
		insertDietMemForm += '</label>';
		insertDietMemForm += '</div>';
		insertDietMemForm += '<div>';
		insertDietMemForm += '<input class="form-check-input" type="radio" name="activity" value="30" checked="">';
		insertDietMemForm += '<label class="form-check-label" >';			
		insertDietMemForm += '활동량 보통'; 				
		insertDietMemForm += '</label>';
		insertDietMemForm += '</div>';
		insertDietMemForm += '<div>';			
		insertDietMemForm += '<input class="form-check-input" type="radio" name="activity" value="40" checked="">';
		insertDietMemForm += '<label class="form-check-label" >';			
		insertDietMemForm += '활동량 많음'; 				
		insertDietMemForm += '</label>';
		insertDietMemForm += '</div>';									
		insertDietMemForm += '</div>';					
		insertDietMemForm += '<button type="button" onclick="insertDietMem();">등록</button><br>';
		insertDietMemForm += '<button type="button" onclick="cancelDietMem();">취소</button><br>';
	
		$('#div_dietMem_right').append(insertDietMemForm);
}

function insertDietMem(){
	$.ajax({
		url : 'insertDietMem',
		data : {
			height : $('#height').val(),
			current_weight : $('#current_weight').val(),
			purpose_weight : $('#purpose_weight').val(),
			activity : $('input[name="activity"]:checked').val()
		},
		success : function(result){
			$('#div_dietMem_right').empty();
			$('#div_dietMem_right').append('<button id="insertDietMem" class="btn btn-grad" onclick="insertDietMemBTN();">등록</button>');
			
		
		},
		complete : function() {
    		dietMemList();
                             
        },
		error : function(result){
			alert('insertDietMem 실패');
		}
	});
}

function cancelDietMem(){
	$('#div_dietMem_right').empty();
	$('#div_dietMem_right').append('<button id="insertDietMem" class="btn btn-grad" onclick="insertDietMemBTN();">등록</button>');
}



function dietMemList(){
	$.ajax({
		url : 'dietMemListAjax',
		success : function(result){
		
			$('#lastDietMem').empty();
			var lastDietMem = '<li class="list-group-item">내 키 : ' + result.dietMemLast.height + '</li>';
			lastDietMem +=	'<li class="list-group-item">몸무게 : ' + result.dietMemLast.current_weight + '</li>';
			lastDietMem +=	'<li class="list-group-item">목표 몸무게 : ' + result.dietMemLast.purpose_weight + '</li>';
			lastDietMem +=	'<li class="list-group-item">BMI : ' + result.dietMemLast.bmi + '</li>';
			lastDietMem +=  '<li class="list-group-item">일일 목표 열량 : ' + result.dietMemLast.day_kcal + '</li>';
			$('#lastDietMem').append(lastDietMem);
		
			$('#dietMemDetail').empty();
						
								
			var count = 1;
			$.each(result.dietMemList, function(index, item){
				count ++;
 				var dietMemDetail = '<div class="accordion-item">';
 				dietMemDetail += '<div class="accordion-title">';
 				dietMemDetail += '<a class="h6 mb-0 collapsed" data-toggle="collapse" href="#collapse-'+count+'" aria-expanded="false">'+item.dm_date.split(' ')[0]+'</a>'
 				dietMemDetail += '</div>';
 				dietMemDetail += '<div class="collapse" id="collapse-'+count+'" data-parent="#dietMemDetail" style="">';
 				dietMemDetail += '<div class="accordion-content">';
 				dietMemDetail += '키 : <a>'+item.height+'</a><br>';
 				dietMemDetail += '체중 : <a>'+item.current_weight+'</a><br>';
 				dietMemDetail += '목표 체중 : <a>'+item.purpose_weight+'</a><br>';
 				dietMemDetail += 'BMI : <a>'+item.bmi+'</a><br>';
 				dietMemDetail += '일일 목표 열량 : <a>'+item.day_kcal+'</a><br>';
 				dietMemDetail += '</div>';
 				dietMemDetail += '<div>';
 				dietMemDetail += '<button id="updateDietMem" class="btn btn-grad updateDietMem" onclick="updateDietMemForm(this);">수정</button>';
 				dietMemDetail += '<button id="deleteDietMem" class="btn btn-grad deleteDietMem" onclick="deleteDietMem(this);">삭제</button>';
 				dietMemDetail += '</div>';
 				dietMemDetail += '</div>';
 				dietMemDetail += '</div>';
 				$('#dietMemDetail').append(dietMemDetail);
 			 });
		},
		error : function(result){
			alert('dietMemList 실패');
		}
	})
}




function deleteDietMem(e){
	var appendDiv = $(e).closest('div').prev();
	var dietMemInfoDmNo = $(e).prev().prev().val();

	$.ajax({
		url : 'deleteDietMemInfo',
		data : {
			dm_no : dietMemInfoDmNo
		},
		success : function(result){
			
		},
		error : function(result){

		},
		complete : function() {
    		dietMemList();
                             
        },
	})
}


function updateDietMemComplete(e){
	var appendDiv = $(e).closest('div').prev();
	var dietMemInfoDmNo = $(e).prev().val();


	var update_height = appendDiv.find('.update_height').val();
	var update_weight = appendDiv.find('.update_weight').val();
	var update_purpose_weight = appendDiv.find('.update_purpose_weight').val();
	var update_bmi = appendDiv.find('.update_bmi').val();
	var update_day_kcal = appendDiv.find('.update_day_kcal').val();

	$.ajax({
		url : 'updateDietMemInfo',
		data : { 
			dm_no : dietMemInfoDmNo,
			height : update_height,
			current_weight : update_weight,
			purpose_weight : update_purpose_weight,
			bmi : update_bmi,
			day_kcal : update_day_kcal	
		},
		success : function(result){
			appendDiv.empty();
			var dietMemInfo = '키 : <a class="height">'+update_height+'</a><br>';
			dietMemInfo += '체중 : <a class="weight">'+update_weight+'</a><br>';
			dietMemInfo += '목표 체중 : <a class="purpose_weight">'+update_purpose_weight+'</a><br>';
			dietMemInfo += 'BMI : <a class="bmi">'+update_bmi+'</a><br>';
			dietMemInfo += '일일 목표 열량 : <a class="day_kcal">'+update_day_kcal+'</a><br>';  
			appendDiv.append(dietMemInfo);

			$(e).text('수정');
			$(e).attr('onclick', 'updateDietMemForm(this)');
		},
		error : function(result){
			alert('회원 정보 수정 실패');
		}
	})
}


function updateDietMemForm(e){
	var appendDiv = $(e).closest('div').prev();
	var dietMemInfoDmNo = $(e).prev();

	var height = appendDiv.find('.height').text();
	var weight = appendDiv.find('.weight').text();
	var purpose_weight = appendDiv.find('.purpose_weight').text();
	var bmi = appendDiv.find('.bmi').text();
	var day_kcal = appendDiv.find('.day_kcal').text();

	appendDiv.empty();

	var dietMemInfo = '키 : <textarea class="update_height" style="background-color:transparent; height:19px;">'+height+'</textarea><br><br>';
	dietMemInfo += '체중 : <textarea class="update_weight" style="background-color:transparent; height:19px;">'+weight+'</textarea><br><br>';
	dietMemInfo += '목표체중 : <textarea class="update_purpose_weight" style="background-color:transparent; height:19px;">'+purpose_weight+'</textarea><br><br>';
	dietMemInfo += 'bmi : <textarea class="update_bmi" style="background-color:transparent; height:19px;">'+bmi+'</textarea><br><br>';
	dietMemInfo += '일일 목표 열량 : <textarea class="update_day_kcal" style="background-color:transparent; height:19px;">'+day_kcal+'</textarea><br><br>';
	appendDiv.append(dietMemInfo);	

	$(e).text('완료');
	$(e).attr('onclick', 'updateDietMemComplete(this)');
}

