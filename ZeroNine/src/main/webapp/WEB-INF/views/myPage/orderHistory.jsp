<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="/css/myPage/common_mypage.css">
<link rel="stylesheet" href="/css/myPage/order_history.css">
<link rel="stylesheet" href="/css/myPage/delivery_tracking.css">
<script defer src="/js/myPage/commonMypage.js"></script>
<script defer src="/js/myPage/orderHistory.js"></script>
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
	                    <li class="on"><a href="${path}/myPage/orderHistory.do">주문 내역</a></li>
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
	                    <li><a href="${path}/myPage/chatList.do">채팅 목록</a></li>
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
	                <div class="con_tit has_line">주문 내역</div>
	                <!-- contents -->
	                <div class="contents">
	                	<!-- search_wrap -->
		                <div class="search_wrap">
		                	<div class="period">
		                		<span>구매 기간</span>
		                		<button class="on" data-period="1">1개월</button>
		                		<button data-period="3">3개월</button>
		                		<button data-period="6">6개월</button>
		                		<div class="calendar">
			                		<input type="text"
									    data-range="true"
									    data-multiple-dates-separator=" - "
	    								data-language="ko"
										id="datepicker"
									/>
		                		</div>
		                	</div>
		                	<div class="search_word">
		                		<span>검색어</span>
		                		<input type="text" placeholder="검색어를 입력하세요." />
		                		<button class="btn_search">검색</button>
		                	</div>
		                </div>
	                	<!-- //search_wrap -->
	                	<!-- order_history_wrap -->
	                	<div id="order_history_wrapper" class="order_history_wrap">
	                	</div>
	                	<!-- //order_history_wrap  -->
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
    <%@include file="deliveryTracking.jsp" %>
	<%@include file="../common/footer.jsp" %>
</body>
</html>
		               
