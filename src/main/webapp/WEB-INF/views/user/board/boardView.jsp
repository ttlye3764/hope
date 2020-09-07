<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
        $(this).attr('action','${pageContext.request.contextPath}/user/board/updateBoardInfo.do?bd_no=' + bd_no + "&bd_division=${bd_division}");
        
        return true;
     });

    // 삭제버튼
  	$('#deleteBtn').on('click', function(){
		//alert('삭제');
		var bd_no = $('input[name="bd_no"]').val();
		$(location).attr('href','${pageContext.request.contextPath}/user/board/deleteBoardInfo.do?bd_no=' + bd_no + "&bd_division=${bd_division}");
  	 });  

  	
    // 목록버튼
    $('#listBtn').on('click', function(){
        var rnum = '${rnum}';
        if(rnum == 'nu'){
			$(location).attr('href','${pageContext.request.contextPath}/user/member/myBoard.do');
        }else{
			$(location).attr('href','${pageContext.request.contextPath}/user/board/boardList.do?bd_division=${bd_division }');
        }
		
	});
    
    
});
function alertPrint(msg){
	BootstrapDialog.show({
		title:'알림',
		message: msg
	});
	return false;
}

function fileDown(fileName, fileNo, fileBdNo) {
	$(location).attr('href','${pageContext.request.contextPath}/user/board/fileDownload.do?fileName='+ fileName + '&fileNo='+ fileNo + '&fileBdNo='+ fileBdNo);
}

function insertReply(bd_no){
	// 등록
	var reContent = $('#re_content').val();
	var bdNo = bd_no;

	if(reContent.length == 0){
		alert("댓글 내용을 입력 해 주세요.")
		return false;
	}else{


		$.ajax({
            url     : "${pageContext.request.contextPath}/user/board/insertBoardReply.do?reContent="+ reContent +"&bdNo=" + bdNo,
            type    : 'get',
            dataType: 'json',
            success : function(result) {      
           		alert("댓글을 등록하였습니다.")
            }
		});

	}
	
	
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
							                                           <input type="hidden" id="bd_division" name="bd_division" value="${bd_division }">
																	   <input type="hidden" name="bd_no" value="${boardInfo.bd_no}"/>
						<div class="col-md-9 "><span class="form-group"><input type="text" class="form-control" placeholder="title"  id="bd_title" name="bd_title" value="${boardInfo.bd_title}"></span></div>
						<div class="col-md-9 mb-2"><span class="form-group"><input type="text" class="form-control" placeholder="writer" id="bd_writer" name="bd_writer" value="${boardInfo.bd_writer}"></span></div>
						<div class="col-md-9"><span class="form-group"><input type="text" class="form-control" id="bd_date" name="bd_date" value="${boardInfo.bd_date}"></span></div>
						<div class="col-md-9 input-group mb-4">
<!-- 							<div class="custom-file"> -->
<!-- 								<input type="file" class="custom-file-input" id="inputGroupFile01"> -->
<!-- 								<label class="custom-file-label" for="inputGroupFile01">Upload your CV</label> -->
<!-- 							</div> -->
							
							 <!-- 파일  -->
							 <c:forEach items="${boardInfo.items2 }" var="fileitemInfo" varStatus="status">
									<!-- 파일일 때 --> 
									<p>${status.count }. &nbsp;&nbsp; <a href="#" onclick="fileDown('${fileitemInfo.file_save_name }','${fileitemInfo.file_no }','${fileitemInfo.file_bd_no }');">${fileitemInfo.file_name } </a></p>
							 </c:forEach>
					 
						</div>
						<div class="col-md-12">
							<span class="form-group"><textarea cols="25" rows="20" class="form-control" placeholder="내용" name="bd_content" >${boardInfo.bd_content}</textarea></span>
						</div>
						<div class="col-md-2 text-center" style="margin-left:650px; float:left; display:inline-block;">
							<button type="submit" id="updateBtn" value="수정" class="btn-block btn btn-dark">수정</button>
							<button type="button" id="deleteBtn" value="삭제" class="btn-block btn btn-dark">삭제</button>
							<button type="button" id="listBtn" value="목록" class="btn-block btn btn-dark">목록</button>
							<button type="button" id="replyBtn" value="댓글쓰기" class="btn-block btn btn-dark">댓글쓰기</button>
						</div>
						
<!-- 			        ***********************************- 댓글 자리 -*********************************			 -->
<!-- comments area -->
					<div class="row mt-5 comments-area">
						<div style="width: 100%;">
							<h4>댓글</h4>
							<div class="comment-list">
							
							
							
							<c:choose>
    								<c:when test="${fn:length(replyList) == 0}">
       								 	<div class="comment">
												<div class="comment-author"><img class="avatar" src="assets/images/thumbnails/avatar-01.jpg" alt=""></div>
												<div class="comment-body">
													<div class="comment-meta">
														<div class="comment-meta-author"><a href="#"></a></div>
														<div class="comment-meta-date"></div>
													</div>
													
													<div class="comment-content" style="width: 920px;">
														<p></p>
													</div>
													<!-- <div class="comment-reply"><a class="btn btn-xs btn-light" href="#">Reply</a></div> -->
												</div>
											
												<!-- sub comment end-->
											</div>
   									 </c:when>
		    						<c:otherwise>
		        						<!-- Comment-->
										<c:forEach var="vo" items="${replyList}" varStatus="i">
											<div class="comment">
												<div class="comment-author"><img class="avatar" src="assets/images/thumbnails/avatar-01.jpg" alt=""></div>
												<div class="comment-body">
													<div class="comment-meta">
														<div class="comment-meta-author"><a href="#">${vo.re_writer}</a></div>
														<div class="comment-meta-date">${vo.re_date }</div>
													</div>
													
													<div class="comment-content" style="width: 920px;">
														<p>${vo.re_content}</p>
													</div>
													<!-- <div class="comment-reply"><a class="btn btn-xs btn-light" href="#">Reply</a></div> -->
												</div>
											
												<!-- sub comment end-->
											</div>
										</c:forEach>
		    						</c:otherwise> 
							</c:choose>
							
							
							
							
								
							</div>

							<!-- Comment-respond -->
						
						</div>
						
						

					</div>
				
					
						<div class="row mt-5">
								<div class="col-md-12">
									<h2 class="mb-2">댓글 작성</h2>
								</div>
								<div class="col-md-12">
									<span class="form-group">
										<textarea id="re_content" name="re_content" cols="40" rows="6" class="form-control" placeholder="Message" ></textarea>
									</span>
								</div>
								
								
								<div class="col-md-12 text-right" >
									<button style="background-color: #343a40; color: #fff; border-color:#343a40;" onclick="insertReply('${boardInfo.bd_no}')">등록</button>
								</div>
								
								<%-- <div class="col-md-12 text-center"><button onclick="insertReply('${boardInfo.bd_no}')" class="btn-dark">등록</button></div> --%>
							</div>

				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>
	
			</div>
</form>
</body>
</html>