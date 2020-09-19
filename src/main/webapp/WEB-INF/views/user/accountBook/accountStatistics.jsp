<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.tooltip{ 
  position:relative;
  float:right;
}
.tooltip-inner { background-color:#e3e3e3; color:black; font-weight:bold; font-size:8px; height: 16px;}
.tooltip{
	width:auto;
	height: 16px;
}
.progress{
  border-radius:0;
  overflow:visible;
}
.progress-bar{
   background:rgb(23,44,60); 
  -webkit-transition: width 1.5s ease-in-out;
  transition: width 1.5s ease-in-out;
}
</style>

<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(function () { 
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
	
  $('[data-toggle="tooltip"]').tooltip({trigger: 'manual'}).tooltip('show');
  $(".progress-bar").each(function(){
	    each_bar_width = $(this).attr('aria-valuenow');
	    $(this).width(each_bar_width + '%');
  });
       
  	
});  


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
						class="d-none d-lg-block">통계</span>
				</a></li>
			</ul>
			<div class="tab-content">
				<form style="width: 880px; height: 800px;">
					<div style="display: flex; justify-content:space-between; width: 880px; height: 400px;">
						<div style="width: 49%; height: 400px; display: flex; flex-direction : column; background-color: white; border: 1px solid #e3e3e3;">
						
							<div style="display: flex;"><h5>비용</h5></div>
							
							<div style="display: flex; justify-content:flex-start; align-items:center; height: 30px; border-bottom: 2px double gray;">
								<div style="width: 80px; text-align: left; color: black;">
									<span class="progressText"><B>총 비용</B></span>
								</div>
								<div class="progress" style="width:230px;">
									<div class="progress-bar" role="progressbar" aria-valuenow="${total_minus}"
										aria-valuemin="0" aria-valuemax="${total_minus}">
										<span class="popOver" data-toggle="tooltip"
											data-placement="right" title="${total_minus}"> </span>
									</div>
								</div>
								<div style="margin-left: 80px;">
									<span>100%</span>
								</div>
							</div>
							
							<c:forEach var="dealVO" items="${dealMinusList}" varStatus="status">
								<div style="display: flex; justify-content: flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
									<div style="width: 80px; text-align: left;">
										<span class="progressText"><B>${dealVO.deal_division}</B></span>
									</div>
									<div class="progress" style="width: 230px;">
										<div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100"
												 aria-valuenow="<fmt:formatNumber type="number"  pattern="0.00" value="${(dealVO.groupPrice*100)/total_minus}"/>" >
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="${dealVO.groupPrice}"> </span>
										</div>
									</div>
									<div style="margin-left: 80px;">
										<span><fmt:formatNumber type="number"  pattern="0.00" value="${(dealVO.groupPrice*100)/total_minus}"/>%</span>
									</div>
								</div>
							</c:forEach>

							<div style="display: flex; justify-content: flex-start; align-items: center; height: 30px; border-bottom: 2px double gray;">
								<div style="width: 80px; text-align: left; color: black;">
									<span class="progressText"><B>총 고정</B></span>
								</div>
								<div class="progress" style="width: 230px;">
									<div class="progress-bar" role="progressbar" aria-valuenow="<fmt:formatNumber type="number"  pattern="0.00" value="${(fix_minus*100)/total_minus}"/>"
										aria-valuemin="0" aria-valuemax="100">
										<span class="popOver" data-toggle="tooltip"
											data-placement="right" title="${fix_minus}"> </span>
									</div>
								</div>
								<div style="margin-left: 80px;">
									<span><fmt:formatNumber type="number"  pattern="0.00" value="${(fix_minus*100)/total_minus}"/>%</span>
								</div>
							</div>							
						</div>
						
						<div style="background-color: white; width: 49%; height: 400px;">
							<div style="background-color: white; height: 220px; border: 1px solid #e3e3e3;">
								<div style="display: flex;"><h5>수익</h5></div>
								
								<div style="display: flex; justify-content:flex-start; align-items:center; height: 30px; border-bottom: 2px double gray;">
									<div style="width: 80px; text-align: left; color: black;">
										<span class="progressText"><B>총 수익</B></span>
									</div>
									<div class="progress" style="width:230px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="${total_plus}"
											aria-valuemin="0" aria-valuemax="${total_plus}">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="${total_plus}"> </span>
										</div>
									</div>
									<div style="margin-left: 80px;">
										<span>100%</span>
									</div>
								</div>
								
								<c:forEach var="dealVO" items="${dealPlusList}" varStatus="status">
								<div style="display: flex; justify-content: flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
									<div style="width: 80px; text-align: left;">
										<span class="progressText"><B>${dealVO.deal_division}</B></span>
									</div>
									<div class="progress" style="width: 230px;">
										<div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100"
												 aria-valuenow="<fmt:formatNumber type="number"  pattern="0.00" value="${(dealVO.groupPrice*100)/total_plus}"/>" >
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="${dealVO.groupPrice}"></span>
										</div>
									</div>
									<div style="margin-left: 80px;">
										<span><fmt:formatNumber type="number"  pattern="0.00" value="${(dealVO.groupPrice*100)/total_plus}"/>%</span>
									</div>
								</div>
							</c:forEach>

								<div
									style="display: flex; justify-content: flex-start; align-items: center; height: 30px; border-bottom: 2px double gray;">
									<div style="width: 80px; text-align: left; color: black;">
										<span class="progressText"><B>총 고정</B></span>
									</div>
									<div class="progress" style="width: 230px;">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="<fmt:formatNumber type="number"  pattern="0.00" value="${(fix_plus*100)/total_plus}"/>"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="${fix_plus}"> </span>
										</div>
									</div>
									<div style="margin-left: 80px;">
										<span><fmt:formatNumber type="number" pattern="0.00" value="${(fix_plus*100)/total_plus}" />%</span>
									</div>
								</div>
							</div>
							
							<div style=" height: 20px;">
							</div>
							
							<div style="background-color: white; height: 160px; border: 1px solid #e3e3e3;">
								
								<div style="display: flex; justify-content:flex-start; align-items:center; height: 30px; border-bottom: 2px double gray;">
									<div style="width: 80px; text-align: left; color: black;">
										<span class="progressText"><B>총 수익</B></span>
									</div>
									<div class="progress" style="width:230px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="<fmt:formatNumber type="number"  pattern="0.00" value="${total_plus}"/>"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="${total_plus}"> </span>
										</div>
									</div>
									<div style="margin-left: 80px;">
										<span>100%</span>
									</div>
								</div>
								<div style="display: flex; justify-content:flex-start; align-items:center; height: 30px; border-bottom: 2px double gray;">
									<div style="width: 80px; text-align: left; color: black;">
										<span class="progressText"><B>총 비용</B></span>
									</div>
									<div class="progress" style="width:230px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="${total_minus}"
											aria-valuemin="0" aria-valuemax="${total_minus}">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="${total_minus}"></span>
										</div>
									</div>
									<div style="margin-left: 80px;">
										<span>100%</span>
									</div>
								</div>
								
								<div style="width: 100px; text-align:center; color: black;">
									<span class="progressText"><B>당기순손익</B></span>
								</div>
								<div  style="width: 300px; height: 80px; text-align: center;">
									<c:if test="${total_plus-total_minus > 0}">
										+ ${total_plus-total_minus} 원
									</c:if>
									<c:if test="${total_plus-total_minus < 0}">
										  ${total_plus-total_minus} 원
									</c:if>
								</div>
							</div>
						</div>
					</div>
					
					<div style="width: 880px; height: 400px; border: 1px solid #e3e3e3; margin-top: 5px;">
						<div style="width:880px; height:90px;display: flex; justify-content:space-between;">
							<div style="width:180px; height:75px;">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;">시작일</label>
								<input type="date" class="startDate" style="margin-top: 5px; text-align:left; width:150px; height: 40px;">
							</div>
							<div style="width:180px; height:75px;">
								<label class="control-label" style="margin-left: 10px; margin-top:5px; text-align:left; width:165px;">종료일</label>
								<input type="date" class="endDate" style="margin-top: 5px; text-align:left; width:150px; height: 40px;">
							</div>	
							<div style="width:180px; height:75px;">
							</div>	
							<div style="width:300px; height:75px; text-align:center; display: flex; justify-content:space-around; margin-top: 10px; ">
								<select name="deal_year" class="deal_year" style="text-align:center; margin-right:5px; width:80px; height: 40px; margin-top: 27px; border: 1px solid black;">
										<option style="text-align: center;" value="">연도별</option>
								</select>
								<select name="deal_bungi" class="deal_bungi" style="text-align:center; margin-right:5px; width:80px; height: 40px; margin-top: 27px; border: 1px solid black;">
										<option style="text-align: center;" value="">분기별</option>
								</select>
								<select name="deal_month" class="deal_month" style="text-align:center; margin-right:5px; width:80px; height: 40px; margin-top: 27px; border: 1px solid black;">
										<option style="text-align: center;" value="">월별</option>
								</select>
							</div>
						</div>
						
						<div style="width: 880px; height: 310px; border-top: 1px solid #e3e3e3;">
							<canvas id="myChart" width="880px" height="310px"></canvas>
						</div>
					</div>					
				</form>		
			</div>
		</div>
		<!-- end card-body-->
	</div>
	<!-- end col -->
</div>


<script>
	$('.startDate').on('change',function(){
		$(".deal_bungi option:eq(0)").prop("selected", true);
		$(".deal_month option:eq(0)").prop("selected", true);
		$(".deal_year option:eq(0)").prop("selected", true);
	});
	
	$('.endDate').on('change',function(){
		$(".deal_bungi option:eq(0)").prop("selected", true);
		$(".deal_month option:eq(0)").prop("selected", true);
		$(".deal_year option:eq(0)").prop("selected", true);
		barChart();
	});
	
	$('.deal_year').on('change',function(){
		$(".deal_bungi option:eq(0)").prop("selected", true);
		$(".deal_month option:eq(0)").prop("selected", true);
		$(".startDate").val("");
		$(".endDate").val("");
		barChart();
	});
	
	$('.deal_bungi').on('change',function(){
		$(".deal_year option:eq(0)").prop("selected", true);
		$(".deal_month option:eq(0)").prop("selected", true);
		$(".startDate").val("");
		$(".endDate").val("");
		barChart();
	});
	
	$('.deal_month').on('change',function(){
		$(".deal_bungi option:eq(0)").prop("selected", true);
		$(".deal_year option:eq(0)").prop("selected", true);
		$(".startDate").val("");
		$(".endDate").val("");
		barChart();
	});
	
	function getToday(){
		var date = new Date();
		return date.getFullYear()+("0"+(date.getMonth()+1)).slice(-2)+("0"+(date.getDate()-1)).slice(-2);
	}
	var myChart;
	
	$(function(){
		var today = getToday();
		$.ajax({
			 url     : '${pageContext.request.contextPath}/user/accountBook/barChart.do',  
		       type    : 'post',
		       dataType: 'json',
		       data : {'mem_no':${LOGIN_MEMBERINFO.mem_no},'deal_month':(today.substring(4,6)+'월')},
		       success : function(result) {
					var listPlus = [];
					var listMinus = [];
					var la = [];				
					
					if(result.check == 1){
						$.each(result.label,function(i,v){
							la.push(v.d_date);
						})
					}else{
						$.each(result.label,function(i,v){
							var date = v.deal_date.split(' ');
							la.push(date[0]);
						})	
					}
					$.each(result.listPlus,function(i,v){						
						listPlus.push(v.totalPrice);
					})					
					$.each(result.listMinus,function(i,v){
						
						listMinus.push(v.totalPrice);
					})					
					console.log(la);
					/* Bar(la,listPlus,listMinus);	 */	


					var ctx = document.getElementById('myChart').getContext('2d');
					myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: la,
					        datasets: [{
					            label: '지출',
					            data: listPlus,		
					            backgroundColor : '#f3545d'         
					        },
					        {
					            label: '수입',
					            data: listMinus,		
					            backgroundColor : '#0095ff'            
					        }
					        ]
					    },
					    options: {
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero: true
					                }
					            }]
					        }
					    }
					});
			    }
		})
	})


	function barChart(){
		myChart.destroy();
		var startDate = $('.startDate').val();
		var endDate = $('.endDate').val();
		var deal_year = $('.deal_year').val();
		var deal_bungi = $('.deal_bungi').val();
		var deal_month = $('.deal_month').val();

		$.ajax({
			 url     : '${pageContext.request.contextPath}/user/accountBook/barChart.do',  
		       type    : 'post',
		       dataType: 'json',
		       data : {'mem_no':${LOGIN_MEMBERINFO.mem_no}, 'startDate':startDate, 'endDate':endDate, 'deal_year':deal_year, 'deal_bungi':deal_bungi,'deal_month':deal_month },
		       success : function(result) {
					var listPlus = [];
					var listMinus = [];
					var la = [];
					console.log(result.listPlus);
					console.log(result.listMinus);
					
					if(result.check == 1){
						$.each(result.label,function(i,v){
							la.push(v.d_date);
						})
					}else{
						$.each(result.label,function(i,v){
							var date = v.deal_date.split(' ');
							la.push(date[0]);
						})	
					}
					$.each(result.listPlus,function(i,v){						
						listPlus.push(v.totalPrice);
					})					
					$.each(result.listMinus,function(i,v){
						
						listMinus.push(v.totalPrice);
					})					
					console.log(la);
					Bar(la,listPlus,listMinus);					
			    }
		})
	}
	function Bar(la,listPlus,listMinus){
		var ctx = document.getElementById('myChart').getContext('2d');
		myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: la,
		        datasets: [{
		            label: '지출',
		            data: listMinus,		
		            backgroundColor : '#f3545d'         
		        },
		        {
		            label: '수입',
		            data: listPlus,		
		            backgroundColor : '#0095ff'            
		        }
		        ]
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero: true
		                }
		            }]
		        }
		    }
		});
	}
</script>


