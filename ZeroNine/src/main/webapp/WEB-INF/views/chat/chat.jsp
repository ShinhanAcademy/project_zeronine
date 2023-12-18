<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet" href="${path}/css/chat/chat.css">
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script defer src="${path}/js/chat/chat.js"></script>
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<%-- zero_container --%>
	<div class="zero_container zn_center">
		<%-- chat_container --%>
		<div class="chat_container">
			<div class="title">채팅목록</div>
			<%-- chat_wrap --%>
			<div class="chat_wrap">
				<%-- chat_list --%>
				<div class="chat_list">
					<%-- chat_list_inner --%>
					<div class="chat_list_inner" id="chatList">
						<c:forEach var="chatInfo" items="${chatList}">
							<div class="chat_unit" data-chatId="${chatInfo.chatId}" data-boardId="${chatInfo.boardId}">
								<div class="profile img_wrap">
									<img src="${chatInfo.path}" alt="profile image" />
								</div>
								<div class="info">
									<div class="user_info">
										<div class="name">${chatInfo.customerName}</div>
										<span>${chatInfo.address}</span>
									</div>
									<div class="message">${chatInfo.messageContent}</div>
									<div class="deadline">${chatInfo.day} (${chatInfo.finishTime}까지)</div>
								</div>
								<div class="product img_wrap">
									<img src="${chatInfo.path}" alt="product image" />
								</div>
								<!-- <div class="read_status">1</div> -->
							</div>
						</c:forEach>
					</div>
					<%-- //chat_list_inner --%>
				</div>
				<%-- //chat_list --%>
				<div class="chat_detail_info">
					<div class="chat_top">
						<div class="user_name" id="customerName"></div>
						<button class="btn_exit" id="btnExit">나가기</button>
					</div>
					<div class="product_info">
						<div class="product img_wrap" id="path"></div>
						<div>
							<div class="brand_name" id="address"></div>						
							<div class="prouct_tit">
								<a href="" id="title"></a>
							</div>						
						</div>
					</div>
					<%-- chat_room_list --%>
					<div class="chat_room_list">
						<%-- chat_room_inner --%>
						<div class="chat_room_inner" id="chatDtlList">
							<%-- <c:forEach begin="1" end="10">
								<div class="talk other_talker">
									<div class="profile img_wrap">
										<img src="${path}/images/mypage/img_chat_profile.png"
											alt="profile image" />
									</div>
									<div class="msg">
										안녕하세요 같이 구매 원합니당.
									</div>
								</div>
								<div class="talk other_talker">
									<div class="msg">
										몇시 가능할까요?
									</div>
								</div>
								<div class="talk my_talk">
									<div class="msg">
										네넵
									</div>
								</div>
								<div class="talk my_talk">
									<div class="msg">
										저는 지금 앞이에요 ~!!
									</div>
								</div>
							</c:forEach>
							<div class="date">
								<span>2022-01-01</span>
							</div>
							<div class="talk other_talker">
								<div class="msg">
									몇시 가능할까요?
								</div>
							</div>
							<div class="talk my_talk">
								<div class="msg">
									네넵
								</div>
							</div>
							<div class="talk my_talk">
								<div class="msg">
									저는 지금 앞이에요 ~!!
								</div>
							</div> --%>
						</div>
						<%-- //chat_room_inner --%>
					</div>
					<%-- //chat_room_list --%>
					<div class="chat_text">
						<div class="text_wrap">
							<textarea id="message"></textarea>
						</div>
						<button class="btn_write" onclick="sendMessage()">작성</button>
					</div>
				</div>
			</div>
			<%-- //chat_wrap --%>
		</div>
		<%-- //chat_container --%>
	</div>
	<%-- //zero_container --%>
	<%@include file="../common/footer.jsp"%>
</body>
</html>