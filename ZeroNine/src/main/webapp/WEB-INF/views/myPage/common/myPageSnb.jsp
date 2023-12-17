<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%-- jstl lib --%>
<!-- zero_sbn -->
<div class="zero_sbn">
	<div class="title">마이 제로나인</div>
	<div class="snb_wrap">
		<div class="sub_tit">MY SHOPPING</div>
		<ul>
			<li><a href="${path}/myPage/myWallet.do">나의 지갑</a></li>
			<li><a href="${path}/myPage/orderHistory.do">주문 내역</a></li>
			<li><a href="${path}/myPage/orderCancelHistory.do">취소 / 반품
					내역</a></li>
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
		<form id="frm" method="get" action="">
	     	<input type="hidden" name="pageName" id="pageName">
	    </form>
	</div>
</div>
<!-- //zero_sbn -->