<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>
$(function(){
	
	$("#files").on("change", handleImgFileSelect);

 	// 등록버튼기능
    $('form[name=boardForm]').on('submit', function(){

    	$(this).attr('action','${pageContext.request.contextPath}/user/board/insertBoardInfo.do?bd_division=${bd_division }');
     
        return true;
     });

    // 목록버튼기능
    $('#listBtn').on('click', function(){	
    	//'${pageContext.request.contextPath}/user/board/boardView.do?bd_no=' + bd_no + '&rnum=' + rnum + "&bd_division=${bd_division}"
		$(location).attr('href','${pageContext.request.contextPath}/user/board/boardList.do?bd_division=${bd_division}');	
	});

   

    
	// 파일 
   
});


function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지만 업로드 가능합니다.");
			return;
		}
		
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e)	{
				var imgInsert = '<div style="width: 390px; height: 280px; align-content: center;">';
				imgInsert += '<img id="img" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;" src="'+e.target.result+'">';
				imgInsert += '</div>'; 
				$('#imgimg').append(imgInsert);
				
		}
		reader.readAsDataURL(f);
	});
		
		
}
</script>

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
										<input type="file" class="form-control-file" name="files" id="exampleFormControlFile1" onchange="handleImgFileSelect(event);"/>
										<div id="imgimg">
											
										</div>
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
				
				</div>
			</div>
		</div>
	</form>
