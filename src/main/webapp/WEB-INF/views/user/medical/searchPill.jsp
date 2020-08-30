<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#searchTable td,#searchTable th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
#searchTable ul{
	list-style: none outside none;
}
.idty{
	margin:0;
	padding:0;
}
.idty input{
	display: none;
}
.idty li{
	margin-left: 10px;
	margin-top:5px;
	padding: 0 0 0 0;
	border: 1px solid #d8d6d6;
	float:left;
	width: 50px;
	text-align:center;
	border-radius:4px;
}
#searchTable th{
	width: 100px;
	text-align:center;
}
#searchTable td{
	width:300px;
	text-align:center;
}
span{
	width:100%;
	height:30px;
	display:block;
}
.li_style:hover {
	cursor:pointer; 
	border:1px solid rgb(74, 186, 238);
}

#searchForm{
	margin-left: 15%;
	margin-right: 15%;
}
#pname, #cname{
	margin-top: 20px;
	width:100%;
}
#searchTable{
	width:100%;
}




<!--리스트-------------------------------------------------------------------------------------------->

#table-list-tr th ul li{
	text-align: center;
}
#list tr{
	text-align: center;
}

#list-ul{
	list-style: none;
	text-align: center;
}


.table-list-container {
  max-width:800px; margin:20px auto;
  background-color:#ffffff; 
  border:1px solid #d2d2d2;  
  position: relative;
  z-index: 0;
}

@media (max-width: 640px ) {
  .table-list-container { border-width: 1px 0; } 
}

.table-list {
  min-height:176px;
} 

.table-list th { 
  border-bottom: .6px solid #d2d2d2;
}

.table-list td { 
  white-space:nowrap;
  height:1.75rem;
  vertical-align:top; 
  padding:10px;
  border-bottom:1px solid #d2d2d2; }

.table-list tr:last-child td { 
  height:auto; }


th button.sort {
  text-align:left; 
  padding:0 10px;
  line-height: 1.75rem;
  border: none; background: none; 
  display: block; width:100%; 
  font-size: 12px; color: #888; 
  border-bottom: 1px solid transparent;  
}

th button.sort.textcenter,
th button.sort.text-center { text-align:center; }

th button.sort.textright,
th button.sort.text-right { text-align:right; }

button.sort .bullet { margin-top:13px; }



.table-list .caret:after { content:""; }
.asc .caret:after {
  width: 0;
  height: 0;
  border-left: 3px solid transparent;
  border-right: 3px solid transparent;
  border-top: 3px solid #808080;
  content: "";
  position: relative;
  top: -3px;
  right: -4px;
  font-size:0; }
.desc .caret:after {
  width: 0;
  height: 0;
  border-left: 3px solid transparent;
  border-right: 3px solid transparent;
  border-bottom: 3px solid #808080;
  content: "";
  position: relative;
  top: -4px;
  right: -4px;
  font-size:0; }

button.sort .caret { display:none; }
button.sort.asc .caret { display:inline-block; }
button.sort.desc .caret { display:inline-block; }

.table-footer { 
  background-color:#fff;
  margin-top:-1px; 
  position:relative; 
  z-index:-1; }
.table-search {
  width:310px;
  border-left:1px solid #d2d2d2; }
.table-search .search { 
  width:100%;
  border:none; 
  background:transparent; 
  box-shadow:none; }


.table-pagination {
  white-space:nowrap; }

.table-pagination:after {
    display: block;
    content: "";
    clear: both;
  }

.jPaginateBack, 
.jPaginateNext, 
.table-list-container .pagination {
  float:left; }

.jPaginateBack, 
.jPaginateNext {  
    line-height:1.75rem;
    width:1.75rem; 
    text-align:center; 
    user-select:none; }


.jPaginateBack .material-icons, 
.jPaginateNext .material-icons { 
  display:block;
  font-size:16px;
  line-height:inherit;
} 




.li_selected{
	border:1px solid rgb(110, 63, 219) !important;
}

.clickPagination{
	color: rgb(177, 113, 236);	
}

.infotable{
	border: 1px solid black !important;
}
.infotable tr,.infotable td,.infotable th{
	border: 1px solid black !important;
	width: auto;
	height: auto;
}
.infotable li{
	list-style: none;
}
.infotable th{
	width:100px;
}
</style>
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

	function getpillAPI(pi_no){

		$.ajax({
            url     : '${pageContext.request.contextPath}/user/medical/pillAPI.do',
            type    : 'post',
            dataType: 'json',
            data : {'pi_no':pi_no },
            success : function(result) { 
            	
                console.log(result.response.body.items.item);                
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
           	 	console.log(result.response.body.items.item.INDUTY_TYPE);  //업종구분
           	 	/* console.log(result.response.body.items.item.EE_DOC_DATA.DOC.title);  //효능 효과
           	 	console.log(result.response.body.items.item.EE_DOC_DATA.DOC.SECTION.ARTICLE.PARAGRAPH.content);  //내용 */
				var ee_doc_data="";
				var nb_doc_data="";
				var ub_doc_data="";
				
				var paraIndex=1;
				var index = 0;
				var list = new Array();
				if(result.response.body.items.item.EE_DOC_DATA.DOC.title){
					ee_doc_data = "<h4>"+result.response.body.items.item.EE_DOC_DATA.DOC.title  +  "</h4>";
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
										ee_doc_data = v1 + "<br>" + ee_doc_data;
										console.log(ee_doc_data);
									}
								}
							});
						}
					}
				});

				//NB_DOC_DATA
				if(result.response.body.items.item.NB_DOC_DATA.DOC.title){
					nb_doc_data += "<h4>"+result.response.body.items.item.NB_DOC_DATA.DOC.title  +  "</h4>";
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
										nb_doc_data = v1 + "<br>" + nb_doc_data;
										console.log(ee_doc_data);
									}
								}
							});
						}
					}
				});
				
				//UD_DOC_DATA
				if(result.response.body.items.item.UD_DOC_DATA.DOC.title){
					ud_doc_data += "<h4>"+result.response.body.items.item.UD_DOC_DATA.DOC.title  +  "</h4>";
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
										ud_doc_data = "<font style='font-size:5px;'>"+ v1 + "<br></font>" + ud_doc_data;
										console.log(ee_doc_data);
									}
								}
							});
						}
					}
				});

				$("#pillInfoDIV").modal("show");
				

 			}
 		});






	}
	
		

	$(function() {

		$('.list tr').on('click', function(){
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
       

		$('#searchBTN').click(function(){
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
	             data : {'shapes':shapes, 'colors':colors, 'pname':pname,'cname':cname, 'lines':lines },
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
						  newTr.append('<td class="" style="height: 60px; text-align:center; ">'+mark+'</td>');						 
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
		})
	});
</script>
</head>
<body>

<div>
	<form id="searchForm" style="margin-bottom: 50px;">
			<table id="searchTable">
				<tbody>
					<tr>
						<th>제품명</th>
							<td>
								<input type="text" id="pname" name="">
							</td>
						<th style="width: 100px;">회사명</th>
							<td>
								<input type="text" id="cname" name="">
							</td>
					</tr>
				<tr>
					<th>모양</th>
					<td colspan="3" class="shape">
						<ul id="shapeids" class="idty">
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape01.jpg" alt="원형"><input type="checkbox" name="shapes" value="원형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape02.jpg" alt="타원형"><input type="checkbox" name="shapes" value="타원형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape07.jpg" alt="장방형"><input type="checkbox" name="shapes" value="장방형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape03.jpg" alt="반원형"><input type="checkbox" name="shapes" value="반원형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape04.jpg" alt="삼각형"><input type="checkbox" name="shapes" value="삼각형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape05.jpg" alt="사각형"><input type="checkbox" name="shapes" value="사각형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape06.jpg" alt="마름모형"><input type="checkbox" name="shapes" value="마름모형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape10.jpg" alt="오각형"><input type="checkbox" name="shapes" value="오각형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape08.jpg" alt="육각형"><input type="checkbox" name="shapes" value="육각형"></li>
							<li id="" class="li_style"><img src="${pageContext.request.contextPath }/images/pills/shape09.jpg" alt="팔각형"><input type="checkbox" name="shapes" value="팔각형"></li>
						</ul>			
					</td>
				</tr>
				<tr id="color">
					<th>색상</th>
					<td colspan="3" class="idty_td8">
						<ul id="colorids" class="idty">
							<li id="color_white" class="li_style" onclick=""><a ><span class="white" style="background: rgba(255, 255, 255, 0.87);" ></span>하양</a><input type="checkbox" name="colors" value="하양"></li>
							<li id="color_yellow" class="li_style"><a onclick=""><span class="yellow" style="background: yellow"></span>노랑</a><input type="checkbox" name="colors" value="노랑"></li>
							<li id="color_orange" class="li_style"><a onclick=""><span class="orange" style="background: orange"></span>주황</a><input type="checkbox" name="colors" value="주황"></li>
							<li id="color_pink" class="li_style"><a onclick=""><span class="pink" style="background: pink"></span>분홍</a><input type="checkbox" name="colors" value="분홍"></li>
							<li id="color_red" class="li_style" ><a onclick=""><span class="red" style="background: red"></span>빨강</a><input type="checkbox" name="colors" value="빨강"></li>
							<li id="color_brown" class="li_style"><a onclick=""><span class="brown" style="background: brown"></span>갈색</a><input type="checkbox" name="colors" value="갈색"></li>
							<li id="color_ygreen" class="li_style"><a onclick=""><span class="ygreen" style="background: yellowgreen"></span>연두</a><input type="checkbox" name="colors" value="연두"></li>
							<li id="color_green" class="li_style"><a onclick=""><span class="green" style="background: green"></span>초록</a><input type="checkbox" name="colors" value="초록"></li>
							<li id="color_bgreen" class="li_style" ><a onclick=""><span class="bgreen" style="background: rgb(00, 97, 70)"></span>청록</a><input type="checkbox" name="colors" value="청록"></li>
							<li id="color_blue" class="li_style" ><a onclick=""><span class="blue" style="background: blue"></span>파랑</a><input type="checkbox" name="colors" value="파랑"></li>
							<li id="color_navy" class="li_style" ><a onclick=""><span class="navy" style="background: navy"></span>남색</a><input type="checkbox" name="colors" value="남색"></li>
							<li id="color_wine" class="li_style" ><a onclick=""><span class="wine" style="background: rgb(245, 140, 245)"></span>자주</a><input type="checkbox" name="colors" value="자주"></li>
							<li id="color_purple" class="li_style"><a onclick=""><span class="purple"  style="background: purple"></span>보라</a><input type="checkbox" name="colors" value="보라"></li>
							<li id="color_grey" class="li_style"><a onclick=""><span class="grey"  style="background: gray"></span>회색</a><input type="checkbox" name="colors" value="회색"></li>
							<li id="color_black" class="li_style"><a onclick=""><span class="black"  style="background: black"></span>검정</a><input type="checkbox" name="colors" value="검정"></li>
							<li id="color_transp" class="li_style"><a onclick=""><span class="transp"></span>투명</a><input type="checkbox" name="colors" value="투명"></li>
						</ul>
					</td>	
				</tr>
				<tr>
					<th>분할선</th>
					<td colspan="3">
						<ul id="lineids" class="idty">
							<li id="line_plus" class="li_style"><a onclick=""><img src="${pageContext.request.contextPath }/images/pills/line02.jpg" alt="(+)형"></a><input type="checkbox" name="lines" value="+"></li>
							<li id="line_minus" class="li_style"><a onclick=""><img src="${pageContext.request.contextPath }/images/pills/line03.jpg" alt="(-)형"></a><input type="checkbox" name="lines" value="-"></li>
						</ul>	
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border: none;">
					<button class="btn btn-outline-grad btn-block" id="searchBTN" type="button">검색</button>
					</td>
					<td colspan="2" style="border: none;">
					<button class="btn btn-outline-grad btn-block" id="cancleBTN" type="button">취소</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>


	<div class="card"
		style="margin-left: 15%; margin-right: 15%;">
		<div class="card-body" style="">
			<div id="" class="" style="width: auto;">
				<table class="table-list" data-currentpage="1">

					<thead>
					<tr id="table-list-tr">
						<th rowspan="2" style="border:1px solid #d2d2d2; width: 10%;">
								<ul id="list-ul"><li>식별이미지</li></ul><i class="caret"></i>
						</th>
						<th rowspan="2" style="border:1px solid #d2d2d2; width: 10%;">
								<ul id="list-ul"><li>식별표시(앞/뒤)</li></ul><i class="caret"></i>
						</th>
						<th rowspan="2" style="border:1px solid #d2d2d2; width: 10%;">
								<ul id="list-ul"><li>제형</li></ul><i class="caret"></i>
						</th>
						<th colspan="3" style="border:1px solid #d2d2d2; width: 15%;">
								<ul id="list-ul"><li>크기(mm)</li></ul><i class="caret"></i>
						</th>
						<th rowspan="2" style="border:1px solid #d2d2d2; width: 40%;">
								<ul id="list-ul"><li>제품명/성분명</li></ul><i class="caret"></i>
						</th>
						<th rowspan="2" style="border:1px solid #d2d2d2; width: 15%;">
								<ul id="list-ul"><li>회사명</li></ul><i class="caret"></i>
						</th>						
					</tr>
					<tr id="table-list-tr">
						<th style="border:1px solid #d2d2d2; width: 50px;"><ul id="list-ul"><li>장축</li></ul></th>
						<th style="border:1px solid #d2d2d2; width: 50px;"><ul id="list-ul"><li>단축</li></ul></th>
						<th style="border:1px solid #d2d2d2; width: 50px;"><ul id="list-ul"><li>두께</li></ul></th>
					</tr>
					</thead>

					<!-- IMPORTANT, class="list" must be on tbody -->
					<tbody class="list">
						
						<c:forEach items="${pillList }" var="pillInfo">
						<tr data-timestamp="1509426000" id="tr_id" data-status="3" style="height: 60px;">
							<input type="hidden" value="${pillInfo.pi_no}"/>
							<td class="" style="height: 60px;"><img alt="" src="${pillInfo.pi_bigimg}" style="width: 96px; height: 71px;"></td>
							<td class="" style="height: 60px; text-align:center;">${pillInfo.pi_f_mark}</td>
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
			<div id="paginationDIV" style="margin-left: 40%; margin-bottom: 20px;"><div>${pagination }</div></div>

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
				
				<table class="infotable" id="infotable" >
					    <tbody>
					        <tr>
					            <th style="border: 2px soild black;">제품명</th>
					            <td colspan="2" id="result_drug_name">가나릴정 </td>
					            <td><img id="idfy_img_small" src="https://www.pharm.or.kr:442/images/sb_photo/big3/A11AOOOOO895502.jpg" alt="식별 이미지" onclick="" style="height: 123px;"></td>
					        </tr>
					    <tr>
					        <th>성분 / 함량</th>
					        <td colspan="3"> 
					            <ul id="ingr_mg">aaaa aaaa</ul>
					        </td>
					    </tr>
					
					    <tr>
					        <th>첨가제</th>
					        <td colspan="3" class="additives" id="additives_td">
					            <ul id="additives">산화티탄<br>스테아르산마그네슘<br>유당수화물<br></ul>
					        </td>
					    </tr>
					
					    <tr>
					        <th>전문 / 일반</th>
					        <td>전문</td>
					        <th>단일 / 복합</th>
					        <td id="sunb_count">단일</td>
					    </tr>
					    <tr>
					        <th>제조 / 수입사</th>
					        <td style="width:130px;">
					               	 영풍제약
					        </td>
					        <th>유효기간</th>
					        <td>
					        	2020.02.21
					        </td>
					    </tr>
					    <tr>
					        <th>완제/원료</th>
					        <td id="drug_form">완제</td>
					        <th>업종구분</th>
					        <td id="dosage_route">경구(내용고형)</td>
					    </tr>
					    <tr>
					        <th>성상</th>
					        <td colspan="3" id="charact">백색원형의 필름코팅정</td>
					    </tr>
					    <tr>
					        <th>허가일</th>
					        <td colspan="3">
					            2004년 10월 29일
					        </td>
					    </tr>           
					    <tr>
					        <th>포장단위<br>(식약처 기준)</th>
					        <td colspan="3" class="br0" id="drug_box">30정/병,100정/병,500정/병</td>					              
					    </tr>
					    <tr>
					        <th class="bb0">저장방법 </th>
					        <td colspan="4" class="bb0 br0" id="stmt">기밀용기, 실온보관(1-30℃)</td>
					    </tr>
					    
					</tbody>
				</table>
				
				
				
				
				
				
				
				
				
				
				
				
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>