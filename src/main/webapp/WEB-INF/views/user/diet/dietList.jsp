<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(${pageContext.request.contextPath}/image/food1.jpg) no-repeat; background-size:cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">diet List</h1>
					<h6 class="subtitle">안녕하세요 메뉴 리스트입니다</h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a href="index.html"><i class="ti-home"></i> Home</a></li>
							<li class="breadcrumb-item">Blog</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<section class="blog-page pb-0">
		<div class="container">
			<div class="row">
				<!-- sidebar start -->
				<aside class="col-md-3 sidebar order-last order-md-first">
					<!-- Text Widget -->
					<div class="widget">
						<h5 class="widget-title" id="h5_menuList">메뉴 리스트</h5>
						<p class="mb-0">Resources exquisite set arranging moonlight sex him household had. Months had too ham cousin remove far spirit. She procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>
					<div class="widget">
						<h5 class="widget-title">추천 식단 리스트</h5>
						<p class="mb-0">Resources exquisite set arranging moonlight sex him household had. Months had too ham cousin remove far spirit. She procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>
					<div class="widget">
						<h5 class="widget-title">나만의 식단 리스트</h5>
						<p class="mb-0">Resources exquisite set arranging moonlight sex him household had. Months had too ham cousin remove far spirit. She procuring the why performed continual improving. Civil songs so large shade in cause.</p>
					</div>
					
					<!-- Newsletter Widget -->
					<div class="widget widget-newsletter">
						<h5 class="widget-title">식단 리스트</h5>
						<p class="mb-1">Subscribe to our newsletter to receive exclusive offers.</p>
						<form>
							<div class="input-group">
								<input type="email" class="form-control" placeholder="Enter your Email...">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-grad mb-0"><i class="fa fa-paper-plane m-0"></i></button>
								</span>
							</div>
						</form>
					</div>

					<!-- Posts Widget -->
					<div class="widget widget-post">
						<h5 class="widget-title">Recent Posts</h5>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/01.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">The Stories Behind those Iconic Blogs</a>
								<p class="date">Aug 26, 2018</p>
							</div>
						</div>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/02.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">Months had too ham cousin remove</a>
								<p class="date">Jun 05, 2018</p>
							</div>
						</div>
						<div class="widget-post clearfix">
							<div class="widget-image">
								<img class="border-radius-3" src="assets/images/thumbnails/03.jpg" alt="">
							</div>
							<div class="details">
								<a href="#">Lady an mr here must neat sold</a>
								<p class="date">May 16, 2018</p>
							</div>
						</div>
					</div>

					<!-- Tag Widget -->
					<div class="widget">
						<h5 class="widget-title">Tags</h5>
						<div class="tags">
							<a href="#">studio</a>
							<a href="#">events</a>
							<a href="#">WordPress</a>
							<a href="#">gadgets</a>
							<a href="#">office</a>
							<a href="#">magazine</a>
							<a href="#">freebies</a>
							<a href="#">photograpy</a>
							<a href="#">updates</a>
							<a href="#">creative</a>
							<a href="#">travel</a>
						</div>
					</div>
				</aside>
				<!-- sidebar end -->

				<!-- blog start -->
				<div class="col-md-9 order-first order-lg-first">
					<!-- Post item  with image-->
					
					<h5 class="widget-title">메뉴 리스트</h5>
					<table class="table table-lg table-noborder table-striped">
							<thead class="all-text-white bg-grad">
								<tr>
									<th scope="col">#</th>
									<th scope="col">메뉴이름</th>
									<th scope="col">열량</th>
									<th scope="col">Handle</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${menuList }" var="menuInfo" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td>${menuInfo.menu_name }</td>
									<td>${menuInfo.menu_kcal }</td>
									<td>@mdo</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>

					<!-- pagination -->
					<div class="container mb-6">
						<div class="row justify-content-center">
							<div class="col-md-8">
								<nav>
									<ul class="pagination justify-content-center">
										<li class="page-item disabled"> <span class="page-link">Prev</span> </li>
										<li class="page-item active"> <span class="page-link bg-grad"> 1 </span> </li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">Next</a> </li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
					<!-- pagination -->

				</div>
				<!-- blog End -->
			</div>
		</div>
	</section>
