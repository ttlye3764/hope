<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>	
						function callAjax(i){
							/* $('.pagination li').click(function(){
								$(this).find('font').addClass('clickPagination');
					
							}); */
							var shapes = [];
							var colors = [];
							var lines = [];
							var pname = $("input[id='pname']").val();
							var	cname = $("input[id='cname']").val();
					        $('input[name="shapes"]:checked').each(function(i){
					        	shapes.push($(this).val());
					        });
					        $('input[name="colors"]:checked').each(function(i){
					        	colors.push($(this).val());
					        });
					        $('input[name="lines"]:checked').each(function(i){
					        	lines.push($(this).val());
					        });
						
					
					        $.ajax({
					            url     : '${pageContext.request.contextPath}/user/medical/searchPillJson.do',
					            type    : 'post',
					            dataType: 'json',
					            data : {'shapes':shapes, 'colors':colors, 'pname':pname,'cname':cname, 'lines':lines, 'currentPage':i },
					            success : function(result) { 
					           	  $('.list').empty();
					           	  $('#paginationDIV').empty();
					           	  $('#paginationDIV').append(result.pagination);
							
									  $.each(result.list, function(index, item){
										  var newTr = $('<tr data-timestamp="1509426000" data-status="3" style="height: 60px;"></tr>');			 
										  newTr.append('<input type="hidden" value="'+item.pi_no+'"/>');
										  newTr.append('<td class="" style="height: 60px;"><img alt="" src="'+item.pi_bigimg+'" style="width: 96px; height: 71px;"></td>');
										  var fmark = item.pi_f_mark;
										  var bmark = item.pi_b_mark;
										  if(fmark == null){
										  	fmark = " ";
										  }
										  if(bmark == null){
										  	bmark = " ";
										  }
										  var mark = fmark.concat("/");
										  mark = mark.concat(bmark);
										  newTr.append('<td class="" style="height: 60px; text-align:center;">'+mark+'</td>');						 
										  newTr.append('<td class="" style="height: 60px;">'+item.pi_shape_name+'</td>');
										  newTr.append('<td class="" style="height: 60px;">'+item.pi_x_size+'</td>');
										  newTr.append('<td class="" style="height: 60px;">'+item.pi_y_size+'</td>');
										  newTr.append('<td class="" style="height: 60px;">'+item.pi_z_size+'</td>');
										  newTr.append('<td class="" style="height: 60px;">'+item.pi_name+'</td>');
										  newTr.append('<td class="" style="height: 60px;">'+item.pi_b_name+'</td>');
					
										  $('.list').append(newTr);
									  })
									  $('.list tr').on('click', function(){
											var pi_no = $(this).find('input').val();
											getpillAPI(pi_no);
									  });
					 			}
					 		});
						}
						var img1="";
						function getpillAPI(pi_no){
							
							$.ajax({
					            url     : '${pageContext.request.contextPath}/user/medical/pillAPI.do',
					            type    : 'post',
					            dataType: 'json',
					            data : {'pi_no':pi_no },
					            async : false,
					            success : function(result) {
					                console.log(result);
					            	getImg(pi_no);
					            	
									var ee_doc_data="";
									var nb_doc_data="";
									var ud_doc_data="";
									
									var paraIndex=1;
									var index = 0;
									var list = new Array();
									if(result.response.body.items.item.EE_DOC_DATA.DOC.title){
										ee_doc_data = "<h5>"+result.response.body.items.item.EE_DOC_DATA.DOC.title  +  "</h5>";
										console.log(ee_doc_data);
									}
									if(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.title){
										ee_doc_data += "<h5>"+result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.title +  "</h5>";
										console.log(ee_doc_data);
					
									}
					
									$.each(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION,function(i,v){	//v=article, title
										if(i=='ARTICLE'){
											if(jQuery.type(v) == "array"){
												list = v;
												$.each(list,function(i1,v1){  //i1=0,1
													ee_doc_data += v1.title + "<br>";
													
													if(jQuery.type(v1.PARAGRAPH)=="array"){
														var list2 = v1.PARAGRAPH;
														$.each(list2,function(index,value){
															ee_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
															console.log(ee_doc_data); 
														});
													}
													
													
												});
											}
											else{
												$.each(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.ARTICLE,function(i1,v1){  //v=paragraph,title
													var i= 1;
													if(i1=='PARAGRAPH'){
														if(jQuery.type(v1) == "array"){
															list = v1;
															$.each(list,function(index,value){
																ee_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
																console.log(ee_doc_data); 
															});	
														}
														else{
															ee_doc_data += "<"+v1.tagName + ">" + v1.content + "</"+v1.tagName + ">";
															console.log(ee_doc_data); 
														}				
													}else{
														if(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.ARTICLE.title){
															var ee = ee_doc_data.split("</h5>");
															ee_doc_data = ee[0] + "</h5>" + i +"."+v1 + "<br>" + ee[1]; 
															i = i+1;
														}
													}
												});
											}
										}
									});
					
									//NB_DOC_DATA
									if(result.response.body.items.item.NB_DOC_DATA.DOC.title){
										nb_doc_data += "<h5>"+result.response.body.items.item.NB_DOC_DATA.DOC.title  +  "</h5>";
										console.log(ee_doc_data);
									}
									if(result.response.body.items.item.NB_DOC_DATA.DOC.SECTION.title){
										nb_doc_data += "<h5>"+result.response.body.items.item.NB_DOC_DATA.DOC.SECTION.title +  "</h5>";
										console.log(ee_doc_data);
					
									}
									$.each(result.response.body.items.item.NB_DOC_DATA.DOC.SECTION,function(i,v){	//v=article, title
										if(i=='ARTICLE'){
											if(jQuery.type(v) == "array"){
												list = v;
												$.each(list,function(i1,v1){  //i1=0,1
													nb_doc_data += v1.title + "<br>";
													
													if(jQuery.type(v1.PARAGRAPH)=="array"){
														var list2 = v1.PARAGRAPH;
														$.each(list2,function(index,value){
															nb_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
															console.log(ee_doc_data); 
														});
													}
													
													
												});
											}
											else{
												$.each(result.response.body.items.item.NB_DOC_DATA.DOC.SECTION.ARTICLE,function(i1,v1){  //v=paragraph,title
													var i= 1;
													if(i1=='PARAGRAPH'){
														if(jQuery.type(v1) == "array"){
															list = v1;
															$.each(list,function(index,value){
																nb_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
																console.log(ee_doc_data); 
															});	
														}
														else{
															nb_doc_data += "<"+v1.tagName + ">" + v1.content + "</"+v1.tagName + ">";
															console.log(ee_doc_data); 
														}				
													}else{
														if(result.response.body.items.item.NB_DOC_DATA.DOC.SECTION.ARTICLE.title){
															var nb = nb_doc_data.split("</h5>");
															nb_doc_data = nb[0] + "</h5>" + i +"."+v1 + "<br>" + nb[1]; 
															i = i+1;
														}
													}
												});
											}
										}
									});
									
									//UD_DOC_DATA
									if(result.response.body.items.item.UD_DOC_DATA.DOC.title){
										ud_doc_data += "<h5>"+result.response.body.items.item.UD_DOC_DATA.DOC.title  +  "</h5>";
										console.log(ee_doc_data);
									}
									if(result.response.body.items.item.UD_DOC_DATA.DOC.SECTION.title){
										ud_doc_data += "<h5>"+result.response.body.items.item.UD_DOC_DATA.DOC.SECTION.title +  "</h5>";
										console.log(ee_doc_data);
					
									}
									$.each(result.response.body.items.item.UD_DOC_DATA.DOC.SECTION,function(i,v){	//v=article, title
										if(i=='ARTICLE'){
											if(jQuery.type(v) == "array"){
												list = v;
												$.each(list,function(i1,v1){  //i1=0,1
													ud_doc_data += "<font style='font-size:5px;'>" + v1.title + "<br></font>";
													
													if(jQuery.type(v1.PARAGRAPH)=="array"){
														var list2 = v1.PARAGRAPH;
														$.each(list2,function(index,value){
															ud_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
															console.log(ee_doc_data); 
														});
													}
													
													
												});
											}
											else{
												$.each(result.response.body.items.item.UD_DOC_DATA.DOC.SECTION.ARTICLE,function(i1,v1){  //v=paragraph,title
													var i = 1;
														if(i1=='PARAGRAPH'){
														if(jQuery.type(v1) == "array"){
															list = v1;
															$.each(list,function(index,value){
																ud_doc_data += "<"+value.tagName + ">" + value.content + "</"+value.tagName + ">";
																console.log(ee_doc_data); 
															});	
														}
														else{
															ud_doc_data += "<"+v1.tagName + ">" + v1.content + "</"+v1.tagName + ">";
															console.log(ee_doc_data); 
														}				
													}else{
														if(result.response.body.items.item.UD_DOC_DATA.DOC.SECTION.ARTICLE.title){
															var ud = ud_doc_data.split("</h5>");
															ud_doc_data = ud[0] + "</h5>" + i +"."+v1 + "<br>" + ud[1]; 
															i = i+1;
														}
													}
												});
											}
										}
									});
									console.log(result.response.body.items.item); 
									/*                  
						           	 	console.log(result.response.body.items.item.ITEM_NAME);		//제품명
						           	 	console.log(result.response.body.items.item.MAIN_ITEM_INGR);		//성분
						           	 	console.log(result.response.body.items.item.MATERIAL_NAME);		//함량
						           	 	console.log(result.response.body.items.item.INGR_NAME);		//첨가제
						           	 	console.log(result.response.body.items.item.ETC_OTC_CODE);		//전문/일반
						           	 	console.log(result.response.body.items.item.ENTP_NAME);  //제조/수입사
						           	 	console.log(result.response.body.items.item.CHART);  //성상
						           	 	console.log(result.response.body.items.item.ITEM_PERMIT_DATE);  //허가일
						           	 	console.log(result.response.body.items.item.PACK_UNIT);  //포장단위
						           	 	console.log(result.response.body.items.item.STORAGE_METHOD);  //저장방법
						           	 	console.log(result.response.body.items.item.VALID_TERM);  //유효기간//완제/원료구분/업종구분
						           	 	console.log(result.response.body.items.item.MAKE_MATERIAL_FLAG);  //완제/원료구분
						           	 	console.log(result.response.body.items.item.INDUTY_TYPE);  //업종구분 */
						           	 	
						           	 var material = (result.response.body.items.item.MATERIAL_NAME).split('|');
									
						           $("#infotable").empty();
						           $('#modal-div1').empty();
						           $('#modal-div2').empty();
						           $('#modal-div3').empty();
						           $('#modal-p1').empty();
						           $('#modal-p2').empty();
						           $('#modal-p3').empty();
					
					
						           var tbody = $('<tbody></tbody>');
						           var tr_1 = $('<tr></tr>');
						           tr_1.append('<th style="border: 2px soild black;">제품명</th>');
						           tr_1.append('<td colspan="2" id="result_drug_name">'+result.response.body.items.item.ITEM_NAME+'</td>');
								   tr_1.append('<td><img id="idfy_img_small" src="'+img1+'" alt="식별 이미지" onclick="" style="height: 123px;"></td>');
						           tbody.append(tr_1);
						           
						           var tr_2 = $('<tr></tr>');
						           tr_2.append('<th>성분 / 함량</th>');
						           tr_2.append('<td colspan="3"><ul id="ingr_mg">'+result.response.body.items.item.MAIN_ITEM_INGR+' <br> '+material[0]+'</ul></td>');
								   tbody.append(tr_2);
					
								   var tr_3 = $('<tr></tr>');
								   tr_3.append('<th>첨가제</th>');
								   tr_3.append('<td colspan="3" class="additives" id="additives_td"><ul id="additives">'+result.response.body.items.item.INGR_NAME+'</ul></td>');
								   tbody.append(tr_3);
					
								   var tr_4 = $('<tr></tr>');
								   tr_4.append('<th>전문 / 일반</th>');		
								   tr_4.append('<td>'+result.response.body.items.item.ETC_OTC_CODE+'</td>');	   
								   tr_4.append('<th>단일 / 복합</th>');		
								   tr_4.append('<td id="sunb_count">단일</td>');
								   tbody.append(tr_4);
					
								   var tr_5 = $('<tr></tr>');	 
								   tr_5.append('<th>제조 / 수입사</th>');
								   tr_5.append('<td style="width: 130px;">'+result.response.body.items.item.ENTP_NAME+'</td>');
								   tr_5.append('<th>유효기간</th>');
								   tr_5.append('<td>'+result.response.body.items.item.VALID_TERM+'</td>');
								   tbody.append(tr_5);
					
					               var tr_6 = $('<tr></tr>');
					               tr_6.append('<th>완제/원료</th>');
					               tr_6.append('<td id="drug_form">'+result.response.body.items.item.MAKE_MATERIAL_FLAG+'</td>');
								   tr_6.append('<th>업종구분</th>');  
								   tr_6.append('<td id="dosage_route">'+result.response.body.items.item.INDUTY_TYPE+'</td>');
								   tbody.append(tr_6);
					
								   var tr_7 = $('<tr></tr>');
								   tr_7.append('<th>성상</th>');
								   tr_7.append('<td colspan="3" id="charact">'+result.response.body.items.item.CHART+'</td>');
								   tbody.append(tr_7);
					
								   var tr_8 = $('<tr></tr>');
								   tr_8.append('<th>허가일</th>');
								   tr_8.append('<td colspan="3">'+result.response.body.items.item.ITEM_PERMIT_DATE+'</td>');
								   tbody.append(tr_8);
					
						           var tr_9 = $('<tr></tr>');
						           tr_9.append('<th>포장단위<br>(식약처 기준)</th>');
						           tr_9.append('<td colspan="3" class="br0" id="drug_box">'+result.response.body.items.item.PACK_UNIT+'</td>');
						           tbody.append(tr_9);
					
						           var tr_10 = $('<tr></tr>');
						           tr_10.append('<th class="bb0">저장방법</th>');
						           tr_10.append('<td colspan="4" class="bb0 br0" id="stmt">'+result.response.body.items.item.STORAGE_METHOD+'</td>');
								   tbody.append(tr_10);
					
								   
									var ee = ee_doc_data.split('</h5>');
									ee[0] = ee[0] + "</h5>";
					
									var nb = nb_doc_data.split('</h5>');
									nb[0] = nb[0] + "</h5>";
					
									var ud = ud_doc_data.split('</h5>');
									ud[0] = ud[0] + "</h5>";
					
									
									
									$("#infotable").append(tbody);	
					
									$('#modal-p1').append(ee[0]);
									$('#modal-div1').append(ee[1]);
									
									$('#modal-p2').append(nb[0]);
									$('#modal-div2').append(nb[1]);
									
									$('#modal-p3').append(ud[0]);
									$('#modal-div3').append(ud[1]);
					
									/* var ee_doc_data="";
									var nb_doc_data="";
									var ud_doc_data=""; */
											
									$("#pillInfoDIV").modal("show");
									
					
					 			}//suc
					 		});//ajax
						}//getpillAPI
						
						function getImg(pi_no){
							$.ajax({
								  url     : '${pageContext.request.contextPath}/user/medical/pillInfo.do',
						          type    : 'post',
						          dataType: 'json',
						          async : false,
						          data : {'pi_no':pi_no},
						          success : function(result1) { 
									  img1 = result1.pillInfo.pi_bigimg;
								  }
								});
							}
						
						
						$(function() {
							$('#cancleBTN').on('click',function(){
								$('#pname').val('');
								$('#cname').val('');
								$("input:checkbox[name='shapes']").prop("checked", false);
								$("input:checkbox[name='colors']").prop("checked", false);
								$("input:checkbox[name='lines']").prop("checked", false);
								$("input[name='shapes']").removeClass('li_selected');
								$("input[name='colors']").removeClass('li_selected');
								$("input[name='lines']").removeClass('li_selected');
					
								var div = document.getElementByName('shapes');
								for(i in div){ i.removeClass('li_selected'); }
								
					
							});
					
							$('.list tr').on('click', function() {
								var pi_no = $(this).find('input').val();
								getpillAPI(pi_no);
							});
							/* $('.list tr').click(function(){
								var pi_no = $(this).find('input').val();
								alert(pi_no);
								//$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardView.do?bo_no=' + bo_no + '&rnum=' + rnum);
							}); */
					
							$('.idty li').click(function() {
								if ($(this).hasClass('li_selected')) {
									$(this).removeClass('li_selected');
									$(this).find('input[type="checkbox"]').prop("checked", false);
								} else {
									$(this).addClass('li_selected');
									$(this).find('input[type="checkbox"]').prop("checked", true);
								}
							})
					
							$('#searchBTN')
									.click(
											function() {
												/* $('.pagination li').click(function(){
													$(this).find('font').addClass('clickPagination');
					
												}); */
												var shapes = [];
												var colors = [];
												var lines = [];
												var pname = $("input[id='pname']").val();
												var cname = $("input[id='cname']").val();
												$('input[name="shapes"]:checked').each(function(i) {
													shapes.push($(this).val());
												});
												$('input[name="colors"]:checked').each(function(i) {
													colors.push($(this).val());
												});
												$('input[name="lines"]:checked').each(function(i) {
													lines.push($(this).val());
												});
					
												$
														.ajax({
															url : '${pageContext.request.contextPath}/user/medical/searchPillJson.do',
															type : 'post',
															dataType : 'json',
															data : {
																'shapes' : shapes,
																'colors' : colors,
																'pname' : pname,
																'cname' : cname,
																'lines' : lines
															},
															success : function(result) {
																$('.list').empty();
																$('#paginationDIV').empty();
																$('#paginationDIV').append(
																		result.pagination);
					
																$
																		.each(
																				result.list,
																				function(index,
																						item) {
																					var newTr = $('<tr data-timestamp="1509426000" data-status="3" style="height: 60px;"></tr>');
																					newTr
																							.append('<input type="hidden" value="'+item.pi_no+'"/>');
																					newTr
																							.append('<td class="" style="height: 60px;"><img alt="" src="'+item.pi_bigimg+'" style="width: 96px; height: 71px;"></td>');
																					var fmark = item.pi_f_mark;
																					var bmark = item.pi_b_mark;
																					if (fmark == null) {
																						fmark = " ";
																					}
																					if (bmark == null) {
																						bmark = " ";
																					}
																					var mark = fmark
																							.concat("/");
																					mark = mark
																							.concat(bmark);
																					newTr
																							.append('<td class="" style="height: 60px; text-align:center; ">'
																									+ mark
																									+ '</td>');
																					newTr
																							.append('<td class="" style="height: 60px;">'
																									+ item.pi_shape_name
																									+ '</td>');
																					newTr
																							.append('<td class="" style="height: 60px;">'
																									+ item.pi_x_size
																									+ '</td>');
																					newTr
																							.append('<td class="" style="height: 60px;">'
																									+ item.pi_y_size
																									+ '</td>');
																					newTr
																							.append('<td class="" style="height: 60px;">'
																									+ item.pi_z_size
																									+ '</td>');
																					newTr
																							.append('<td class="" style="height: 60px;">'
																									+ item.pi_name
																									+ '</td>');
																					newTr
																							.append('<td class="" style="height: 60px;">'
																									+ item.pi_b_name
																									+ '</td>');
					
																					$('.list')
																							.append(
																									newTr);
																				})
																$('.list tr').on(
																		'click',
																		function() {
																			var pi_no = $(this)
																					.find('input')
																					.val();
																			getpillAPI(pi_no);
																		});
															}
														});
											})
						});
					</script>










<section class="blog-page pb-0">
		<div class="container">
			<div class="row">
				<!-- sidebar start -->
				<aside class="col-md-3 sidebar order-last order-md-first">
					<!-- Text Widget -->
					<div class="widget">
						<h5 class="widget-title">Text Widget</h5>
						<p class="mb-0">Resources exquisite set arranging moonlight sex him household had. Months had too ham cousin remove far spirit. She procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>

					<!-- Newsletter Widget -->
					<div class="widget widget-newsletter">
						<h5 class="widget-title">Newsletter</h5>
						<p class="mb-1">Subscribe to our newsletter to receive exclusive offers.</p>
						<form>
							<div class="input-group">
								<input type="email" class="form-control" placeholder="Enter your Email...">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-grad mb-0"><svg class="svg-inline--fa fa-paper-plane fa-w-16 m-0" aria-hidden="true" data-prefix="fa" data-icon="paper-plane" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M476 3.2L12.5 270.6c-18.1 10.4-15.8 35.6 2.2 43.2L121 358.4l287.3-253.2c5.5-4.9 13.3 2.6 8.6 8.3L176 407v80.5c0 23.6 28.5 32.9 42.5 15.8L282 426l124.6 52.2c14.2 6 30.4-2.9 33-18.2l72-432C515 7.8 493.3-6.8 476 3.2z"></path></svg><!-- <i class="fa fa-paper-plane m-0"></i> --></button>
								</span>
							</div>
						</form>
					</div>

					<!-- Posts Widget -->
					<div class="widget widget-post">
						<h5 class="widget-title">Recent Posts</h5>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/01.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">The Stories Behind those Iconic Blogs</a>
								<p class="date">Aug 26, 2018</p>
							</div>
						</div>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/02.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">Months had too ham cousin remove</a>
								<p class="date">Jun 05, 2018</p>
							</div>
						</div>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/03.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">Lady an mr here must neat sold</a>
								<p class="date">May 16, 2018</p>
							</div>
						</div>
					</div>

					<!-- Tag Widget -->
					<div class="widget">
						<h5 class="widget-title">Tags</h5>
						<div class="tags">
							<a href="#">studio</a>
							<a href="#">events</a>
							<a href="#">WordPress</a>
							<a href="#">gadgets</a>
							<a href="#">office</a>
							<a href="#">magazine</a>
							<a href="#">freebies</a>
							<a href="#">photograpy</a>
							<a href="#">updates</a>
							<a href="#">creative</a>
							<a href="#">travel</a>
						</div>
					</div>
				</aside>
				<!-- sidebar end -->

				<!-- blog start -->
				<div class="col-md-9 order-first order-lg-first">			
					
					
						<div>
							<form id="searchForm" style="margin-bottom: 50px;">
								<table id="searchTable">
									<tbody>
										<tr>
											<th>제품명</th>
											<td><input type="text" id="pname" name="" style="border: 1px solid #d2d2d2 !important;"></td>
											<th style="width: 100px;">회사명</th>
											<td><input type="text" id="cname" name="" style="border: 1px solid #d2d2d2 !important;"></td>
										</tr>
										<tr>
											<th>모양</th>
											<td colspan="3" class="shape">
												<ul id="shapeids" class="idty">
													<li id="" class="li_style">
													<img src="${pageContext.request.contextPath }/images/pills/shape01.jpg"
														alt="원형"><input type="checkbox" name="shapes" value="원형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape02.jpg"
														alt="타원형"><input type="checkbox" name="shapes"
														value="타원형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape07.jpg"
														alt="장방형"><input type="checkbox" name="shapes"
														value="장방형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape03.jpg"
														alt="반원형"><input type="checkbox" name="shapes"
														value="반원형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape04.jpg"
														alt="삼각형"><input type="checkbox" name="shapes"
														value="삼각형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape05.jpg"
														alt="사각형"><input type="checkbox" name="shapes"
														value="사각형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape06.jpg"
														alt="마름모형"><input type="checkbox" name="shapes"
														value="마름모형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape10.jpg"
														alt="오각형"><input type="checkbox" name="shapes"
														value="오각형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape08.jpg"
														alt="육각형"><input type="checkbox" name="shapes"
														value="육각형"></li>
													<li id="" class="li_style"><img
														src="${pageContext.request.contextPath }/images/pills/shape09.jpg"
														alt="팔각형"><input type="checkbox" name="shapes"
														value="팔각형"></li>
												</ul>
											</td>
										</tr>
										<tr id="color">
											<th>색상</th>
											<td colspan="3" class="idty_td8">
												<ul id="colorids" class="idty">
													<li id="color_white" class="li_style" onclick=""><a><span
															class="white" style="background: rgba(255, 255, 255, 0.87);"></span>하양</a><input
														type="checkbox" name="colors" value="하양"></li>
													<li id="color_yellow" class="li_style"><a onclick=""><span
															class="yellow" style="background: yellow"></span>노랑</a><input
														type="checkbox" name="colors" value="노랑"></li>
													<li id="color_orange" class="li_style"><a onclick=""><span
															class="orange" style="background: orange"></span>주황</a><input
														type="checkbox" name="colors" value="주황"></li>
													<li id="color_pink" class="li_style"><a onclick=""><span
															class="pink" style="background: pink"></span>분홍</a><input
														type="checkbox" name="colors" value="분홍"></li>
													<li id="color_red" class="li_style"><a onclick=""><span
															class="red" style="background: red"></span>빨강</a><input
														type="checkbox" name="colors" value="빨강"></li>
													<li id="color_brown" class="li_style"><a onclick=""><span
															class="brown" style="background: brown"></span>갈색</a><input
														type="checkbox" name="colors" value="갈색"></li>
													<li id="color_ygreen" class="li_style"><a onclick=""><span
															class="ygreen" style="background: yellowgreen"></span>연두</a><input
														type="checkbox" name="colors" value="연두"></li>
													<li id="color_green" class="li_style"><a onclick=""><span
															class="green" style="background: green"></span>초록</a><input
														type="checkbox" name="colors" value="초록"></li>
													<li id="color_bgreen" class="li_style"><a onclick=""><span
															class="bgreen" style="background: rgb(00, 97, 70)"></span>청록</a><input
														type="checkbox" name="colors" value="청록"></li>
													<li id="color_blue" class="li_style"><a onclick=""><span
															class="blue" style="background: blue"></span>파랑</a><input
														type="checkbox" name="colors" value="파랑"></li>
													<li id="color_navy" class="li_style"><a onclick=""><span
															class="navy" style="background: navy"></span>남색</a><input
														type="checkbox" name="colors" value="남색"></li>
													<li id="color_wine" class="li_style"><a onclick=""><span
															class="wine" style="background: rgb(245, 140, 245)"></span>자주</a><input
														type="checkbox" name="colors" value="자주"></li>
													<li id="color_purple" class="li_style"><a onclick=""><span
															class="purple" style="background: purple"></span>보라</a><input
														type="checkbox" name="colors" value="보라"></li>
													<li id="color_grey" class="li_style"><a onclick=""><span
															class="grey" style="background: gray"></span>회색</a><input
														type="checkbox" name="colors" value="회색"></li>
													<li id="color_black" class="li_style"><a onclick=""><span
															class="black" style="background: black"></span>검정</a><input
														type="checkbox" name="colors" value="검정"></li>
													<li id="color_transp" class="li_style"><a onclick=""><span
															class="transp"></span>투명</a><input type="checkbox" name="colors"
														value="투명"></li>
												</ul>
											</td>
										</tr>
										<tr>
											<th>분할선</th>
											<td colspan="3">
												<ul id="lineids" class="idty">
													<li id="line_plus" class="li_style"><a onclick=""><img
															src="${pageContext.request.contextPath }/images/pills/line02.jpg"
															alt="(+)형"></a><input type="checkbox" name="lines" value="+"></li>
													<li id="line_minus" class="li_style"><a onclick=""><img
															src="${pageContext.request.contextPath }/images/pills/line03.jpg"
															alt="(-)형"></a><input type="checkbox" name="lines" value="-"></li>
												</ul>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="border: none;">
												<button class="btn btn-outline-grad btn-block" id="searchBTN"
													type="button">검색</button>
											</td>
											<td colspan="2" style="border: none;">
												<button class="btn btn-outline-grad btn-block" id="cancleBTN"
													type="button">취소</button>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					
					
						<div class="card" style="margin-left: 15%; margin-right: 15%;">
							<div class="card-body" style="">
								<div id="" class="" >
									<table class="table-list" data-currentpage="1">
					
										<thead>
											<tr id="table-list-tr">
												<th rowspan="2" style="border: 1px solid #d2d2d2; width: 10% !important;">
													<ul id="list-ul">
														<li>식별이미지</li>
													</ul>
													<i class="caret"></i>
												</th>
												<th rowspan="2" style="border: 1px solid #d2d2d2; width: 10% !important;">
													<ul id="list-ul">
														<li>식별표시(앞/뒤)</li>
													</ul>
													<i class="caret"></i>
												</th>
												<th rowspan="2" style="border: 1px solid #d2d2d2; width: 10% !important;">
													<ul id="list-ul">
														<li>제형</li>
													</ul>
													<i class="caret"></i>
												</th>
												<th colspan="3" style="border: 1px solid #d2d2d2; width: 15% !important;">
													<ul id="list-ul">
														<li>크기(mm)</li>
													</ul>
													<i class="caret"></i>
												</th>
												<th rowspan="2" style="border: 1px solid #d2d2d2; width: 40% !important;">
													<ul id="list-ul">
														<li>제품명/성분명</li>
													</ul>
													<i class="caret"></i>
												</th>
												<th rowspan="2" style="border: 1px solid #d2d2d2; width: 15% !important;">
													<ul id="list-ul">
														<li>회사명</li>
													</ul>
													<i class="caret"></i>
												</th>
											</tr>
											<tr id="table-list-tr">
												<th style="border: 1px solid #d2d2d2; width: 50px;"><ul
														id="list-ul">
														<li>장축</li>
													</ul></th>
												<th style="border: 1px solid #d2d2d2; width: 50px;"><ul
														id="list-ul">
														<li>단축</li>
													</ul></th>
												<th style="border: 1px solid #d2d2d2; width: 50px;"><ul
														id="list-ul">
														<li>두께</li>
													</ul></th>
											</tr>
										</thead>
					
										<!-- IMPORTANT, class="list" must be on tbody -->
										<tbody class="list">
											<c:forEach items="${pillList }" var="pillInfo">
												<tr data-timestamp="1509426000" id="tr_id" data-status="3"
													style="height: 60px;">
													<input type="hidden" value="${pillInfo.pi_no}" />
													<td class="" style="height: 60px;"><img alt=""
														src="${pillInfo.pi_bigimg}" style="width: 96px; height: 71px;"></td>
													<td class="" style="height: 60px; text-align: center;">${pillInfo.pi_f_mark}</td>
													<td class="" style="height: 60px;">${pillInfo.pi_shape_name}</td>
													<td class="" style="height: 60px;">${pillInfo.pi_x_size}</td>
													<td class="" style="height: 60px;">${pillInfo.pi_y_size}</td>
													<td class="" style="height: 60px;">${pillInfo.pi_z_size}</td>
													<td class="" style="height: 60px;">${pillInfo.pi_name}</td>
													<td class="" style="height: 60px;">${pillInfo.pi_b_name}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div id="paginationDIV" style="margin-left: 40%; margin-bottom: 20px;">
							<div>${pagination }</div>
						</div>
					
					
						<div class="modal fade text-left" id="pillInfoDIV" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenter"
							style="display: none;" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">알약 정보 상세보기</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">
					
										<table class="infotable" id="infotable">						
										</table>
									</div>
									<div style="float: left;">
										<p id="modal-p1" style="margin-left: 15px; margin-right: 15px; margin-top: 5px; margin-bottom: 0px;"></p>
										<div id="modal-div1" style="overflow: auto; height:100px; margin-left: 15px; margin-right: 15px; border: 1px solid #d2d2d2 !important;">				
										</div>
									</div>
									<div style="float: left;">
										<p id="modal-p2" style="margin-left: 15px; margin-right: 15px;  margin-top: 10px; margin-bottom: 0px;"></p>
										<div id="modal-div2" style="overflow: auto; height:180px; margin-left: 15px; margin-right: 15px; border: 1px solid #d2d2d2 !important;">				
										</div>
									</div>
									<div style="float: left;">
										<p id="modal-p3" style="margin-left: 15px; margin-right: 15px;  margin-top: 10px; margin-bottom: 0px;"></p>
										<div id="modal-div3" style="overflow: auto; height:180px; margin-left: 15px; margin-right: 15px; border: 1px solid #d2d2d2 !important;">				
										</div>
									</div>					
									
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>
	
	