<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Chat</title>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<style>
:root{
	--green: #86BB71;
	--blue: #94C2ED;
	--orange: #E38968;
	--gray: #92959E;
}

*{
	box-sizing: border-box;
}
.chat{ 
	max-width: 700px;
	width: 100%;
	display: flex;
	margin: 0 auto;
	box-shadow: 0 80px 400px 3px  rgba(0,0,0, .8);
}
.chat-left{
	min-height: 500px;
	width: 35%;
	min-width: 120px;
	background-color: #444753;
	padding: 20px;
}

.input-wrap{
	position: relative;
}
.input-wrap input{
	background-color: #6A6C75;
	width: 90%;
	height: 44px;
	border: none;
	padding-left: 5px;
	padding-right: 40px;
	color: #222;
	border-radius: 4px 4px 4px 4px ;

}
.input-wrap .fa-search{
	position: absolute;
	top: 22px;
	right: 35px;
	transform: translateY(-50%);
	color: white;
}

.user{
	display: flex;
	margin-top: 15px;
}
img {
	width: 55px;
	height: 55px;
	border-radius: 50%;
	border: 4px solid #676771;
}
.user .icon-user{
	margin-right: 5px;
}
.user .name{
	color: white;
}
.user .status{
	color: #898C95;
}
.user .fa-circle.offline{
	color: #E38968;
}
.user .fa-circle{
	color: var(--green);
}
.chat-right{
	width: 65%;
	display: flex;
	flex-wrap: wrap;
	background-color: #F2F5F8;
}

.chating{
	padding: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 15%;
	width: 100%;
	background-color: #F2F5F8;
	border-bottom: 1px solid white;
}
.chating .name-chat{
	color: #434651;
}
.chating .chating-with{
	margin-left: -150px;
}
.chating .status{
	color: #9995A4;
	font-size: 16px;
}
.chating .fa{
	color: #D8DADF;
	font-size: 22px;
}
.message{
	overflow-y: scroll;
	height: 70%;
	max-height: 450px;
}
.solo-message{
	margin: 10px;
	display: block;
	clear: both;
}
.message-text{
	margin-top: 10px;
	max-width: 90%;
	display: inline-block;
	border-radius: 10px;
	padding: 10px 15px;
	word-wrap: break-word;
}
.message-text.right{
	float: right;
	background-color: var(--blue);
}
.message-text.left{
	float: left;
	background-color: var(--green);
}

.line-input{
	height: 15%;
	width: 100%;
	padding: 5px 10px;
	align-self: flex-end;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-top: 1px solid white;
}
.line-input .input{
	position: relative;
	width: 100%;
}
.line-input .input input{
	width: 100%;
	border: none;
	padding: 10px 20px;
}
.line-input .input:after{
	content:" ";
	display: block;
	position: absolute;
	left: 51%;
	right: 50%;
	bottom: 0%;
	height: 2px;
	background-color: #444753;
	transition: all 300ms;
}
.line-input .input:hover:after{
	left:0%;
	right: 0%;
	bottom: 0%;
}
.line-input .add{
	padding: 9px 15px;
	width: 15%;
	margin-left: 1px;
}
</style>
<body>
	<div class="wrapper">
		<div class="chat">
			<div class="chat-left">
				<div class="input-wrap">
					<input type="text" name="" placeholder="seach">
					<i class="fa fa-search" aria-hidden="true"></i>
				</div>
				<div class="user">
					<img src="https://yt3.ggpht.com/-W8COuePR0sU/AAAAAAAAAAI/AAAAAAAAAAA/iAbnzA42vvY/s900-c-k-no-mo-rj-c0xffffff/photo.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Artem Grinberg</div>
						<i class="fa fa-circle"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_80%2Cw_300/MTE5NDg0MDU0NTIzODQwMDE1/steven-jobs-9354805-2-402.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Steve Jobs</div>
						<i class="fa fa-circle offline"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://cs8.pikabu.ru/post_img/big/2016/04/13/7/1460542975161293550.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Elon Musk</div>
						<i class="fa fa-circle"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://avatarfiles.alphacoders.com/792/79295.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Bugs Bunny</div>
						<i class="fa fa-circle"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://i.work.ua/sent_photo/9/8/3/983e03f616d55c1b67f9a01633e27e72.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Chybirka Victor</div>
						<i class="fa fa-circle offline"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="http://99px.ru/sstorage/1/2012/05/image_12605120347344938832.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Iron Man</div>
						<i class="fa fa-circle "></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://media1.popsugar-assets.com/files/thumbor/WjFR-_7dQ3eGnp_oHtDor3Au1gI/fit-in/550x550/filters:format_auto-!!-:strip_icc-!!-/2017/08/18/840/n/1922398/d06222d559973b8d6550b9.76731985_edit_img_image_43907487_1503079245/i/Leonardo-DiCaprio-Halloween-Costume-Ideas.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Leonardo Dicaprio</div>
						<i class="fa fa-circle offline"></i>
						<span class="status">online</span>
					</div>
				</div>
				<div class="user">
					<img src="https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/a1/a139201eecad23108dc4a2b1453ffa74a9e51387_full.jpg" alt="" class="icon-user">
					<div class="user-status">
						<div class="name">Donald Trump</div>
						<i class="fa fa-circle offline"></i>
						<span class="status">online</span>
					</div>
				</div>

			</div>

			<div class="chat-right">
				<div class="chating">
					<img src="https://yt3.ggpht.com/-W8COuePR0sU/AAAAAAAAAAI/AAAAAAAAAAA/iAbnzA42vvY/s900-c-k-no-mo-rj-c0xffffff/photo.jpg">
					<div class="chating-with">
						<div class="name-chat"> <b> Chat with Sorax </b></div>
						<span class="status">already 1 902 messages</span>
					</div>
					<div class="like"><i class="fa fa-thumbs-up"></i></div>

				</div>
				<div class="message">
					<div class="solo-message">
						<div class="message-text left">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus rem aspernatur neque omnis nostrum voluptatem obcaecati natus. Deleniti, iusto, sed.
						</div>
					</div>
				</div>
				
				<div class="line-input">
					<div class="input"><input type="text"></div>
					<button class="add">Send</button>
				</div>
			</div>
		</div>

	</div>
	<script src="js/script.js"></script>	
</body>
<script type ="text/javascript">

(function(){
	var i = 0;
	document.querySelector(".add").addEventListener("click", addMessage);

	document.querySelector(".input").onkeypress = function(e){
		if(e.key === "Enter"){
			addMessage();
		}
	}

	function addMessage(){
		var message = document.querySelector(".input input").value;

		if( message !== ""){
			var botText = [
				'Why did the web developer leave the restaurant? Because of the table layout.',
      			'How do you comfort a JavaScript bug? You console it.',
      			'An SQL query enters a bar, approaches two tables and asks: "May I join you?"',
      			'What is the most used language in programming? Profanity.',
      			'What is the object-oriented way to become wealthy? Inheritance.',
      			'An SEO expert walks into a bar, bars, pub, tavern, public house, Irish pub, drinks, beer, alcohol'
      		];


			var text = document.createElement("div");
			var bot = document.createElement("div");

			text.className = "message-text right";
			bot.className = "message-text left";

			text.innerHTML = message;
			append(text);
			
			setTimeout(function(){
				bot.innerHTML = botText[i];
				i++;
				append(bot);

			}, 1000);

		}
	}

	function append(child){
		var out = document.querySelector(".message");
		var innerDiv = document.createElement("div");

		innerDiv.className = "solo-message";

		innerDiv.appendChild(child);
		out.appendChild(innerDiv);

		out.scrollBy(0, 1000);
		document.querySelector(".input input").value = "";

	}

})();
</script>
</html>