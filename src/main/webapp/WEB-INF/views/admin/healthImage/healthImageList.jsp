<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="loading">
        <div id="detached-topbar-placeholder"></div>
        <!-- Begin page -->
        <div class="wrapper">

            <div id="vertical-sidebar-placeholder"></div>
            <div id="detached-sidebar-placeholder"></div>

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    <div id="vertical-topbar-placeholder"></div>
                    <div id="horizontal-topbar-placeholder"></div>

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);"></a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);"></a></li>
                                            <li class="breadcrumb-item active"></li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title"></h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col-sm-4">
                                            	<button type="button" class="btn btn-danger mb-2" value="등록" id="regBtn">
                                            		<i class="mdi mdi-plus-circle mr-2"></i>등록하기</button>
                                            </div>
                                            <div class="col-sm-8">
                                            	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
	                                                <div class="text-sm-right">
	                                                    <button type="button" class="btn btn-success mb-2 mr-1"><i class="mdi mdi-settings"></i></button>
	                                                    <button type="button" class="btn btn-light mb-2 mr-1" id="excel">Excel</button>
	                                                </div>
                                            	</form>
                                            </div><!-- end col-->
                                        </div>
                
                                        <div class="table-responsive">
                                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable" style="text-align: center;">
                                                <ul class="nav nav-tabs mb-3">
                                                 <li class="nav-item">
		                                                <a href="#home" id="all" data-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    <i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
		                                                    <span class="d-none d-lg-block">전체</span>
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a href="#home" onclick="shoulder();" data-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    <i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
		                                                    <input type="hidden" value="어깨" id="shoulder"/>
		                                                    <span class="d-none d-lg-block">어깨</span>
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a href="#profile" onclick="back();" data-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
		                                                    <input type="hidden" value="등" id="back"/>
		                                                    <span class="d-none d-lg-block">등</span>
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a href="#settings" onclick="chest();" data-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
		                                                    <input type="hidden" value="가슴" id="chest"/>
		                                                    <span class="d-none d-lg-block">가슴</span>
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a href="#settings" onclick="arm();" data-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
		                                                    <input type="hidden" value="팔" id="arm"/>
		                                                    <span class="d-none d-lg-block">팔</span>
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a href="#settings" onclick="leg();" data-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
		                                                    <input type="hidden" value="다리" id="leg"/>
		                                                    <span class="d-none d-lg-block">다리</span>
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a href="#settings" onclick="exe1();" data-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
		                                                    <input type="hidden" value="추천 유지 운동" id="exe1"/>
		                                                    <span class="d-none d-lg-block">추천 유지 운동</span>
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a href="#settings" onclick="exe2();" data-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
		                                                    <input type="hidden" value="추천 근욱 운동" id="exe2"/>
		                                                    <span class="d-none d-lg-block">추천 근육 운동</span>
		                                                </a>
		                                            </li>
		                                           
		                                        </ul>
                                                <thead class="thead-light">
                                                    <tr>
                                                       	<th class="all">추천 운동</th>
                                                        <th>카테고리</th>
                                                        <th>추천 연령</th>
                                                        <th>운동 방법(유/무)</th>
                                                        <th>시간</th>
                                                        <th >난이도</th>
                                                    </tr>
                                                </thead>
												
												<c:forEach items="${healthImageList }" var="healthInfo" varStatus="status">
                                                <tbody >
                                                     <tbody id="list">
                                                    <tr>
                                                        <td>
			                                               	<input type="hidden" value="${healthInfo.healthImage_no}" id="healthImage_no"/>
                                                            <p class="m-0 d-inline-block align-middle font-16">
                                                                <a class="text-body">${healthInfo.healthImage_title}</a>
                                                                <br/>
                                                            </p>
                                                        </td>
                                                        <td>
                                                        ${healthInfo.healthImage_category}
                                                        </td>
                                                        <td>
                                                        ${healthInfo.healthImage_age}
                                                        </td>
                                                        <td>
                                                        ${healthInfo.healthImage_diet}
                                                        </td>
                                                        <td>
                                                        ${healthInfo.healthImage_time}분
                                                        </td>
                                                        <td>
                                                        <c:if test="${healthInfo.healthImage_difficulty eq '상'}">
                                                            <span class="badge badge-danger">${healthInfo.healthImage_difficulty}</span>
                                                        </c:if>
                                                        
                                                        <c:if test="${healthInfo.healthImage_difficulty eq '중'}">
                                                            <span class="badge badge-warning">${healthInfo.healthImage_difficulty}</span>
                                                        </c:if>
                                                        
                                                        <c:if test="${healthInfo.healthImage_difficulty eq '하'}">
                                                            <span class="badge badge-success">${healthInfo.healthImage_difficulty}</span>
                                                        </c:if>
                                                        </td>
                    
                                                    </tr>
                                                	</tbody>
                                                </tbody>
                                                </c:forEach>
                                            </table>
												<div style="margin: auto;">${pagination }</div>
											
                                        </div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->      
                        
                    </div> <!-- container -->

                </div> <!-- content -->
            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <!-- App js -->
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/app.min.js"></script>

        <!-- third party js -->
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/vendor/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/vendor/dataTables.bootstrap4.js"></script>
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/vendor/dataTables.responsive.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/vendor/responsive.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/vendor/dataTables.checkboxes.min.js"></script>

        <!-- third party js ends -->

        <!-- demo app -->
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/pages/demo.products.js"></script>
        <!-- end demo js-->
        
        <script type="text/javascript">
			$(function(){
				// 등록
				$('#regBtn').click(function(){	
					$(location).attr('href','${pageContext.request.contextPath}/admin/healthImage/healthImageForm.do');
					
				});

				// 수정
				$('#list tr').click(function(){
					var healthImage_no = $(this).find('td:eq(0) input').val();
					$(location).attr('href','${pageContext.request.contextPath}/admin/healthImage/healthImageView.do?healthImage_no=' + healthImage_no);
				});

				// 엑셀
				$('#excel').click(function(){
					$(location).attr('href','${pageContext.request.contextPath}/admin/healthImage/excelDown.do');
				}); 

				// 전체
				$('#all').click(function(){
					$(location).attr('href','${pageContext.request.contextPath}/admin/healthImage/healthImageList.do');
				});
			});


			function shoulder() {
				  var choose = $('#shoulder').val();	
				  location.href = '${pageContext.request.contextPath}/admin/healthImage/healthImageList.do?choose=' + choose;
			}
			
			function back() {
				  var choose = $('#back').val();	
				  location.href = '${pageContext.request.contextPath}/admin/healthImage/healthImageList.do?choose=' + choose;
			}
			
			function chest() {
				  var choose = $('#chest').val();	
				  location.href = '${pageContext.request.contextPath}/admin/healthImage/healthImageList.do?choose=' + choose;
			}
			
			function arm() {
				  var choose = $('#arm').val();	
				  location.href = '${pageContext.request.contextPath}/admin/healthImage/healthImageList.do?choose=' + choose;
			}
			
			function leg() {
				  var choose = $('#leg').val();	
				  location.href = '${pageContext.request.contextPath}/admin/healthImage/healthImageList.do?choose=' + choose;
			}

			function exe1() {
				  var choose = $('#exe1').val();	
				  location.href = '${pageContext.request.contextPath}/admin/healthImage/healthImageList.do?choose=' + choose;
			}

			function exe2() {
				  var choose = $('#exe2').val();	
				  location.href = '${pageContext.request.contextPath}/admin/healthImage/healthImageList.do?choose=' + choose;
			}

			
			
		</script>

    </body>
</html>