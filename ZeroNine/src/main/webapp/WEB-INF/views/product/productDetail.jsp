<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/productdetail.css" />
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="zero_container detail_bodypart zn_center">
		<div class="detail_link">
			<span id="home">홈</span> > <span id="home">밀키트</span> > <span
				id="home" class="detail.tang">탕국찌개</span>
		</div>
		<div class="detail_middle">
			<div class="detail_img">
				<img src="${path}/images/sangpumpage/image 1.png">
			</div>
			<div class="detail_right">
				<div class="detail_heartcart">
					<img class="detail_heart" src="${path}/images/board/heart.png">
					<img src="${path}/images/sangpumpage/productcart.png">
				</div>
				<span class="detail_pname">옛날 사골곰탕</span>
				<div class="detail_price">
					<span>2,480원</span>
				</div>
				<div class="jul"></div>
				<div class="detail_right_middle">
					<div class="detail_text">
						<span class="subtitle">원산지</span> <span class="sub_explain">상품정보
							원산지표시 참조</span>
					</div>
					<div class="detail_text">
						<span class="subtitle_middle">적립정보</span> <span
							class="sub_explain">로그인 후 적립혜택 제공</span>
					</div>
					<div class="detail_text_bottom">
						<span class="subtitle_middle">배송정보</span> <span
							class="sub_explain">3,000원</span><br>

					</div>
					<div class="sub_delifree">
						<span class="sub_explain">동일 배송유형 상품 50,000이상 구매시 무료</span>
					</div>
					<div class="sub_amount">
						<span class="subtitle_middle">수량선택</span>
						<div class="sub_amoutpm">
							<button class="minus">-</button>
							<span class="sub_text">1</span>
							<button class="plus">+</button>
						</div>
					</div>
				</div>
				<div class="jul"></div>
				<div class="total_part">
					<span class="total_price">총 금액</span> <span
						class="total_price_text">2,480원</span>
				</div>
				<div class="total_button">
					<button class="detail_cart">장바구니</button>
					<button class="detail_order">바로구매</button>
				</div>

			</div>


		</div>
		<div class="jul0"></div>

		<div class="detail_middle2">
			<span class="forzero_text">제로들을 위한 추천</span>
			<div>
				<div class="forzero">
					<div class="forzero_list">
						<div class="forzero_sub">
							<div class="forzero_image">
								<img class="menupng"
									src="https://zeronine.s3.ap-northeast-2.amazonaws.com/test.jpg">
							</div>
							<span class="menufont">오뚜기</span> <span class="menufont_name">농심곰탕</span>
							<span class="menufont_price"> <fmt:formatNumber
									value="3500" maxFractionDigits="3"></fmt:formatNumber> 원
							</span>
						</div>
						<div class="forzero_sub">
							<div class="forzero_image">
								<img class="menupng"
									src="${path}/images/sangpumpage/image 1.png">
							</div>
							<span class="menufont">오뚜기</span> <span class="menufont_name">농심곰탕</span>
							<span class="menufont_price"> <fmt:formatNumber
									value="3500" maxFractionDigits="3"></fmt:formatNumber> 원
							</span>
						</div>
						<div class="forzero_sub">
							<div class="forzero_image">
								<img class="menupng"
									src="${path}/images/sangpumpage/image 1.png">
							</div>
							<span class="menufont">오뚜기</span> <span class="menufont_name">농심곰탕</span>
							<span class="menufont_price"> <fmt:formatNumber
									value="3500" maxFractionDigits="3"></fmt:formatNumber> 원
							</span>
						</div>
						<div class="forzero_sub">
							<div class="forzero_image">
								<img class="menupng"
									src="${path}/images/sangpumpage/image 1.png">
							</div>
							<span class="menufont">오뚜기</span> <span class="menufont_name">농심곰탕</span>
							<span class="menufont_price"> <fmt:formatNumber
									value="3500" maxFractionDigits="3"></fmt:formatNumber> 원
							</span>
						</div>
					</div>
					<div class="jul1"></div>
					<div class="jul100"></div>
				</div>
			</div>
		</div>
		<div class="detail_bottom">
			<div class="detail_bottom_left">
				<img src="${path}/images/sangpumpage/image 3.png"> <img
					class="detail_img2" src="${path}/images/sangpumpage/image 4.png">



			</div>

			<div class="detail_bottom_right">
				<div id="sidebox">내용 입력</div>


			</div>

		</div>


	</div>





	<%@include file="../common/footer.jsp"%>
	<script>
		var path = "${path}";
		var currentPosition = parseInt($("#sidebox").css("top"));
		$(window).scroll(function()
		{       var position = $(window).scrollTop();
		       $("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
		 });
	</script>
</body>
</html>
