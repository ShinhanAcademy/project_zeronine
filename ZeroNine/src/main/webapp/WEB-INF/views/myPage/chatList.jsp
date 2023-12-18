<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/chat_list.css">
<link rel="stylesheet" href="${path}/css/myPage/chatDetailView.css">
<!-- <script src="${path}/js/myPage/commonMypage.js" defer></script>  -->
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<!-- zero_container -->
	<div class="zero_container zn_center">
	    <!-- mypage_container -->
	    <div class="mypage_container">
	        <!-- zero_sbn -->
	        <div class="zero_sbn">
	            <div class="title">마이 제로나인</div>
	            <div class="snb_wrap">
	                <div class="sub_tit">MY SHOPPING</div>
	                <ul>
	                    <li><a href="${path}/myPage/myWallet.do">나의 지갑</a></li>
	                    <li><a href="${path}/myPage/orderHistory.do">주문 내역</a></li>
	                    <li><a href="${path}/myPage/orderCancelHistory.do">취소 / 반품 내역</a></li>
	                    <li><a href="${path}/myPage/myCart.do">장바구니</a></li>
	                    <li><a href="${path}/myPage/likeProduct.do">찜한 상품</a></li>
	                </ul>
	                <div class="sub_tit">MY ACTIVITIES</div>
	                <ul>
   	                    <li><a href="${path}/myPage/ecoCare.do">나의 에코케어</a></li>
	                    <li><a href="${path}/myPage/createdBoard.do">내가 쓴 게시글</a></li>
	                    <li><a href="${path}/myPage/participatedBoard.do">내가 참여한 게시글</a></li>
	                    <li><a href="${path}/myPage/likeBoard.do">찜한 게시글</a></li>
	                    <li class="on"><a href="${path}/myPage/chatList.do">채팅 목록</a></li>
	                </ul>
	                <div class="sub_tit">MY INFOMATION</div>
	                <ul>
	                    <li><a href="${path}/myPage/validatePassword.do">개인 정보</a></li>
	                    <li><a href="${path}/myPage/subscriptionInfo.do">구독 정보</a></li>
	                </ul>
	            </div>
	        </div>
	        <!-- //zero_sbn -->
	        <!-- mypage_detail_wrap -->
	        <div class="mypage_detail_wrap">
	            <!-- my_info_wrap -->
	            <div class="my_info_wrap">
	                <!-- info_left -->
	                <div class="info_left">
	                    <div class="profile">
                            <div class="img_wrap">
                                <img src="${path}/images/mypage/img_mypage_profile.png" alt="profile image" />
                            </div>
                            홍길동 님
	                    </div>
	                    <ul class="subscription_list">
	                        <li>
	                            <div class="img_wrap">
	                                <img src="${path}/images/mypage/img_bag_small.png" alt="subscription image">
	                            </div>
	                            슝슝 무한 배송 구독중
	                        </li>
	                        <li>
	                            <div class="img_wrap">
	                                <img src="${path}/images/mypage/img_trash_small.png" alt="subscription image">
	                            </div>
	                            쓰레기 수거 구독중
	                        </li>
	                        <li>현재 구독 중인 구독권이 없습니다.</li>
	                    </ul>
	                </div>
	                <!-- //info_left -->
	                <!-- info_right -->
	                <div class="info_right">
	                    <table>
	                        <tbody>
	                            <tr>
	                                <th>지구 지킴이 횟수</th>
	                                <td>36회</td>
	                            </tr>
	                            <tr>
	                                <th>My Point</th>
	                                <td>
	                                    4,280
	                                    <button class="btn_orange_small">충전하기</button>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>회수 쿠폰</th>
	                                <td>36회</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- //info_right -->
	            </div>
	            <!-- //my_info_wrap -->
	            <!-- contents_wrap -->
	            <div class="contents_wrap">
	                <div class="con_tit">채팅 목록</div> <%-- has_line --%>
	                <!-- contents -->
	                <div class="contents">
	                    <div class="chatlist_wrap">
	                    
	                    <div id="hereContents">
		                    <div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>${count}</span>건 &nbsp[진행중]
		                    	</div>
		                    	
		                    	<div class="chat_kind">
								<span class="btn_deli on" id="author_chat">작성자</span>
								<span>|</span>
								<span class="btn_deli" id="participant_chat">참여자</span>
								</div>
		                    	
		                    	<div class="btn_wrap">
		                    		<button class="btn_more">채팅방으로 가기 &gt;</button>
		                    	</div>
	                    	</div>
		                    <div class="tbl_wrap">
		                    	<table class="tbl_chat_wrap">
								  <colgroup>  	
								    <col width="20%" />
									<col width="35%" />
									<col width="15%" />
									<col width="18%" />
									<col width="12%" />
								  </colgroup>
		                    		<thead>
		                    			<tr>
		                    				<th>상품</th>
		                    				<th>게시글 제목</th>
		                    				<th>게시일</th>
		                    				<th>마감 기한</th>
		                    				<th>더보기</th>
		                    			</tr>
		                    		</thead>
		                    		<tbody>
		                    			<c:forEach items="${info}" var="board">
		                    			<tr>
		                    				<td><img class="product_image" src="${board.oBoardImagePath}"></td>
		                    				<td class="td_font_title">${board.oTitle}</td>
		                    				<td class="td_font_upload">${board.uploadTime}</td>
		                    				<td class="td_font_remain">${board.remainTime}</td>
		                    				<td class="read_status">
		                    				<input id="hiddenBoardId" type="hidden" value="${board.oBoardId}">
											<button class="boardDetail">상세보기</button>	
		                    				</td>
		                    			</tr>
		                    			</c:forEach>
		                    		</tbody>
		                    	</table>
		                    	<br><br>
		                    	<div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>${successCount}</span>건 &nbsp[완료]
		                    	</div>
		                    	
	                    	</div>
		                    <div class="tbl_wrap">
		                    	<table class="tbl_chat_wrap">
								  <colgroup>  	
								    <col width="20%" />
									<col width="35%" />
									<col width="15%" />
									<col width="18%" />
									<col width="12%" />
								  </colgroup>
		                    		<thead>
		                    			<tr>
		                    				<th>상품</th>
		                    				<th>게시글 제목</th>
		                    				<th>게시일</th>
		                    				<th>마감 기한</th>
		                    				<th>더보기</th>
		                    			</tr>
		                    		</thead>
		                    		<tbody>
		                    			<c:forEach items="${successInfo}" var="board">
		                    			<tr>
		                    				<td><img class="product_image" src="${board.oBoardImagePath}"></td>
		                    				<td class="td_font_title">${board.oTitle}</td>
		                    				<td class="td_font_upload">${board.uploadTime}</td>
		                    				<td class="td_font_remain">${board.remainTime}</td>
		                    				<td class="read_status">
		                    				<input id="hiddenBoardId" type="hidden" value="${board.oBoardId}">
											<button class="boardDetail">상세보기</button>	
											<input id="hiddenIsSuccess" type="hidden" value="success">
											<p id="isSuccess">공구 성공</p>
		                    				</td>
		                    			</tr>
		                    			</c:forEach>
		                    		</tbody>
		                    	</table>
		                    	</div>
		                    </div>
	          
							
	                    </div>
	                    <!-- //chatlist_wrap  -->
	                </div>
	                <!-- //contents -->
	            </div>
	            <!-- //contents_wrap -->
	        </div>
	        <!-- //mypage_detail_wrap -->
	    </div>
	    <!-- //mypage_container -->
	</div>
	<!-- //zero_container -->
	<div id="here"></div>
	<%@include file="../common/footer.jsp" %>
	<script>
	var path = "${path}";
	</script>
	<script src="${path}/js/myPage/chatList.js" type="text/javascript"></script>
</body>
</html>