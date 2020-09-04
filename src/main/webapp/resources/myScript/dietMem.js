function insertDietMemBTN(){
	$('#div_dietMem_right').empty();

	var insertDietMemForm = '<div id ="insertDietMemForm">';
		insertDietMemForm += '<input type="text" id="height" placeholder="키를 입력해주세요"><br>';
		insertDietMemForm += '<input type="text" id="current_weight" placeholder="현재 몸무게를 입력해주세요"><br>';
		insertDietMemForm += '<input type="text" id="purpose_weight placeholder="목표 몸무게를 입력해주세요"><br>';
		insertDietMemForm += '<button type="button" onclick="insertDietMem();">등록</button><br>';
		insertDietMemForm += '<button type="button" onclick="cancelDietMem();">취소</button><br>';
	
	$('#div_dietMem_right').append(insertDietMemForm);
}

function insertDietMem(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/diet/insertDietMem',
		data : {
			height : $('#height').val(),
			current_weight : $('#current_weight').val(),
			purpose_weight : $('#purpose_weight').val()
		},
		success : function(result){
			$('#div_dietMem_right').empty();
			$('#div_dietMem_right').append('<button id="insertDietMem" class="btn btn-grad" onclick="insertDietMemBTN();">등록</button>');
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

