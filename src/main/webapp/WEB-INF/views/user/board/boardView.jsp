<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<script>
$(function(){
	if(!(${LOGIN_MEMBERINFO.mem_no} == ${boardInfo.mem_no})){
		$('#bd_title').attr("disabled", true);
		$('#bd_writer').attr("disabled", true);
		$('#bd_date').attr("disabled", true);
		$('#bd_content').attr("disabled", true);
	}
	
	
    // 수정버튼
    $('form[name=boardView]').on('submit', function(){
		
  		var bd_no = $('input[name="bd_no"]').val();
        $(this).attr('action','${pageContext.request.contextPath}/user/board/updateBoardInfo.do?bd_no=' + bd_no + '&re_no=${re_no}' +
                      '&bd_division=${bd_division}' + '&currentPage=${currentPage}' + '&search_keyword=${search_keyword}' + '&search_keycode=${search_keycode}');
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
        var currentPage = '${currentPage}';
        var search_keyword = '${search_keyword}';
        var search_keycode = '${search_keycode}';
        var bd_division = '${bd_division}';

        if(rnum == 'nu'){
			$(location).attr('href','${pageContext.request.contextPath}/user/member/myBoard.do');
        }else{
			$(location).attr('href','${pageContext.request.contextPath}/user/board/boardList.do?currentPage='+ currentPage + '&search_keyword='+ search_keyword + '&search_keycode=' + search_keycode + '&bd_division=${bd_division}');
        }
		
	});

		
	$("#comment_list").on("click", ".updateReply", function(){
		var re_content = $(this).parent().siblings()[0].innerText;

		$("input[name=re_contentModel]").val(re_content);

		var bd_no = $(this).data("bd_no");   
		var re_no = $(this).data("re_no");

		$("#modal_bd_no").val(bd_no);
		$("#modal_re_no").val(re_no);
	}); 

	$("#modalUpdateBtn").on("click", function(){
		updateReply2();
	});
});


//댓글 등록기능 
function insertReplyA(bd_no){
	var re_content = $('#re_content').val();
	
	$.ajax({
   	 	async    : false,
        url     : '${pageContext.request.contextPath}/user/board/insertBoardReply.do',
        type    : 'post',
        dataType : 'json',
        data : {'re_content':re_content,'bd_no':bd_no},
        success : function(Result) {
	       console.log(Result);
	      
	       /* board_replyList */
	       
        },
        complete : function(){
        	 replyList();
        	 $('#re_content').val("");
         }
   	});  
}

function replyList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/board/replyList',
		data : {
			bd_no : $('#bd_no').val()
		},
		success : function(result){
			$('#comment_list').empty();
			var replyList = "";
			var count = 0;
			$.each(result.replyList, function(index, item){

				replyList += '<input type="hidden" name="re_no" value="'+item.re_no+'" id="re_no">';
				replyList += '<div class="comment">';
				replyList += '	<div class="comment-author"><img class="avatar" src="assets/images/thumbnails/avatar-01.jpg" alt=""></div>';
				replyList += '	<div class="comment-body">';
				replyList += '		<div class="comment-meta">';
				replyList += '			<div class="comment-meta-author"><a href="#">'+item.mem_name+'</a></div>';
				replyList += '			<div class="comment-meta-date">'+item.re_date+'</div>';
				replyList += '		</div>';
				replyList += '		<div class="comment-content" style="width: 920px;">';
				replyList += '			<p>'+item.re_content+'</p>';
				replyList += '			<div align="right">';
					if(item.re_writer == '${LOGIN_MEMBERINFO.mem_no}'){
						replyList += '				<button type="button" id="updateReply1"  class="updateReply" data-bd_no="' + item.bd_no + '" data-re_no="' + item.re_no+ '" data-toggle="modal" data-target="#replyModal">수정</button>';
						replyList += '				<button type="button" id="deleteReply"  class="" data-re_no="' + item.re_no +'"  onclick="deleteReplyA(' + $('#bd_no').val() + ',' + item.re_no + ');" >삭제</button>';
						}		
				replyList += '			</div>';
				replyList += '		</div>';
				replyList += '</div>';
				count++;
			})

			$('#comment_list').append(replyList);
		},
		error : function(result){
				alert('리플 조회 실패')
		}
	})   		
}




// 댓글 수정기능 
function updateReply2(){
	var re_content = $('input[name="re_contentModel"]').val();	//모달 댓글 수정창의 댓글 input 태그 값으로 정정
	var bd_no = $('#modal_bd_no').val();	//ok
	var re_no = $('#modal_re_no').val();	//re_no라는 이름의 input 태그가 복수개(6개)
	
	$(location).attr('href','${pageContext.request.contextPath}/user/board/updateBoardReply.do?re_content='+ re_content + '&bd_no=' + bd_no + '&re_no=' + re_no + '&bd_division=${bd_division}');		
}


// 댓글 삭제기능
function deleteReplyA(bd_no, re_no){
	$(location).attr('href', '${pageContext.request.contextPath}/user/board/deleteBoardReply.do?bd_no=' + bd_no + '&re_no=' + re_no + '&bd_division=${bd_division}');
}



//파일 다운로드기능 
function fileDown(fileName, fileNo, fileBdNo) {
	$(location).attr('href','${pageContext.request.contextPath}/user/board/fileDownload.do?fileName='+ fileName + '&fileNo='+ fileNo + '&fileBdNo='+ fileBdNo);
}


</script>



<form name="boardView" class="board-form-area" role="form" method="post" enctype="multipart/form-data">			
<div class="container">
			<div class="row">
				<div class="col-sm-10 mb-5">
					<h5 class="text-center mb-4"></h5>
				
			<div class="row mt-5">
						<div class="col-md-12">
							<h2 class="mb-3">게시판 상세보기</h2>
						</div>
						<input type="hidden" id="bd_division" name="bd_division" value="${bd_division }">
						<input type="hidden" id="bd_no" name="bd_no" value="${boardInfo.bd_no}"/>
						<div class="col-md-9 mb-2"><span class="form-group"><input type="text" class="form-control" placeholder="title"  id="bd_title" name="bd_title" value="${boardInfo.bd_title}"></span></div>
						<div class="col-md-9 mb-2"><span class="form-group"><input type="text" class="form-control" placeholder="writer" id="bd_writer" name="bd_writer" value="${boardInfo.bd_writer}"></span></div>
						<div class="col-md-9"><span class="form-group"><input type="text" class="form-control" id="bd_date" name="bd_date" value="${boardInfo.bd_date}"></span></div>
						
						<c:if test="${LOGIN_MEMBERINFO.mem_no eq 1}">
							<div class="form-group">
								<label for="exampleFormControlFile1"></label>
								<input type="file" class="form-control-file" name="files" id="exampleFormControlFile1" onchange="setThumbnail(event);"/>
							</div>
						</c:if>
						
								
						<div class="col-md-12 mb-2">
							<span class="form-group "><textarea cols="25" rows="20" class="form-control" placeholder="내용" id="bd_content" name="bd_content" >${boardInfo.bd_content}</textarea></span>
						</div>
						<div class="col-md-13 input-group mb-1">							
							 <!-- 파일  -->
							 <c:forEach items="${boardInfo.items2 }" var="fileitemInfo" varStatus="status">
									<!-- 파일일 때 --> 
									<p>${status.count }.&nbsp;&nbsp; <a href="#" onclick="fileDown('${fileitemInfo.file_save_name }','${fileitemInfo.file_no }','${fileitemInfo.file_bd_no }');">${fileitemInfo.file_name } </a></p>
									<img src="/files/${fileitemInfo.file_save_name }" >
							 </c:forEach>
						</div>
							<div class="col-md-2 text-center" style="margin-left:700px; float:left; display:inline-block;" > 
								<c:if test="${bd_division ne 2 }">
								   <c:if test="${LOGIN_MEMBERINFO.mem_no eq boardInfo.mem_no}">
										<button type="submit" id="updateBtn" value="수정" class="btn-block btn btn-dark" >수정</button>
										<button type="button" id="deleteBtn" value="삭제" class="btn-block btn btn-dark" >삭제</button>
									</c:if>
								</c:if>
									<button type="button" id="listBtn" value="목록" class="btn-block btn btn-dark" >목록</button>
							</div>
						 
						
						
<!-- ***********************************- 댓글 자리 -********************************* -->
<!-- comments area -->
	
		<div class="row mt-5 comments-area">
				
						<div style="width: 100%;">
							<h4>댓글</h4>
							<div class="comment-list" id="comment_list">
							
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
												</div>
												<!-- sub comment end-->
											</div>
   									 </c:when>
		    						<c:otherwise>
		        						<!-- Comment-->
										<c:forEach var="vo" items="${replyList}" varStatus="status">
		        						<input type="hidden" name="re_no" value="${vo.re_no}" id="re_no">
		        				
											<div class="comment">
												<div class="comment-author"><img class="avatar" src="assets/images/thumbnails/avatar-01.jpg" alt=""></div>
												<div class="comment-body">
													<div class="comment-meta">
														<div class="comment-meta-author"><a href="#">${vo.mem_name}</a></div>
														<div class="comment-meta-date">${vo.re_date }</div>
													</div>
													<div class="comment-content" style="width: 920px;">
														<p>${vo.re_content}</p>
														<div align="right">
														<%-- INDEX : [${status.index }]   인덱스 번호 확인해볼때는 이렇게 el태그로 확인할 수 있다.--%>
															<c:if test="${LOGIN_MEMBERINFO.mem_name eq vo.mem_name}">
																<button type="button" id="updateReply1" class="updateReply" data-bd_no="${vo.bd_no}" data-re_no="${vo.re_no }" data-toggle="modal" data-target="#replyModal">수정</button>
																<button type="button" id="deleteReply"  onclick="deleteReplyA('${boardInfo.bd_no}','${vo.re_no }')" class="">삭제</button>
															</c:if>
														</div>
													</div>
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
									<textarea id="re_content" name="re_content" cols="30" rows="3" class="form-control" placeholder="Message" ></textarea>
								</span>
							</div>
							<div class="col-md-12 text-right" >
								<button type="button" id="insertReply" onclick="insertReplyA(${boardInfo.bd_no})" style="background-color: #343a40; color: #fff; border-color:#343a40;">등록</button>
							</div>		
						</div>
					</div>
				<!-- blog End -->
			</div>
		</div>

	
	
		<!-- 모달2 inbody -->
<%-- 								<c:forEach var="vo" items="${replyList}" varStatus="status"> --%>
										<div class="modal fade text-left" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
											<input type="hidden" id="modal_bd_no" />
											<input type="hidden" id="modal_re_no" />
											
											<div class="modal-dialog modal-dialog-centered" role="document">
										  		<div class="modal-content" id="modals">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLongTitle" ><p>댓글 수정</p></h5>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
															<div class="form-group">
																<label for="exampleFormControlFile1">댓글 내용 ${status.index}</label>
																<!-- 어떠한 댓글을 수정을 해도 0번째 댓글 내용으로 수정이 되어 보여지는 이유 : 이 모달창은 id는 유일값만 존재해야하는데 모든 댓글이 같은 id값으로 되어있기때문에 오로지 0번째 내용으로만 바뀌는 것이다. 
																                                                                                                    그러므로 좋은 방법은 아니지만, 최선의 방법은 바뀔 내용 input태그에 클래스나 네임값을 줘서 위에 기능 수행하기  
																 -->
																<input type="text" name="re_contentModel" value=""> <%--${vo.re_content} --%>
															</div>
														<div align="right">
	 														<button type="button" id="modalUpdateBtn" style="margin: 0px 0px 0px 160px;">수정</button>
	 													</div>
													</div>
												</div>
											</div>
										</div>
<%-- 								</c:forEach>		 --%>
			</div>
</form>