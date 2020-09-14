<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/validation.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

</script>
<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
      <div class="container">
         <div class="row all-text-white">
            <div class="col-md-12 align-self-center">
               <h1 class="innerpage-title">내 차 정보 수정</h1>
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/user/main/mainForm.do"><i class="ti-home"></i> Home</a></li>
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
   <form name="carForm" method="post" action="${pageContext.request.contextPath}/user/car/updateMycar.do">
      <table style="border: none" align="center">
		<tr>            
            <td width="150px" height="25" class="idright">차종</td>
            <td>
            <input type="text" class="form-control" id="car_kinds" name="car_kinds" value=${carInfo.car_kinds } />
            </td>
            <td width="150px"></td>
         </tr>
         <tr>            
            <td width="150px" height="25" class="idright">차량번호</td>
            <td>
            <input type="text" class="form-control" id="car_no" name="car_no" value=${carInfo.car_no } />
            </td>
            <td width="150px"></td>
         </tr>
        <tr>            
            <td width="150px" height="25" class="idright">출고년도</td>
            <td>
            <input type="text" class="form-control" id="car_date" name="car_date" value=${carInfo.car_date } />
            </td>
            <td width="150px"></td>
         </tr>
         <tr>            
            <td width="150px" height="25" class="idright">유종구분</td>
            <td>
            	<select id="search_keycode" name="car_oil" class="custom-select select-big">
					<option value="휘발유" selected="selected">휘발유</option>
					<option value="경유">경유</option>
					<option value="LPG">LPG</option>
				</select>
            </td>
            <td width="150px"></td>
         </tr>
         <tr>
            <td class="btnGroup" colspan="3" align="center">
               <input id="btn1" type="submit" value="수정"/>               
               &nbsp;&nbsp;&nbsp;&nbsp;
               <button id="btn3" type="button">취소
               </button>
            </td>
         </tr>
      </table>
   </form>
