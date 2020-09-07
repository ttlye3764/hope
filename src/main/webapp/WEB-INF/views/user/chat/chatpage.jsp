<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/myCSS/chatPage.css">


<br>
<br>
<br>
<br>
<br>
<br>

<div class="messaging">
  <div class="inbox_msg">
	<div class="inbox_people">
	  <div class="headind_srch">
	   <ul class="social-icons si-colored-bg si-medium">
	   		<li class="social-icons-item social-dribbble">
				<a class="social-icons-link" onclick="searchFriendForm();"><i class="fa fa-dribbble"></i></a>
			</li>
			<li class="social-icons-item social-flickr">
				<a class="social-icons-link" onclick=""><i class="fa fa-flickr"></i></a>
			</li>
		</ul>
		<div class="recent_heading">
		  <h4>Recent</h4>
		 
		</div>
		<div class="srch_bar">
		  <div class="stylish-input-group">
			<input type="text" class="search-bar"  placeholder="Search" >
			</div>
		</div>
	  </div>
	  <div class="inbox_chat scroll">
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
	</div>
	<div class="mesgs">
	  <div class="msg_history">
		<div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>Test which is a new approach to have all
				solutions</p>
			  <span class="time_date"> 11:01 AM    |    June 9</span></div>
		  </div>
		</div>
		<div class="outgoing_msg">
		  <div class="sent_msg">
			<p>Test which is a new approach to have all
			  solutions</p>
			<span class="time_date"> 11:01 AM    |    June 9</span> </div>
		</div>
		<div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>Test, which is a new approach to have</p>
			  <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
		  </div>
		</div>
		<div class="outgoing_msg">
		  <div class="sent_msg">
			<p>Apollo University, Delhi, India Test</p>
			<span class="time_date"> 11:01 AM    |    Today</span> </div>
		</div>
		<div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>We work directly with our designers and suppliers,
				and sell direct to you, which means quality, exclusive
				products, at a price anyone can afford.</p>
			  <span class="time_date"> 11:01 AM    |    Today</span></div>
		  </div>
		</div>
	  </div>
	  <div class="type_msg">
		<div class="input_msg_write">
		  <input type="text" class="write_msg" placeholder="Type a message" />
		  <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
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
								<div class="modal-body">
									<h4>친구 아이디로 찾기 </h4>
									친구 아이디 : <input class="form-control" type="text" id="mem_name" placeholder="이름을 입력해주세요" style="width:200px; !important">
									
									<br>
									<br>
									<div class="divider divider-grad"></div>
									<br>
									<br>
									
									<div id="searchFriendId">
										
									</div>
									
									<h4>친구 이름으로 찾기 </h4>
									<br>
									<br>
									친구 이름 : <input class="form-control" type="text" placeholder="아이디를 입력해주세요" style="width:200px; !important">
									
									<br>
									<br>
									<div class="divider divider-grad"></div>
									
									<table id="searchFriendName">
									
									</table>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save changes</button>
								</div>
							</div>
						</div>
					</div>
				

					

<script type="text/javascript">

var socket;
var messages = document.getElementById("messages");
var targetMemNo;
var currentTargetMemNo;
var mem_no = ${LOGIN_MEMBERINFO.mem_no};
var chatingRoomNO;

function initSocket(url) {
	socket = new SockJS(url);
	
	socket.onmessage = function(evt) {
		console.log(evt.data + "<br/>");
		// 받아온 메세지 넣어주기

		var bot = document.createElement("div");
		bot.className = "message-text left";

		bot.innerHTML = evt.data;
		var out = document.querySelector(".message");
		var innerDiv = document.createElement("div");

		innerDiv.className = "solo-message";

		innerDiv.appendChild(bot);
		out.appendChild(innerDiv);

		out.scrollBy(0, 1000);
		document.querySelector(".input input").value = "";
	};
	
	socket.onclose = function(evt) {
		console.log("연결 종료료");
	}
	
	$("#sendBtn").on("click", function() {
		var msg = $("#message").val();
		var text = document.getElementById("messageinput").value + "," + chatingRoomNo;
		socket.send(text);
		console.log(text);
		text = "";
	});
}

// 친구추가 모달창 띄우기
function searchFriendForm(){
	$("#searchFriendForm").modal("show"); //모달창 띄우기
}

// 친구목록 모달창 띄우기
function friendList(){
	$("#friend_list").modal("show");
}

// 친구 검색하기
function searchFriend(){
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/chat/searchMember.do',
		dataType : 'JSON',
		data : {
			mem_name : $('#mem_name').val()
		},
		error : function(result) {
			alert("친구검색에 실패했습니다.");
		},
		success : function(result) {

			$('#searchFriendName').empty();

 			$('#searchFriendName').append('<tr>')
 			$('#searchFriendName').append('<th>프로필 사진</th>');
 			$('#searchFriendName').append('<th>ID</th>');
 			$('#searchFriendName').append('<th>이름</th>');
 			$('#searchFriendName').append('<th></th>');
 			$('#searchFriendName').append('</tr>');
 			
 			$.each(result.memberList, function(index, item){
 				$('#searchFriendName').append('<tr>');
 				$('#searchFriendName').append('<td><img src=""></td>');
 				$('#searchFriendName').append('<td onclick=""><input type="hidden" id="searchFriendNo" value="'+item.men_no+'">'+item.mem_id+'</td>');
 				$('#searchFriendName').append('<td>'+item.mem_name+'</td>');
 				$('#searchFriendName').append('<td><button type="button" id="insertFriendBtn">추가</button></td>');
 				$('#searchFriendName').append('</tr>');	 
 			 });
		}
	});
}	
		

	})
	
//친구 추가
$("#insertFriendBtn").click(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/user/chat/addFriend',
			data : mem_no = $('#searchFriendNo').val(),
			error : function(result) {
				alert("친구 추가 실패");
			},
			success : function(result) {
				alert("친구 추가 성공");
			},
		});
	});


$(function(){
	initSocket("http://localhost:8080/lastProject/echo?mem_no=" + ${LOGIN_MEMBERINFO.mem_no});


		
})
</script>





 