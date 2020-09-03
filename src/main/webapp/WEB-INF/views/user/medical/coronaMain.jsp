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
				<aside class="col-md-3 sidebar order-last order-md-first" style="margin-top: 5px; width:330px;">
					<div style="height: 400px; width:280px; border: 1px solid black;">
					<!-- sidebar start -->
						<!-- Text Widget -->
						<div class="widget" style="width:280px;">
							<h5 class="widget-title">Text Widget</h5>
							<p class="mb-0">Resources exquisite set arranging moonlight sex him household had. Months had too ham cousin remove far spirit. She procuring the why performed continual improving. Civil songs so large shade in cause.</p>
						</div>
					</div>
					<div style="margin-top: 7px; height: 705px; width:280px;  border-top: 3px solid #164068; background-color: rgb(233,233,233);">
						<strong id="strongID1" style="display:block; margin-top: 18px; margin-left:12px; color: #174069; font-family: 'Spoqa Han Sans'; font-size:20px;">인천</strong>
						<div style="background-color: white; height: 310px;"></div>
						<div style="background-color: gray;  height: 342px;"></div>
					</div>
					
					
					
					
					
					
					
				</aside>
				<!-- sidebar end -->

				<!-- blog start -->
				<div class="col-md-9 order-first order-lg-first" style="width: 800px;">		

			



		<div id="body1" style="width: 800px;">
			<div class="mainlive_container" style="width:800px;">
					<div class="liveNumOuter">				
						<div style="display: flex; justify-content: space-between;">
							<div class="liveNum1">
								<strong class="tit">일일확진자</strong>
							</div>
							<div class="liveNum2">						
								<span class="subtit" style="font-size:14px;">국내발생  </span><span class="data" style="color: yellow; font-size:19px;">238</span>
							</div>
							<div class="liveNum3">	
								<span class="subtit" style="font-size:14px;">해외유입  </span><span class="data" style="color: yellow; font-size:19px;">10</span>
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
												<div>
												<span class="mini" style="font-size:14px; color: white;">(누적)</span>
													<span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="20182" data-speed="3000" data-refresh-interval="10" style="font-size:30px;"></span><br>
													
												</div>
												<div style="display: flex; justify-content: center;">
													<span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">전일대비 (+ 235)</span>
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
												<div>
													<span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="15198" data-speed="3000" data-refresh-interval="10" style="font-size:30px;"></span><br>
													
												</div>
												<div style="display: flex; justify-content: center;">
													<span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">(+ 225)</span>
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
												<div>
													<span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="4660" data-speed="3000" data-refresh-interval="10" style="font-size:30px;"></span><br>
													
												</div>
												<div style="display: flex; justify-content: center;">
													<span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">(+ 10)</span>
												</div>
											</div>
										</div>					
									</div>
									
									<div class="" style="background: #808080; width: 25%; height: 100px;">
										<div style="display: flex; justify-content: center; align-items: center; height: 100px;">
											<div>
												<div style="display: flex; justify-content: center;">
													<strong class="tit"  style="color: white; font-size:19px;">사망자수</strong>
												</div>
												<div style="align-items: center;">
													<span class="counter-item-digit text-center"  style="color: white;" data-from="0" data-to="324" data-speed="3000" data-refresh-interval="10" style="font-size:30px;"></span><br>
													
												</div>
												<div style="display: flex; justify-content: center;">
													<span class="before"  style="font-size:14px; color: white; margin-top: 2px; ">(+ 0)</span>
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
											<div style="margin-right: 5px;">
												<span class="num" style="font-size:14px;">1,959,080건</span>
											</div>
										</div>
									</li>
									<li style="margin-bottom: 25px;">
										<div style="display: flex; justify-content: space-between;">
											<div style="margin-left: 5px;">
												<span class="tit" style="font-size:14px;">누적 검사완료수</span>
											</div>
											<div style="margin-right: 5px;">
												<span class="num" style="font-size:14px;">1,902,337건</span>
											</div>
										</div>
									</li>
									<li style="">
										<div style="display: flex; justify-content: space-between;">
											<div style="margin-left: 5px;">
											<span class="tit" style="font-size:14px;">누적 확진율</span>
											</div>
											<div style="margin-right: 5px;">
											<span class="num" style="font-size:14px;">1.1%</span>
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
									<div style="display: flex; flex-direction: column; height: 190px;">
										  	<!-- line chart canvas element -->
										<canvas id="buyers"  style="height: 190px; width: 100%; margin-left: 5px;"></canvas>					       
									</div>
									
									<div style="height:28px; display: flex; justify-content: center; align-items: center;">
										<div style="width: 15px; height: 15px; background-color: gray;  margin-top:10px;"></div>
										<span class="title" style=" margin-left:3px; margin-top:10px;">사망자</span>
										<div style="width: 15px; height: 15px; background-color: red;  margin-top:10px;"></div>
										<span class="title" style=" margin-left:3px; margin-top:10px;">확진자</span>
										<div style="width: 15px; height: 15px; background-color: skyblue;  margin-top:10px;"></div>
										<span class="title" style=" margin-left:3px; margin-top:10px;">격리해제</span>
									</div>
							</div>
							<!-- <div class="chart_d" style="height: 200px; width: 75%;" >
								<div style="height: 200px;">
									<div class="cc_graph"  style="display: flex; justify-content: center; align-items: center; height: 200px;">
										pie
										 <section style="margin-top: 5px; height: 200px; display: flex; justify-content: center; align-items: center;">
										    <div class="pieID pie">     
										    </div>
										    <ul class="pieID legend">
											      <li>
											        <em>결과양성(확진)</em>
											        <span>20182</span>
											      </li>
											      <li>
											        <em>검사중</em>
											        <span>56743</span>
											      </li>
											      <li>
											        <em>결과음성</em>
											        <span>1882155</span>
											      </li>      
										    </ul>
		  								</section>
										pie
									</div>
								</div>
							</div> -->
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
							    <div class="item-info-box" id="item-info-box" style="width: 55px; height: 70px;left: 213px; top: 145px;">
								    <div class="item-info" id="item-info" style="width: 55px; height: 70px;">
									    <small id="item_small">인천</small>
									    <span class="status in-progress" id="item_span1">751</span>
									    <span class="status in-progress" id="item_span2">(+11)</span>
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 58px; height: 66px; left: 325px; top: 144px;">
								    <div class="item-info" id="item-info" style=" width: 58px; height: 66px;">
									    <small id="item_small">서울</small>
									    <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 60px; height: 68px; left: 322px; top: 60px;">
								    <div class="item-info" id="item-info" style="width: 60px; height: 68px;">
									   <small id="item_small">경기</small>
									   <span class="status in-progress" id="item_span1">3751</span>
									   <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px; left: 430px; top: 108px;">
								    <div class="item-info" id="item-info" style=" width: 50px; height: 67px;">
									   <small id="item_small">강원</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px;left: 380px; top: 202px;">
								    <div class="item-info" id="item-info" style=" width: 50px; height: 67px;">
									   <small id="item_small">충북</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>	
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px;left: 352px; top: 288px;">
								    <div class="item-info" id="item-info" style=" width: 50px; height: 67px;">
									   <small id="item_small">대전</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px;left: 296px; top: 234px;">
								    <div class="item-info" id="item-info" style="width: 50px; height: 67px;">
									   <small id="item_small">세종</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							       <div class="item-info-box" id="item-info-box" style="width: 50px; height: 67px; left: 228px; top: 293px;">
								    <div class="item-info" id="item-info" style=" width: 50px; height: 67px;">
									   <small id="item_small">충남</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 43px; height: 68px; left: 296px; top: 374px;">
								    <div class="item-info" id="item-info" style=" width: 43px; height: 68px;">
									   <small id="item_small">전북</small>
									    <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 68px;left: 286px; top: 473px;">
								    <div class="item-info" id="item-info" style=" width: 53px; height: 68px;">
									   <small id="item_small">광주</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 68px;left: 211px; top: 501px;">
								    <div class="item-info" id="item-info" style=" width: 53px; height: 68px;">
									   <small id="item_small">전남</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 68px; left: 233px; top: 622px;">
								    <div class="item-info" id="item-info" style=" width: 53px; height: 68px;">
									   <small id="item_small">제주</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							       <div class="item-info-box" id="item-info-box" style="width: 60px; height: 67px;left: 458px; top: 266px;">
								    <div class="item-info" id="item-info" style=" width: 60px; height: 67px;">
									   <small id="item_small">경북</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							       <div class="item-info-box" id="item-info-box" style="width: 60px; height: 67px; left: 481px; top: 348px;">
								    <div class="item-info" id="item-info" style=" width: 60px; height: 67px;">
									   <small id="item_small">대구</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 68px; left: 400px; top: 451px;">
								    <div class="item-info" id="item-info" style=" width: 53px; height: 68px;">
									   <small id="item_small">경남</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							      <div class="item-info-box" id="item-info-box" style="width: 53px; height: 72px; left: 548px; top: 454px;">
								    <div class="item-info" id="item-info" style=" width: 53px; height: 72px;">
									   <small id="item_small">울산</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>
							    <div class="item-info-box" id="item-info-box" style="width: 55px; height: 70px; left: 492px; top: 511px;">
								    <div class="item-info" id="item-info" style="width: 55px; height: 70px;">
									   <small id="item_small">부산</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
								    </div>
							    </div>							    
							    <div class="item-info-box" id="item-info-box" style="width: 67px; height: 70px; left: 515px; top: 583px;">
								    <div class="item-info" id="item-info" style=" width: 67px; height: 70px;">
									   <small id="item_small">검역</small>
									     <span class="status in-progress" id="item_span1">3751</span>
									    <span class="status in-progress" id="item_span2">(+311)</span>
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
			</div>
		</div>
	</section>
	
	
	
	
	
<script>




$(function(){
	$('.item-info-box').click(function(){		
		var name = $(this).find('small').text();
		var value1 = $(this).find('span:eq(0)').text();
		var value2 = $(this).find('span:eq(1)').text();
		$('#strongID1').text(name);
	});

	
});

	function sliceSize(dataNum, dataTotal) {
	  return (dataNum / dataTotal) * 360;
	}
	function addSlice(sliceSize, pieElement, offset, sliceID, color) {
	  $(pieElement).append("<div class='slice "+sliceID+"'><span></span></div>");
	  var offset = offset - 1;
	  var sizeRotation = -179 + sliceSize;
	  $("."+sliceID).css({
	    "transform": "rotate("+offset+"deg) translate3d(0,0,0)"
	  });
	  $("."+sliceID+" span").css({
	    "transform"       : "rotate("+sizeRotation+"deg) translate3d(0,0,0)",
	    "background-color": color
	  });
	}
	function iterateSlices(sliceSize, pieElement, offset, dataCount, sliceCount, color) {
	  var sliceID = "s"+dataCount+"-"+sliceCount;
	  var maxSize = 179;
	  if(sliceSize<=maxSize) {
	    addSlice(sliceSize, pieElement, offset, sliceID, color);
	  } else {
	    addSlice(maxSize, pieElement, offset, sliceID, color);
	    iterateSlices(sliceSize-maxSize, pieElement, offset+maxSize, dataCount, sliceCount+1, color);
	  }
	}
	function createPie(dataElement, pieElement) {
	  var listData = [];
	  $(dataElement+" span").each(function() {
	    listData.push(Number($(this).html()));
	  });
	  var listTotal = 0;
	  for(var i=0; i<listData.length; i++) {
	    listTotal += listData[i];
	  }
	  var offset = 0;
	  var color = [
	    "cornflowerblue", 
	    "olivedrab", 
	    "orange", 
	    "tomato", 
	    "crimson", 
	    "purple", 
	    "turquoise", 
	    "forestgreen", 
	    "navy", 
	    "gray"
	  ];
	  for(var i=0; i<listData.length; i++) {
	    var size = sliceSize(listData[i], listTotal);
	    iterateSlices(size, pieElement, offset, i, 0, color[i]);
	    $(dataElement+" li:nth-child("+(i+1)+")").css("border-color", color[i]);
	    offset += size;
	  }
	}
	createPie(".pieID.legend", ".pieID.pie");


	 // line chart data
    var buyerData = {
        labels : ["08-27","08-28","08-29","08-30","08-31","09-01","09-02"],
        datasets : [
        {
            fillColor : "rgba(172,194,132,0.4)",
            strokeColor : "#e2e2e2",
            pointColor : "skyblue",
            pointStrokeColor : "#e2e2e2",
            data : [99,251,305,247,356,786,234]
        },
          {
            fillColor : "rgba(100,194,132,0.4)",
            strokeColor : "#FFC26D",
            pointColor : "red",
            pointStrokeColor : "#FFC26D",
            data : [120,150,291,251,353,224,500]
        },
          {
            fillColor : "rgba(0,0,0,0.4)",
            strokeColor : "#ffffff",
            pointColor : "gray",
            pointStrokeColor : "#ffffff",
            data : [205,108,91,201,35,15,500]
        }
    ]
    }
    // get line chart canvas
    var buyers = document.getElementById('buyers').getContext('2d');
    // draw line chart
    new Chart(buyers).Line(buyerData);   
</script>