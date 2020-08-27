<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fitvids/jquery.fitvids.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
<script>
$(function(){


    // 수정버튼
    $('form[name=boardView]').on('submit', function(){

		//같이 보내줄 값이 필요하기 때문에 bd_no을 hidden으로 감싸서 같이 리턴을 해줘야한다  ?
  		/* $(this).append('<input type="hidden" name="bd_no" value="${boardInfo.bd_no}"/>'); 
  			 기능이 수행되지 않아서  body부분에 <input type="hidden" name="bd_no" value="${boardInfo.bd_no}"/>을 넣기..
  		*/
  		var bd_no = $('input[name="bd_no"]').val();
        $(this).attr('action','${pageContext.request.contextPath}/user/board/updateBoardInfo.do?bd_no=' + bd_no);
        
        return true;
     });

    // 삭제버튼
  	$('#deleteBtn').on('click', function(){
		alert('삭제');
		var bd_no = $('input[name="bd_no"]').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/board/deleteBoardInfo.do?bd_no=' + bd_no);
  	 });  

  	
    // 목록버튼
    $('#listBtn').on('click', function(){	
		$(location).attr('href','${pageContext.request.contextPath}/user/board/boardList.do');
		
	});
    
    
});
function alertPrint(msg){
	BootstrapDialog.show({
		title:'알림',
		message: msg
	});
	return false;
}


</script>
</head>
<body>
<form name="boardView" class="board-form-area" role="form" method="post" enctype="multipart/form-data">			
<div class="container">
			<div class="row">
				<div class="col-sm-10 mb-5">
					<h5 class="text-center mb-4"></h5>
				
			<div class="row mt-5">
						<div class="col-md-12">
							<h2 class="mb-3">게시판 상세보기</h2></div>
																	   <input type="hidden" name="bd_no" value="${boardInfo.bd_no}"/>
						<div class="col-md-9"><span class="form-group"><input type="text" class="form-control" placeholder="title"  id="bd_title" name="bd_title" value="${boardInfo.bd_title}"></span></div>
						<div class="col-md-9"><span class="form-group"><input type="text" class="form-control" placeholder="writer" id="bd_writer" name="bd_writer" value="${boardInfo.bd_writer}"></span></div>
						<div class="col-md-9"><span class="form-group"><input type="text" class="form-control" id="bd_date" name="bd_date" value="${boardInfo.bd_date}"></span></div>
						<div class="col-md-9 input-group mb-4">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="inputGroupFile01">
								<label class="custom-file-label" for="inputGroupFile01">Upload your CV</label>
							</div>
						</div>
						<div class="col-md-12">
							<span class="form-group"><textarea cols="25" rows="20" class="form-control" placeholder="내용" name="bd_content" >${boardInfo.bd_content}</textarea></span>
						</div>
						<div class="col-md-2 text-center" style="margin-left:650px; float:left; display:inline-block;"  >
							<button type="submit" id="updateBtn" value="수정" class="btn-block btn btn-dark">수정</button>
							<button type="button" id="deleteBtn" value="삭제" class="btn-block btn btn-dark">삭제</button>
							<button type="button" id="listBtn" value="목록" class="btn-block btn btn-dark">목록</button>
							<button type="button" id="replyBtn" value="댓글쓰기" class="btn-block btn btn-dark">댓글쓰기</button>
						</div>
			</div>
</form>
</body>
</html>