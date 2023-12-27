<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/my_wallet.css">
<link rel="stylesheet" href="/css/myPage/delivery_tracking.css">
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<script defer src="${path}/js/myPage/myWallet.js"></script>
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<!-- zero_container -->
	<div class="zero_container zn_center">
	    <!-- mypage_container -->
	    <div class="mypage_container">
	        <!-- zero_sbn -->
			<%@include file="common/myPageSnb.jsp" %>
	        <!-- //zero_sbn -->
	        <!-- mypage_detail_wrap -->
	        <div class="mypage_detail_wrap">
	            <!-- my_info_wrap -->
	            <div id="personalInfo" class="my_info_wrap">
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
													<button class="btn_orange_underline btn_delivery_check">배송조회</button>
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
	<%@include file="deliveryTracking.jsp" %>
	<%@include file="../common/footer.jsp" %>
</body>
</html>