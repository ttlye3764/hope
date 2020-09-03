<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 100%">
		<div id="freeboardList_content" style="width: 50%; margin: auto;">
		<h4>내가 작성한 게시글</h4>
			<div class="panel panel-blue">
				<div class="panel-heading">자유게시판</div>
				<div class="table-responsive-sm">
					<table class="table table-lg table-bordered table-striped">
						<thead>
							<tr>
								<th scope="col" width="60%">제목</th>
								<th scope="col" width="10%">작성자</th>
								<th scope="col" width="20%">작성일</th>
								<th scope="col" width="10%">조회수</th>
							</tr>
						</thead>
						<tbody id="boardTBY">
							<c:if test="${empty fboardList }">
								<tr align="center">
									<td colspan="5"><font color="red">등록된 게시글이 존재하지않습니다</font></td>
								</tr>
							</c:if>
							<c:if test="${!empty fboardList }">
								<c:forEach items="${fboardList}" var="fboardInfo">
									<tr>
										<td><c:if test="${fboardInfo.bd_depth != 0 }">
												<c:forEach begin="1" end="${fboardInfo.bd_depth }">
                                            		&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;
                                        			</c:forEach>
											</c:if> ${fboardInfo.bd_title }</td>
										<td>${fboardInfo.bd_writer }</td>
										<td>${fboardInfo.bd_date }</td>
										<td>${fboardInfo.bd_hit }</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>

				<div class="panel-heading">건의사항</div>
				<div class="table-responsive-sm">
					<table class="table table-lg table-bordered table-striped">
						<thead>
							<tr>
								<th scope="col" width="60%">제목</th>
								<th scope="col" width="10%">작성자</th>
								<th scope="col" width="20%">작성일</th>
								<th scope="col" width="10%">조회수</th>
							</tr>
						</thead>
						<tbody id="boardTBY">
							<c:if test="${empty boardList }">
								<tr align="center">
									<td colspan="5"><font color="red">등록된 게시글이 존재하지않습니다</font></td>
								</tr>
							</c:if>
							<c:if test="${!empty boardList }">
								<c:forEach items="${boardList}" var="boardInfo">
									<tr>
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
				<div class="panel-heading">QnA</div>
				<div class="table-responsive-sm">
					<table class="table table-lg table-bordered table-striped">
						<thead>
							<tr>
								<th scope="col" width="60%">제목</th>
								<th scope="col" width="10%">작성자</th>
								<th scope="col" width="20%">작성일</th>
								<th scope="col" width="10%">조회수</th>
							</tr>
						</thead>
						<tbody id="boardTBY">
							<c:if test="${empty qboardList }">
								<tr align="center">
									<td colspan="5"><font color="red">등록된 게시글이 존재하지않습니다</font></td>
								</tr>
							</c:if>
							<c:if test="${!empty qboardList }">
								<c:forEach items="${qboardList}" var="qboardInfo">
									<tr>
										<td><c:if test="${qboardInfo.bd_depth != 0 }">
												<c:forEach begin="1" end="${qboardInfo.bd_depth }">
                                            		&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;
                                        			</c:forEach>
											</c:if> ${qboardInfo.bd_title }</td>
										<td>${qboardInfo.bd_writer }</td>
										<td>${qboardInfo.bd_date }</td>
										<td>${qboardInfo.bd_hit }</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>