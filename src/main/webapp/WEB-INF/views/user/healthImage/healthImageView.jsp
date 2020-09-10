<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<div class="loading">
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
                            <div class="col-10">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);"> </a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);"> </a></li>
                                            <li class="breadcrumb-item active"> </li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <!-- Form row -->
                        <div class="row">
                            <div class="col-10">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">추천 운동법 수정</h4>

                                        <form name="healForm" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
                                        <input type="hidden" value="${healthInfo.healthImage_no}" id="healthImage_no"/>
                                            <div class="form-row" style="padding-left: 13px;">
                                                <div class="form-group col-md-3">
                                                    <label for="title" class="col-form-label">제목</label>
                                                    <input type="text" 
                                                    	class="form-control" value="${healthInfo.healthImage_title}"
                                                    	id="title" name="healthImage_title" placeholder="title">
                                                </div>
                                                
                                                <div class="form-group col-md-3">
                                                    <label for="category" class="col-form-label">카테고리</label>
                                                    <select id="category" class="form-control" name="healthImage_category">
                                                        <option>어깨</option>
                                                        <option>등</option>
                                                        <option>가슴</option>
                                                        <option>팔</option>
                                                        <option>다리</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group col-md-6">
                                                <label for="content" class="col-form-label">내용</label>
                                                <textarea class="form-control" 
                                                id="example-textarea" rows="5" name="healthImage_content">${healthInfo.healthImage_content}</textarea>
                                            </div>
                                            
                                             <div class="form-row" style="padding-left: 13px;">
                                                 <div class="form-group col-md-3">
                                                   <label for="age" class="col-form-label">추천 연령</label>
                                                   <input type="text" value="${healthInfo.healthImage_age}"
                                                   		class="form-control" id="age" placeholder="age" name="healthImage_age">
                                            	 </div>
                                                
                                                <div class="form-group col-md-3">
                                                   <label for="time" class="col-form-label">권장 시간(분)</label>
                                                   <input type="number" value="${healthInfo.healthImage_time}"
                                                   	class="form-control" id="time" name="healthImage_time" placeholder="time">
                                            	</div>
                                            </div>
                                             
                                             <div class="form-row" style="padding-left: 13px;">
                                                 <div class="form-group col-md-3">
                                                    <label for="diet" class="col-form-label">운동법</label>
                                                    <select id="diet" class="form-control" name="healthImage_diet">
                                                        <option value="유산소">유산소</option>
                                                        <option value="무산소">무산소</option>
                                                    </select>
                                             	</div>
                                                
                                                <div class="form-group col-md-3">
                                                    <label for="difficulty" class="col-form-label">난이도</label>
                                                    <select id="difficulty" class="form-control" name="healthImage_difficulty">
                                                        <option value="상">상</option>
                                                        <option value="중">중</option>
                                                        <option value="하">하</option>
                                                    </select>
                                             	</div>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label>파일 업로드</label>
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="inputGroupFile04" 
                                                        	name="files" onchange="setThumbnail(event);"> 
                                                        <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                             <!-- 파일 -->
											 <c:if test="${!empty healthInfo.items }">  
												<div id="image_container" style="width: 300px; height: 200px;">
													<c:forEach items="${healthInfo.items }" var="fileitemInfo">
														<img src="/files/${fileitemInfo.file_save_name }" alt="pic1">
													</c:forEach>
												</div>
											 </c:if>

                                            <button type="button" id="delBtn" class="btn btn-danger" style="float: right; margin: 0px 0px 0px 10px;">삭제</button>
                                            <button type="button" id="cancel" class="btn btn-light" style="float: right; margin: 0px 0px 0px 10px;">취소</button>
                                            <button type="submit" class="btn btn-primary" style="float: right;">수정</button>
                                        </form>

                                    </div> <!-- end card-body -->
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->
            </div>
        </div>
        <!-- END wrapper -->

        <!-- App js -->
<script src="${pageContext.request.contextPath }/resources/html/dist/assets/js/app.min.js"></script>

<script type="text/javascript">
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
		
		img.style.height = '300px';
	    img.style.width = '300px';
		}; 
		reader.readAsDataURL(event.target.files[0]);

		document.querySelector("div#image_container").addEventListener('click', function() {
		document.querySelector("div#image_container").remove();
		});
	};

	$(function(){
		$('form[name=healForm]').on('submit', function(){	
			alert("수정 완료");
		    var category = $('#category option:selected').val();
		    var diet = $('#diet option:selected').val();

		     $(this).append('<input type="hidden" name="healthImage_no" value="${healthInfo.healthImage_no}"/>');
			 $(this).attr('action','${pageContext.request.contextPath}/admin/healthImage/updateHealthImageInfo.do?category=' + category + '&diet=' + diet);
		        
		        return true;
		});

		$('#cancel').click(function(){	
			$(location).attr('href','${pageContext.request.contextPath}/admin/healthImage/healthImageList.do');
			
		});

		// 삭제
		$('#delBtn').click(function(){
			alert("삭제 되었습니다.");	
			var healthImage_no = $('#healthImage_no').val();
			$(location).attr('href','${pageContext.request.contextPath}/admin/healthImage/deleteHealthImageInfo.do?healthImage_no=' + healthImage_no);
			
		});

		$('select[name=healthImage_category]').val('${healthInfo.healthImage_category}');
		$('select[name=healthImage_diet]').val('${healthInfo.healthImage_diet}');
		$('select[name=healthImage_difficulty]').val('${healthInfo.healthImage_difficulty}');

	});
</script>
</div>
</html>