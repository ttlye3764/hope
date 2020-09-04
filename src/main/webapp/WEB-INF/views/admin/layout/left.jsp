<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--BEGIN SIDEBAR MENU-->
<!-- ========== Left Sidebar Start ========== -->
<div class="left-side-menu">

    <div class="slimscroll-menu" id="left-side-menu-container">

        <!-- LOGO -->
        <a href="index.html" class="logo text-center">
            <span class="logo-lg">
                <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/logo.png" alt="" height="16" id="side-main-logo">
            </span>
            <span class="logo-sm">
                <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/logo_sm.png" alt="" height="16" id="side-sm-main-logo">
            </span>
        </a>

        <!--- Sidemenu -->
        <ul class="metismenu side-nav">

            <li class="side-nav-title side-nav-item">Jobis</li>

            <li class="side-nav-item">
                <a href="javascript: void(0);" class="side-nav-link">
                    <i class="dripicons-meter"></i>
                    <span class="badge badge-success float-right">3</span>
                    <span> Dashboards </span>
                </a>
            </li>
                <ul class="side-nav-second-level" aria-expanded="false">
                    <li class="side-nav-item">
                        <a href="${pageContext.request.contextPath}/admin/healthImage/healthImageList.do" aria-expanded="false">Health
                            <span class="menu-arrow"></span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a href="${pageContext.request.contextPath}/admin/knowledge/knowledgeList.do" aria-expanded="false">knowledge
                            <span class="menu-arrow"></span>
                        </a>
                        <ul class="side-nav-third-level" aria-expanded="false">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/knowledge/knowledgeList.do">knowledgeList</a>
                            </li>
                           
                        </ul>
                    </li>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                </ul>
            
        <!-- Help Box -->
        <div class="help-box text-white text-center">
            <a href="javascript: void(0);" class="float-right close-btn text-white">
                <i class="mdi mdi-close"></i>
            </a>
            <img src="${pageContext.request.contextPath }/resources/html/dist/assets/images/help-icon.svg" height="90" alt="Helper Icon Image" />
            <h5 class="mt-3">Unlimited Access</h5>
            <p class="mb-3">Upgrade to plan to get access to unlimited reports</p>
            <a href="javascript: void(0);" class="btn btn-outline-light btn-sm">Upgrade</a>
        </div>
        <!-- end Help Box -->
        <!-- End Sidebar -->

        <div class="clearfix"></div>

    </div>
    <!-- Sidebar -left -->

</div>
<!-- Left Sidebar End -->



</body>
</html>