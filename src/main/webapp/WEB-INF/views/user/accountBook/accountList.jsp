<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.control-label {
    color: #999;
    padding: 0;
    font-size: .8rem;
    font-weight: 400;
    margin-bottom: 0;
    height: 16px;
    line-height: 1em;
}
tr:hover{
		background-color: #e3e3e3;
	} 
</style>
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function updateFunc(i){
	var card ="";
	$.ajax({
        url     : '${pageContext.request.contextPath}/user/accountBook/accountInfo.do',
        type    : 'post',
        dataType: 'json',
        data : {'deal_no' : i },
        async : false,
        success : function(result) {
			console.log(result.dealInfo);
			var date = result.dealInfo.deal_date.split(' ');
			$('#deal_no').val(i);
			$('#modal_date').val(date[0]);
			$('#modal_item').val(result.dealInfo.deal_name);
			$('#modal_price').val(result.dealInfo.deal_price);
			$('#modal_division').val(result.dealInfo.deal_division);
			$('#modal_option').val(result.dealInfo.deal_option);
			if(result.dealInfo.deal_kind=='현금'){
				$('#modal_method').val(result.dealInfo.deal_kind);
				$("#modal_kind2").hide(); 
			}
			else if(result.dealInfo.deal_kind!='현금'){				
				$('#modal_method').val('카드');
				card = result.dealInfo.deal_card_name;
				$('#modal_kind2').empty();
				$.ajax({
			        url     : '${pageContext.request.contextPath}/user/accountBook/cardList.do',
			        type    : 'post',
			        dataType : 'json',
			        async : false,
			        data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
			        success : function(Result) {
						var str="";
				        for(var i=0; i<Result.cardlist.length; i++){
							if(card == Result.cardlist[i].card_kind){
								str += '<option selected="selected" value="'+Result.cardlist[i].card_kind+'">'+Result.cardlist[i].card_kind+'</option>';
							}else{
					    		str += '<option value="'+Result.cardlist[i].card_kind+'">'+Result.cardlist[i].card_kind+'</option>';
							}
					    }
						$('#modal_kind2').append(str);
			        }

			   	});
				$("#modal_kind2").show(); 
			}
	 	 }
	}); 
	
	$("#centermodal").modal("show");
}
function deleteFunc(i){
	var no = i
	$.ajax({
         url     : '${pageContext.request.contextPath}/user/accountBook/deleteAccount.do',
         type    : 'post',
         dataType: 'json',
         data : {'deal_no' : no },
         async : false,
         success : function(result) {
        	 getAccountList();
        	 alert('삭제완료');
	 	 }
	}); 
}
function getAccountList(){
	var startDate = $('.startDate').val();
	var endDate = $('.endDate').val();
	var deal_option = $('.deal_option option:selected').val();
	var deal_name = $('.deal_name').val();
	var deal_division = $('.deal_division option:selected').val();
	var deal_kind = $('.deal_kind option:selected').val();
	var deal_year = $('.deal_year option:selected').val();
	var deal_bungi = $('.deal_bungi option:selected').val();
	var deal_month = $('.deal_month option:selected').val();
	if(deal_kind == '카드'){
		deal_kind = $('#kind option:selected').val();
	}
	 $.ajax({
            url     : '${pageContext.request.contextPath}/user/accountBook/searchAccountList.do',
            type    : 'post',
            dataType: 'json',
            async : false,
            data : {'startDate':startDate, 'endDate':endDate, 'deal_option':deal_option, 'deal_name':deal_name, 'deal_division':deal_division, 'deal_kind':deal_kind,
	            		'deal_year':deal_year, 'deal_bungi':deal_bungi, 'deal_month':deal_month, 'mem_no':${LOGIN_MEMBERINFO.mem_no} },
            success : function(result) {
	            console.log(result.list);
	            console.log(result.pagination);
            	$('#paginationDIV').empty();
            	    $('#paginationDIV').append(result.pagination);
	            $('#tbody').empty();
				var str = "";
				$.each(result.list,function(i,v){
					str += '<tr><input type="hidden" value="'+v.deal_no+'"/>';
					str += '<th>'+(i+1)+'</th>';
					var date = v.deal_date.split(' ');
					str += '<td>'+ date[0] +'</td>';
					str += '<td>'+v.deal_name +'</td>';
					str += '<td>'+v.deal_division +'</td>';
					str += '<td>'+numberWithCommas(v.deal_price) +'</td>';
					if(v.deal_kind=='현금'){
						str += '<td>'+v.deal_kind +'</td>';
					}else if(v.deal_kind=='카드'){
						str += '<td>'+v.deal_card_name +'</td>';
					}
					str += '<td>'+v.deal_option +'</td>';
					str += '<td style="width:50px; height: 50px;">';
					str += '<div style="display: flex; justify-content:space-around; height: 50px; width:50px;">';
					str += '<img class="img1" src="${pageContext.request.contextPath}/images/update.PNG" onclick="updateFunc('+v.deal_no+');" style="width:25px; height: 25px;  display:none;">';
					str += '<img class="img2" src="${pageContext.request.contextPath}/images/delete.PNG" onclick="deleteFunc('+v.deal_no+');" style="width:25px; height: 25px;  display:none;"></div></td></tr>';
				});
				$('#tbody').append(str);
		    }
	})
}

	   
$(function(){
	$("#kind").hide(); 
	$(".img1").hide();
	$(".img2").hide();
	

	$('#registBtn1').on('click',function(){
		var deal_no = $('#deal_no').val();
		var date = $('#modal_date').val();
		var item = $('#modal_item').val();
		var price = $('#modal_price').val();
		var division = $('#modal_division').val();
		var option = $('#modal_option').val();
		var method = $('#modal_method').val();
		var card_name ="";		
		if(method=='현금'){
			$("#modal_kind2").hide(); 
		}
		else if(method!='현금'){
			card_name = $('#modal_kind2').val();
			$("#modal_kind2").show(); 
		}

		 $.ajax({
	            url     : '${pageContext.request.contextPath}/user/accountBook/updateAccount.do',
	            type    : 'post',
	            dataType: 'json',
	            async : false,
	            data : {'deal_no':deal_no, 'deal_date':date, 'deal_name':item, 'deal_price':price, 'deal_division' : division,
		            'deal_option':option,'deal_kind':method,'deal_card_name':card_name },
	            success : function(result) {
	            	$("#centermodal").modal("hide");

	        		$('#tbody').empty();
	        		
	        		var startDate = $('.startDate').val();
	        		var endDate = $('.endDate').val();
	        		var deal_option = $('.deal_option option:selected').val();
	        		var deal_name = $('.deal_name').val();
	        		var deal_division = $('.deal_division option:selected').val();
	        		var deal_kind = $('.deal_kind option:selected').val(); //현금 카드
	        		var deal_year = $('.deal_year option:selected').val();
	        		var deal_bungi = $('.deal_bungi option:selected').val();
	        		var deal_month = $('.deal_month option:selected').val();
	        		
	        		if(deal_kind == '카드'){
	        			deal_kind = $('#kind option:selected').val();
	        		}

	        		 $.ajax({
	        	            url     : '${pageContext.request.contextPath}/user/accountBook/searchAccountList.do',
	        	            type    : 'post',
	        	            dataType: 'json',
	        	            async : false,
	        	            data : {'startDate':startDate, 'endDate':endDate, 'deal_option':deal_option, 'deal_name':deal_name, 'deal_division':deal_division, 'deal_kind':deal_kind,
	        		            		'deal_year':deal_year, 'deal_bungi':deal_bungi, 'deal_month':deal_month, 'mem_no':${LOGIN_MEMBERINFO.mem_no} },
	        	            success : function(result) {
	        	            	$('#paginationDIV').empty();
	                     	    $('#paginationDIV').append(result.pagination);
	        		            $('#tbody').empty();
	        					var str = "";
	        					$.each(result.list,function(i,v){
	        						str += '<tr><input type="hidden" value="'+v.deal_no+'"/>';
	        						str += '<th>'+(i+1)+'</th>';
	        						var date = v.deal_date.split(' ');
	    							str += '<td>'+ date[0] +'</td>';
	        						str += '<td>'+v.deal_name +'</td>';
	        						str += '<td>'+v.deal_division +'</td>';
	        						str += '<td>'+numberWithCommas(v.deal_price) +'</td>';
	        						if(v.deal_kind=='현금'){
	        							str += '<td>'+v.deal_kind +'</td>';
	        						}else if(v.deal_kind=='카드'){
	        							str += '<td>'+v.deal_card_name +'</td>';
	        						}
	        						str += '<td>'+v.deal_option +'</td>';
	        						str += '<td style="width:50px; height: 50px;">';
	        						str += '<div style="display: flex; justify-content:space-around; height: 50px; width:50px;">';
	        						str += '<img class="img1" src="${pageContext.request.contextPath}/images/update.PNG" onclick="updateFunc('+v.deal_no+');" style="width:25px; height: 25px;  display:none;">';
	        						str += '<img class="img2" src="${pageContext.request.contextPath}/images/delete.PNG" onclick="deleteFunc('+v.deal_no+');" style="width:25px; height: 25px;  display:none;"></div></td></tr>';
	        					});
	        					$('#tbody').append(str);
	        			    }
	        		});
	        		alert('수정완료');
			    }
		 })
	});

	$(document).on('mouseenter','#tbody tr', function(){
		$(this).find('.img1').show();
		$(this).find('.img2').show();
	});
	$(document).on('mouseleave','#tbody tr', function(){
		$(this).find('.img1').hide();
		$(this).find('.img2').hide();
	});

	
	
	
		
	var str = "";
		for(i=6; i>0; i--){
			str += '<option style="text-align: center;" value="'+(2020-i)+'">'+(2020-i)+'</option>';
		}
		for(i = 0; i < 6; i++){
			str += '<option style="text-align: center;" value="'+(2020+i)+'">'+(2020+i)+'</option>';
		}
		$('.deal_year').append(str);
		str = "";
		
		for(j=1; j<5; j++){
			str += '<option style="text-align: center;" value="'+(String(j)+'/4')+'">'+(String(j)+'/4')+'</option>';
		}
		$('.deal_bungi').append(str);

		str = "";
		for(i=1; i<13; i++){
			str += 	'<option style="text-align: center;" value="'+String(i)+'월'+'">'+String(i)+'월'+'</option>';
		}
		$('.deal_month').append(str);

		$('#searchBTN').on('click',function(){
			var startDate = $('.startDate').val();
			var endDate = $('.endDate').val();
			var deal_option = $('.deal_option option:selected').val();
			var deal_name = $('.deal_name').val();
			var deal_division = $('.deal_division option:selected').val();
			var deal_kind = $('.deal_kind option:selected').val(); //현금 카드
			var deal_year = $('.deal_year option:selected').val();
			var deal_bungi = $('.deal_bungi option:selected').val();
			var deal_month = $('.deal_month option:selected').val();
			
			if(deal_kind == '카드'){
				deal_kind = $('#kind option:selected').val();
			}
			 $.ajax({
		            url     : '${pageContext.request.contextPath}/user/accountBook/searchAccountList.do',
		            type    : 'post',
		            dataType: 'json',
		            data : {'startDate':startDate, 'endDate':endDate, 'deal_option':deal_option, 'deal_name':deal_name, 'deal_division':deal_division, 'deal_kind':deal_kind,
			            		'deal_year':deal_year, 'deal_bungi':deal_bungi, 'deal_month':deal_month, 'mem_no':${LOGIN_MEMBERINFO.mem_no} },
		            success : function(result) {
			            console.log(result.list);
			            console.log(result.pagination);
		            	$('#paginationDIV').empty();
   	             	    $('#paginationDIV').append(result.pagination);
			            $('#tbody').empty();
						var str = "";
						$.each(result.list,function(i,v){
							str += '<tr><input type="hidden" value="'+v.deal_no+'"/>';
							str += '<th>'+(i+1)+'</th>';
							var date = v.deal_date.split(' ');
							str += '<td>'+ date[0] +'</td>';
							str += '<td>'+v.deal_name +'</td>';
							str += '<td>'+v.deal_division +'</td>';
							str += '<td>'+numberWithCommas(v.deal_price) +'</td>';
							if(v.deal_kind=='현금'){
								str += '<td>'+v.deal_kind +'</td>';
							}else if(v.deal_kind=='카드'){
								str += '<td>'+v.deal_card_name +'</td>';
							}
							str += '<td>'+v.deal_option +'</td>';
							str += '<td style="width:50px; height: 50px;">';
							str += '<div style="display: flex; justify-content:space-around; height: 50px; width:50px;">';
							str += '<img class="img1" src="${pageContext.request.contextPath}/images/update.PNG" onclick="updateFunc('+v.deal_no+');" style="width:25px; height: 25px;  display:none;">';
							str += '<img class="img2" src="${pageContext.request.contextPath}/images/delete.PNG" onclick="deleteFunc('+v.deal_no+');" style="width:25px; height: 25px;  display:none;"></div></td></tr>';
						});
						$('#tbody').append(str);
				    }
			});
		});

		$('.deal_year').on('change',function(){
			$(".deal_bungi option:eq(0)").prop("selected", true);
			$(".deal_month option:eq(0)").prop("selected", true);
			$(".deal_option option:eq(0)").prop("selected", true);
			$(".deal_division option:eq(0)").prop("selected", true);
			$(".deal_kind option:eq(0)").prop("selected", true);
			$(".startDate").val("");
			$(".endDate").val("");
			$(".deal_name").val("");
			$("#kind").hide();
		});
		$('.deal_bungi').on('change',function(){
			$(".deal_year option:eq(0)").prop("selected", true);
			$(".deal_month option:eq(0)").prop("selected", true);
			$(".deal_option option:eq(0)").prop("selected", true);
			$(".deal_division option:eq(0)").prop("selected", true);
			$(".deal_kind option:eq(0)").prop("selected", true);
			$(".startDate").val("");
			$(".endDate").val("");
			$(".deal_name").val("");
			$("#kind").hide();
		});
		$('.deal_month').on('change',function(){
			$(".deal_bungi option:eq(0)").prop("selected", true);
			$(".deal_year option:eq(0)").prop("selected", true);
			$(".deal_option option:eq(0)").prop("selected", true);
			$(".deal_division option:eq(0)").prop("selected", true);
			$(".deal_kind option:eq(0)").prop("selected", true);
			$(".startDate").val("");
			$(".endDate").val("");
			$(".deal_name").val("");
			$("#kind").hide();
		});
		$('.deal_division').on('change',function(){
			$(".deal_bungi option:eq(0)").prop("selected", true);
			$(".deal_year option:eq(0)").prop("selected", true);
			$(".deal_month option:eq(0)").prop("selected", true);
		});
		$('.deal_option').on('change',function(){
			$(".deal_bungi option:eq(0)").prop("selected", true);
			$(".deal_year option:eq(0)").prop("selected", true);
			$(".deal_month option:eq(0)").prop("selected", true);
		});
		$('.startDate').on('change',function(){
			$(".deal_bungi option:eq(0)").prop("selected", true);
			$(".deal_year option:eq(0)").prop("selected", true);
			$(".deal_month option:eq(0)").prop("selected", true);
		});
		$('.endDate').on('change',function(){
			$(".deal_bungi option:eq(0)").prop("selected", true);
			$(".deal_year option:eq(0)").prop("selected", true);
			$(".deal_month option:eq(0)").prop("selected", true);
		});
	});


	function categoryChange2(e){
		var kind_a = [];
		
		$.ajax({
	   	 	async    : false,
	        url     : '${pageContext.request.contextPath}/user/accountBook/cardList.do',
	        type    : 'post',
	        dataType : 'json',
	        data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
	        success : function(Result) {
		        for(var i=0; i<Result.cardlist.length; i++){
					kind_a[i] = Result.cardlist[i].card_kind;
			    }
	        }

	   	});
		
	    var target = document.getElementById("modal_kind2");
	    
		if(e.value=="카드"){
		    var d = kind_a;
			$("#modal_kind2").show(); 
		}else if(e.value=="현금"){
			$("#modal_kind2").hide(); 
		}else if(e.value==""){
			$("#modal_kind2").hide(); 
		}
		target.options.length = 0;

		for(x in d){
			var opt = document.createElement("option");
			opt.value=d[x];
			opt.innerHTML=d[x];
			target.appendChild(opt);
		}
	}

	function categoryChange(e){

		$(".deal_bungi option:eq(0)").prop("selected", true);
		$(".deal_year option:eq(0)").prop("selected", true);
		$(".deal_month option:eq(0)").prop("selected", true);

		var kind_a = [];
		
		$.ajax({
	   	 	async    : false,
	        url     : '${pageContext.request.contextPath}/user/accountBook/cardList.do',
	        type    : 'post',
	        dataType : 'json',
	        data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}},
	        success : function(Result) {
		        for(var i=0; i<Result.cardlist.length; i++){
					kind_a[i] = Result.cardlist[i].card_kind;
			    }
	        }

	   	});
		
	    var target = document.getElementById("kind");
	    
		if(e.value=="카드"){
		    var d = kind_a;
			$("#kind").show(); 
		}else if(e.value=="현금"){
			$("#kind").hide(); 
		}else if(e.value==""){
			$("#kind").hide(); 
		}
		target.options.length = 0;

		for(x in d){
			var opt = document.createElement("option");
			opt.value=d[x];
			opt.innerHTML=d[x];
			target.appendChild(opt);
		}
	}



	function callAjax(i){
		var startDate = $('.startDate').val();
		var endDate = $('.endDate').val();
		var deal_option = $('.deal_option option:selected').val();
		var deal_name = $('.deal_name').val();
		var deal_division = $('.deal_division option:selected').val();
		var deal_kind = $('.deal_kind option:selected').val();
		var deal_year = $('.deal_year option:selected').val();
		var deal_bungi = $('.deal_bungi option:selected').val();
		var deal_month = $('.deal_month option:selected').val();
	

		 $.ajax({
	            url     : '${pageContext.request.contextPath}/user/accountBook/searchAccountList.do',
	            type    : 'post',
	            dataType: 'json',
	            data : {'startDate':startDate, 'endDate':endDate, 'deal_option':deal_option, 'deal_name':deal_name, 'deal_division':deal_division, 'deal_kind':deal_kind,
		            		'deal_year':deal_year, 'deal_bungi':deal_bungi, 'deal_month':deal_month, 'mem_no':${LOGIN_MEMBERINFO.mem_no},'currentPage':i },
	            success : function(result) {
		            console.log(result.list);
		            console.log(result.pagination);
	            	$('#paginationDIV').empty();
             	    $('#paginationDIV').append(result.pagination);
		            $('#tbody').empty();
					var str = "";
					$.each(result.list,function(i,v){
						str += '<tr><th>'+(i+1)+'</th>';
						var date = v.deal_date.split(' ');
						str += '<td>'+ date[0] +'</td>';
						str += '<td>'+v.deal_name +'</td>';
						str += '<td>'+v.deal_division +'</td>';
						str += '<td>'+numberWithCommas(v.deal_price) +'</td>';
						if(v.deal_kind=='현금'){
							str += '<td>'+v.deal_kind +'</td>';
						}else if(v.deal_kind=='카드'){
							str += '<td>'+v.deal_card_name +'</td>';
						}
						str += '<td>'+v.deal_option +'</td>';
						str += '<td style="width:50px; height: 50px;">';
						str += '<div style="display: flex; justify-content:space-around; height: 50px; width:50px;">';
						str += '<img class="img1" src="${pageContext.request.contextPath}/images/update.PNG" onclick="updateFunc('+v.deal_no+');" style="width:25px; height: 25px; display:none;">';
						str += '<img class="img2" src="${pageContext.request.contextPath}/images/delete.PNG" onclick="deleteFunc('+v.deal_no+');" style="width:25px; height: 25px;  display:none;"></div></td></tr>';

						});

					$('#tbody').append(str);
			    }
		});
	}
</script>



<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">Asset management system</h1>
					<h6 class="subtitle"> Manage your money smartly! </h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a href="index.html"><i class="ti-home"></i> Home</a></li>
							<li class="breadcrumb-item">Timeline</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
		<br>
		<br>
		<br>

<div align="center" style="height: auto; margin : auto;">
	<div class="col-lg-6" style="width:880px;">
		<div class="card-body"  style="width: 880px;">
			<ul class="nav nav-tabs nav-bordered mb-3"  style="width: 880px;">
				<li class="nav-item"><a href="#profile-b1" data-toggle="tab"
					aria-expanded="true" class="nav-link active"> <i
						class="mdi mdi-account-circle d-lg-none d-block mr-1"></i> <span
						class="d-none d-lg-block">거래 내역</span>
				</a></li>
			</ul>
			<div class="tab-content">
				<form style="width: 880px; height: 150px; display: flex; justify-content:space-between;  border: 1px solid #e3e3e3; ">
					<div style="width:600px; height:150px;">
						<div style="width:600px; height:75px;display: flex; justify-content:flex-start;">
							<div style="width:180px; height:75px;">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;">시작일</label>
								<input type="date" class="startDate" style="margin-top: 5px; text-align:left; width:150px; height: 40px;">
							</div>
							<div style="width:180px; height:75px;">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;">종료일</label>
								<input type="date" class="endDate" style="margin-top: 5px; text-align:left; width:150px; height: 40px;">
							</div>
							<div style="width:180px; height:75px;">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;">거래종류</label>
								<select name="deal_option" class="deal_option" style="margin-top: 5px; text-align:left; width:150px; height: 40px;">
									<option value="">거래종류</option>
									<option value="출금">출금</option>
									<option value="입금">입금</option>
								</select>
							</div>
						</div>
						<div style="width:600px; height:75px; display: flex; justify-content:flex-start;">
							<div style="width:180px; height:75px;">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;   ">아이템</label>
								<input type="text" class="deal_name" name="deal_name" style="margin-top: 5px; text-align:left; width:150px; height: 40px; margin-left: 5px;  border: 1px solid black;">
							</div>
							<div style="width:180px; height:75px;">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;">구분</label>
								<select name="deal_division" class="deal_division" style="margin-top: 5px; width:150px; height: 40px;">
									<option value="">구분</option>
									<option value="식비">식비</option>
									<option value="교통비">교통비</option>
									<option value="주거/통신">주거/통신</option>
									<option value="생활용품">생활용품</option>
									<option value="경조사비">경조사비</option>
									<option value="지식문화">지식문화</option>
									<option value="의복,미용">의복,미용</option>
									<option value="의료,건강">의료,건강</option>
									<option value="여가,유흥">여가,유흥</option>
									<option value="세금,이자">세금,이자</option>
									<option value="기타비용">기타비용</option>
									<option value="월급">월급</option>
									<option value="상여금">상여금</option>
									<option value="펀드,수익">펀드,주식</option>
									<option value="기타수익">기타수익</option>
								</select>
								
							</div>
							<div style="width:180px; height:75px;">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;">결제방법</label>
								<!-- <input type="text" style="margin-top: 5px; text-align:left; width:150px; height: 40px;"> -->
								<select name="deal_kind" class="deal_kind" onchange="categoryChange(this);" style="text-align:center; margin-top: 5px; text-align:left; width:150px; height: 40px;">
									<option value="">결제방법</option>
									<option value="현금">현금</option>
									<option value="카드">카드</option>
							    </select>
							</div>
							
						</div>
					</div>
					<div style="width:280px; height:150px; display: flex; flex-direction : column;">
						<div style="width:280px; height:75px; display: flex; justify-content:space-around; ">
							<select name="deal_year" class="deal_year" style="text-align:center; width:65px; height: 25px; margin-top: 30px; border: 1px solid black;">
									<option style="text-align: center;" value="">연도별</option>
							</select>
							<select name="deal_bungi" class="deal_bungi" style="text-align:center; width:65px; height: 25px; margin-top: 30px; border: 1px solid black;">
									<option style="text-align: center;" value="">분기별</option>
							</select>
							<select name="deal_month" class="deal_month" style="text-align:center; width:65px; height: 25px; margin-top: 30px; border: 1px solid black;">
									<option style="text-align: center;" value="">월별</option>
							</select>
						</div>
						<div style="width:280px; height:75px; display: flex; justify-content:flex-start; ">							
							<div  style="width:180px; height:40px; ">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;"></label>
								<select id="kind" style="width:180px; height:40px;">
									<option value="">카드선택</option>
								</select>
							</div>
							<div>
								<label class="control-label" style="margin-left: 13px; margin-top:5px; text-align:left; width:50px;"></label>
								<img alt="#" id="searchBTN" src="${pageContext.request.contextPath}/images/search1.PNG" style="border:1px solid green; margin-left: 13px; color: #37bf74; width:40px; height:40px;">
							</div>
						</div>
					</div>
				</form>
				
				<div class="tab-pane show active" id="profile-b1" style="margin-top: 60px; width : 880px">
					<div>
						<table id="accountTable"
							class="table table-sm table-centered mb-0"
							style="margin: auto; text-align: center;">
							<thead>
								<tr>
									<th>순번</th>
									<th>날짜</th>
									<th>아이템</th>
									<th>구분</th>
									<th>금액</th>
									<th>결제방법</th>
									<th>입/출</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="tbody">
								<c:forEach var="dealVO" items="${dealList }" varStatus="status">
									<tr>
										<input type="hidden" value="${dealVO.deal_no }"/>
										<th>${status.count }</th>
										<td>${fn:substring(dealVO.deal_date,0,10) }</td>
										<td>${dealVO.deal_name}</td>
										<td>${dealVO.deal_division}</td>
										<td><fmt:formatNumber value="${dealVO.deal_price}" groupingUsed="true"/></td>
										<c:if test="${dealVO.deal_kind eq '현금'}">
											<td>${dealVO.deal_kind}</td>
										</c:if>
										<c:if test="${dealVO.deal_kind eq '카드'}">
											<td>${dealVO.deal_card_name}</td>
										</c:if>
										<td>${dealVO.deal_option}</td>
										<td style="width:50px; height: 50px;">
											<div style="display: flex; justify-content:space-around; height: 50px; width:50px;">
												<img class="img1" src="${pageContext.request.contextPath}/images/update.PNG" onclick="updateFunc(${dealVO.deal_no});" style="width:25px; height: 25px;">
												<img class="img2" src="${pageContext.request.contextPath}/images/delete.PNG" onclick="deleteFunc(${dealVO.deal_no});" style="width:25px; height: 25px;">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="paginationDIV" style="margin-left: 40%;">
						${pagination }
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- end card-body-->

	</div>
	<!-- end col -->
</div>





 <!-- Center modal content -->
		<div class="modal fade" id="centermodal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title" id="myCenterModalLabel" style="text-align: center;">내역 수정</h6>
					</div>
					<div class="modal-body">
						<div>
							<input type="hidden" id="deal_no" value="">
							<div style="display: flex; justify-content:space-between;">
                                                	<label>날짜</label><input type="date" id="modal_date" style="border: 1px solid #e3e3e3; height: 27px;"> &nbsp;&nbsp;
                                                	<label>아이템</label><input type="text" id="modal_item" style="border: 1px solid #e3e3e3; height: 27px;"> 
							</div>
                            <div style="display: flex; justify-content:flex-start; margin-top: 5px;">
                                                	<div><label>금액</label><input type="text" id="modal_price" style="border: 1px solid #e3e3e3; height: 27px; margin-left: 21px; width:145px;"></div>
                                                	<div><label style="margin-left: 46px;">구분</label>
                                                	<select name="division" id="modal_division" style="border: 1px solid #e3e3e3; height: 27px; width:164px; margin-left: 30px;">
                                                			<option value="">구분</option>
                                                			<option value="식비">식비</option>
                                                			<option value="교통비">교통비</option>
                                                			<option value="주거/통신">주거/통신</option>
                                                			<option value="생활용품">생활용품</option>
                                                			<option value="경조사비">경조사비</option>
                                                			<option value="지식문화">지식문화</option>
                                                			<option value="의복,미용">의복,미용</option>
                                                			<option value="의료,건강">의료,건강</option>
                                                			<option value="여가,유흥">여가,유흥</option>
                                                			<option value="세금,이자">세금,이자</option>
                                                			<option value="기타비용">기타비용</option>
                                                			<option value="월급">월급</option>
															<option value="상여금">상여금</option>
															<option value="펀드,수익">펀드,주식</option>
															<option value="기타수익">기타수익</option>
                                                	</select>
                                                	</div>
                            </div>              	
							<div style="margin-top: 5px;">
									  <label>거래종류</label>
									  <select name="paymentOption" id="modal_option" style="width:100px; border: 1px solid #e3e3e3; margin-left: 5px;">
											<option value="">거래종류</option>
											<option value="출금">출금</option>
											<option value="입금">입금</option>
									  </select>
								     <label style="margin-left: 20px;	">결제방법</label>
								     <select name="paymentMethod" id="modal_method" onchange="categoryChange2(this)" style="width:100px; border: 1px solid #e3e3e3;  margin-left: 5px;">
											<option value="">결제방법</option>
											<option value="현금">현금</option>
											<option value="카드">카드</option>
									</select>		
									<select id="modal_kind2" style="width:100px; border: 1px solid #e3e3e3;  margin-left: 5px;  display:none; ">
										<option value="">카드선택</option>
									</select>
									
									
									
									
							</div>
                                                                                                                									
																													
                                                	
                            <div style="display: flex; justify-content: center; margin-top: 5px;"><button type="button" id="registBtn1">수정</button></div>
                                                	
                                                	
                                               


                                               
                                                	
                     </div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
<!-- /.modal -->




