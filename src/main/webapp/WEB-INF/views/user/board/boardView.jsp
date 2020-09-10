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
        $(this).attr('action','${pageContext.request.contextPath}/user/board/updateBoardInfo.do?bd_no=' + bd_no + '&re_no=${re_no}' + '&bd_division=${bd_division}' + '&currentPage=${currentPage}' + '&search_keyword=${search_keyword}' + '&search_keycode=${search_keycode}');
 
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

        if(rnum == 'nu'){
			$(location).attr('href','${pageContext.request.contextPath}/user/member/myBoard.do');
        }else{
			$(location).attr('href','${pageContext.request.contextPath}/user/board/boardList.do?currentPage='+ currentPage + '&search_keyword='+ search_keyword + '&search_keycode=' + search_keycode + '&bd_division=${bd_division}');
        }
		
	});
	
    
    
});

// 파일 다운로드기능 
function fileDown(fileName, fileNo, fileBdNo) {
	$(location).attr('href','${pageContext.request.contextPath}/user/board/fileDownload.do?fileName='+ fileName + '&fileNo='+ fileNo + '&fileBdNo='+ fileBdNo);
}

// 댓글 등록기능 
function insertReply(bd_no){
	var re_content = $('#re_content').val();
	var bd_no = bd_no;

	alert("goofffd");

	if(re_content.length == 0){
		alert("댓글 내용을 입력해 주세요.")
		return false;
	}else{
		$.ajax({
            url     : '${pageContext.request.contextPath}/user/board/insertBoardReply.do',
            type    : 'post',
            data : {'re_content':re_content,'bd_no':bd_no,'re_no':re_no},
            dataType: 'json',
            success : function(result) {      
           		alert("댓글을 등록하였습니다.")
            }
		});
	}	
}

// 댓글 수정기능 
function updateReply2(bd_no, re_no, index){
	var re_content = $('input[name="re_contentModel"]').eq(index).val();	//모달 댓글 수정창의 댓글 input 태그 값으로 정정
	//var bdNo = $('input[name="bd_no"]').val();	//ok
	//var re_no = $('input[name="re_no"]').val();	//re_no라는 이름의 input 태그가 복수개(6개)
	//var re_no = re_no;
	
	$(location).attr('href','${pageContext.request.contextPath}/user/board/updateBoardReply.do?re_content='+ re_content + '&bd_no=' + bd_no + '&re_no=' + re_no + '&bd_division=${bd_division}');		
}


	// 댓글 삭제기능
// function deleteReply(bd_no, re_no, index){
// 	alert("zㅇ");
// 	var re_no = $('input[name="re_no"]').eq(index).val();
// 	$(location).attr('href', '${pageContext.request.contextPath}/user/board/deleteBoardReply.do?reContent='+ reContent + '&bdNo=' + bd_no + '&re_no=' + re_no + '&bd_division=${bd_division}');
// }
$(function(){
	$('#deleteReply').on('click', function(){
		var re_no = $('input[name="re_no"]').val();
		$(location).attr('href', '${pageContext.request.contextPath}/user/board/deleteBoardReply.do?re_no=' + re_no + '&bd_division=${bd_division}');
		});
});


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
							<h2 class="mb-3">게시판 상세보기</h2>
						</div>
							                                           <input type="hidden" id="bd_division" name="bd_division" value="${bd_division }">
																	   <input type="hidden" name="bd_no" value="${boardInfo.bd_no}"/>
						<div class="col-md-9 mb-2"><span class="form-group"><input type="text" class="form-control" placeholder="title"  id="bd_title" name="bd_title" value="${boardInfo.bd_title}"></span></div>
						<div class="col-md-9 mb-2"><span class="form-group"><input type="text" class="form-control" placeholder="writer" id="bd_writer" name="bd_writer" value="${boardInfo.bd_writer}"></span></div>
						<div class="col-md-9"><span class="form-group"><input type="text" class="form-control" id="bd_date" name="bd_date" value="${boardInfo.bd_date}"></span></div>
						<div class="col-md-9 input-group mb-4">							
							 <!-- 파일  -->
							 <c:forEach items="${boardInfo.items2 }" var="fileitemInfo" varStatus="status">
									<!-- 파일일 때 --> 
									<p>${status.count }. &nbsp;&nbsp; <a href="#" onclick="fileDown('${fileitemInfo.file_save_name }','${fileitemInfo.file_no }','${fileitemInfo.file_bd_no }');">${fileitemInfo.file_name } </a></p>
							 </c:forEach>
						</div>
						<div class="col-md-12 mb-2">
							<span class="form-group "><textarea cols="25" rows="20" class="form-control" placeholder="내용" name="bd_content" >${boardInfo.bd_content}</textarea></span>
						</div>
						<div class="col-md-2 text-center" style="margin-left:650px; float:left; display:inline-block;">
							<button type="submit" id="updateBtn" value="수정" class="btn-block btn btn-dark">수정</button>
							<button type="button" id="deleteBtn" value="삭제" class="btn-block btn btn-dark">삭제</button>
							<button type="button" id="listBtn" value="목록" class="btn-block btn btn-dark">목록</button>
						</div>
						
						
						
						
						
<!-- ***********************************- 댓글 자리 -********************************* -->
<!-- comments area -->
		<div class="row mt-5 comments-area">
					
<!-- 					<div> -->
<!-- 		                <table class="table mb-2">                     -->
<!-- 		                    <tr> -->
<!-- 		                        <td> -->
<!-- 		                            <textarea style="width: 925px" rows="3" cols="30" id="re_content" name="re_content" placeholder="댓글을 입력하세요"></textarea> -->
<!-- 		                            <br> -->
<!-- 		                            <div> -->
<%-- 		                                <a href='#' onclick="insertReply('${boardInfo.bd_no}')" class="btn pull-right btn-success">등록</a> --%>
<!-- 		                            </div> -->
<!-- 		                        </td> -->
<!-- 		                    </tr> -->
<!-- 		                </table> -->
<!-- 	            	</div> -->
					
					
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
														<div class="comment-meta-author"><a href="#">${vo.re_writer}</a></div>
														<div class="comment-meta-date">${vo.re_date }</div>
													</div>
													<div class="comment-content" style="width: 920px;">
														<p>${vo.re_content}</p>
														<div align="right">
															<button type="button" id="updateReply1"  data-toggle="modal" data-target="#replyModal${status.index }">수정</button>
<%-- 															<button type="button" id="deleteReply"  onclick="deleteReply('${boardInfo.bd_no}', '${vo.re_no }',${status.index})" class="">삭제</button> --%>
															<button type="button" id="deleteReply"  class="">삭제</button>
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
								<a href="javascript:insertReply('${boardInfo.bd_no}')">babo</a>dsffs
								<button id="insertReply" style="background-color: #343a40; color: #fff; border-color:#343a40;" onclick="insertReply('${boardInfo.bd_no}')">등록</button>
							</div>		
						</div>
						
						

				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>
	
	
		<!-- 모달2 inbody -->
							<c:forEach var="vo" items="${replyList}" varStatus="status">
									<div class="modal fade text-left" id="replyModal${status.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true">
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
															<input type="text" name="re_contentModel" value="${vo.re_content}">
														</div>
													<div align="right">
 														<button type="button" onclick="updateReply2('${boardInfo.bd_no}', '${vo.re_no }',${status.index})" style="margin: 0px 0px 0px 160px;">수정</button>
<!--  														<button type="button" class="" id="cencelReply" style="margin: 0px 0px 0px 160px;">취소</button> -->
 													</div>
												</div>
											</div>
										</div>
									</div>
							</c:forEach>		
	
			</div>
</form>
</body>
</html>