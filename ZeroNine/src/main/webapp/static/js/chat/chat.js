/***************************
    ZERO NINE
	-- Chat / chat
****************************/

let stompClient = null;
let chatId = null;
let boardId = null;
let sender = null;
$(function(){
	$(`#chatList .chat_unit`).on("click", function(){
		$(`#chatList .chat_unit`).removeClass("on");
		$(this).addClass("on");
		
		chatId = $(this).attr("data-chatId");
		boardId = $(this).attr("data-boardId");
		
		$.ajax({
			url : contextPath + "/chatDtl.do",
			data : {chatId},
			type : "POST",
			success : function(result) {
				const {customerId, chatDtlList, chatDtlVO} = result;
				const {customerName, address, title, path} = chatDtlVO;
				
				sender = customerId;
				
				$("#customerName").html(customerName);
				$("#address").html(address);
				$("#title").html(title);
				
				if(path != null && typeof path != "undefined"){
					$("#path").html(`<img src="${path}" alt="product image">`);
				}else{
					$("#path").html(null);
				}
				
				if(Array.isArray(chatDtlList) && chatDtlList.length > 0){
					const addHtml = [];
					let currDate = convertTime(chatDtlList[0].sendTime);
					
					addHtml.push(`<div class="date">`);
					addHtml.push(`<span>${convertTime(currDate)}</span>`);
					addHtml.push(`</div>`);
					
					for(const [idx, chatInfo] of chatDtlList.entries()){
						let makeImage = false;
						let {messageContent, sendTime, senderId} = chatInfo;
						
						if(currDate != convertTime(sendTime)){
							addHtml.push(`<div class="date">`);
							addHtml.push(`<span>${convertTime(sendTime)}</span>`);
							addHtml.push(`</div>`);
							
							currDate = convertTime(sendTime);
						}
						
						if(customerId == senderId){
							addHtml.push(`<div class="talk my_talk">`);
							addHtml.push(`<div class="msg">${messageContent}</div>`);
							addHtml.push(`</div>`);
							
							makeImage = false;
						}else{
							addHtml.push(`<div class="talk other_talker">`);
							if(!makeImage){
								addHtml.push(`<div class="profile img_wrap">`);
								addHtml.push(`<img src="${contextPath}/images/mypage/img_chat_profile.png" alt="profile image" />`)	
								addHtml.push(`</div>`);
								
								makeImage = true;
							}
							
							addHtml.push(`<div class="msg">${messageContent}</div>`);
							addHtml.push(`</div>`);
						}
						
						$("#chatDtlList").html(addHtml.join(""));
					}
				}else{
					$("#chatDtlList").html(`<div>대화내용이 없네요~~</div>`);
				}
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});
	
	$("#btnExit").on("click", function(){
		if(chatId == null || typeof chatId == "undefined"){
			return;
		}
		
		if(confirm("채팅방을 나가시겠습니까?")){
			$.ajax({
				url : contextPath + "/deleteChatInfo.do",
				data : {chatId},
				type : "POST",
				success : function(result) {
					if(result > 0){
						const div = $(`div[data-chatId="${chatId}"]`);
						$(div).remove();
						
						$("#customerName").html(null);
						$("#address").html(null);
						$("#title").html(null);
						$("#path").html(null);
					}
				},
				error : function() {
					alert("에러입니다.");
				}
			});
		}
	});
	
	connect();
});

function connect() {
	const socket = new SockJS("/chat");
	stompClient = Stomp.over(socket);

	stompClient.connect({}, function(frame) {
		console.log("Connected: " + frame);
		stompClient.subscribe("/topic/publicChatRoom", function(message) {
			console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			console.log(message);
			showMessage(JSON.parse(message.body));
		});
	});
}

function sendMessage() {
	const message = document.getElementById("message").value;

	stompClient.send("/app/chat.sendMessage", {}, JSON.stringify({
		messageContent : message,
		chatId,
		boardId,
		sender,
		type : "CHAT"
	}));
}

function showMessage(message) {
//	const chatBox = document.getElementById("chatBox");
//	const p = document.createElement("p");
//	p.style.wordWrap = "break-word";
//	p.appendChild(document.createTextNode(message.sender + ": " + message.content));
//	chatBox.appendChild(p);
	
	const {messageContent} = message;
	
	const addHtml = [];
	let currDate = convertTime(new Date());
	
	const lastDate = $("#chatDtlList div.date:last").text();
	
	if(currDate != lastDate){
		addHtml.push(`<div class="date">`);
		addHtml.push(`<span>${currDate}</span>`);
		addHtml.push(`</div>`);
	}
	
	addHtml.push(`<div class="talk my_talk">`);
	addHtml.push(`<div class="msg">${messageContent}</div>`);
	addHtml.push(`</div>`);
	
	$("#chatDtlList").append(addHtml.join(""));
	$("#message").val("");
}