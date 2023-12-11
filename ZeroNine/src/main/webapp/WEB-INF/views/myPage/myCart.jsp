<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/my_cart.css">
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
	                    <li class="on"><a href="${path}/myPage/myCart.do">장바구니</a></li>
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
	            	<div class="free_delivery_amount">
	            		<div class="target_amount">
	            			<div class="now_amount"></div>
	            		</div>
	            		<div class="text">32,000원 추가하면 무료배송!!</div>
	            	</div>
	                <div class="con_tit">장바구니</div>
	                <!-- contents -->
	                <div class="contents">
	                	<!-- my_cart_wrap  -->
	                	<div class="my_cart_wrap">
	                		<!-- tbl_wrap -->
		                	<div class="tbl_wrap">
		                    	<table class="tbl_orderlist_wrap">
								  <colgroup>
								    <col width="6%" />
								    <col width="54%" />
								    <col span="3" />
								  </colgroup>
		                    		<thead>
		                    			<tr>
		                    				<th class="check_all">	                    					
	    										<input type="checkbox" />
		                    				</th>
		                    				<th>상품 정보</th>
		                    				<th>수량</th>
		                    				<th>구매가</th>
		                    				<th>선택</th>
		                    			</tr>
		                    		</thead>
		                    		<tbody>
		                    			<tr>
		                    				<td class="check_item">
												<input type="checkbox" />	                    					
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
		                    				<td class="product_count">
		                    					<select id="select_count">
		                    						<option value="1">1</option>
		                    						<option value="2">2</option>
		                    						<option value="3">3</option>
		                    						<option value="4">4</option>
		                    						<option value="5">5</option>
		                    						<option value="6">6</option>
		                    						<option value="7">7</option>
		                    						<option value="8">8</option>
		                    						<option value="9">9</option>
		                    						<option value="10">10</option>
		                    					</select>
		                    				</td>
		                    				<td class="price">66,000원</td>
		                    				<td class="purchase_selection">
	                    						<button class="btn_buy btn_blue">바로구매</button>
	                    						<button class="btn_addlike btn_default">쇼킹찜</button>
	                    						<button class="btn_del btn_default">삭제</button>
											</td>
		                    			</tr>
		                    			<tr>
		                    				<td class="check_item">
												<input type="checkbox" />	                    					
		                    				</td>
		                    				<td class="product_info">
												<div class="img_wrap">
													<img src="${path}/images/mypage/img_product_05.png" alt="product image" />
												</div>
												<div class="detail">
													<div class="brand_name">유시몰</div>
													<div class="product_name">[11/27 하루특가]유시몰 화이트닝 미백치약 106g+20g (가글 9ml 추가</div>
												</div>
											</td>
		                    				<td class="product_count">
		                    					<select id="select_count">
		                    						<option value="1">1</option>
		                    						<option value="2">2</option>
		                    						<option value="3">3</option>
		                    						<option value="4">4</option>
		                    						<option value="5">5</option>
		                    						<option value="6">6</option>
		                    						<option value="7">7</option>
		                    						<option value="8">8</option>
		                    						<option value="9">9</option>
		                    						<option value="10">10</option>
		                    					</select>
		                    				</td>
		                    				<td class="price">66,000원</td>
		                    				<td class="purchase_selection">
	                    						<button class="btn_buy btn_blue">바로구매</button>
	                    						<button class="btn_addlike btn_default">쇼킹찜</button>
	                    						<button class="btn_del btn_default">삭제</button>
											</td>
		                    			</tr>
		                    			<tr>
		                    				<td class="check_item">
												<input type="checkbox" />	                    					
		                    				</td>
		                    				<td class="product_info">
												<div class="img_wrap">
													<img src="${path}/images/mypage/img_product_06.png" alt="product image" />
												</div>
												<div class="detail">
													<div class="brand_name">라보에이치</div>
													<div class="product_name">라보에이치 두피강화샴푸 탈모증상완화 333ml기획 (+112ml 증정)</div>
												</div>
											</td>
		                    				<td class="product_count">
		                    					<select id="select_count">
		                    						<option value="1">1</option>
		                    						<option value="2">2</option>
		                    						<option value="3">3</option>
		                    						<option value="4">4</option>
		                    						<option value="5">5</option>
		                    						<option value="6">6</option>
		                    						<option value="7">7</option>
		                    						<option value="8">8</option>
		                    						<option value="9">9</option>
		                    						<option value="10">10</option>
		                    					</select>
		                    				</td>
		                    				<td class="price">66,000원</td>
		                    				<td class="purchase_selection">
	                    						<button class="btn_buy btn_blue">바로구매</button>
	                    						<button class="btn_addlike btn_default">쇼킹찜</button>
	                    						<button class="btn_del btn_default">삭제</button>
											</td>
		                    			</tr>
		                    			<tr>
		                    				<td class="check_item">
												<input type="checkbox" />	                    					
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
		                    				<td class="product_count">
		                    					<select id="select_count">
		                    						<option value="1">1</option>
		                    						<option value="2">2</option>
		                    						<option value="3">3</option>
		                    						<option value="4">4</option>
		                    						<option value="5">5</option>
		                    						<option value="6">6</option>
		                    						<option value="7">7</option>
		                    						<option value="8">8</option>
		                    						<option value="9">9</option>
		                    						<option value="10">10</option>
		                    					</select>
		                    				</td>
		                    				<td class="price">66,000원</td>
		                    				<td class="purchase_selection">
	                    						<button class="btn_buy btn_blue">바로구매</button>
	                    						<button class="btn_addlike btn_default">쇼킹찜</button>
	                    						<button class="btn_del btn_default">삭제</button>
											</td>
		                    			</tr>
		                    		</tbody>
		                    	</table>
		                    </div>
	                		<!-- tbl_wrap -->
	                		<!-- tbl_bottom_wrap -->
	                		<div class="tbl_bottom_wrap">
		                    	<div class="btn_wrap">
		                    		<button class="btn_del">선택상품 삭제</button>
		                    	</div>
	                    	</div>
	                    	<!-- //tbl_bottom_wrap -->
	                    	<div class="buy_price_wrap">
	                    		<div class="price_top">
	                    			<div class="price_info total_selling_price">
	                    				<div>총 판매가</div>
	                    				<div>119,710원</div>
	                    			</div>
	                    			<div class="price_info delivery_fee">
	                    				<div>배송비</div>
	                    				<div>0원</div>
	                    			</div>
	                    		</div>
	                    		<div class="price_bottom">
	                    			<div class="noti">배송비는 구독권 및 공동구매여부에 따라 변경될 수 있습니다.</div>
	                    			<div class="expected_payment">
	                    				총 결제예상금액
	                    				<span>119,710원</span>
	                    			</div>
	                    		</div>
	                    		<div class="btn_wrap">
	                    			<button class="partial_order btn_blue">선택 주문</button>
	                    			<button class="all_order">전체 주문</button>
	                    		</div>
	                    	</div>
	                	</div>
	                	<!-- //my_cart_wrap  -->
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