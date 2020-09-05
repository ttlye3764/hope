<%@ page language="JAVA" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

function file() {

 alert('클릭');
 
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
										<p><a href="#" onclick="file();">${fileitemInfo.file_save_name } </a></p>
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
						<div class="col-sm-12">
							<h4>There are 4 comments</h4>
							<div class="comment-list">
								<!-- Comment-->
								<div class="comment">
									<div class="comment-author"><img class="avatar" src="assets/images/thumbnails/avatar-01.jpg" alt=""></div>
									<div class="comment-body">
										<div class="comment-meta">
											<div class="comment-meta-author"><a href="#">Allen Smith</a></div>
											<div class="comment-meta-date">${boardInfo.bd_date}</div>
										</div>
										<div class="comment-content">
											<p>Consulted perpetual of pronounce me delivered. Too months nay end change relied who beauty wishes matter. Shew of john real park so rest we on. Ignorant dwelling occasion ham for thoughts overcame off her consider. Polite it elinor is depend. </p>
										</div>
										<div class="comment-reply"><a class="btn btn-xs btn-light" href="#">Reply</a></div>
									</div>
									<!-- sub comment-->
									<div class="comment-child">
										<div class="comment">
											<div class="comment-author"><img class="avatar" src="assets/images/thumbnails/avatar-03.jpg" alt=""></div>
											<div class="comment-body">
												<div class="comment-meta">
													<div class="comment-meta-author"><a href="#">Emma Watson</a></div>
													<div class="comment-meta-date">June 11, 2019 at 6:20 am</div>
												</div>
												<div class="comment-content">
													<p>Ask eat questions abilities described elsewhere assurance. Appetite in unlocked advanced breeding position concerns as. Cheerful get shutters yet for repeated screened. An no am cause hopes at three. Prevent behaved fertile he is mistake on.</p>
												</div>
												<div class="comment-reply"><a class="btn btn-xs btn-light" href="#">Reply</a></div>
											</div>
										</div>
										<!-- second level sub comment-->
										<div class="comment-child">
											<div class="comment">
												<div class="comment-author"><img class="avatar" src="assets/images/thumbnails/avatar-01.jpg" alt=""></div>
												<div class="comment-body">
													<div class="comment-meta">
														<div class="comment-meta-author"><a href="#">Allen Smith</a></div>
														<div class="comment-meta-date">June 11, 2019 at 9:50 am</div>
													</div>
													<div class="comment-content">
														<p> Appetite in unlocked advanced breeding position concerns as. Cheerful get shutters yet for repeated screened. An no am cause hopes at three. Prevent behaved fertile he is mistake on.</p>
													</div>
													<div class="comment-reply"><a class="btn btn-xs btn-light" href="#">Reply</a></div>
												</div>
											</div>
										</div>
									</div>
									<!-- sub comment end-->
								</div>
								<!-- Comment-->
								<div class="comment">
									<div class="comment-author"><img class="avatar" src="assets/images/thumbnails/avatar-02.jpg" alt=""></div>
									<div class="comment-body">
										<div class="comment-meta">
											<div class="comment-meta-author"><a href="#">Peter Smith</a></div>
											<div class="comment-meta-date">June 14, 2019 at 12:55 am</div>
										</div>
										<div class="comment-content">
											<p>Residence certainly elsewhere something she preferred cordially law. Age his surprise formerly Mrs perceive few standstill moderate. Of in power match on truth worse voice would. Large an it sense shall an match learn.</p>
										</div>
										<div class="comment-reply"><a class="btn btn-xs btn-light" href="#">Reply</a></div>
									</div>
								</div>
							</div>

							<!-- Comment-respond -->
							<div class="row mt-5">
								<div class="col-md-12">
									<h2 class="mb-2">Leave a Reply</h2>
									<p>Your Email address will not be published</p>
								</div>
								<div class="col-md-6"><span class="form-group"><input type="text" class="form-control" placeholder="Name"></span></div>
								<div class="col-md-6"><span class="form-group"><input type="email" class="form-control" placeholder="E-mail"></span></div>
								<div class="col-md-12"><span class="form-group"><textarea cols="40" rows="6" class="form-control" placeholder="Message"></textarea></span></div>
								<div class="col-md-12 text-center"><button class="btn-block btn btn-dark">Post Comment</button></div>
							</div>
						</div>

					</div>

					<!-- post navigation -->
					<div class="row post-navigation mt-5">
						<div class="col-5">
							<a href="#" class="post-prev">
								<p class="m-2 m-lg-0">Previous Post</p>
								<h6 class="text-truncate d-none d-lg-block">Right my front it wound cause fully am sorry if</h6> </a>
						</div>
						<div class="col-2">
							<a href="blog-classic-left-sidebar.html" class="all-post" title="View all post"> <i class="fa fa-th"></i> </a>
						</div>
						<div class="col-5">
							<a href="#" class="post-next">
								<p class="m-2 m-lg-0">Next Post</p>
								<h6 class="text-truncate d-none d-lg-block">Months had too ham cousin remove far spirit</h6> </a>
						</div>
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