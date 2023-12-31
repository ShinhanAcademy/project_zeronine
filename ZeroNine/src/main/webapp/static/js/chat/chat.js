/***************************
    ZERO NINE
	-- Chat / chat
****************************/

let stompClient = null;
let currChatId = null;
let boardId = null;
//let mySessionId = null; // myId
let sendMsgImageFlag = false;
//let otherCustId = null; //???
//let otherCustName = null;
//let lastTalkCustId = null;

let selectedData = {};

$(function() {
	clickEventInit();
	
	//채팅방 나가기
	$("#btnExit").on("click", function(){
		if(currChatId == null || typeof currChatId == "undefined"){
			return;
		}
		
		if(confirm("채팅방을 나가시겠습니까?")){
			$.ajax({
				url : contextPath + "/deleteChatInfo.do",
				data : {chatId:currChatId},
				type : "POST",
				success : function(result) {
					if(result > 0){
						const div = $(`div[data-chatId="${currChatId}"]`);
						$(div).remove();
						
						$("#customerName").html(null);
						$("#address").html(null);
						$("#chatTitle").html(null);
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
	
	if($("div[data-flag='Y']").length > 0){
		$("div[data-flag='Y']").click();
	}
});

function connect() {
	const socket = new SockJS("/chat");
	stompClient = Stomp.over(socket);

	stompClient.connect({}, function(frame) {
		stompClient.subscribe("/topic/publicChatRoom", function(message) {
			showMessage(JSON.parse(message.body));
		});
	});
}

function sendMessage() {
	let message = document.getElementById("message").value;
	 if(isEmpty(message) || message.trim() == "") {
	 	$("#message").val("").focus();
	 	return;
	 }

	//return;
	stompClient.send("/app/chat.sendMessage", {}, JSON.stringify({
		messageContent : message,
		chatId : currChatId,
		boardId,
		sender : selectedData.myCustomerId,
		type : "CHAT"
	}));
}

function showMessage(message) {
	let {messageContent, sendTime, chatId} = message;

	messageContent = messageContent.replace(/(?:\r\n|\r|\n)/g, '<br>');
	console.log("SHOW MESSAGE", message);
	console.log("??????", messageContent);
	
	console.log(`currChatId >>>> ${currChatId} | chatId >>>> ${chatId}`);


	if(selectedData.chatId == chatId){
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
		

		if(message.senderId == selectedData.myCustomerId){
			addHtml.push(`<div class="talk my_talk">`);
			addHtml.push(`<div class="time">${dateSet.convertTime(sendTime)}</div>`);
			addHtml.push(`<div class="msg">${messageContent}</div>`);
			addHtml.push(`</div>`);
			
			sendMsgImageFlag = false;
		}else{ //other msg
			
			if(message.senderId != selectedData.authorCustId //상대방 true
				& message.senderId == selectedData.lastTalkCustId) { 
				sendMsgImageFlag = true;
			} else if(message.senderId != selectedData.chatCustId //상대방 true
				&& message.senderId == selectedData.lastTalkCustId) {
				sendMsgImageFlag = true;
			}

			// if(message.senderId == selectedData.lastTalkCustId) {
			// 	sendMsgImageFlag = true;
			// }

			addHtml.push(`<div class="talk other_talker">`);
			if(!sendMsgImageFlag){
				addHtml.push(`<div class="profile img_wrap">`);
				
				let imagePath;
				if(selectedData.myCustomerId != selectedData.chatCustId) {
					let _chatCustName = selectedData.chatCustName;
					let _chatCustId = selectedData.chatCustId;
					if(_chatCustName == "유은경" || _chatCustId == "7cb70b46-d6c2-462d-b785-dc27e1e7d045"){
						imagePath = "/images/common/img_user_ek.jpg";
					}else if(_chatCustName == "방용수" || _chatCustId == "490ef92a-d77f-432f-8bfb-2828eee6db77"){
						imagePath = "/images/common/img_user_ys.jpg";
					}else if(_chatCustName == "이예나" || _chatCustId == "87c5033c-ef9d-4934-930a-2f172cdad795"){
						imagePath = "/images/common/img_user_yn.jpg";
					}else if(_chatCustName == "정주영" || _chatCustId == "e70c4145-25b8-43d3-9ff8-60ef51d4adb9"){
						imagePath = "/images/common/img_user_jy.jpg";
					}else if(_chatCustName == "노승광" || _chatCustName == "네이버승광" || _chatCustId == "68966705-7537-4e13-8262-dffaa09f39c8"){
						imagePath = "/images/common/img_user_sg.png";
					}
				} else if(selectedData.myCustomerId != selectedData.authorCustId) {
					let _authorCustName = selectedData.authorCustName;
					let _authorCustId = selectedData.authorCustId;
					if(_authorCustName == "유은경" || _authorCustId == "7cb70b46-d6c2-462d-b785-dc27e1e7d045"){
						imagePath = "/images/common/img_user_ek.jpg";
					}else if(_authorCustName == "방용수" || _authorCustId == "490ef92a-d77f-432f-8bfb-2828eee6db77"){
						imagePath = "/images/common/img_user_ys.jpg";
					}else if(_authorCustName == "이예나" || _authorCustId == "87c5033c-ef9d-4934-930a-2f172cdad795"){
						imagePath = "/images/common/img_user_yn.jpg";
					}else if(_authorCustName == "정주영" || _authorCustId == "e70c4145-25b8-43d3-9ff8-60ef51d4adb9"){
						imagePath = "/images/common/img_user_jy.jpg";
					}else if(_authorCustName == "노승광" || _authorCustName == "네이버승광" || _authorCustId == "68966705-7537-4e13-8262-dffaa09f39c8"){
						imagePath = "/images/common/img_user_sg.png";
					}
				} else {
					imagePath = "/images/common/img_user_profile.png";
				}
				
				addHtml.push(`<img src="${contextPath}${imagePath}" alt="profile image" />`);
				addHtml.push(`</div>`);
				
				sendMsgImageFlag = true;
				
			
			}
			addHtml.push(`<div class="msg">${messageContent}</div>`);
			addHtml.push(`<div class="time">${dateSet.convertTime(sendTime)}</div>`);
			addHtml.push(`</div>`);
		}
	
		$("#chatDtlList").append(addHtml.join(""));
	
		$("#message").val("").focus();
	
		$('.chat_room_list').stop().animate({
			scrollTop: $(".chat_room_list")[0].scrollHeight
		}, 400);
		
		const chatUnit = $("#chatList div.chat_unit.on");
		const outHTML = $("#chatList div.chat_unit.on")[0].outerHTML;
		
		console.log("메시지 보낼때마다 호출");
		$(chatUnit).remove();
		$("#chatList").prepend(outHTML);
		$("#chatList div.chat_unit.on").find("div.message").html(messageContent);
		console.log("메시지 보낼때마다 호출");
		
	} else {
		console.log("else!!!!!!!!!!!!!!!!!!!!!");
		console.log(`chatId >>> ${chatId}`);
		console.log(`messageContent >>> ${messageContent}`);
		
		const chatUnit = $(`#chatList div[data-chatid="${chatId}"]`);
		const outHTML = $(`#chatList div[data-chatid="${chatId}"]`)[0].outerHTML;
		
		console.log("else 메시지 보낼때마다 호출");
		$(chatUnit).remove();
		$("#chatList").prepend(outHTML);
		$(`#chatList div[data-chatid="${chatId}"]`).find("div.message").html(messageContent);
		console.log("else 메시지 보낼때마다 호출");
	}

	clickEventInit();
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

function clickEventInit() {
	// 채팅 목록
	$(`#chatList .chat_unit`).off().on("click", function(){
		$(`#chatList .chat_unit`).removeClass("on");
		$(this).addClass("on");
	
		currChatId = $(this).attr("data-chatId");
		boardId = $(this).attr("data-boardId");
		
		$.ajax({
			url : contextPath + "/chatDtl.do",
			data : {chatId:currChatId},
			type : "POST",
			success : function(result) {
				console.log("RESULT======================================>", result);
				const {chatDtlList, chatDtlVO} = result;

				//const {chatId, address, title, productImagePath, chatCustId, authorCusId, chatCustName, authorCustName, lastTalkerId} = chatDtlVO;
				//const {customerName, address, title, productImagePath, myCustomerId, otherCustomerId, lastTalkerId} = chatDtlVO;
				selectedData = {...chatDtlVO};
				
				console.log("selectedData >>>>>>>>>>>    ", selectedData);

				if(chatDtlVO.myCustomerId != chatDtlVO.chatCustId) {
					$("#customerName").html(selectedData.authorCustName);

				} else {
					$("#customerName").html(selectedData.chatCustName);
				}
				$("#address").html(chatDtlVO.address);
				$("#chatTitle").html(chatDtlVO.title);
				
				if(path != null && typeof path != "undefined"){
					$("#path").html(`<img src="${chatDtlVO.productImagePath}" alt="product image">`);
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
						
						if(chatDtlVO.myCustomerId == senderId) { //my msg
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
								
								let imagePath;
								
								if(chatDtlVO.myCustomerId != chatDtlVO.chatCustId) {
									let _chatCustName = chatDtlVO.chatCustName;
									let _chatCustId = chatDtlVO.chatCustId;
									if(_chatCustName == "유은경" || _chatCustId == "7cb70b46-d6c2-462d-b785-dc27e1e7d045"){
										imagePath = "/images/common/img_user_ek.jpg";
									}else if(_chatCustName == "방용수" || _chatCustId == "490ef92a-d77f-432f-8bfb-2828eee6db77"){
										imagePath = "/images/common/img_user_ys.jpg";
									}else if(_chatCustName == "이예나" || _chatCustId == "87c5033c-ef9d-4934-930a-2f172cdad795"){
										imagePath = "/images/common/img_user_yn.jpg";
									}else if(_chatCustName == "정주영" || _chatCustId == "e70c4145-25b8-43d3-9ff8-60ef51d4adb9"){
										imagePath = "/images/common/img_user_jy.jpg";
									}else if(_chatCustName == "노승광" || _chatCustName == "네이버승광" || _chatCustId == "68966705-7537-4e13-8262-dffaa09f39c8"){
										imagePath = "/images/common/img_user_sg.png";
									} else {
										imagePath = "/images/common/img_user_profile.png";
									}
								} else if(chatDtlVO.myCustomerId != chatDtlVO.authorCustId) {
									let _authorCustName = chatDtlVO.authorCustName;
									let _authorCustId = chatDtlVO.authorCustId;
									if(_authorCustName == "유은경" || _authorCustId == "7cb70b46-d6c2-462d-b785-dc27e1e7d045"){
										imagePath = "/images/common/img_user_ek.jpg";
									}else if(_authorCustName == "방용수" || _authorCustId == "490ef92a-d77f-432f-8bfb-2828eee6db77"){
										imagePath = "/images/common/img_user_ys.jpg";
									}else if(_authorCustName == "이예나" || _authorCustId == "87c5033c-ef9d-4934-930a-2f172cdad795"){
										imagePath = "/images/common/img_user_yn.jpg";
									}else if(_authorCustName == "정주영" || _authorCustId == "e70c4145-25b8-43d3-9ff8-60ef51d4adb9"){
										imagePath = "/images/common/img_user_jy.jpg";
									}else if(_authorCustName == "노승광" || _authorCustName == "네이버승광" || _authorCustId == "68966705-7537-4e13-8262-dffaa09f39c8"){
										imagePath = "/images/common/img_user_sg.png";
									} else {
										imagePath = "/images/common/img_user_profile.png";
									}
								} else {
									imagePath = "/images/common/img_user_profile.png";
								}
								
								addHtml.push(`<img src="${contextPath}${imagePath}" alt="profile image" />`);
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
}