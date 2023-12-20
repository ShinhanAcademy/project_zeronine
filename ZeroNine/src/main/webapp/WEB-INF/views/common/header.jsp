<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="zn_header">
	<div class="top">
		<div class="top_inner zn_center">
			<%-- member --%>
			<div class="member">
				<ul>
					<li><a href="${path}/auth/login.do">로그인</a></li>
					<li><a href="${path}/auth/joinMembership.do">회원가입</a></li>
				</ul>
			</div>
			<%-- //member --%>
			<%-- logo --%>
			<div class="logo">
				<h1>
					<a href="${path}/main/main.do"></a>
				</h1>
			</div>
			<%-- //logo --%>
		</div>
	</div>
	<div class="bot">
		<div class="bot_inner zn_center">
			<%-- menu --%>
			<ul class="menu gnb_1depth">
				<li>
					<a href="${path}/product/productList.do">상품목록</a>
					<ul class="gnb_2depth">
						<li>
							<a href="${path}/product/productList.do">채소</a>
						</li>
						<li>
							<a href="${path}/product/productList.do">생필품</a>
						</li>
						<li>
							<a href="${path}/product/productList.do">음식</a>
						</li>
						<li>
							<a href="${path}/product/productList.do">전체</a>
						</li>
					</ul>
				</li>
				<li><a href="${path}/board/">게시판</a></li>
				<li><a href="${path}/myPage/ecoCare.do">마이 에코케어</a></li>
				<li><a href="${path}/subscription/subscriptionBuy.do">구독권</a></li>
			</ul>
			<%-- //menu --%>
			<%-- user_fav --%>
			<div class="user_fav">
				<ul>
					<!-- 로그인 후 보이기 -->
					<li class="icon_btn">
						<button type="button" class="wish"
							onclick="location.href='${path}/myPage/likeProduct.do';">찜하기</button>
					</li>
					<li class="icon_btn">
						<button type="button" class="my"
							onclick="location.href='${path}/myPage/orderHistory.do';">마이페이지</button>
					</li>
					<li class="icon_btn">
						<button type="button" class="cart"
							onclick="location.href='${path}/myPage/myCart.do';">카트</button>
					</li>
				</ul>
			</div>
			<%-- //user_fav --%>
		</div>
	</div>
</header>