<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>

<script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/template/assets/vendor/popper.js/umd/popper.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/template/assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/template/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!--Vendors-->
   <script src="${pageContext.request.contextPath }/resources/template/assets/vendor/fitvids/jquery.fitvids.js"></script>

   <!--Template Functions-->
   <script src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>

<script>
$(function(){

	$("#files").on("change", handleImgFileSelect);

 	// 등록버튼기능
    $('form[name=boardForm]').on('submit', function(){
    
		var bd_title = $('input[name="bd_title"]').val();
		var bd_writer = $('input[name="bd_writer"]').val();
    	$(this).attr('action','${pageContext.request.contextPath}/admin/board/insertBoardInfo.do?bd_division=${bd_division }' + '&bd_title=' + bd_title + '&bd_writer=' + bd_writer);
     
        return true;
     });

    // 목록버튼기능
    $('#listBtn').on('click', function(){	
		$(location).attr('href','${pageContext.request.contextPath}/admin/board/boardList.do?bd_division=${bd_division}');	
	});

	// 파일 
   function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
			
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e)	{
					$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
	}
});



</script>
</head>
<body>
	<form name="boardForm" class="board-form-area" role="form" method="post" enctype="multipart/form-data">			
	<div class="container">
				<div class="row">
					<div class="col-sm-10 mb-5">
						<h5 class="text-center mb-4"></h5>
					
				<div class="row mt-5">
							<div class="col-md-12">
								<h2 class="mb-3">게시판 작성하기</h2></div>
							<div class="col-md-9 mb-2">
									<span class="form-group">
										<input type="text" class="form-control" placeholder="제목" id="bd_title" name="bd_title">
									</span>
							</div>
							<input type="hidden" id="bd_division" name="bd_division" value="${bd_division }">
							<input type="hidden" name="bd_writer" value='${LOGIN_MEMBERINFO.mem_nickname }'>
							<input type="hidden" name="mem_no" value='${LOGIN_MEMBERINFO.mem_no }'>
							<div class="col-md-9 input-group mb-2">
															
								<div class="form-group">
									<label for="exampleFormControlFile1"></label>
									<input type="file" class="form-control-file" name="files" id="exampleFormControlFile1" onchange="setThumbnail(event);"/>
								</div>
								
							</div>
							<div class="col-md-12 mb-2">
								<span class="form-group"><textarea cols="25" rows="20" class="form-control" placeholder="내용" name="bd_content"></textarea></span>
							</div>
							<div class="col-md-2 mb-2" style="margin-left:650px; float:left; display:inline-block;">
								<button type=submit id="regBtnZ" value="등록" class="btn-block btn btn-dark">등록</button>
							</div>
							<div class="mb-2">
								<button type="button" id="listBtn" value="목록" class="btn-block btn btn-dark">목록</button>
							</div>	
				</div>
	</form>
</body>
</html>