<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
	#fix1{
		width:300px;
		height:300px;
		background-color: red;
		position: fixed;
		top: 500px;
		right: 0px;
		z-index: 1;
	}
	#fix2{
		width:300px;
		height:300px;
		background-color: black;
		position: fixed;
		top: 400px;
		right: 200px;
		z-index: 1;
	}




	#body1 {
	font-size: $f-baseSize;
  	font-family: $f-family;
  	font-weight: $f-weight;
 	
	
	
	margin-right:10%;
	margin-bottom: 20%;
    height: 1200px;
    font-family: 'Noto Sans KR', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', sans-serif;
    font-weight: 400;
    letter-spacing: -0.024em;
    overflow-x: hidden;
    line-height: 1;   
	}
	#body1 li{
	list-style: none;
	}
	.mainlive_container {
    padding-top: 5px;
    padding-bottom: 10px;
    width: 100%;
    height: auto;
    overflow: hidden;
/*     background-color: #eeefef;*/
}
	.liveNumOuter h2 {
    width: 100%;
    font-size: 18px;
    line-height: 22px;
    font-weight: 600;
    color: #174069;
	}
	.liveNum1{
	width:30%;
    height: 42px;
/* 	float: left; */
    margin-left: 3px;
    background-color: aliceblue;
    line-height: 40px;
    text-align: center;
	}
	.liveNum2{
	width: 34%;
	height: 42px;
/*     float: left; */
    margin-left: 1px;
    margin-right: 1px;
    background-color: #288000;
    line-height: 40px;
    text-align: center;
    color: white;
	}
    .liveNum3{
	width:35%;
	height: 42px;
/*     float: left; */
    margin-right: 2px;
    background-color: #288000;
    line-height: 40px;
    text-align: center;
	color: white;
    }

    .liveTest .suminfo .tit {
    font-size: 13px;
    color: #666;
    font-weight: 600;
    letter-spacing: -0.075em;
}
    .liveTest .suminfo .num {
    font-family: 'Spoqa Han Sans';
    font-weight: 600;
    font-size: 16px;
    color: #174069;
    text-align: right;
}
    
    .liveTest .suminfo .num {
    font-family: 'Spoqa Han Sans';
    font-weight: 600;
    font-size: 16px;
    color: #174069;
    text-align: right;
}
    .liveTest > * {
    display: table-cell;
    vertical-align: top;
}
    .liveTest .info_core {
    width: 30%;
    padding-bottom: 20px;
}
.c_chart_is {
    position: relative;
    padding: 70px 0 10px 0;
}
<!-- pie차트------------------------------------------------------------------------------------------------------------------------------------------ -->
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);

@keyframes bake-pie {
  from {
    transform: rotate(0deg) translate3d(0,0,0);
  }
}


.pieID {
  display: inline-block;
  vertical-align: top;
}
.pie {
  height: 200px;
  width: 200px;
  position: relative;
  margin: 0 30px 30px 0;
}
.pie::before {
  content: "";
  display: block;
  position: absolute;
  z-index: 1;
  width: 100px;
  height: 100px;
  background: #EEE;
  border-radius: 50%;
  top: 50px;
  left: 50px;
}
.pie::after {
  content: "";
  display: block;
  width: 120px;
  height: 2px;
  background: rgba(0,0,0,0.1);
  border-radius: 50%;
  box-shadow: 0 0 3px 4px rgba(0,0,0,0.1);
  margin: 220px auto;
  
}
.slice {
  position: absolute;
  width: 200px;
  height: 200px;
  clip: rect(0px, 200px, 200px, 100px);
  animation: bake-pie 1s;
}
.slice span {
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  background-color: black;
  width: 200px;
  height: 200px;
  border-radius: 50%;
  clip: rect(0px, 200px, 200px, 100px);
}
.legend {
  list-style-type: none;
  padding: 0;
  margin: 0;
  background: #FFF;
  padding: 15px;
  font-size: 13px;
  box-shadow: 1px 1px 0 #DDD,
              2px 2px 0 #BBB;
}
.legend li {
  width: 110px;
  height: 1.25em;
  margin-bottom: 0.7em;
  padding-left: 0.5em;
  border-left: 1.25em solid black;
}
.legend em {
  font-style: normal;
}
.legend span {
  float: right;
}
#item_small{
	display: block; margin-top:10px; margin-bottom:5px; font-size:11px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;
}    
    
#item-info{
	display: inline-block; text-align: center;  
}    
#item_span1{
	display: block; margin-bottom:1px; font-size:15px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;
} 
#item_span2{
	display: block; font-size:10px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;
}
#item-info-box{
 	position: absolute;  border-radius:5px 5px 5px 5px; z-index: 1; background-color:white; 
}
    
</style>



	










<section class="blog-page pb-0">
		<div class="container">
			<div class="row">
				
				<!-- sidebar end -->

				<!-- blog start -->
				<div class="col-md-9 order-first order-lg-first" style="width: 800px;">		

			



		<div id="body1" style="width: 800px;">
			<div class="mainlive_container" style="width:800px;">
					<div class="liveNumOuter">				
						<div style="display: flex; justify-content: space-between;">
							<div class="liveNum1">
								<strong class="tit">일일현황</strong>
							</div>
							<div class="liveNum2">						
								<!-- <span class="subtit" style="font-size:14px;">국내발생  </span><span class="data" style="color: yellow; font-size:19px;">238</span> -->
							</div>
							<div class="liveNum3">	
								<!-- <span class="subtit" style="font-size:14px;">해외유입  </span><span class="data" style="color: yellow; font-size:19px;">10</span> -->
			                </div>
						</div>
		                <div style="margin: 5px 0px 0px 0px;">
			                <div class="counter counter-light counter-small" style="display: flex;">
									<div class="" style="background: #0099ff; width: 25%; height: 100px;">
										<div style="display: flex; justify-content: center; align-items: center; height: 100px;">
											<div>
												<div style="display: flex; justify-content: center;">
													<strong class="tit"  style="color: white; font-size:19px; margin-bottom: 2px;">확진환자</strong>
												</div>
												<div id="decideDiv">
													<span class="mini" style="font-size:14px; color: white;">(누적)</span>
													<!-- <span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="20182" data-speed="3000" data-refresh-interval="10" style="font-size:30px;"></span><br> -->
												</div>	
												<div id="toDayDecideDiv" style="display: flex; justify-content: center;">
													<!-- <span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">전일대비 (+ 235)</span> -->
												</div>
											</div>
										</div>					
									</div>
									<div class="" style="background: #006699; width: 25%; height: 100px;">
										<div style="display: flex; justify-content: center; align-items: center; height: 100px;">
											<div>
												<div style="display: flex; justify-content: center;">
													<strong class="tit"  style="color: white; font-size:19px; margin-bottom: 2px;">격리해제</strong>
												</div>
												<div id="clearDiv">
													<!-- <span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="15198" data-speed="3000" data-refresh-interval="10" style="font-size:30px;"></span><br> -->
													
												</div>
												<div id="toDayClearDiv" style="display: flex; justify-content: center;">
													<!-- <span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">(+ 225)</span> -->
												</div>
											</div>
										</div>					
									</div>
									<div class="" style="background: #174069; width: 25%; height: 100px;">
										<div style="display: flex; justify-content: center; align-items: center; height: 100px;">
											<div>
												<div style="display: flex; justify-content: center;">
													<strong class="tit"  style="color: white; font-size:19px; margin-bottom: 2px;">격리중</strong>
												</div>
												<div id="careDiv">
													<!-- <span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="4660" data-speed="3000" data-refresh-interval="10" style="font-size:30px;"></span><br> -->
													
												</div>
												<div id="toDayCareDiv" style="display: flex; justify-content: center;">
													<!-- <span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">(+ 10)</span> -->
												</div>
											</div>
										</div>					
									</div>
									
									<div class="" style="background: #808080; width: 25%; height: 100px;">
										<div style="display: flex; justify-content: center; align-items: center; height: 100px;">
											<div>
												<div style="display: flex; justify-content: center;">
													<strong class="tit"  style="color: white; font-size:19px;">사망자</strong>
												</div>
												<div id="deathDiv">
													<!-- <span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="324" data-speed="3000" data-refresh-interval="10" style="font-size:30px;"></span><br> -->
												</div>
												<div id="toDayDeathDiv" style="display: flex; justify-content: center;">
													<!-- <span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">(+ 0)</span> -->
												</div>
											</div>
										</div>					
									</div>
							</div>
		                </div>
		
		
						<div class="liveTest main_box_toggle" style="height: 250px; margin-top: 5px; border-top: 3px solid #164068; display: flex; justify-content: space-between;">
							<div class="" style="background-color:#eafdff; width: 25%; height: 100%; ">
									<div style="display: flex; justify-content: center; align-items: center;">
										<span class="title" style="font-size:15px; margin-bottom: 0px; margin-top: 15px; font-family: 'Spoqa Han Sans'; font-weight: 600; font-size: 16px; color: #174069;">검사현황</span>
									</div>
								<ul class="suminfo" style="height: 180px; display: flex; flex-direction : column">
									<li style="margin-bottom: 25px;">
										<div style="display: flex; justify-content: space-between;">
											<div style="margin-left: 5px;">
												<span class="tit" style="font-size:14px; ">누적 검사수</span>
											</div>
											<div id="examDiv" style="margin-right: 5px;">
												<!-- <span class="num" style="font-size:14px;">1,959,080건</span> -->
											</div>
										</div>
									</li>
									<li style="margin-bottom: 25px;">
										<div style="display: flex; justify-content: space-between;">
											<div style="margin-left: 5px;">
												<span class="tit" style="font-size:14px;">누적 검사완료수</span>
											</div>
											<div id="examCompDiv" style="margin-right: 5px;">
												<!-- <span class="num" style="font-size:14px;">1,902,337건</span> -->
											</div>
										</div>
									</li>
									<li style="">
										<div style="display: flex; justify-content: space-between;">
											<div style="margin-left: 5px;">
											<span class="tit" style="font-size:14px;">누적 확진율</span>
											</div>
											<div id="defRateDiv" style="margin-right: 5px;">
												<!-- <span class="num" style="font-size:14px;">1.1%</span> -->
											</div>	
										</div>
										<div style="margin-left: 5px;">
										<span class="tit" style="display: block; font-size: 11px; line-height: 1.25em;">(결과양성 / 총 검사완료수 * 100%)</span>
										</div>
									</li>							
								</ul>
							</div>
												
							<div class="" style="width: 75%; " >
									<div style="height: 30px; display: flex; justify-content: center; align-items: center; background-color: #e6f6ff" >
										<div>
											<span class="title" style=" margin-top:10px;  margin-bottom: 0px; font-family: 'Spoqa Han Sans'; font-size: 16px; color: #174069;">일별 확진환자 발생 및 완치 추세</span>
										</div>
									</div>
									<div style="display: flex; flex-direction: column; height: 220px;">
										  	<!-- line chart canvas element -->
										<canvas id="myChart"  style="height: 220px; width: 100%; margin-left: 5px;"></canvas>		<!-- height: 190px; width: 100%; -->			       
									</div>
									
									<!-- <div style="height:28px; display: flex; justify-content: center; align-items: center;">
										<div style="width: 15px; height: 15px; background-color: gray;  margin-top:10px;"></div>
										<span class="title" style=" margin-left:3px; margin-top:10px;">사망</span>
										<div style="width: 15px; height: 15px; background-color: red;  margin-top:10px;"></div>
										<span class="title" style=" margin-left:3px; margin-top:10px;">확진</span>
										<div style="width: 15px; height: 15px; background-color: skyblue;  margin-top:10px;"></div>
										<span class="title" style=" margin-left:3px; margin-top:10px;">격리해제</span>
									</div> -->
							</div>
							
						</div> <!-- 차트쪽 div -->
						<%-- <img id="imgTag" usemap="#Map" border="0" src="${pageContext.request.contextPath }/images/korea.PNG" style="width: 980px; height:747px; z-index: -1;">
							<map name="Map" id="Map">
								<area shape="rect" coords="100,100,55,50" title="서울" href="#" type="${pageContext.request.contextPath }/images/korea.PNG">
							</map> --%>
						
						
						<%-- <div class="liveTest main_box_toggle" style="height: 747px; margin-top: 5px; border-top: 3px solid #164068; display: flex; justify-content: space-between;">
							<div style="width: 75%; height: 747px; position:relative;">
									<img id="imgTag" usemap="#Map" border="0" src="${pageContext.request.contextPath }/images/korea.PNG" style="width: 980px; height:747px; z-index: -1;">
									<map name="Map" id="Map">
										<area shape="rect" coords="11,13,56,24" title="서울" style="border: 1px solid black;" href="#">
									</map>
							</div> 
							<div style="width: 25%; height: 747px; background-color: pink; "></div>
						</div> --%>
		
						<div class="liveTest main_box_toggle" style="height: 747px; margin-top: 5px; border-top: 3px solid #164068; display: flex; justify-content: space-between;">
							<div class="item-wrapper" style="display: inline-block; position: relative; width: 100%; height: 700px;">
							    <div class="item-image">
							   		<img id="imgTag" border="0" src="${pageContext.request.contextPath }/images/korea.PNG" style="width: 100%; height:700px; z-index: -1;">
							    </div>
							    <div class="item-info-box" id="item-info-box" style="height: 40px; right: 0px; top: 0px; background-color: rgb(233,233,233);">
							   		<small id="item_small">시도를 클릭하시면 상세 현황을 확인할 수 있습니다.</small> 
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 55px; height: 70px;left: 213px; top: 145px;">
								    <div class="item-info" id="item-inchun" onclick="getCorona('인천');" style="width: 55px; height: 70px; text-align: center;">
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 58px; height: 66px; left: 325px; top: 144px;">
								    <div class="item-info" id="item-seoul" onclick="getCorona('서울');" style=" width: 58px; height: 66px;  text-align: center;">
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 60px; height: 68px; left: 322px; top: 60px;">
								    <div class="item-info" id="item-kyenggi" onclick="getCorona('경기');" style="width: 60px; height: 68px;  text-align: center;">
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px; left: 430px; top: 108px;">
								    <div class="item-info" id="item-kangwon" onclick="getCorona('강원');" style=" width: 50px; height: 67px;  text-align: center;">
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px;left: 380px; top: 202px;">
								    <div class="item-info" id="item-chungbuk" onclick="getCorona('충북');" style=" width: 50px; height: 67px;  text-align: center;">
								    </div>	
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px;left: 352px; top: 288px;">
								    <div class="item-info" id="item-daejeon" onclick="getCorona('대전');" style=" width: 50px; height: 67px;  text-align: center;">
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px;left: 296px; top: 234px;">
								    <div class="item-info" id="item-seyjong" onclick="getCorona('세종');" style="width: 50px; height: 67px;  text-align: center;">
								    </div>
							    </div>
							       <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px; left: 228px; top: 293px;">
								    <div class="item-info" id="item-chungnam" onclick="getCorona('충남');" style=" width: 50px; height: 67px;  text-align: center;">
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 43px; height: 68px; left: 296px; top: 374px;">
								    <div class="item-info" id="item-junbook" onclick="getCorona('전북');" style=" width: 43px; height: 68px;  text-align: center;">
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 68px;left: 286px; top: 473px;">
								    <div class="item-info" id="item-gwangju" onclick="getCorona('광주');" style=" width: 53px; height: 68px;  text-align: center;">
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 68px;left: 211px; top: 501px;">
								    <div class="item-info" id="item-junnam" onclick="getCorona('전남');" style=" width: 53px; height: 68px;  text-align: center;">
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 68px; left: 233px; top: 622px;">
								    <div class="item-info" id="item-jeju" onclick="getCorona('제주');" style=" width: 53px; height: 68px;  text-align: center;">
								    </div>
							    </div>
							       <div class="item-info-box" id="item-info-box" style="width: 60px; height: 67px;left: 458px; top: 266px;">
								    <div class="item-info" id="item-kyengbook" onclick="getCorona('경북');" style=" width: 60px; height: 67px;  text-align: center;">
								    </div>
							    </div>
							       <div class="item-info-box" id="item-info-box" style="width: 60px; height: 67px; left: 481px; top: 348px;">
								    <div class="item-info" id="item-daegu" onclick="getCorona('대구');" style=" width: 60px; height: 67px;  text-align: center;">
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 68px; left: 400px; top: 451px;">
								    <div class="item-info" id="item-kyengnam" onclick="getCorona('경남');" style=" width: 53px; height: 68px;  text-align: center;">
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 72px; left: 548px; top: 454px;">
								    <div class="item-info" id="item-ulsan" onclick="getCorona('울산');" style=" width: 53px; height: 72px;  text-align: center;">
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 55px; height: 70px; left: 492px; top: 511px;">
								    <div class="item-info" id="item-busan" onclick="getCorona('부산');" style="width: 55px; height: 70px;  text-align: center;">
								    </div>
							    </div>							    
							    <div class="item-info-box" id="item-info-box" style="width: 67px; height: 70px; left: 515px; top: 583px;">
								    <div class="item-info" id="item-gumyoc" onclick="getCorona('검역');" style=" width: 67px; height: 70px;  text-align: center;">
								    </div>
							    </div>
						    </div>	
						</div>
				</div>
			</div>
		</div>	
		
		
		
		<div> <a href="#" class="back-top btn btn-grad"><i class="ti-angle-up"></i></a> </div>
	

								

				</div>
				<!-- blog End -->
				<aside class="col-md-3 sidebar order-last order-md-first" style="margin-top: 5px; width:330px;">
					<div style="height: 400px; width:280px; border: 1px solid black;">
						<div style="background-color: #174069;    height: 50px; font-family: 'Spoqa Han Sans'; color: white; text-align: center;">
							<div style="">
								<strong class="tit" style="color: white; font-size:19px; ">연령/성별 확진자 현황</strong>
							</div>
						</div>
						<div class="cc_graph"  style="display: flex; flex-direction : column; height: 200px; border-bottom:3px solid #164068; ">
							<canvas id="AgePieChart"  style="height: 200px; width: 278px; "></canvas>		<!-- height: 190px; width: 100%; -->
						</div>
						<div class="cc_graph"  style="display: flex; flex-direction : column; height: 200px;">
							<canvas id="AgeBarChart"  style="height: 150px; width: 278px; margin-top: 5px;"></canvas>		<!-- height: 190px; width: 100%; -->
						</div>






					</div>
					<div style="margin-top: 7px; height: 705px; width:280px;  border-top: 3px solid #164068; background-color: rgb(233,233,233);">
						<strong id="strongID1" style="display:block; margin-top: 18px; margin-left:12px; color: #174069; font-family: 'Spoqa Han Sans'; font-size:20px;"></strong>
						
						<div style="background-color: rgb(233, 233, 233); height: 400px; margin-top: 10px;">
						<div class="chart_d" style="height: 400px;" >
								<div style="height: 400px;">
									<div class="cc_graph"  style="display: flex; flex-direction : column; height: 400px; border-bottom:3px solid #164068; ">
									<canvas id="myPieChart"  style="height: 400px; width: 400px; margin-left: 5px;"></canvas>		<!-- height: 190px; width: 100%; -->
									</div>
								</div>
							</div>						
						</div>

						<div style="background-color: rgb(233,233,233);  height: 239px; display: flex; align-items:center ">
							<div style="display: flex; flex-direction: column; width: 300px;">
								<div style="display: flex; justify-content: space-between;">
									<div style="margin-left: 5px; height: 13px;">
										<span class="tit" style="font-size: 14px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">누적 확진환자</span>
									</div>
									<div style="margin-right: 5px; height: 13px;">
										<p style="font-size: 14px;"><span class="num chart_span1" style="font-size: 15px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">751</span>명</p>
									</div>
								</div>
								
								<div style="display: flex; justify-content: space-between;">
									<div style="margin-left: 5px;">
										<span class="tit" style="margin-top:1px; font-size: 11px; font-family: 'Spoqa Han Sans'; color: rgb(235, 33, 77);">전일 대비 증감</span>
									</div>
									<div style="margin-right: 5px;">
										<span class="num chart_span2" style="font-size: 11px; font-family: 'Spoqa Han Sans'; color: rgb(235, 33, 77);">(+11)</span>
									</div>
								</div>
								
								<div style="display: flex; justify-content: space-between; margin-top: 5px;">
									<div style="margin-left: 5px;">
										<span class="tit" style="font-size: 14px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">격리중</span>
									</div>
									<div style="margin-right: 5px;">
										<p style="font-size: 14px;"><span class="num chart_span3" style="font-size: 15px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">321</span>명</p>
									</div>
								</div>
								
								<div style="display: flex; justify-content: space-between;">
									<div style="margin-left: 5px;">
										<span class="tit" style="font-size: 14px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">누적 격리해제</span>
									</div>
									<div style="margin-right: 5px;">
										<p style="font-size: 14px;"><span class="num chart_span4" style="font-size: 15px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">427</span>명</p>
									</div>
								</div>
								
								<div style="display: flex; justify-content: space-between;">
									<div style="margin-left: 5px;">
										<span class="tit" style="font-size: 14px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">사망자</span>
									</div>
									<div style="margin-right: 5px;">
										<p style="font-size: 14px;"><span class="num chart_span5" style="font-size: 15px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">3</span>명</p>
									</div>
								</div>
								
								<div style="display: flex; justify-content: space-between;">
									<div style="margin-left: 5px;">
										<span class="tit" style="font-size: 14px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">10만명당 발생률</span>
									</div>
									<div style="margin-right: 5px;">
										<p style="font-size: 10px;"><span class="num chart_span6" style="font-size: 15px; font-family: 'Spoqa Han Sans'; font-weight: 600; color: #174069;">25.4</span>명</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					
					
					
					
					
				</aside>
				
				
				
			</div>
		</div>
	</section>
	
	
<script>
var pieChart;
var ageBarChart;
var agePieChart;
var ctxAgePie = document.getElementById('AgePieChart').getContext('2d');
var ctxAgeBar = document.getElementById('AgeBarChart').getContext('2d');
var ctxLine = document.getElementById('myChart').getContext('2d');
var ctxPie = document.getElementById('myPieChart').getContext('2d');
	var dateList = [];
	var dataList = [];
	var deathList = [];
	var clearList = [];
	var decideList = [];
	
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}




var list = new Array();

function getToday(){
	var date = new Date();
	return date.getFullYear()+("0"+(date.getMonth()+1)).slice(-2)+("0"+(date.getDate()-1)).slice(-2);
}
function endday(){
	var date = new Date();
	return date.getFullYear()+("0"+(date.getMonth()+1)).slice(-2)+("0"+(date.getDate())).slice(-2);
}
function startday(){

	var caledmonth, caledday, caledYear;
	var loadDt = new Date();
	var date = new Date(Date.parse(loadDt) - 7 * 1000 * 60 * 60 * 24);

	caledYear = date.getFullYear();

	if( date.getMonth() < 9 ){
		  caledmonth = '0'+(date.getMonth()+1);
	}else{
		  caledmonth = date.getMonth()+1;
	}
	if( date.getDate() < 9 ){
		  caledday = '0'+date.getDate();
	}else{
		  caledday = date.getDate();
	}
	var result =  caledYear+caledmonth+caledday;
	return result;
}

var date = getToday();
var startdate = startday();
var enddate = endday();

function getCorona(name1){
	$.ajax({
        url     : '${pageContext.request.contextPath}/user/medical/coronaSidoAPI.do',
        type    : 'post',
        dataType: 'json',
        data : {'date':date },
        success : function(result) {
			//console.log(result.response.body.items.item);
			var target = 0;
			var all = 0;
			all = result.response.body.items.item[18].defCnt;
			
			$.each(result.response.body.items.item, function(key,value){//인덱스, 벨류
				if(key < 19){
					if(value.gubun == name1){
						$('#strongID1').text(name1);
						var data = numberWithCommas(value.defCnt);
						$('.chart_span1').text(data);
						
						data = numberWithCommas(value.incDec);
						$('.chart_span2').text('(+'+data+')');
	
						data = numberWithCommas(value.isolIngCnt);
						$('.chart_span3').text(data);
						
						data = numberWithCommas(value.isolClearCnt);
						$('.chart_span4').text(data);
						
						data = numberWithCommas(value.deathCnt);					
						$('.chart_span5').text(data);
	
						data = numberWithCommas(value.qurRate);	
						$('.chart_span6').text(data);
							target = value.defCnt;
						}
				}
	        });
			resetPieChart();
			dataList[0] = all;
			dataList[1] = target;
			var label = [];
			label[0] = '전체';
			label[1] = name1;
			PieChart(label,dataList);
			




			
        }
	});


	/*<li>
      <em>대구</em>
      <span>7072</span>
   	 </li>
  	 <li>
      <em>서울</em>
      <span>4201</span>
     </li> */
	
};


$(function(){

/* 	$('.item-info-box').on('click',function(){
		var name = $(this).find('small').text();
		var value1 = $(this).find('span:eq(0)').text();
		var value2 = $(this).find('span:eq(1)').text();
		$('#strongID1').text(name);
		$('.chart_span1').text(value1);
		$('.chart_span2').text(value2);
	}) */

	$.ajax({
		 url     : '${pageContext.request.contextPath}/user/medical/coronaAgeAPI.do',  //나이/성별
	        type    : 'post',
	        dataType: 'json',
	        data : {'startdate':startdate,'enddate':startdate },
	        success : function(result) {
				var list = [];
				var la = [];
				console.log('연령별');
				console.log(result.response.body.items.item);
				$.each(result.response.body.items.item,function(i,v){
					if(i<9){
					list.push(v.confCase);
					la.push(v.gubun);
					}
				})
				AgeBarChart(la,list);
				list = [];
				la = [];
				$.each(result.response.body.items.item,function(i,v){
					if(i>8 && i<11){
					list.push(v.confCase);
					la.push(v.gubun);
						}
				})
				AgePieChart(la,list);
		    }
	})









	
	$.ajax({
        url     : '${pageContext.request.contextPath}/user/medical/coronaAPI.do',  //총 코로나
        type    : 'post',
        dataType: 'json',
        data : {'startdate':startdate,'enddate':enddate },
        success : function(result) {
			console.log(result.response.body.items.item);

			$.each(result.response.body.items.item,function(i,v){
				var str = v.stateDt+"";
				if(i!=6){
					str = str.substring(4,6) + "-" + str.substring(6,8);
					dateList.push(str);
				}
				
				str = v.clearCnt
				clearList.push(str);
				str = v.deathCnt
				deathList.push(str);
				str = v.decideCnt
				decideList.push(str);
			});
			dateList.reverse();
			var clear = clearList.reverse();
			clearList = [];
			var death = deathList.reverse();
			deathList = [];
			var decide = decideList.reverse();
			decideList = [];
			/* $.each(clear,function(ind,val){
				if(ind != 0){
					var value = parseInt(val[ind]) - parseInt(val[ind-1]);
					console.log(typeof val[ind]);
					clearList.push(value);
				}
			}); */


			for(var i=0;i<clear.length;i++){
				if(i != 0){
					var value = clear[i] - clear[i-1];
					clearList.push(value);
				}
			}
			for(var i=0;i<death.length;i++){
				if(i != 0){
					var value = death[i] - death[i-1];
					deathList.push(value);
				}
			}
			for(var i=0;i<decide.length;i++){
				if(i != 0){
					var value = decide[i] - decide[i-1];
					decideList.push(value);
				}
			}
			drawChart(dateList,clearList,deathList,decideList);
			
			
			/*var date = result.response.body.items.item[0].stateDt + "";
			 
			date = date.substring(4,8);
			date = (date*1)-7;
			alert(date);
			 */
			var todayDecide = result.response.body.items.item[0].decideCnt - result.response.body.items.item[1].decideCnt;
			var todayClear = result.response.body.items.item[0].clearCnt - result.response.body.items.item[1].clearCnt;
			var todayCare = result.response.body.items.item[0].careCnt - result.response.body.items.item[1].careCnt;
			var todayDeath = result.response.body.items.item[0].deathCnt - result.response.body.items.item[1].deathCnt;
			var str = '<span class="subtit" style="font-size:14px;">확진 </span><span class="data" style="color: yellow; font-size:19px;">'+todayDecide+'</span>';
			$('.liveNum2').append(str);
			str = '<span class="subtit" style="font-size:14px;">격리해제 </span><span class="data" style="color: yellow; font-size:19px;">'+todayClear+'</span>';
			$('.liveNum3').append(str);
			
			var decide = result.response.body.items.item[0].decideCnt; //누적 확진자수
			var death = result.response.body.items.item[0].deathCnt; //누적 사망자수
			var clear = result.response.body.items.item[0].clearCnt; //누적 격리해제 
			var care = result.response.body.items.item[0].careCnt; //누적 격리중

			if(todayDecide > 0){
				todayDecide = "+ " + todayDecide;
			}
			if(todayClear > 0){
				todayClear = "+ " + todayClear;
			}
			if(todayCare > 0){
				todayCare = "+ " + todayCare;
			}
			if(todayDeath > 0){
				todayDeath = "+ " + todayDeath;
			}
			
			str = '<span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="'+decide+'" data-speed="3000" data-refresh-interval="10" style="font-size:30px;">'+decide+'</span><br>';
			$('#decideDiv').append(str);
			str = '<span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">전일대비 ('+todayDecide+')</span>';
			$('#toDayDecideDiv').append(str); 

			str = '<span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="'+clear+'" data-speed="3000" data-refresh-interval="10" style="font-size:30px;">'+clear+'</span><br>';
			$('#clearDiv').append(str);
			str = '<span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">('+todayClear+')</span>';
			$('#toDayClearDiv').append(str);

			str= '<span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="'+care+'" data-speed="3000" data-refresh-interval="10" style="font-size:30px;">'+care+'</span><br>';
			$('#careDiv').append(str);
			str = '<span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">('+todayCare+')</span>';
			$('#toDayCareDiv').append(str);

			str = '<span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="'+death+'" data-speed="3000" data-refresh-interval="10" style="font-size:30px;">'+death+'</span><br>';
			$('#deathDiv').append(str);
			str = '<span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">('+todayDeath+')</span>';
			$('#toDayDeathDiv').append(str);


			var examCnt = result.response.body.items.item[0].accExamCnt;		//누적 검사수
			var examCompCnt = result.response.body.items.item[0].accExamCompCnt; //누적 검사 완료 수
			var defRate = result.response.body.items.item[0].accDefRate; //누적 확진률
			defRate = defRate.toFixed(2);
			



			
			examCnt = numberWithCommas(examCnt);
			str = '<span class="num" style="font-size:14px;">'+examCnt+'건</span>';
			$('#examDiv').append(str);

			examCompCnt = numberWithCommas(examCompCnt);
			str = '<span class="num" style="font-size:14px;">'+examCompCnt+'건</span>';
			$('#examCompDiv').append(str);
			str = '<span class="num" style="font-size:14px;">'+defRate+'%</span>';
			$('#defRateDiv').append(str);
			/* <accDefRate>1.0611161854	누적 확진률
			<accExamCnt>1937689			누적 검사 수
			<accExamCompCnt>1879813	누적 검사 완료 수
			<careCnt>4650			치료중 환자 수
			<clearCnt>14973			격리해제 수				
			<deathCnt>324				사망자 수
			<decideCnt>19947			확진자 수
			<examCnt>57876			검사진행 수
			<resutlNegCnt>1859866		결과 음성 수
			<seq>247				감연현황 고유값
			<stateDt>20200831			기준일
			<stateTime>00:00			기준시간 */
		}
	});

	console.log("dd");
	console.log(dateList);
	console.log(clearList);
	console.log(deathList);
	console.log(decideList);
	
	$.ajax({
        url     : '${pageContext.request.contextPath}/user/medical/coronaSidoAPI.do',
        type    : 'post',
        dataType: 'json',
        data : {'date':date },
        success : function(result) {
			console.log(result.response.body.items.item);
			
			var n1;
			var n2;
			var n3;
			var n4;
			var labels = [];
			labels.push('전체');
			dataList.push(result.response.body.items.item[18].defCnt);
			
			PieChart(labels, dataList);
			



			
			/* <deathCnt>0			사망자 수       
			<defCnt>45		확진자 수
			<gubun>제주			시도명			
			<incDec>6			전일대비 증감 수
			<isolClearCnt>26		격리 해제 수
			<isolIngCnt>19			격리중 환자 수
			<localOccCnt>5		지역발생 수
			<overFlowCnt>1		해외유입 수
			<qurRate>6.71		10만명당 발생률
			<seq>4072				국내 시도별 발생현황
			<stdDay>2020년 08월 31일 00시	기준일시 */

			//result.response.body.items.item[0] - 검역
			//result.response.body.items.item[1] - 제주
			//result.response.body.items.item[2] - 경남
			//result.response.body.items.item[3] - 경북
			//result.response.body.items.item[4] - 전남
			//result.response.body.items.item[5] - 전북
			//result.response.body.items.item[6] - 충남
			//result.response.body.items.item[7] - 충북
			//result.response.body.items.item[8] - 강원
			//result.response.body.items.item[9] - 경기
			//result.response.body.items.item[10] - 세종
			//result.response.body.items.item[11] - 울산
			//result.response.body.items.item[12] - 대전
			//result.response.body.items.item[13] - 광주
			//result.response.body.items.item[14] - 인천
			//result.response.body.items.item[15] - 대구
			//result.response.body.items.item[16] - 부산
			//result.response.body.items.item[17] - 서울
			//result.response.body.items.item[18] - 합계

			$('#strongID1').text("전국");
			
			var data = numberWithCommas(result.response.body.items.item[18].defCnt);
			$('.chart_span1').text(data);
			
			data = numberWithCommas(result.response.body.items.item[18].incDec);
			$('.chart_span2').text('(+'+data+')');
			
			data = numberWithCommas(result.response.body.items.item[18].isolIngCnt);
			$('.chart_span3').text(data);
			
			data = numberWithCommas(result.response.body.items.item[18].isolClearCnt);
			$('.chart_span4').text(data);

			data = numberWithCommas(result.response.body.items.item[18].deathCnt);
			$('.chart_span5').text(data);

			data = numberWithCommas(result.response.body.items.item[18].qurRate);
			$('.chart_span6').text(data);


	    	
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[0].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[0].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[0].incDec+')</span>';
	    	$('#item-gumyoc').append(str);
			
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[1].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[1].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[1].incDec+')</span>';
	    	$('#item-jeju').append(str);
			
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[2].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[2].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[2].incDec+')</span>';
	    	$('#item-kyengnam').append(str);
			
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[3].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[3].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[3].incDec+')</span>';
	    	$('#item-kyengbook').append(str);
			
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[4].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[4].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[4].incDec+')</span>';
	    	$('#item-junnam').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[5].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[5].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[5].incDec+')</span>';
	    	$('#item-junbook').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[6].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[6].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[6].incDec+')</span>';
	    	$('#item-chungnam').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[7].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[7].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[7].incDec+')</span>';
	    	$('#item-chungbuk').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[8].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[8].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[8].incDec+')</span>';
	    	$('#item-kangwon').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[9].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[9].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[9].incDec+')</span>';
	    	$('#item-kyenggi').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[10].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[10].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[10].incDec+')</span>';
	    	$('#item-seyjong').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[11].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[11].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[11].incDec+')</span>';
	    	$('#item-ulsan').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[12].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[12].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[12].incDec+')</span>';
	    	$('#item-daejeon').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[13].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[13].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[13].incDec+')</span>';
	    	$('#item-gwangju').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[14].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[14].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[14].incDec+')</span>';
	    	$('#item-inchun').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[15].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[15].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[15].incDec+')</span>';
	    	$('#item-daegu').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[16].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[16].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[16].incDec+')</span>';
	    	$('#item-busan').append(str);
	    	
			var str = '<small id="item_small">'+result.response.body.items.item[17].gubun+'</small>';
			str += '<span class="status in-progress" id="item_span1">'+result.response.body.items.item[17].defCnt+'</span>';
			str += '<span class="status in-progress" id="item_span2">(+'+result.response.body.items.item[17].incDec+')</span>';
	    	$('#item-seoul').append(str);
			
        }
	});
	
}); //$(function())

function drawChart(dateList,clearList,deathList,decideList){

	console.log('차트 데이터');
	console.log(dateList);
	console.log(clearList);
	console.log(deathList);
	console.log(decideList); 	
    	
    var chart = new Chart(ctxLine, {
        // The type of chart we want to create
        type: 'line',

        // The data for our dataset
        data: {
            labels: dateList,
            datasets: [
                {
                label : '사망',
                backgroundColor: 'rgba(0,0,0,0.3)',
                borderColor: 'rgba(0,0,0,100)',
                pointBackgroundColor:"rgba(255,255,255,100)",
                pointBorderColor : 'rgba(0,0,0,100)',
                pointBorderWidth : 2,
                data:deathList
            	},
            	{
            		label : '확진',
                    backgroundColor: 'rgba(237, 58, 38,0)',
                    borderColor: 'rgba(237, 58, 38,100)',	
                    pointBackgroundColor:"rgba(255,255,255,100)",
                    pointBorderColor : 'rgba(237, 58, 38,100)',
                    pointBorderWidth : 2,
                    data:decideList
            	},
                {
            		label : '격리해제',
                    backgroundColor: 'rgba(65, 232, 84,0)',
                    borderColor: 'rgba(65, 232, 84,100)',	
                    pointBackgroundColor:"rgba(255,255,255,100)",
                    pointBorderColor : 'rgba(65, 232, 84,100)',
                    pointBorderWidth : 2,
                    data:clearList
                 }
            ]
        },
        options: {}
    });
}


function PieChart(labels,dataList){
	 var data = [{
		 backgroundColor : [ '#0095ff', '#fdaf4b' ],   
         data: dataList
		 }];


	 var options = {
			   plugins: {
			     datalabels: {
			       formatter: (value, ctxPie) => {

			         let datasets = ctxPie.chart.data.datasets;

			         if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
			           let sum = datasets[0].data.reduce((a, b) => a + b, 0);
			           let percentage = Math.round((value / sum) * 100) + '%';
			           return percentage;
			         } else {
			           return percentage;
			         }
			       },
			       color: '#fff',
			     }
			   }
			 };

		
		 pieChart = new Chart(ctxPie, {
		    type: 'doughnut',

		    data: {
		        labels: labels,
		       
		        datasets:data
		    },
		    options: options
		});
		 pieChart.update();	
}

function resetPieChart(){
	 pieChart.update();	
	 pieChart.clear();
	
}
function AgePieChart(label,data){
	 var data = [{
		 backgroundColor : ['#eb4034','#009dff'],   
         data: data
		 }];
	 var options = {
			   plugins: {
			     datalabels: {
			       formatter: (value, ctxPie) => {

			         let datasets = ctxPie.chart.data.datasets;

			         if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
			           let sum = datasets[0].data.reduce((a, b) => a + b, 0);
			           let percentage = Math.round((value / sum) * 100) + '%';
			           return percentage;
			         } else {
			           return percentage;
			         }
			       },
			       color: '#fff',
			     }
			   }
	 };
		
		 agePieChart = new Chart(ctxAgePie, {
		    type: 'pie',

		    data: {
		        labels: label,
		       
		        datasets:data
		    },
		    options: options
		});
}

function resetAgePieChart(){
	agePieChart.update();	
	agePieChart.clear();
}
function AgeBarChart(label,data){
	 var data = [{
		 backgroundColor : [ '#f3545d','#fdaf4b','#0095ff', '#32a852', '#ff8400', '#ae00ff','#ff0000','#00ffd9','#eaff00' ],   
         data: data
		 }];


	 var options = {
			 legend: {
		            display: false,
		        },
		     responsive: false,
			   plugins: {
			     datalabels: {
			       formatter: (value, ctxPie) => {

			         let datasets = ctxPie.chart.data.datasets;

			         if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
			           let sum = datasets[0].data.reduce((a, b) => a + b, 0);
			           let percentage = Math.round((value / sum) * 100) + '%';
			           return percentage;
			         } else {
			           return percentage;
			         }
			       },
			       color: '#fff',
			     }
			   }
			 };

		
	 	ageBarChart = new Chart(ctxAgeBar, {
		    type: 'bar',

		    data: {		       
		    	labels: label,
		        datasets:data
		    },
		    options: options
		});
}

function resetAgeBarChart(){
	ageBarChart.update();	
	ageBarChart.clear();
}
	
</script>
	
