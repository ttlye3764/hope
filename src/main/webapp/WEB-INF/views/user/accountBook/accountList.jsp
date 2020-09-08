<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</style>
<script>

	$(function(){
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
			var deal_kind = $('.deal_kind option:selected').val();
			var deal_year = $('.deal_year option:selected').val();
			var deal_bungi = $('.deal_bungi option:selected').val();
			var deal_month = $('.deal_month option:selected').val();

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
							str += '<tr><th>'+(i+1)+'</th>';
							str += '<td>'+v.deal_date +'</td>';
							str += '<td>'+v.deal_name +'</td>';
							str += '<td>'+v.deal_price +'</td>';
							str += '<td>'+v.deal_option +'</td></tr>';
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
	
	function categoryChange(e){

		$(".deal_bungi option:eq(0)").prop("selected", true);
		$(".deal_year option:eq(0)").prop("selected", true);
		$(".deal_month option:eq(0)").prop("selected", true);

		
		var kind_a = ["체크카드","신용카드"];
	    var target = document.getElementById("kind");
	    
		if(e.value=="카드"){
		    var d = kind_a;
			$("#kind").show(); 
			$("#cardRegistBtn").show(); 
		}else if(e.value=="현금"){
			$("#kind").hide(); 
			$("#cardRegistBtn").hide(); 
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
						str += '<td>'+v.deal_date +'</td>';
						str += '<td>'+v.deal_name +'</td>';
						str += '<td>'+v.deal_price +'</td>';
						str += '<td>'+v.deal_option +'</td></tr>';
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

<div align="center" style="height: auto; margin: auto;">
	<div class="col-lg-6">
		<div class="card-body">
			<ul class="nav nav-tabs nav-bordered mb-3">
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
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;">아이템</label>
								<input type="text" class="deal_name" name="deal_name" style="margin-top: 5px; text-align:left; width:150px; height: 40px; margin-left: 5px;">
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
							<select name="deal_year" class="deal_year" style="text-align:center; width:65px; height: 25px; margin-top: 30px; border: 1px solid #e3e3e3;">
									<option style="text-align: center;" value="">연도별</option>
							</select>
							<select name="deal_bungi" class="deal_bungi" style="text-align:center; width:65px; height: 25px; margin-top: 30px; border: 1px solid #e3e3e3;">
									<option style="text-align: center;" value="">분기별</option>
							</select>
							<select name="deal_month" class="deal_month" style="text-align:center; width:65px; height: 25px; margin-top: 30px; border: 1px solid #e3e3e3;">
									<option style="text-align: center;" value="">월별</option>
							</select>
						</div>
						<div style="width:280px; height:75px; display: flex; justify-content:flex-start; ">							
							<div id="kind" style="width:180px; height:40px; visibility:hidden; ">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;"></label>
								<select style="width:180px; height:40px;">
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
				
				<div class="tab-pane show active" id="profile-b1" style="margin-top: 60px;">
					<div>
						<table id="accountTable"
							class="table table-sm table-centered mb-0"
							style="margin: auto; text-align: center;">
							<thead>
								<tr>
									<th></th>
									<th>날짜</th>
									<th>아이템</th>
									<th>금액</th>
									<th>입/출</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<c:forEach var="dealVO" items="${dealList }" varStatus="status">
									<tr>
										<th>${status.count }</th>
										<td>${dealVO.deal_date }</td>
										<td>${dealVO.deal_name}</td>
										<td>${dealVO.deal_price}</td>
										<td>${dealVO.deal_option}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="paginationDIV" style="margin-left: 35%;">
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

