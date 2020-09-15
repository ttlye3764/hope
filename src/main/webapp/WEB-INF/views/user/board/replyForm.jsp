<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 등록 화면 </title>
<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fitvids/jquery.fitvids.js"></script>
<script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
<script>
function(){

}

</script>
</head>
<body>
	 <form name="replyForm" action="${pageContext.request.contextPath}/user/board/insertReplyInfo.do" class="board-form-area" role="form" method="post" enctype="multipart/form-data">			
	<div class="container">
				<div class="row">
					<div class="col-sm-10 mb-5">
						<h5 class="text-center mb-4"></h5>
					
				<div class="row mt-5">
							<div class="col-md-12">
								<h2 class="mb-3">답글 작성하기</h2></div>

							<div class="col-md-9 mb-2">
									<span class="form-group">
										<input type="text" class="form-control"  value="[Re]&nbsp;"  id="bd_title" name="bd_title" >
									</span>
							</div>
							
							<input type="hidden" id="bd_division" name="bd_division" value="${bd_division}">
							<input type="hidden" name="bd_writer" value='${LOGIN_MEMBERINFO.mem_nickname}'>
							<input type="hidden" name="mem_no" value='${LOGIN_MEMBERINFO.mem_no}'>
							<input type="hidden" name="bd_sequence" value="${bd_sequence}">
							<input type="hidden" name="bd_group" value="${bd_group}">
							<input type="hidden" name="bd_depth" value="${bd_depth}">

							<div class="col-md-12 mb-2">
								<span class="form-group"><textarea cols="20" rows="15" class="form-control" placeholder="내용" name="bd_content"></textarea></span>
							</div>
							<div class="col-md-2 mb-2" style="margin-left:650px; float:left; display:inline-block;">
								<button type=submit id="regBtn" value="글쓰기" class="btn-block btn btn-dark">글쓰기</button>
							</div>
							<div class="mb-2">
								<button type="button" value="취소" class="btn-block btn btn-dark" onclick="window.history.back()">취소</button>
							</div>	
				</div>
	</form>
</body>
</html>