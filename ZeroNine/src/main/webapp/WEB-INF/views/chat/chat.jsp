<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet" href="${path}/css/chat/chat.css">

<%-- web socket CDN --%>
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
							<%-- chat_unit --%>
							<div class="chat_unit" data-chatId="${chatInfo.chatId}" data-boardId="${chatInfo.boardId}" <c:if test="${chatId != null && chatId == chatInfo.chatId}">data-flag="Y"</c:if>>
								<div class="profile img_wrap">
									<c:if test="${sessionScope.customerId ne chatInfo.chatCustId}">
										<c:choose>
											<c:when test="${chatInfo.chatCustName eq '방용수' || chatInfo.chatCustId eq '4591549e-7eaa-4009-a4cd-b052d8b1f537' || chatInfo.chatCustId eq '490ef92a-d77f-432f-8bfb-2828eee6db77'}">
												<img src="${path}/images/common/img_user_ys.jpg"
													alt="profile image" />
											</c:when>
											<c:when test="${chatInfo.chatCustName eq '이예나' || chatInfo.chatCustId eq '87c5033c-ef9d-4934-930a-2f172cdad795'}">
												<img src="${path}/images/common/img_user_yn.jpg"
													alt="profile image" />
											</c:when>
											<c:when test="${chatInfo.chatCustName eq '정주영' || chatInfo.chatCustId eq 'e70c4145-25b8-43d3-9ff8-60ef51d4adb9'}">
												<img src="${path}/images/common/img_user_jy.jpg"
													alt="profile image" />
											</c:when>
											<c:when test="${chatInfo.chatCustName eq '노승광' || chatInfo.chatCustName eq '네이버승광' || chatInfo.chatCustId eq 'a6a48528-9215-4fb9-9dd0-5bb174103277' || chatInfo.chatCustId eq '68966705-7537-4e13-8262-dffaa09f39c8'}">
												<img src="${path}/images/common/img_user_sg.png"
													alt="profile image" />
											</c:when>
											<c:when test="${chatInfo.chatCustName eq '유은경' || chatInfo.chatCustId eq '7cb70b46-d6c2-462d-b785-dc27e1e7d045'}">
												<img src="${path}/images/common/img_user_ek.jpg"
													alt="profile image" class="has_user_img" />
											</c:when>
											<c:otherwise>
												<img src="${path}/images/common/img_user_profile.png"
													alt="profile image" />
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${sessionScope.customerId ne chatInfo.authorCusId}">
										<c:choose>
											<c:when test="${chatInfo.authorCustName eq '방용수' || chatInfo.authorCusId eq '4591549e-7eaa-4009-a4cd-b052d8b1f537' || chatInfo.authorCusId eq '490ef92a-d77f-432f-8bfb-2828eee6db77'}">
												<img src="${path}/images/common/img_user_ys.jpg"
													alt="profile image" />
											</c:when>
											<c:when test="${chatInfo.authorCustName eq '이예나' || chatInfo.authorCusId eq '87c5033c-ef9d-4934-930a-2f172cdad795'}">
												<img src="${path}/images/common/img_user_yn.jpg"
													alt="profile image" />
											</c:when>
											<c:when test="${chatInfo.authorCustName eq '정주영' || chatInfo.authorCusId eq 'e70c4145-25b8-43d3-9ff8-60ef51d4adb9'}">
												<img src="${path}/images/common/img_user_jy.jpg"
													alt="profile image" />
											</c:when>
											<c:when test="${chatInfo.authorCustName eq '노승광' || chatInfo.authorCustName eq '네이버승광' || chatInfo.authorCusId eq '68966705-7537-4e13-8262-dffaa09f39c8'}">
												<img src="${path}/images/common/img_user_sg.png"
													alt="profile image" />
											</c:when>
											<c:when test="${chatInfo.authorCustName eq '유은경' || chatInfo.authorCusId eq '7cb70b46-d6c2-462d-b785-dc27e1e7d045'}">
												<img src="${path}/images/common/img_user_ek.jpg"
													alt="profile image" class="has_user_img" />
											</c:when>
											<c:otherwise>
												<img src="${path}/images/common/img_user_profile.png"
													alt="profile image" />
											</c:otherwise>
										</c:choose>
									</c:if>
								</div>
								<div class="info">
									<div class="user_info">
										<c:if test="${sessionScope.customerId ne chatInfo.chatCustId}">
											<div class="name">${chatInfo.chatCustName}</div>
										</c:if>
										<c:if test="${sessionScope.customerId ne chatInfo.authorCusId}">
											<div class="name">${chatInfo.authorCustName}</div>
										</c:if>
										<span>${chatInfo.boardTitle} | ${chatInfo.address}, ${chatInfo.addrDetail}</span>
									</div>
									<div class="message">${chatInfo.messageContent}</div>
									<div class="deadline">${chatInfo.remainingDays} (${chatInfo.finishTime}까지)</div>
								</div>
								<div class="product img_wrap">
									<img src="${chatInfo.productImagePath}" alt="product image" />
								</div>
								<!-- <div class="read_status">1</div> -->
							</div> 
							<%-- //chat_unit --%>
						</c:forEach>
					</div>
					<%-- //chat_list_inner --%>
				</div>
				<%-- //chat_list --%>
				<div class="chat_detail_info">
					<div class="chat_top">
						<div class="user_name" id="customerName"></div>
						<button class="btn_exit" id="btnExit">채팅방 나가기</button>
					</div>
					<div class="product_info">
						<div class="product img_wrap" id="path"></div>
						<div>
							<div class="brand_name" id="address"></div>						
							<div class="prouct_tit" id="chatTitle">
							</div>						
						</div>
					</div>
					<%-- chat_room_list --%>
					<div class="chat_room_list">
						<%-- chat_room_inner --%>
						<div class="chat_room_inner" id="chatDtlList">
						</div>
						<%-- //chat_room_inner --%>
					</div>
					<%-- //chat_room_list --%>
					<div class="chat_text">
						<div class="text_wrap">
							<textarea id="message"></textarea>
							<button class="btn_write" onclick="sendMessage()">작성</button>
						</div>
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