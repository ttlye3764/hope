<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });

    
    $('#bo_title').val('${freeboardInfo.bo_title}');
    $('#bo_nickname').val('${freeboardInfo.bo_nickname}');
    $('#bo_pwd').val('${freeboardInfo.bo_pwd}');
    $('#bo_mail').val('${freeboardInfo.bo_mail}');
    $('#bo_content').summernote('code', '${freeboardInfo.bo_content}');
    
    $('.freeboardView-btnList #btn1').click(function(){
    	// /ddit/13/freeboard/freeboardForm.jsp
    	$(location).attr('href', '${freeboardFormURI}');
    });
    
    
    //수정
    $('form[name=freeboardViewForm]').submit(function(){
    		
    var bo_content = $('#bo_content').summernote('code');
    $(this).append('<input type="hidden" name="bo_content" value="'+ bo_content +'"/>');
    $(this).append('<input type="hidden" name="bo_no" value="${freeboardInfo.bo_no}"/>');
    
    
    $(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
    $(this).attr('action','${pageContext.request.contextPath}/user/freeboard/updateFreeboardInfo.do');
    return true;
    });

    
    //삭제
    $('.freeboardView-btnList #btn2').click(function(){
    	var flag = true;
    	if(eval('${!empty LOGIN_MEMBERINFO}')){
    		if('${LOGIN_MEMBERINFO.mem_id}' == '${freeboardInfo.bo_writer}'){
    			$(location).attr('href','${pageContext.request.contextPath}/user/freeboard/deleteFreeboardInfo/${freeboardInfo.bo_no}.do');
    		}else{
    			flag = false;
    		}
    	}else{
    		flag = false;
    	}
    	if(!flag){
    		BootstrapDialog.show({
    			title : '알림',
    			message : '작성자만 게시글 삭제가 가능합니다'
    		});	
    	}
    });
    
    //계층형
     $('.freeboardView-btnList #btn3').click(function(){
    	 if(eval('${!empty LOGIN_MEMBERINFO}')){
    	    	// /ddit/13/main.jsp?contentPage=/13/freeboard/freeboardReplyFor.jsp?rnum=${param.rnum}&
    	    	// 한글 처리
    	    	var bo_title = encodeURIComponent('${freeboardInfo.bo_title}');
    	    					 // rnum <- freeboardList에서 넘어온 아이
    	    	var queryString = '?rnum=${param.rnum}&bo_title=' + bo_title;
    	    	var parentInfo = '&bo_group=${freeboardInfo.bo_group}&bo_seq=${freeboardInfo.bo_seq}&bo_depth=${freeboardInfo.bo_depth}';
    	    	$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardReplyForm.do' + queryString + parentInfo);
    	    	}else{
    	    		BootstrapDialog.show({
    	    			title : '알림',
    	    			message : '로그인 후 댓글 작성이 가능합니다'
    	    		});	
    	    	}
    	    });
    
});
</script>
</head>
<body>
<form name="freeboardViewForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nickname" name="bo_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_pwd" name="bo_pwd" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_mail" name="bo_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"><p></p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<c:forEach items="${freeboardInfo.items }" var="fileitemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">    
					</c:if>
					<c:if test="${stat.last }">
						<div class="item">
					</c:if>
					<img src="/files/${fileitemInfo.file_save_name }" alt="pic1" 
					     onclick="javascript:location.href='${pageContext.request.contextPath}/user/freeboard/fileDownload.do?file_seq=${fileitemInfo.file_seq }'">
				</div>
				</c:forEach>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10 freeboardView-btnList">
			<button type="button" class="btn btn-success" id="btn1">글쓰기</button>
			<button type="button" class="btn btn-danger" id="btn2">삭제</button>
			<button type="button" class="btn btn-primary" id="btn3">답글</button>
			<button type="button" class="btn btn-info" id="btn4">목록</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
		</div>
	</div>
</form>
</body>
</html>