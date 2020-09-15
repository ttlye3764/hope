<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/html/dist/assets/images/favicon.ico">

        <!-- inline style to handle loading of various element-->
        <style>body.loading {visibility: hidden;}</style>

        <!-- App css -->
        <link href="${pageContext.request.contextPath }/resources/html/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath }/resources/html/dist/assets/css/app.min.css" rel="stylesheet" type="text/css" id="main-style-container" />
   
	
	<script>
		function LogOut(){
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/join/logout.do',
				dataType : 'JSON',
				data : {
				},
				success : function(result) {
					$(location).attr('href','${pageContext.request.contextPath}/user/join/loginForm.do');
				}
			});
		}
</script>
	<!-- =======================
	service  -->
	<section class="bg-light" style="margin-left:250px">
		<div class="container">
		 <div class="row">
              <div class="col-12">
                  <div class="page-title-box">
                      <div class="page-title-right">
                          <ol class="breadcrumb m-0">
                          		<li class="breadcrumb-item"><a href="javascript: void(0);">Jobis</a></li>
                                <li class="breadcrumb-item active">main</li>
                          </ol>
                          
                          <div class="col-sm-12">
                           		<a class="btn btn-primary" href="javascript:LogOut();">로그아웃</a>
                           </div>
                           <br>
                      </div>
                  </div>
              </div>
          </div>   
          
            
		<div class="row">
            <div class="col-12">
                <div class="board">
                    <div class="tasks" data-plugin="dragula" data-containers='["task-list-one", "task-list-two", "task-list-three", "task-list-four"]'>
                        <h5 class="mt-0 task-header">개인 관리</h5>
                        
                        <div id="task-list-one" class="task-list-items">

                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">

                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin/medical/medicalMain.do" data-toggle="modal" data-target="#task-detail-modal" class="text-body">복용 관리</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            Medical
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-2.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Lee Young Chun</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->

                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">

                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin/healthImage/healthImageList.do" data-toggle="modal" data-target="#task-detail-modal" class="text-body">건강 관리</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            Heatlh
                                        </span>
                                    </p>
                                    
                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-1.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Lee su a</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->

                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin/knowledge/knowledgeList.do" data-toggle="modal" data-target="#task-detail-modal" class="text-body">지식 관리</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            Knowledge
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-1.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Lee su a</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->
                            
                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin/schedule/schedule.do" data-toggle="modal" data-target="#task-detail-modal" class="text-body">일정 관리</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            Schedule
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-9.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Seo Han Byeol</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->
                            
                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin/car/carMain.do" data-toggle="modal" data-target="#task-detail-modal" class="text-body">내 차 관리</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            My Car
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-6.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Lee Seung Min</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->
                            
                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin/accountBook/accountList.do" data-toggle="modal" data-target="#task-detail-modal" class="text-body">금전 관리</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            Assets
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-9.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-1.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Seo & Lee</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->
                            
                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin/diet/dietMain.do" data-toggle="modal" data-target="#task-detail-modal" class="text-body">식단 관리</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            Diet
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-3.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Lee Jae Ho</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->
                            
                            
                        </div> <!-- end company-list-1-->
                    </div>

                    <div class="tasks">
                        <h5 class="mt-0 task-header text-uppercase">회원 및 게시판 관리</h5>
                        
                        <div id="task-list-two" class="task-list-items">

                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin/member/memberList.do" data-toggle="modal" data-target="#task-detail-modal" class="text-body">회원 관리</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            board
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-6.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Lee Seung Min</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->
                            
                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=2" data-toggle="modal" data-target="#task-detail-modal" class="text-body">공지사항</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            board
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-4.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Sim Yun Hee</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->
                            
                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=3" data-toggle="modal" data-target="#task-detail-modal" class="text-body">건의 사항</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            board
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-4.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Sim Yun Hee</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->

							<!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=1" data-toggle="modal" data-target="#task-detail-modal" class="text-body">자유게시판</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            board
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-4.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Sim Yun Hee</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->
                            
                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="${pageContext.request.contextPath}/user/board/boardList.do?bd_division=4" data-toggle="modal" data-target="#task-detail-modal" class="text-body">QnA</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            board
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-4.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Sim Yun Hee</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->


                        </div> <!-- end company-list-2-->
                    </div>
                    
                    <div class="tasks">
                        <h5 class="mt-0 task-header text-uppercase">채팅 관리</h5>
		                    <div id="task-list-three" class="task-list-items">

                            <!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">채팅</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            Chat
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-6.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Lee Jae Ho</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->

							<!-- Task Item -->
                            <div class="card mb-0">
                                <div class="card-body p-3">
                                    <h5 class="mt-2 mb-2">
                                        <a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">챗봇</a>
                                    </h5>

                                    <p class="mb-0">
                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                            ChatBot
                                        </span>
                                    </p>

                                    <div class="dropdown float-right">
                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                        </a>
                                    </div>

                                    <p class="mb-0">
                                        <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/users/avatar-6.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                        <span class="align-middle">Lee Jae Ho</span>
                                    </p>
                                </div> <!-- end card-body -->
                            </div>
                            <!-- Task Item End -->

                        </div> <!-- end company-list-3-->
                    </div>




                   </div>
            </div> <!-- end col -->
        </div>
	</div>
	</section>
	<!-- =======================
	service  -->

	<div> <a href="#" class="back-top btn btn-grad"><i class="ti-angle-up"></i></a> </div>

	<!--Global JS-->
	
	
	<script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/app.min.js"></script>

        <!-- dragula js-->
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/vendor/dragula.min.js"></script>

        <!-- demo js -->
        <script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/ui/component.dragula.js"></script>

</body>
</html>