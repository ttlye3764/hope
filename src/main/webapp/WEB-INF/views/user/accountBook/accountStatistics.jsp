<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    $(function () { 
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
				<form style="width: 880px; height: 800px; border-bottom: 1px solid black;">
					<div style="display: flex; justify-content:space-between; width: 880px; height: 800px;">
						<div style="width: 49%; height: 400px; display: flex; flex-direction : column; background-color: white; border: 1px solid #e3e3e3;">
						
							<div style="display: flex;"><h5>비용</h5></div>
							
							<div style="display: flex; justify-content:flex-start; align-items:center; height: 30px; border-bottom: 2px double gray;">
								<div style="width: 80px; text-align: left; color: black;">
									<span class="progressText"><B>총 비용</B></span>
								</div>
								<div class="progress" style="width:280px;">
									<div class="progress-bar" role="progressbar" aria-valuenow="40"
										aria-valuemin="0" aria-valuemax="100">
										<span class="popOver" data-toggle="tooltip"
											data-placement="right" title="5,000"> </span>
									</div>
								</div>
								<div style="margin-left: 40px;">
									<span>40%</span>
								</div>
							</div>
							
							<div style="display: flex; justify-content:flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
								<div style="width: 80px; text-align: left;">
									<span class="progressText"><B>식비</B></span>
								</div>
								<div class="progress" style="width:280px;">
									<div class="progress-bar" role="progressbar" aria-valuenow="0"
										aria-valuemin="0" aria-valuemax="100">
										<span class="popOver" data-toggle="tooltip"
											data-placement="right" title="0"> </span>
									</div>
								</div>
								<div style="margin-left: 40px;">
									<span>0%</span>
								</div>
							</div>
							<div style="display: flex; justify-content:flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
								<div style="width: 80px; text-align: left;">
									<span class="progressText"><B>교통비</B></span>
								</div>
								<div class="progress" style="width:280px;">
									<div class="progress-bar" role="progressbar" aria-valuenow="0"
										aria-valuemin="0" aria-valuemax="100">
										<span class="popOver" data-toggle="tooltip"
											data-placement="right" title="0"> </span>
									</div>
								</div>
								<div style="margin-left: 40px;">
									<span>0%</span>
								</div>
							</div>
							<div style="display: flex; justify-content:flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
								<div style="width: 80px; text-align: left;">
									<span class="progressText"><B>주거,통신</B></span>
								</div>
								<div class="progress" style="width:280px;">
									<div class="progress-bar" role="progressbar" aria-valuenow="0"
										aria-valuemin="0" aria-valuemax="100">
										<span class="popOver" data-toggle="tooltip"
											data-placement="right" title="0"> </span>
									</div>
								</div>
								<div style="margin-left: 40px;">
									<span>0%</span>
								</div>
							</div>

							<div style="display: flex; justify-content: flex-start; align-items: center; height: 30px; border-bottom: 2px double gray;">
								<div style="width: 80px; text-align: left; color: black;">
									<span class="progressText"><B>총 고정</B></span>
								</div>
								<div class="progress" style="width: 280px;">
									<div class="progress-bar" role="progressbar" aria-valuenow="40"
										aria-valuemin="0" aria-valuemax="100">
										<span class="popOver" data-toggle="tooltip"
											data-placement="right" title="5,000"> </span>
									</div>
								</div>
								<div style="margin-left: 40px;">
									<span>40%</span>
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
									<div class="progress" style="width:280px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="40"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="5,000"> </span>
										</div>
									</div>
									<div style="margin-left: 40px;">
										<span>40%</span>
									</div>
								</div>
								
								<div style="display: flex; justify-content:flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
									<div style="width: 80px; text-align: left;">
										<span class="progressText"><B>월급</B></span>
									</div>
									<div class="progress" style="width:280px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="0"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="0"> </span>
										</div>
									</div>
									<div style="margin-left: 40px;">
										<span>0%</span>
									</div>
								</div>
								<div style="display: flex; justify-content:flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
									<div style="width: 80px; text-align: left;">
										<span class="progressText"><B>상여금</B></span>
									</div>	
									<div class="progress" style="width:280px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="0"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="0"> </span>
										</div>
									</div>
									<div style="margin-left: 40px;">
										<span>0%</span>
									</div>
								</div>
								<div style="display: flex; justify-content:flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
									<div style="width: 80px; text-align: left;">
										<span class="progressText"><B>펀드,주식</B></span>
									</div>
									<div class="progress" style="width:280px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="0"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="0"> </span>
										</div>
									</div>
									<div style="margin-left: 40px;">
										<span>0%</span>
									</div>
								</div>
								<div style="display: flex; justify-content:flex-start; margin-top: 5px; border-bottom: 2px double #e3e3e3;">
									<div style="width: 80px; text-align: left;">
										<span class="progressText"><B>기타수익</B></span>
									</div>
									<div class="progress" style="width:280px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="0"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="0"> </span>
										</div>
									</div>
									<div style="margin-left: 40px;">
										<span>0%</span>
									</div>
								</div>
	
								<div style="display: flex; justify-content: flex-start; align-items: center; height: 30px; border-bottom: 2px double gray;">
									<div style="width: 80px; text-align: left; color: black;">
										<span class="progressText"><B>총 고정</B></span>
									</div>
									<div class="progress" style="width: 280px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="40"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="5,000"> </span>
										</div>
									</div>
									<div style="margin-left: 40px;">
										<span>40%</span>
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
									<div class="progress" style="width:280px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="40"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="5,000"> </span>
										</div>
									</div>
									<div style="margin-left: 40px;">
										<span>40%</span>
									</div>
								</div>
								<div style="display: flex; justify-content:flex-start; align-items:center; height: 30px; border-bottom: 2px double gray;">
									<div style="width: 80px; text-align: left; color: black;">
										<span class="progressText"><B>총 비용</B></span>
									</div>
									<div class="progress" style="width:280px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="40"
											aria-valuemin="0" aria-valuemax="100">
											<span class="popOver" data-toggle="tooltip"
												data-placement="right" title="5,000"> </span>
										</div>
									</div>
									<div style="margin-left: 40px;">
										<span>40%</span>
									</div>
								</div>
								
								<div style="width: 100px; text-align: left; color: black;">
									<span class="progressText"><B>당기순손익</B></span>
								</div>
								<div  style="width: 300px; height: 80px; text-align: center;">
									+ 0
								</div>
								
								
								
								
								
								
							</div>
						</div>
					</div>
				</form>		
			</div>
		</div>
		<!-- end card-body-->
	</div>
	<!-- end col -->
</div>