<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
ul{
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
th{
	width: 100px;
	text-align:center;
}
td{
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
.selected{
	border:2px solid rgb(110, 63, 219);
}
#searchForm{
	margin-left: 25%;
	margin-right: 25%;
}
#pname, #cname{
	margin-top: 20px;
	width:100%;
}
#searchTable{
	width:100%;
}
</style>
<script>
	$(function(){
		$('.idty li').click(function(){
	if ($(this).hasClass('selected')) {
		$(this).removeClass('selected');
		$(this).find('input[type="checkbox"]').prop("checked",false);
	} else {
		$(this).addClass('selected');
		$(this).find('input[type="checkbox"]').prop("checked",true);
	}
	})
});
</script>
</head>
<body>
<form id="searchForm">
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
						<li id="line_no" class="li_style"><a onclick=""><img src="${pageContext.request.contextPath }/images/pills/line01.jpg" alt="없음"></a><input type="checkbox" name="lines" value="no"></li>
						<li id="line_plus" class="li_style"><a onclick=""><img src="${pageContext.request.contextPath }/images/pills/line02.jpg" alt="(+)형"></a><input type="checkbox" name="lines" value="plus"></li>
						<li id="line_minus" class="li_style"><a onclick=""><img src="${pageContext.request.contextPath }/images/pills/line03.jpg" alt="(-)형"></a><input type="checkbox" name="lines" value="minus"></li>
					</ul>	
				</td>
			</tr>
			<tr>
				<td colspan="2" style="border: none;">
				<button class="btn btn-outline-grad btn-block" type="submit">검색</button>
				</td>
				<td colspan="2" style="border: none;">
				<button class="btn btn-outline-grad btn-block" id="cancleBTN" type="button">취소</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html>