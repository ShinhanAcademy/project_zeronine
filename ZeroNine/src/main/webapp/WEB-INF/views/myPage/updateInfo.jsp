<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">



<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
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
	                    <li><a href="${path}/myPage/chatList.do">채팅 목록</a></li>
	                </ul>
	                <div class="sub_tit">MY INFOMATION</div>
	                <ul>
	                    <li class="on"><a href="${path}/myPage/validatePassword.do">개인 정보</a></li>
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
								<img src="${path}/images/mypage/img_mypage_profile.png"
									alt="profile image" />
							</div>
							홍길동 님
						</div>
						<ul class="subscription_list">
							<li>
								<div class="img_wrap">
									<img src="${path}/images/mypage/img_bag_small.png"
										alt="subscription image">
								</div> 슝슝 무한 배송 구독중
							</li>
							<li>
								<div class="img_wrap">
									<img src="${path}/images/mypage/img_trash_small.png"
										alt="subscription image">
								</div> 쓰레기 수거 구독중
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
									<td>4,280
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
					<span class="info_font">개인정보</span>
					<hr>
					<br>
					<br>
					<br>
					<div class="update_wrap">
						<form id="updateForm">
							<div class="update_container zn_center">
								<div class="form_group">
									<label>이름</label> <input disabled type="text" id="name" name="name"
										placeholder="방용수" required>
								</div>
								<div class="form_group">
									<label>이메일</label> <input disabled type="email" id="email"
										name="email" placeholder="yongsu@gmail.com" required>
								</div>
								<div class="form_group">
									<label>새 비밀번호</label> <input type="password" name="password"
										id="password" placeholder="비밀번호를 입력하세요." required>
								</div>
								<div class="form_group">
									<label>새비밀번호 확인</label> <input type="password"
										name="password_check" id="password_check"
										placeholder="비밀번호를 다시 입력하세요." required>
								</div>

								<div class="form_group">
									<label>휴대폰 번호</label> <input type="tel" id="phone" name="phone"
										pattern="[0-9]{11}" placeholder="(-)를 제외하고 휴대폰 번호를 입력하세요."
										required>
									<button type="button" class="double_check_btn" id="phone_check">중복확인</button>
									<input type="hidden" id="hidden_phone_check" value='0'>
								</div>
								<div class="form_group">
									<label>주소</label> <input type="text" id="address"
										name="address" class="update_address">
									<button type="button" class="address_search_btn">
										<img src="${path}/images/auth/search.png">우편 번호 검색
									</button>
								</div>
								<div class="form_group">
									<input class="update_address_detail" type="text"
										id="address_detail" name="address_detail"
										placeholder="상세 주소를 입력하세요." required>
								</div>
								<div class="form_group">
									<label>생년월일</label> <input type="date" id="date" name="date"
										required>
								</div>
							</div>
							<button type="button" id="update_btn">수정하기</button>
						</form>

					</div>
					<!-- contents -->

					<!--  -->
				</div>
				<!-- //contents -->
			</div>
			<!-- //contents_wrap -->
		</div>
		<!-- //mypage_detail_wrap -->
	</div>
	<!-- //mypage_container -->

	<!-- //zero_container -->
	<%@include file="../common/footer.jsp"%>




</body>
</html>

























