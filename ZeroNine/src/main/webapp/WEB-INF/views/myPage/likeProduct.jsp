<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/like_product.css">
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
	                    <li class="on"><a href="${path}/myPage/likeProduct.do">찜한 상품</a></li>
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
	            <div id="like_contents_wrap" class="contents_wrap">
	                <div class="con_tit has_line">찜한 상품</div>
	                <!-- contents -->
	                <div class="contents">
	                	<!-- search_wrap -->
	                	<div class="search_wrap">
		                	<div class="search_word">
		                		<input type="text" placeholder="상품명, 브랜드명을 입력하세요.">
		                		<button class="btn_search"></button>
		                	</div>
		                </div>
	                	<!-- //search_wrap -->
	                	<!-- like_product_wrap -->
	                	<div class="like_product_wrap">
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_08.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_01.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_01.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_02.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_02.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_02.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_08.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_08.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                		<div class="like_item">
	                			<div class="item_inner">
		                			<div class="img_wrap">
		                				<a href="javascript:void(0)">
			                				<img src="${path}/images/mypage/img_product_08.png" alt="product image" />
		                				</a>
		                				<button class="btn_like">like</button>
		                			</div>
		                			<div>
		                				<div class="product_brand">엑스투</div>
		                				<div class="product_name">
			                				<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon Grape</a>
		                				</div>
		                				<div class="price">200,000원</div>
		                			</div>
	                			</div>
	                		</div>
	                	</div>
	                	<!-- //like_product_wrap -->
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