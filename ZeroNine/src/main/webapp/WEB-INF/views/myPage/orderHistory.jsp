<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="/css/myPage/common_mypage.css">
<link rel="stylesheet" href="/css/myPage/order_history.css">
<link rel="stylesheet" href="/css/myPage/delivery_tracking.css">
<script defer src="/js/myPage/myShopping.js"></script>
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
	                    <li><a href="${path}/myPage/createdBoard.do">내가 쓴 게시글</a></li>
	                    <li><a href="${path}/myPage/participatedBoard.do">내가 참여한 게시글</a></li>
	                    <li><a href="${path}/myPage/chatList.do">채팅 목록</a></li>
	                    <li><a href="${path}/myPage/likeBoard.do">찜한 게시글</a></li>
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
		                		<button class="on" period="1">1개월</button>
		                		<button period="3">3개월</button>
		                		<button period="6">6개월</button>
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
	                	<!-- orderhistory_wrap  -->
	                	<div id="orderhistory_wrap" class="order_history_wrap">
		                    <div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>2</span>건
		                    	</div>
	                    	</div>
	                		<!-- tbl_wrap -->
		                	<div class="tbl_wrap">
		                    	<table class="tbl_orderlist_wrap">
								  <colgroup>
								    <col width="22%" />
								    <col width="40%" />
								    <col width="8%" />
								    <col width="15%" />
								    <col width="15%" />
								  </colgroup>
		                    		<thead>
		                    			<tr>
		                    				<th>주문 일자</th>
		                    				<th>상품 정보</th>
		                    				<th>수량</th>
		                    				<th>주문금액</th>
		                    				<th>상태</th>
		                    			</tr>
		                    		</thead>
		                    		<tbody>
		                    			<tr>
		                    				<td rowspan="3">
		                    					2023.11.14
												<div class="order_num color_blue">202311150000001</div>
		                    				</td>
		                    				<td class="product_info">
												<div class="img_wrap">
													<img src="${path}/images/mypage/img_product_04.png" alt="product image" />
												</div>
												<div class="detail">
													<div class="brand_name">에스쁘아</div>
													<div class="product_name">[증량기획] 에스쁘아 원터 스플래쉬 선크림 세라마이드 60ml+20ml 세트</div>
												</div>
											</td>
		                    				<td>3</td>
		                    				<td class="price color_red ">66,000원</td>
		                    				<td rowspan="3" class="order_status">
												배송완료
												<div>
													<button class="btn_blue btn_delivery_check">배송조회</button>
												</div>
											</td>
		                    			</tr>
		                    			<tr>
		                    				<td class="product_info">
												<div class="img_wrap">
													<img src="${path}/images/mypage/img_product_05.png" alt="product image" />
												</div>
												<div class="detail">
													<div class="brand_name">유시몰</div>
													<div class="product_name">[11/27 하루특가]유시몰 화이트닝 미백치약 106g+20g (가글 9ml 추가</div>
												</div>
											</td>
		                    				<td>3</td>
		                    				<td class="price color_red ">66,000원</td>
		                    			</tr>
		                    			<tr>
		                    				<td class="product_info">
												<div class="img_wrap">
													<img src="${path}/images/mypage/img_product_06.png" alt="product image" />
												</div>
												<div class="detail">
													<div class="brand_name">라보에이치</div>
													<div class="product_name">라보에이치 두피강화샴푸 탈모증상완화 333ml기획 (+112ml 증정)</div>
												</div>
											</td>
		                    				<td>3</td>
		                    				<td class="price color_red ">66,000원</td>
		                    			</tr>
		                    			<tr>
		                    				<td>
		                    					2023.11.14
												<div class="order_num color_blue">202311150000001</div>
		                    				</td>
		                    				<td class="product_info">
												<div class="img_wrap">
													<img src="${path}/images/mypage/img_product_07.png" alt="product image" />
												</div>
												<div class="detail">
													<div class="brand_name">에스쁘아</div>
													<div class="product_name">[한정기획/베스트립증정]에스쁘아 비벨벳 커버쿠션 뉴클래스 미니립 2종[한정기획/베스트립증정]에스쁘아 비벨벳 커버쿠션 뉴클래스 미니립 2종</div>
												</div>
											</td>
		                    				<td>3</td>
		                    				<td class="price color_red ">66,000원</td>
		                    				<td class="order_status">
												배송완료
												<div>
													<button class="btn_blue btn_delivery_check">배송조회</button>
												</div>
											</td>
		                    			</tr>
		                    		</tbody>
		                    	</table>
		                    </div>
	                		<!-- tbl_wrap -->
	                	</div>
	                	<!-- //orderhistory_wrap  -->
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