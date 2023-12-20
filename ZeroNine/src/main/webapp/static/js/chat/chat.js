/***************************
    ZERO NINE
	-- Chat / chat
****************************/

let stompClient = null;
let chatId = null;
let boardId = null;
let sender = null;
let myId = null;
let sendMsgImageFlag = false;

$(function() {
	// 채팅 목록
	$(`#chatList .chat_unit`).on("click", function(){
		$(`#chatList .chat_unit`).removeClass("on");
		$(this).addClass("on");
		$("#message").val("").focus();
	
		chatId = $(this).attr("data-chatId");
		boardId = $(this).attr("data-boardId");
		
		$.ajax({
			url : contextPath + "/chatDtl.do",
			data : {chatId},
			type : "POST",
			success : function(result) {
				console.log("RESULT=>", result);
				myId = result.customerId;
				console.log("MY ID", myId);
				const {customerId, chatDtlList, chatDtlVO} = result;
				const {customerName, address, title, path} = chatDtlVO;
				
				sender = customerId;
				
			console.log("chatDtlVO>>>>>>>>>>>>    ", chatDtlVO);

				$("#customerName").html(customerName);
				$("#address").html(address);
				$("#title").html(title);
				
				if(path != null && typeof path != "undefined"){
					$("#path").html(`<img src="${path}" alt="product image">`);
				}else{
					$("#path").html(`<img src="../images/chat/img_no_product.png" alt="product no-image">`);
				}
				
				if(Array.isArray(chatDtlList) && chatDtlList.length > 0) {
					const addHtml = [];
					let currDate = dateSet.convertDate(chatDtlList[0].sendTime);
					let otherCurrTime = null;
					let myCurrTime = null;
					let makeImage = false;
					
					addHtml.push(`<div class="date">`);
					addHtml.push(`<span>${dateSet.convertDate(currDate)}</span>`);
					addHtml.push(`</div>`);
					
					for(const [idx, chatInfo] of chatDtlList.entries()){
						let {messageContent, sendTime, senderId} = chatInfo;
						messageContent = messageContent.replace(/(?:\r\n|\r|\n)/g, '<br>');
						
						if(currDate != dateSet.convertDate(sendTime)){
							addHtml.push(`<div class="date">`);
							addHtml.push(`<span>${dateSet.convertDate(sendTime)}</span>`);
							addHtml.push(`</div>`);
							
							currDate = dateSet.convertDate(sendTime);
							makeImage = false;
						}
						
						if(customerId == senderId) { //my msg
							addHtml.push(`<div class="talk my_talk">`);
							if(myCurrTime != dateSet.convertTime(sendTime)){
								addHtml.push(`<div class="time">${dateSet.convertTime(sendTime)}</div>`);
								myCurrTime = dateSet.convertTime(sendTime);
							}
							addHtml.push(`<div class="msg">${messageContent}</div>`);
							addHtml.push(`</div>`);
							
							makeImage = false;
						} else {  //other msg
							addHtml.push(`<div class="talk other_talker">`);
							if(!makeImage){
								addHtml.push(`<div class="profile img_wrap">`);
								addHtml.push(`<img src="${contextPath}/images/mypage/img_chat_profile.png" alt="profile image" />`)	
								addHtml.push(`</div>`);
								
								makeImage = true;
							}
							
							addHtml.push(`<div class="msg">${messageContent}</div>`);
							if(otherCurrTime != dateSet.convertTime(sendTime)){
								addHtml.push(`<div class="time">${dateSet.convertTime(sendTime)}</div>`);
								otherCurrTime = dateSet.convertTime(sendTime);
							}
							addHtml.push(`</div>`);
						}

						$("#chatDtlList").html(addHtml.join(""));
						console.log(
							"???~~~~~~~~~~~"
						);
					}
					$('.chat_room_list').scrollTop($('.chat_room_list')[0].scrollHeight);
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
	// console.log("message == null", isEmpty(message));
	// if(isEmpty(message)) {
	// 	alert("내용을 입력해주세요.");
	// 	$("#message").val("").focus();
	// }

	//return;
	stompClient.send("/app/chat.sendMessage", {}, JSON.stringify({
		messageContent : message,
		chatId,
		boardId,
		sender,
		type : "CHAT"
	}));
}

function showMessage(message) {
	let {messageContent} = message;
	messageContent = messageContent.replace(/(?:\r\n|\r|\n)/g, '<br>');
	console.log("SHOW MESSAGE", message);
	
	const addHtml = [];
	let currDate = dateSet.convertDate(new Date());
	let lastDate = $("#chatDtlList div.date").last().text();
	//let otherLastTime = $("#chatDtlList div.other_talker:last .time").text();
	//let myLastTime = $("#chatDtlList div.my_talk:last .time").text();

	if(currDate != lastDate){
		addHtml.push(`<div class="date">`);
		addHtml.push(`<span>${currDate}</span>`);
		addHtml.push(`</div>`);
		sendMsgImageFlag = false;
	}

	if(message.senderId == myId){ // my msg
		addHtml.push(`<div class="talk my_talk">`);
		addHtml.push(`<div class="msg">${messageContent}</div>`);
		addHtml.push(`</div>`);
		
		sendMsgImageFlag = false;
	}else{ //other msg
		addHtml.push(`<div class="talk other_talker">`);
		if(!sendMsgImageFlag){
			addHtml.push(`<div class="profile img_wrap">`);
			addHtml.push(`<img src="${contextPath}/images/mypage/img_chat_profile.png" alt="profile image" />`)	
			addHtml.push(`</div>`);
			
			sendMsgImageFlag = true;
		}
		addHtml.push(`<div class="msg">${messageContent}</div>`);
		addHtml.push(`</div>`);
	}

	$("#chatDtlList").append(addHtml.join(""));

	$("#message").val("").focus();

	$('.chat_room_list').stop().animate({
		scrollTop: $(".chat_room_list")[0].scrollHeight
	}, 400);
}

//엔터 Trigger
const chatTextArea = document.querySelector(".chat_wrap .text_wrap textarea");
if (chatTextArea) {
	chatTextArea.addEventListener("keyup", function(e) {
		if (e.keyCode === 13 && !e.shiftKey) {
			document.querySelector(".btn_write").click();
		};
	});
}
