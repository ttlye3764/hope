<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




      
<div style=" height: auto; width: 1500px; margin: auto; ">
${fn:length(scheduleList)}
<%-- <c:forEach var="scheduleVO" items="${scheduleList }" varStatus="status"> --%>
	<br><br>
                <!-- end row-->
                <div class="row">
                       <c:forEach var="scheduleVO" items="${scheduleList }" varStatus="status"> 

                            <div class="col-md-6 col-xl-3">
                                <!-- project card -->
                                <div class="card d-block">
                                    <div class="card-body">
                                        <!-- project title-->
                                        <h4 class="mt-0">
                                           ${scheduleVO.s_startdate}
                                        </h4>
                                        <div class="badge badge-success mb-3">${scheduleVO.s_startdate}</div>

                                        <p class="text-muted font-13 mb-3">${scheduleVO.s_memo}</p>

                                        <!-- project detail-->
                                        <p class="mb-1">
                                            <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                                <i class="mdi mdi-format-list-bulleted-type text-muted"></i>
                                                <b>21</b> Tasks
                                            </span>
                                            <span class="text-nowrap mb-2 d-inline-block">
                                                <i class="mdi mdi-comment-multiple-outline text-muted"></i>
                                                <b>741</b> Comments
                                            </span>
                                        </p>
                                        <div>
                                            <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mat Helme" class="d-inline-block">
                                                
                                            </a>
    
                                            <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="" data-original-title="Michael Zenaty" class="d-inline-block">
                                              
                                            </a>
    
                                            <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="" data-original-title="James Anderson" class="d-inline-block">
                                            </a>
                                            <a href="javascript:void(0);" class="d-inline-block text-muted font-weight-bold ml-2">
                                            </a>
                                        </div>
                                    </div> <!-- end card-body-->
                                  
                                    </div> <!-- end card-body-->
                                    <br>
                                </div> <!-- end card-->
                                
                   </c:forEach>
                   </div> <!-- end col -->
        
				

 <!-- end row-->

<%-- </c:forEach> --%>
       

</div>

