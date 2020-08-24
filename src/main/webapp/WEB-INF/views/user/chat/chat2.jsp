<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/chat.css">
</head>
<body>
	<div class="wrapper">
		<div class="chat">
			<div class="chat-left">
				<div class="input-wrap">
					<input type="text" name="" placeholder="seach"> <i
						class="fa fa-search" aria-hidden="true"></i>
				</div>

				<c:if test="${empty friendList }">
					<tr align="center">
						<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다</font></td>
					</tr>
				</c:if>
				<c:if test="${!empty friendList }">
					<c:forEach items="${friendList }" var="friendInfo">

						<div class="user" onclick="openSocket();">
							<img
								src="https://media1.popsugar-assets.com/files/thumbor/WjFR-_7dQ3eGnp_oHtDor3Au1gI/fit-in/550x550/filters:format_auto-!!-:strip_icc-!!-/2017/08/18/840/n/1922398/d06222d559973b8d6550b9.76731985_edit_img_image_43907487_1503079245/i/Leonardo-DiCaprio-Halloween-Costume-Ideas.jpg"
								alt="" class="icon-user">
							<div class="user-status">
								<div class="name">${friendInfo.mem_name }</div>
								<i class="fa fa-circle offline"></i> <span class="status">online</span>
							</div>
						</div>

					</c:forEach>
				</c:if>

				<div class="user">
					<img
						src="https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/a1/a139201eecad23108dc4a2b1453ffa74a9e51387_full.jpg"
						alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Donald Trump</div>
						<i class="fa fa-circle offline"></i> <span class="status">online</span>
					</div>
				</div>

			</div>

			<div class="chat-right">
				<div class="chating">
					<img
						src="https://yt3.ggpht.com/-W8COuePR0sU/AAAAAAAAAAI/AAAAAAAAAAA/iAbnzA42vvY/s900-c-k-no-mo-rj-c0xffffff/photo.jpg">
					<div class="chating-with">
						<div class="name-chat">
							<b> Chat with Sorax </b>
						</div>
						<span class="status">already 1 902 messages</span>
					</div>
					<div class="like">
						<i class="fa fa-thumbs-up" onclick="addFriend();"></i>
					</div>

				</div>
				<div class="message" id="messages">
					<div class="solo-message">
						<div class="message-text left">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Delectus rem aspernatur neque omnis
							nostrum voluptatem obcaecati natus. Deleniti, iusto, sed.</div>
					</div>
				</div>

				<div class="line-input">
					<div class="input">
						<input type="text" id="messageinput">
					</div>
					<input type="text" id="sender" value="${sessionScope.id}"
						style="display: none;">
					<button class="add" onclick="send()">Send</button>
				</div>
			</div>
		</div>

	</div>
	
	<div id="regist-modal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="container" style="">
			<div class="row">
				<div class="col-12 col-lg-8 mx-auto">
					<div class="title text-center">
						<h2>약 복용정보</h2>
					</div>
				</div>
			</div>
			<div class="row ">
				<!-- contact form -->
				<div class="col-md-6">
					<div class="h-100">
						<form class="contact-form" id="contact-form" name="contactform" action="${pageContext.request.contextPath}/user/medical/updateMedicalInfo.do" method="post" enctype="multipart/form-data">			
							<!-- Start main form -->
							<div class="row">
								<div class="col-md-6">
									<!-- name -->
										<input id="pill_no" name="pill_no" type="hidden" class="form-control">
										<label>제품 명 </label><input id="pill_name" name="pill_name" type="text" class="form-control" placeholder="제품명">
										<label>복용일수 </label><input id="pill_count1_update" name="pill_count1" type="text" class="form-control" disabled>
										<input id="pill_count_update" name="pill_count" type="hidden" class="form-control">
										<label>복용시작일</label><input type="date" id="pill_start_update" name="pill_start"  class="form-control">
										<label>복용종료일</label><input type="date" id="pill_end_update" name="pill_end" class="form-control">
										<label>알림시간설정</label><input type="time" id="pill_alerttime" name="pill_alerttime" class="form-control">
								</div>	
								<div class="col-md-6" style="width: 100px;">
									<div></div>
									<div class="col-md-12 text-center">
									<input type="file" class="btn btn-outline-primary btn-block" style="margin-top: 30px;" id="files2" name="files">
									</div>
									<div style="width: 230px; height: 150px;" >
									<img id="img2" style="width: 100%; height: 100%; margin-left: 15px; margin-top: 30px;">
									</div>
									<div class="col-md-12 text-center"><button class="btn btn-outline-primary btn-block" style="margin-top: 60px;">약 상세보기</button></div>
									<label>달력 표시 색 설정</label><div><input type="color" id="pill_color" name="pill_color"></div>
								</div>																							
								<!-- submit button -->
								<div class="col-md-12 text-center">
								<button class="btn btn-outline-grad " type="submit">수정</button>
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
</body>
<script type="text/javascript">
	var ws;
	var messages = document.getElementById("messages");

	function openSocket() {
		if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
			writeResponse("WebSocket is already opened.");
			return;
		}
		//웹소켓 객체 만드는 코드
		ws = new WebSocket("ws://localhost:8080/lastProject/echo.do");

		ws.onopen = function(event) {
			if (event.data === undefined) {
				return;
			}
			writeResponse(event.data);
		};

		ws.onmessage = function(event) {
			console.log('writeResponse');
			console.log(event.data)
			writeResponse(event.data);
		};

		ws.onclose = function(event) {
			writeResponse("대화 종료");
		}

	}

	function send() {
		// var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
		var text = document.getElementById("messageinput").value + ","
				+ document.getElementById("sender").value;
		ws.send(text);
		console.log(text);
		text = "";
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
	(function() {
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
				var botText = [
						'Why did the web developer leave the restaurant? Because of the table layout.',
						'How do you comfort a JavaScript bug? You console it.',
						'An SQL query enters a bar, approaches two tables and asks: "May I join you?"',
						'What is the most used language in programming? Profanity.',
						'What is the object-oriented way to become wealthy? Inheritance.',
						'An SEO expert walks into a bar, bars, pub, tavern, public house, Irish pub, drinks, beer, alcohol' ];

				var text = document.createElement("div");
				var bot = document.createElement("div");

				text.className = "message-text right";
				bot.className = "message-text left";

				text.innerHTML = message;
				append(text);

				setTimeout(function() {
					bot.innerHTML = botText[i];
					i++;
					append(bot);

				}, 1000);

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

	})();

	
	function addFriend(){
		$("#regist-modal").modal("show"); //모달창 띄우기
	}
	
		
		

</script>
</html>