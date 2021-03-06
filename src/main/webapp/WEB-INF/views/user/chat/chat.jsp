<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<div class="wrapper">
		<div class="chat">
			<div class="chat-left">
				<div class="input-wrap">
					<input type="text" name="" placeholder="seach"> <i
						class="fa fa-search" aria-hidden="true"></i>
				</div>
				<c:if test="${empty chatingRoomList }">
					<tr align="center">
						<td colspan="5"><font color="blue">참여중인 채팅이 없습니다.</font></td>
					</tr>
				</c:if>
				<c:if test="${!empty chatingRoomList }">
					<c:forEach items="${chatingRoomList }" var="chatingRoomInfo">

						<div class="user" onclick="">
							<img
								class="chat_img" class="chat_img" src=""
								alt="" class="icon-user">
							<div class="user-status">
								<div class="name">${chatingRoomInfo.ch_no }</div>
								<input type="hidden" value="${chatingRoomInfo.ch_no }">
								<i class="fa fa-circle offline"></i> <span class="status">online</span>
							</div>
						</div>

					</c:forEach>
				</c:if>
			</div>

			<div class="chat-right">
				<div class="chating">
					<img
						class="chat_img" class="chat_img" src="">
					<div class="chating-with">
						<div class="name-chat">
							<b>${LOGIN_MEMBERINFO.mem_name}</b>
						</div>
						<span class="status"> 상태 메세지 </span>
					</div>
					<div class="like">
						<button onclick="addFriend();">친구 등록</button>
						<button onclick="friendList();">친구 목록</button>
<!-- 					<i class="fa fa-thumbs-up" onclick="addFriend();"></i> -->
<!-- 					<i class="fa fa-thumbs-up" onclick="friendList();"></i> -->
					</div>

				</div>
				<div class="message" id="messages">
					<div class="solo-message">
						<div class="message-text left">안녕하세요</div>
					</div>
				</div>

				<div class="line-input">
					<div class="input">
						<input type="text" id="messageinput">
					</div>
					<input type="text" id="sender" value="${LOGIN_MEMBERINFO.mem_no}" style="display: none;">
					<button class="add" id="sendBtn">Send</button>
				</div>
			</div>
		</div>

	</div>
	
	
<!-- 	모달창 1 -->

<div id="friend_list" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="height:800px; !important; overflow:auto" >
					<div class="container" style="">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<h2>친구 목록</h2>
					</div>
				</div>
			</div>
			<div class="row ">
				<!-- contact form -->
				<div class="col-md-6">
					<div class="h-100">
						<form class="contact-form" id="contact-form" name="contactform" action="${pageContext.request.contextPath}/user/chat/addFriend.do" method="post" enctype="multipart/form-data">			
							<!-- Start main form -->
							<div class="row">
							<c:if test="${empty friendList }">
								<tr align="center">
									<td colspan="5"><font color="blue">친구가 없네요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</font></td>
								</tr>
							</c:if>

							<!-- 테이블 -->
							<c:if test="${!empty friendList }">
								<div class="table-responsive-sm">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">번</th>
												<th scope="col">이</th>
												<th scope="col">Handle</th>
											</tr>
										</thead>
										<tbody id="friend_tbody">
							<c:forEach items="${friendList }" var="friendInfo">
								<tr>
									<th scope="row" >1</th>
									<td><input type="hidden" value="${friendInfo.fri_mem_no }"/>${friendInfo.fri_mem_no }</td>
									<td colspan="2"><input type="hidden" value="${friendInfo.fri_mem_name }"/>${friendInfo.fri_mem_name } </td> 									
									<td>@mdo</td>
									<td><button class="btn btn-outline-grad " type="submit">채팅</button></td>
								</tr>
							</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
																												
								<!-- submit button -->
								<div class="col-md-12 text-center">
								<button class="btn btn-outline-grad " type="submit">추가</button>
								<button class="btn btn-outline-grad " id="deleteBTN" type="button">삭제</button>
								</div>
							</div>
							<!-- End main form -->
						</form>
					</div>
				</div>
			</div>
		</div>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<!-- 	모달창 2 -->

<div id="search_friend" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body"  style="height:800px; !important; overflow:auto">
					<div class="container" style="">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<h2>친구 등록</h2>
					</div>
				</div>
			</div>
			<div class="row ">
				<!-- contact form -->
				<div class="col-md-6">
					<div class="h-100">
						<form class="contact-form" name="contactform" action="${pageContext.request.contextPath}/user/chat/addFriend" method="post" enctype="multipart/form-data">			
							<!-- Start main form -->
							<div class="row">
							
								<div class="col-md-6">
									<label>친구 이름 </label>
								</div>
								<!-- name -->
								<input id="mem_name" name="mem_name" type="text" class="form-control" placeholder="친구이름">
								<button type="button" id="search_fri">검색</button>
								
								<br>
								<br>
								<br>
								<br>
								<br>
								<div class="divider divider-dotted"></div>
								
											
								<label>검색 내용 - 친구 이름 </label><br>
								<input id="search_mem_name" name="search_mem_name" type="text" class="form-control" placeholder="친구이름">
								<br>
								<br>			
								<br>
								<br>
								<br>
								<div class="divider divider-dotted"></div>
								
								<br>
								<br>
								<br>
								
																							
								<!-- submit button -->
								<div class="col-md-12 text-center">
								<button class="btn btn-outline-grad " type="button" id="insertBtn">추가</button>
								<button class="btn btn-outline-grad " id="deleteBTN" type="button">삭제</button>
								</div>
							</div>
							<!-- End main form -->
						</form>
					</div>
				</div>
			</div>
		</div>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js'></script>
<script type="text/javascript">
//var ws;
var messages = document.getElementById("messages");
var targetMemNo;
var currentTargetMemNo;
var mem_no = ${LOGIN_MEMBERINFO.mem_no};
var chatingRoomNO;

function addFriend(){
	$("#search_friend").modal("show"); //모달창 띄우기
}

function friendList(){
	$("#friend_list").modal("show");
}

function closeSocket() {
	ws.close();
}

function writeResponse(text) {
	messages.innerHTML += "<br/>" + text;
}

function clearText() {
	console.log(messages.parentNode);
	messages.parentNode.removeChild(messages)
}


var socket;

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

$(function(){
	
	initSocket("http://localhost:8080/lastProject/echo?mem_no=" + ${LOGIN_MEMBERINFO.mem_no});
	
	var i = 0;
	document.querySelector(".add").addEventListener("click", addMessage);

	document.querySelector(".input").onkeypress = function(e) {
		if (e.key === "Enter") {
			addMessage();
		}
	}
	
	function addMessage() {
		var message = document.querySelector(".input input").value;
		
		if (message !== "") {
			var text = document.createElement("div");
			text.className = "message-text right";
			text.innerHTML = message;
			append(text);
		}
	}

	function append(child) {
		var out = document.querySelector(".message");
		var innerDiv = document.createElement("div");

		innerDiv.className = "solo-message";

		innerDiv.appendChild(child);
		out.appendChild(innerDiv);

		out.scrollBy(0, 1000);
		document.querySelector(".input input").value = "";

	}

	$('#search_fri').click(function(){
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/chat/searchMember.do',
			dataType : 'JSON',
			data : {
				mem_name : $('#mem_name').val()
			},
			error : function(result) {
				alert(result.memberInfo.mem_name);
			},
			success : function(result) {
				alert(result.memberInfo.mem_name);
				$('#search_mem_name').val(result.memberInfo.mem_name);
			}
		});

	})
	
	// 친구랑 채팅방에 연결하기
	$('#friend_tbody tr').click(function(){
		var fri_mem_no = $(this).find('td:eq(0) input').val();
		var fri_mem_name = $(this).find('td:eq(1) input').val();

		console.log("targetMemNo" + targetMemNo);
		
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
						data : "mem_no="+mem_no+"&target_mem_no=" + fri_mem_no,
						success : function(result){
							alert("참여 테이블 삽입 성공");
						},
						error : function(result){
							alert("참여 테이블 삽입 실패");
						}	
					 })
				}
		});
		
	});

	//채팅방 특정하기.
	$('.user').click(function(){
	
	chatingRoomNo = $(this).find('div input').val();
	console.log(chatingRoomNo);
	currentTargetMemNo = 100000;

	});

	//친구 검색 후 친구 추가 하기
	$("#insertBtn").click(function(){
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/chat/addFriend',
			data : "mem_name=" + $("#search_mem_name").val(),
			error : function(result) {
				alert("친구 추가 실패");
			},
			success : function(result) {
				alert("친구 추가 성공");
			},
		});
	});
});
</script>
