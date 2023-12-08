<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/my_wallet.css">
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
	                    <li class="on"><a href="${path}/myPage/myWallet.do">나의 지갑</a></li>
	                    <li><a href="${path}/myPage/orderHistory.do">주문 내역</a></li>
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
	                <div class="con_tit">진행 중인 주문</div>
	                <!-- contents -->
	                <div class="contents">
	                	<%-- wallet_wrap --%>
						<div class="wallet_wrap">
	                		<%-- tbl_top_wrap --%>
		                    <div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>2</span>건
		                    	</div>
		                    	<div class="btn_wrap">
		                    		<button class="btn_more">더보기 &gt;</button>
		                    	</div>
	                    	</div>
	                		<%-- //tbl_top_wrap --%>
	                    	<%-- tbl_wrap --%>
		                    <div class="tbl_wrap">
		                    	<table class="tbl_wallet_wrap">
								  <colgroup>  	
								    <col width="52%" />
								    <col span="4" width="12%" />
								  </colgroup>
		                    		<thead>
		                    			<tr>
		                    				<th>상품 정보</th>
		                    				<th>상품 금액</th>
		                    				<th>배송비</th>
		                    				<th>주문 상태</th>
		                    				<th>확인 / 취소</th>
		                    			</tr>
		                    		</thead>
		                    		<tbody>
		                    			<tr>
		                    				<td class="product_info">
		                    					<div>
		                    						<div class="img_wrap">
		                    							<img src="${path}/images/mypage/img_product_01.png" alt="product image" />
		                    						</div>
		                    						<ul class="detail">
		                    							<li>구매 일자 : 2023-11-14</li>
		                    							<li>구매 번호 : 202311140000001</li>
		                    							<li class="product_name">[스타벅스] SS 크리스마스 골드빔 아티스틱 콜드컵 473m [스타벅스] SS 크리스마스 골드빔 아티스틱 콜드컵 473m [스타벅스] SS 크리스마스 골드빔 아티스틱 콜드컵 473m</li>
		                    						</ul>
		                    					</div>
		                    				</td>
		                    				<td>32,300원</td>
		                    				<td>무료</td>
		                    				<td class="order_status">
												배송중
												<div>
													<button class="btn_orange_underline">배송조회</button>
												</div>
											</td>
		                    				<td class="purchase_decision">
		                    					<button class="btn_blue">반품 신청</button>	
											</td>
		                    			</tr>
		                    			<tr>
		                    				<td class="product_info">
		                    					<div>
		                    						<div class="img_wrap">
		                    							<img src="${path}/images/mypage/img_product_02.png" alt="product image" />
		                    						</div>
		                    						<ul class="detail">
		                    							<li>구매 일자 : 2023-11-16</li>
		                    							<li>구매 번호 : 202311160000001</li>
		                    							<li class="product_name">아이앤어스 3챔버 고농축 캡슐세제 실속형 50개입</li>
		                    						</ul>
		                    					</div>
		                    				</td>
		                    				<td>32,300원</td>
		                    				<td>무료</td>
		                    				<td class="order_status">결제완료</td>
		                    				<td class="purchase_decision">
		                    					<button class="btn_blue">주문 취소</button>	
											</td>
		                    			</tr>
		                    		</tbody>
		                    	</table>
		                    </div>
	                    	<%-- //tbl_wrap --%>
						</div>
	                	<%-- //wallet_wrap --%>
	                </div>
	                <!-- //contents -->
	                <div class="con_tit">진행 중인 공구</div>
	                <!-- contents -->
	                <div class="contents">
	                	<%-- wallet_wrap --%>
						<div class="wallet_wrap">
	                		<%-- tbl_top_wrap --%>
		                    <div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>2</span>건
		                    	</div>
		                    	<div class="btn_wrap">
		                    		<button class="btn_more">더보기 &gt;</button>
		                    	</div>
	                    	</div>
	                		<%-- //tbl_top_wrap --%>
	                    	<%-- tbl_wrap --%>
		                    <div class="tbl_wrap">
		                    	<table class="tbl_wallet_wrap">
								  <colgroup>  	
								    <col width="52%" />
								    <col span="4" width="12%" />
								  </colgroup>
		                    		<thead>
		                    			<tr>
		                    				<th>상품 정보</th>
		                    				<th>상품 금액</th>
		                    				<th>배송비</th>
		                    				<th>주문 상태</th>
		                    				<th>확인 / 취소</th>
		                    			</tr>
		                    		</thead>
		                    		<tbody>
		                    			<tr>
		                    				<td class="product_info">
		                    					<div>
		                    						<div class="img_wrap">
		                    							<img src="${path}/images/mypage/img_product_03.png" alt="product image" />
		                    						</div>
		                    						<ul class="detail">
		                    							<li>구매 일자 : 2023-11-15</li>
		                    							<li>구매 번호 : 202311150000001</li>
		                    							<li class="product_name">노브랜드 국산콩두부300g*2입</li>
		                    						</ul>
		                    					</div>
		                    				</td>
		                    				<td>
		                    					1,640원<br>
		                    					&#40;3,280원 &#47; 2&#41;		                    					
		                    				</td>
		                    				<td>무료</td>
		                    				<td class="order_status">공구 참여중</td>
		                    				<td class="purchase_decision">
		                    					<button class="btn_blue">공구 취소</button>	
											</td>
		                    			</tr>
		                    			<tr>
		                    				<td class="product_info">
		                    					<div>
		                    						<div class="img_wrap">
		                    							<img src="${path}/images/mypage/img_product_03.png" alt="product image" />
		                    						</div>
		                    						<ul class="detail">
		                    							<li>구매 일자 : 2023-11-15</li>
		                    							<li>구매 번호 : 202311150000001</li>
		                    							<li class="product_name">노브랜드 국산콩두부300g*2입</li>
		                    						</ul>
		                    					</div>
		                    				</td>
		                    				<td>
		                    					1,640원<br>
		                    					&#40;3,280원 &#47; 2&#41;		                    					
		                    				</td>
		                    				<td>무료</td>
		                    				<td class="order_status">공구 진행중</td>
		                    				<td class="purchase_decision">
		                    					<button class="btn_blue">공구 취소</button>	
											</td>
		                    			</tr>
		                    		</tbody>
		                    	</table>
		                    </div>
	                    	<%-- //tbl_wrap --%>
						</div>
	                	<%-- //wallet_wrap --%>
	                </div>
	                <!-- //contents -->
	                <div class="con_tit">진행 중인 에코케어</div>
	                <!-- contents -->
	                <div class="contents">
	                	<%-- wallet_wrap --%>
						<div class="wallet_wrap">
	                		<%-- tbl_top_wrap --%>
		                    <div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>1</span>건
		                    	</div>
		                    	<div class="btn_wrap">
		                    		<button class="btn_more">더보기 &gt;</button>
		                    	</div>
	                    	</div>
	                		<%-- //tbl_top_wrap --%>
	                    	<%-- tbl_wrap --%>
		                    <div class="tbl_wrap">
		                    	<table class="tbl_wallet_wrap">
								  <colgroup>  	
								    <col width="55%" />
								    <col span="3" width="15%" />
								  </colgroup>
		                    		<thead>
		                    			<tr>
		                    				<th>분리수거 정보</th>
		                    				<th>배송비</th>
		                    				<th>회수 상태</th>
		                    				<th>확인 / 취소</th>
		                    			</tr>
		                    		</thead>
		                    		<tbody>
		                    			<tr>
		                    				<td class="product_info">
		                    					<div>
		                    						<div class="img_wrap">
		                    							<img src="${path}/images/mypage/img_ecocare_01.png" alt="ecocare image" />
		                    						</div>
		                    						<ul class="detail">
		                    							<li>신청 일자 : 2023-11-16</li>
		                    							<li>일반쓰레기 수거 요청건</li>
		                    						</ul>
		                    					</div>
		                    				</td>
		                    				<td>무료</td>
		                    				<td class="order_status">신청 완료</td>
		                    				<td class="purchase_decision">
		                    					<button class="btn_blue">회수 취소</button>	
											</td>
		                    			</tr>
		                    		</tbody>
		                    	</table>
		                    </div>
	                    	<%-- //tbl_wrap --%>
						</div>
	                	<%-- //wallet_wrap --%>
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
	<%@include file="../common/footer.jsp" %>
</body>
</html>