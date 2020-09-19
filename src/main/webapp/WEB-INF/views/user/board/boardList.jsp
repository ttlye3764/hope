<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<head>
<title>Wizixo | Creative Multipurpose Bootstrap Template</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Creative Multipurpose Bootstrap Template">

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CPlayfair+Display:400,400i,700,700i%7CRoboto:400,400i,500,700"
	rel="stylesheet">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/vendor/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="assets/vendor/themify-icons/css/themify-icons.css" />
<link rel="stylesheet" type="text/css"
	href="assets/vendor/animate/animate.min.css" />

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="assets/css/style.css" />

<style>
.list-tr:hover {
	cursor: pointer;
	background-color: #d9eecd !important;
	transition: 1s;
}
</style>

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/template/assets/js/functions.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/template/assets/vendor/fitvids/jquery.fitvids.js"></script>
<script type="text/javascript">
	// 부트스트랩 엔터키 이벤트 제거
	$(document).keypress(function(e) {
		if (e.keyCode == 13)
			e.preventDefault();
	});

	$(function() {
		// 상세보기 기능
		$('#boardTBY tr').on(
				'click',
				function() {
					var bd_no = $(this).find('td:eq(0) input').val();
					var rnum = $(this).find('td:eq(0)').text();

					$(location).attr(
							'href',
							'${pageContext.request.contextPath}/user/board/boardView.do?bd_no='
									+ bd_no + '&rnum=' + rnum
									+ "&bd_division=${bd_division}"
									+ '&currentPage=${currentPage}'
									+ '&search_keyword=${search_keyword}'
									+ '&search_keycode=${search_keycode}');
				});

		// 검색 버튼 기능 
		$('#searchBTN')
				.on(
						'click',
						function() {
							var search_keyword = $("input[id='search_keyword']")
									.val();
							var search_keycode = $(
									"#search_keycode option:selected").val();

							document.location.href = '${pageContext.request.contextPath}/user/board/boardList.do?bd_division=${bd_division}&currentPage=${currentPage}&search_keyword='
									+ search_keyword
									+ '&search_keycode='
									+ search_keycode;
						});

	});

	// 부트스트랩 엔터키 이벤트 제거
	$(document).keypress(function(e) {
		if (e.keyCode == 13)
			e.preventDefault();
	});

	// 엔터 버튼 눌렀을때 검색
	function enterkey() {

		if (window.event.keyCode == 13) {
			// triiger : 강제로 기능 수행하는 아이 
			$('#searchBTN').trigger("click");
		}
		;
	};
</script>
</head>
<body>
	<div class="preloader">
		<img src="${pageContext.request.contextPath }/resources/template/assets/images/preloader.svg" alt="Pre-loader">
	</div>

	<!-- =======================
Banner innerpage -->
	<div class="innerpage-banner center bg-overlay-dark-7 py-7"
		style="background: url(assets/images/bg/04.jpg) no-repeat; background-size: cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">${board_division_name}</h1>
					<h6 class="subtitle">We transform your perception into an
						excellent website</h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a href="index.html"><i
									class="ti-home"></i> Home</a></li>
							<li class="breadcrumb-item">Table</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- =======================
Banner innerpage -->




	<!-- Table -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-12 mb-5">

					<!-- Sidebar -->
					<div class="sidebar">
						<div class="widget widget-newsletter border-0 p-0"
							style="display: flex; justify-content: space-between; margin: 100px 5px 0px 3px;">
							<div>
								<form>
									<div class="input-group mb-40">
										<div
											style="width: 110px; margin: 0px 5px 0px 0px; display: flex; justify-content: center; align-items: center; height: 50px;">
											<select id="search_keycode" name="search_keycode"
												class="custom-select select-big">
												<option value="TOTAL"
													<c:if test="${search_keycode == 'TOTAL'}">selected="selected"</c:if>>전체</option>
												<option value="TITLE"
													<c:if test="${search_keycode == 'TITLE'}">selected="selected"</c:if>>제목</option>
												<option value="CONTENT"
													<c:if test="${search_keycode == 'CONTENT'}">selected="selected"</c:if>>내용</option>
												<option value="WRITER"
													<c:if test="${search_keycode == 'WRITER'}">selected="selected"</c:if>>작성자</option>
											</select>
										</div>
										<div class=>
											<input id="search_keyword" onkeyup="enterkey();"
												class="form-control border-radius-right-0 border-right-0 mb-0"
												style="height: 40px; display: inline-block; margin: 5px 5px 5px 0px;"
												type="text" name="search_keyword" placeholder="Search"
												size="35px" value="${search_keyword }">
										</div>
										<span class="input-group-btn">
											<button type="button" id="searchBTN"
												class="btn btn-grad border-radius-left-0 mb-0">
												<i class="ti-search m-0"
													style="font-size: 2.0em; height: 45px; width: 20px;"></i>
											</button>
										</span>

										<!-- 등록버튼 시작-->
										<div
											style="padding-left: 10px; margin-bottom: 20px; height: 50px;"
											class="nav-item border-0 d-none d-lg-inline-block align-self-center">
											<c:if test="${bd_division ne 2 }">
											<a  href="${pageContext.request.contextPath}/user/board/boardForm.do?bd_division=${bd_division }"
												class=" btn btn-sm btn-grad text-white mb-0"
												style="float: right; height: 40px; margin: 4px 0px 25px 50px;">작성하기</a>
											</c:if>
										</div>
										<!-- 등록버튼 끝 -->
									</div>
								</form>
							</div>

						</div>
					</div>
					<!-- Sidebar end-->

					<div class="table-responsive-sm">
						<input type="hidden" id="bdDivisionNo" value="${bd_division }" />
						<table class="table table-lg table-bordered table-striped">
							<thead>
								<tr>
									<th scope="col" width="5%">번호</th>
									<th scope="col" width="60%">제목</th>
									<th scope="col" width="11%">작성자</th>
									<th scope="col" width="11%">작성일</th>
									<th scope="col" width="10%">조회수</th>
								</tr>
							</thead>
							<tbody id="boardTBY">
								<c:if test="${empty boardList }">
									<tr align="center">
										<td colspan="5"><font color="red">등록된 게시글이
												존재하지않습니다</font></td>
									</tr>
								</c:if>
								<c:if test="${!empty boardList }">
									<c:forEach items="${boardList}" var="boardInfo">
										<tr class="list-tr">
											<td>${boardInfo.rnum}<input type="hidden" class="bd_no"
												value="${boardInfo.bd_no}" /></td>
											<td><c:if test="${boardInfo.bd_depth != 0 }">
													<c:forEach begin="1" end="${boardInfo.bd_depth }">
                                                  &nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;
                                                 </c:forEach>
												</c:if> ${boardInfo.bd_title }</td>
											<td>${boardInfo.bd_writer }</td>
											<td>${boardInfo.bd_date }</td>
											<td>${boardInfo.bd_hit }</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					
					<!-- pagination -->
				<div id="paginationDIV" class="container mb-6">
					<div>${pagination }</div>
				</div>
				<!-- pagination -->
				<!-- Table -->
				
			</div>		
		</div>
	</div>
</section>
</body>
</html>