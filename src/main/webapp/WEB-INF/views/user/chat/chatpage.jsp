<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/myCSS/chatPage.css">
<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(/lastProject/image/kakao.jpg) no-repeat; background-size:cover; background-position: center center;">
	<div class="container">
		<div class="row all-text-white">
			<div class="col-md-12 align-self-center">
				<h1 class="innerpage-title">채팅</h1>
				<h6 class="subtitle">다른 유저들과 채팅을 할 수 있습니다.</h6>
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
<br>
<br>
<br>
<div class="messaging">
  <div class="inbox_msg">
	<div class="inbox_people">
	  <div class="headind_srch">
<!-- 	   <ul class="social-icons si-colored-bg si-medium"> -->
<!-- 	   		<li class="social-icons-item social-dribbble"> -->
<!-- 				<a class="social-icons-link" onclick="searchFriendForm();"><i class="fa fa-dribbble"></i></a> -->
<!-- 			</li> -->
<!-- 			<li class="social-icons-item social-flickr"> -->
<!-- 				<a class="social-icons-link" onclick="friendListForm();"><i class="fa fa-flickr"></i></a> -->
<!-- 			</li> -->		
<!-- 		</ul> -->
		<div style="display:flex;  justify-content: flex-end;">
		<img src="${pageContext.request.contextPath }/image/hug.png" style="width=:40px; height:40px;" onclick="searchFriendForm();">
		<img src="${pageContext.request.contextPath }/image/friends.png" style="width=:40px; height:40px;" onclick="friendListForm();">
		</div>
		<div class="recent_heading">
		  <h4>Recent</h4>
		 
		</div>
		<div class="srch_bar">
		  <div class="stylish-input-group">
			<input type="text" class="search-bar"  placeholder="Search" >
			</div>
		</div>
	  </div>
	  
	  <!-- 친구 목록 -->
	  <div class="inbox_chat scroll" id="chatRoomList">
		<div class="chat_list active_chat">
		  <div class="chat_people">
			<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			<div class="chat_ib">
			  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
			  <p>Test, which is a new approach to have all solutions 
				astrology under one roof.</p>
			</div>
		  </div>
		</div>
		<div class="chat_list">
		  <div class="chat_people">
			<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			<div class="chat_ib">
			  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
			  <p>Test, which is a new approach to have all solutions 
				astrology under one roof.</p>
			</div>
		  </div>
		</div>
	  </div>
	  <!-- 친구 목록 끝 -->
	</div>
	<div class="mesgs">
<!-- 		<ul class="social-icons si-colored-bg si-medium"> -->
<!-- 			<li class="social-icons-item social-dribbble"> -->
<!-- 				<a class="social-icons-link" onclick="updateChatImageForm();"><i class="fa fa-dribbble"></i></a> -->
<!-- 			</li> -->
<!-- 		</ul> -->
		<div style="display:flex;  justify-content: flex-end;">
			<img src="${pageContext.request.contextPath }/image/settings.png" style=" width=:40px; height:40px;" onclick="updateChatImageForm();">
	  	</div>
	  <div class="msg_history" id="msg_history" style="background-image: url();">
		
	  </div>
	  <div class="type_msg">
		<div class="input_msg_write">
		  <input type="text" class="write_msg" id="message" placeholder="Type a message" />
		  <button class="msg_send_btn" id="sendBtn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
		</div>
	  </div>
	</div>
  </div>
</div>



				  
					<!-- 친구추가 모달창 -->
					<div class="modal fade text-left" id="searchFriendForm"  tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" style="display: none; overflow: auto;" aria-hidden="true" >
						<div class="modal-dialog modal-dialog-centered" role="document" >
							<div class="modal-content">
								<div class="modal-header">
									친구 추가
								</div>
								<div class="modal-body" >
									<h4>친구 아이디로 찾기 </h4>
									친구 아이디 : <input class="form-control" onchange="searchFriendID();" type="text" id="mem_id" placeholder="이름을 입력해주세요" style="width:200px; !important">
									<br>
									<br>
									<table id="searchFriendID">
									</table>
									<div class="divider divider-grad"></div>
									<br>
									<h4>친구 이름으로 찾기 </h4>
									<br>
									<br>
									친구 이름 : <input class="form-control" onchange="searchFriendName();" type="text" id="mem_name" placeholder="아이디를 입력해주세요" style="width:200px; !important">
									<table id="searchFriendName">
									</table>
									<div class="divider divider-grad"></div>
									<br>
									<br>			
								<div class="modal-footer">
									<button type="button" style="float:right;" class="btn btn-secondary" data-dismiss="modal">확인</button>
								</div>
							</div>
						</div>
						</div>
					</div>
					<!-- 친구목록 모달창 -->
					<div class="modal fade text-left" id="friendListForm"  tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" style="display: none; overflow: auto;" aria-hidden="true" >
						<div class="modal-dialog modal-dialog-centered" role="document" >
							<div class="modal-content">
								<div class="modal-header">
									친구 목록
								</div>
								<div class="modal-body" id="friendListFormBody" style="height:600px; overflow: auto; !important">
									<!-- 친구 한명 -->
									
									<!-- 친구한명 끝 -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
								</div>
							</div>
						</div>
					</div>
					
					
					
					
					
					<div class="modal fade text-left" id="updateChatImageForm"  tabindex="-1" role="dialog" aria-labelledby="exampleModalCenter" style="display: none; overflow: auto;" aria-hidden="true" >
						<div class="modal-dialog modal-dialog-centered" role="document" >
							<div class="modal-content">
								<div class="modal-header">
									채팅방 배경화면 수정
								</div>
								<div class="modal-body" id="friendListFormBody" style="height:600px; overflow: auto; !important">
				
									
								배경화면 바꾸기 모달창
									<form id="fileForm" method="post" enctype="multipart/form-data">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
										<span class="input-group-text">Upload</span>
										</div>
										<div class="custom-file">	
											<input type="file" class="custom-file-input" id="files" name="files">
											<label class="custom-file-label" for="file">파일을 선택하세요</label>
										</div>				
									</div>
									<div style="width: 390px; height: 280px; align-content: center;">
											<img id="img" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;" src=" ">
									</div>
									</form>
									<br>
									<br>
									<div style="float: right;">
										<button type="button" class="btn btn-primary" onclick="insertChatFile()">저장</button>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									</div>
								</div>
											
							</div>
								<div class="modal-footer">
								
								</div>
							</div>
						</div>
					
					
					
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js'></script>

<script type="text/javascript">


var socket;
var messages = document.getElementById("messages");
var targetMemNo;
var targetMemName;
var currentTargetMemNo;
var chatingRoomNo;

//채팅방 리스트 띄우기
function chatRoomList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/chat/chatRoomList',
		success : function(result){
			$('#chatRoomList').empty();
			if(result.chatMemberList == null){
				$('#chatRoomList').append(result.fail);
				alert(result.fail);
			}else{
				var chatRoomList = "";
				$.each(result.chatMemberList, function(index, item){

					if(item.msg_date == null){
						item.msg_date = '';
					}
					if(item.msg_content==null){
						item.msg_content = '';
					}
					
					chatRoomList += '<div class="chat_list" onclick="startChat(this);">';
					chatRoomList += '<input type="hidden" id="ch_no" value="'+item.ch_no+'">';
					chatRoomList += '<input type="hidden" id="mem_no" value="'+item.mem_no+'">';
					chatRoomList += '<div class="chat_people">';
					chatRoomList += '<div class="chat_img"> <img src="/files/'+item.file_save_name+'" alt=""> </div>';
					chatRoomList += '<div class="chat_ib">';
					chatRoomList += '<h5 id="mem_no"><input type="hidden" id="mem_name" value="'+item.mem_name+'">'+item.mem_name+'<span class="chat_date" id="lastChat">'+item.msg_date+'</span></h5>';
					chatRoomList += '<p>'+item.msg_content+'</p>';
					chatRoomList += '</div>';
					chatRoomList += '</div>';
					chatRoomList += '</div>';
				})
				$('#chatRoomList').append(chatRoomList);
			}
		},
		error : function(result){
			alert('채팅방 조회에 실패하였습니다.');
		}
	})
}

// 채팅방 클릭하면 채팅방 비우고 메세지 내역 디비에서 가져와서 출력
function startChat(e){
	chatingRoomNo = $(e).find('#ch_no').val();
	targetMemNo = $(e).find('#mem_no').val();
	targetMemName = $(e).find('#mem_name').val();

	console.log(chatingRoomNo);
	console.log(targetMemNo);
	console.log(targetMemName);

	$('.chat_list').removeClass('active_chat');
	$(e).toggleClass('active_chat');

	$('#msg_history').empty();
	messageList();
}

function insertChatFile(){

	var formData = new FormData($('#fileForm')[0]);
	
	$.ajax({
		type : 'POST',
		enctype : 'multipart/form-data',
		url : '${pageContext.request.contextPath}/user/chat/insertChatFile?ch_no='+chatingRoomNo,
		data : formData ,
		processData : false,
		contentType : false,
		cache : false,
		success : function(result){
		},
		error : function(result){
			alert('파일 삽입 실패');
		}
});
}

function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지만 업로드 가능합니다.");
			return;
		}
		
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e)	{
				$("#img").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function messageList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/chat/messageList',
		data : {
			ch_no : chatingRoomNo
		},
		success : function(result){

			$('#msg_history').empty();
			if(result.chatFileInfo != null){
				$('#msg_history').css('background', 'url(/files/'+result.chatFileInfo.cf_save_name + ')') ;
				}
			
			if(result.messageList==null){

			}
			var messageList = "";
			$.each(result.messageList, function(index, item){
				
				if(item.mem_no == '${LOGIN_MEMBERINFO.mem_no}'){
					messageList += '<div class="outgoing_msg">';
					messageList += '<div class="sent_msg">';
					messageList += '<p>'+item.msg_content+'</p>';
					messageList += '<span class="time_date"> '+item.msg_date.split(' ')[1].split(':')[0]+':' +item.msg_date.split(' ')[1].split(':')[1] +'</span> </div>';
					messageList += '</div>';
				}else{
					messageList += '<div class="incoming_msg">';
					messageList += '<div class="incoming_msg_img"> <img src="${pageContext.request.contextPath}/image/empty.png" alt=""> </div>';
					messageList += '<div class="received_msg">';
					messageList += '<div class="received_withd_msg">';
					messageList += '<p>'+item.msg_content+'</p>';
					messageList += '<span class="time_date"> '+item.msg_date.split(' ')[1].split(':')[0]+':' +item.msg_date.split(' ')[1].split(':')[1] +'</span> </div>';
					messageList += '</div>';
					messageList += '</div>';
				}
			})
			$('#msg_history').append(messageList);
		},
		error : function(result){
			alert('채팅방 조회에 실패하였습니다.')
		}
	})
}

function initSocket(url) {
	socket = new SockJS(url);
	
	socket.onmessage = function(evt) {
		console.log(evt.data + "<br/>");
		// 받아온 메세지 넣어주기

		messageList();
	};
	
	socket.onclose = function(evt) {
		console.log("연결 종료료");
	}
	
	$("#sendBtn").on("click", function() {
		var msg = $("#message").val();
		var text = msg + "," + chatingRoomNo;
		socket.send(text);
		console.log(text);
		text = "";
		$('#message').val("");
		setTimeout(function(){
			messageList();
			}, 500);
	});
}

// 친구추가 모달창 띄우기
function searchFriendForm(){
	$("#searchFriendForm").modal("show"); //모달창 띄우기
}
//채팅 배경화면 이미지 수정 모달창 띄우기
function updateChatImageForm(){
	$('#updateChatImageForm').modal("show");
}



 

  
  
  
  


// 친구목록
function friendListForm(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/chat/selectFriendList',
		success : function (result){
			if(result.memberList == null){
				alert(result.fail);
			}else{
				$('#friendListFormBody').empty();
				var friendInfo ="";
				$.each(result.memberList, function(index, item){
					friendInfo += '<div style="margin : 15px 15px 15px 15px; border : 1px solid black;">'
					friendInfo += '<div class="row">';
					friendInfo += '<div class="col-4" id="profile-image"><img id="modal-img" src="'+item.file_save_name+'" alt=""></div>';
					friendInfo += '<div class="col-8" id="all-info">';
					friendInfo += '<div id="profile-name"><i class="fas fa-user"></i>'+item.mem_name+'</div>';
					friendInfo += '<div id="profile-birthday"><i class="fas fa-birthday-cake"></i>'+item.mem_birth+'</div>';
					friendInfo += '<div id="profile-country"><i class="fas fa-globe"></i>'+item.mem_hp+'</div>';
					friendInfo += '<div id="profile-email"><i class="fas fa-envelope"></i>'+item.mem_email+'</div>';
					friendInfo += '</div>';
					friendInfo += '<div class="col-4">';
					friendInfo += '<button class="btn btn-grad" onclick="createChatingRoom(this);" style="float:right;"><input type="hidden" value="'+item.mem_no+'"><i class="fa fa-arrow-right"></i>채팅하기</button>';					
					friendInfo += '</div>';
					friendInfo += '</div>';
					friendInfo += '</div>';
					})
					$('#friendListFormBody').append(friendInfo);
					
			}
		},
		error : function(result){
			alert('친구 목록 조회에 실패했습니다.')
		}
	})
	
	$("#friendListForm").modal("show");
}

// 채팅방 생성, 참여
function createChatingRoom(e){
	var fri_mem_no = $(e).find('input').val()

	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/chat/createChatingRoom',
			
		error : function(result) {
			alert("채팅방 생성 실패");
		},
		success : function(result) {
			alert("채팅방 생성 성공");
			
		},
		complete : function(result){
			 $.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/user/chat/insertParticipation',
					//dataType : 'JSON',
					data : {
						fri_mem_no : $(e).find('input').val()
					},
					success : function(result){
						alert("참여 테이블 삽입 성공");
					},
					error : function(result){
						alert("참여 테이블 삽입 실패");
					}	
				 })
			}
	});
}

// 친구 검색하기 id
function searchFriendID(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/chat/selectMemList',
		data : {
			mem_id : $('#mem_id').val()
		},
		error : function(result) {
			alert("친구검색에 실패했습니다.");
		},
		success : function(result) {
			
			$('#searchFriendID').empty();
			
 			$('#searchFriendID').append('<tr>')
 			$('#searchFriendID').append('<th>프로필 사진</th>');
 			$('#searchFriendID').append('<th>ID</th>');
 			$('#searchFriendID').append('<th>이름</th>');
 			$('#searchFriendID').append('<th></th>');
 			$('#searchFriendID').append('</tr>');
 			
 			$.each(result.memberList, function(index, item){
 				$('#searchFriendID').append('<tr>');
 				$('#searchFriendID').append('<td><img src=""></td>');
 				$('#searchFriendID').append('<td>'+item.mem_id+'</td>');
 				$('#searchFriendID').append('<td>'+item.mem_name+'</td>');
 				$('#searchFriendID').append('<td><button type="button" onclick="insertFriendBtn(this)"><input type="hidden" value="'+item.mem_no+'">추가</button></td>');
 				$('#searchFriendID').append('</tr>');	 
 			 });
		}
	});
}	
// 친구 검색하기 name
function searchFriendName(){
	$.ajax({
		url : '${pageContext.request.contextPath}/user/chat/selectMemList',
		data : {
			mem_name : $('#mem_name').val()
		},
		error : function(result) {
			alert("친구검색에 실패했습니다.");
		},
		success : function(result) {
		
			$('#searchFriendName').empty();

			if(result.memberList != null){
				$('#searchFriendName').append('<tr>')
	 			$('#searchFriendName').append('<th>프로필 사진</th>');
	 			$('#searchFriendName').append('<th>ID</th>');
	 			$('#searchFriendName').append('<th>이름</th>');
	 			$('#searchFriendName').append('<th></th>');
	 			$('#searchFriendName').append('</tr>');
	 			
	 			$.each(result.memberList, function(index, item){
	 				$('#searchFriendName').append('<tr>');
	 				$('#searchFriendName').append('<td><img src=""></td>');
	 				$('#searchFriendName').append('<td onclick="">'+item.mem_id+'</td>');
	 				$('#searchFriendName').append('<td>'+item.mem_name+'</td>');
	 				$('#searchFriendName').append('<td><button type="button" onclick="insertFriendBtn(this)"><input type="hidden" value="'+item.mem_no+'">추가</button></td>');
	 				$('#searchFriendName').append('</tr>');	 
	 			 });
			}else{
				$('#searchFriendName').append('<tr>')
	 			$('#searchFriendName').append('<th>프로필 사진</th>');
	 			$('#searchFriendName').append('<th>ID</th>');
	 			$('#searchFriendName').append('<th>이름</th>');
	 			$('#searchFriendName').append('<th></th>');
	 			$('#searchFriendName').append('</tr>');

	 			$('#searchFriendName').append('<tr>');
	 			$('#searchFriendName').append('<td colspan="4">'+result.fail+'</td>');
 				$('#searchFriendName').append('</tr>');	
			}	
 			
		}
	});
}	

	
//친구 추가
function insertFriendBtn(e){
		$.ajax({
			url : '${pageContext.request.contextPath}/user/chat/insertFriendInfo',
			data : {
				mem_no : $(e).find('input').val(),
				mem_a : '1'
			},
			error : function(result) {
				alert("친구 추가 실패");
			},
			success : function(result) {
				alert("친구 추가 성공");
			}
		});
	}


$(function(){

// 	192.168.31.35


	initSocket("http://localhost:8080/lastProject/echo?mem_no=" + ${LOGIN_MEMBERINFO.mem_no});
	chatRoomList();
	
	

	$('#files').on('change', handleImgFileSelect);
})
</script>






 