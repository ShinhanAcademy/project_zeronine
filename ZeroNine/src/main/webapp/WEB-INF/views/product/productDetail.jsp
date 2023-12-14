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
			<span id="home"
				onclick="location.href='${Path }/product/productList.do'">홈</span> >
			<span id="home">밀키트</span> > <span id="home" class="detail.tang">탕국찌개</span>
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
				<span class="detail_pname">${plist.pName}</span>
				<div class="detail_price">
					<span>${plist.price}원</span>
				</div>

				<div class="jul"></div>
				<div class="detail_right_middle">
					<div class="detail_text">
						<span class="subtitle">원산지</span> <span class="sub_explain">상품정보
							원산지표시 참조</span>
					</div>
					<div class="detail_text">
						<span class="subtitle_middle">적립정보</span> <span
							class="sub_explain">${plist.price*0.001}포인트</span>
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
						<div class="sub_amountpm">
							<button class="minus" onclick="decrement()">-</button>
							<span class="sub_text" id="quantity">1</span>
							<button class="plus" onclick="increment()">+</button>
						</div>
					</div>
				</div>
				<div class="jul"></div>
				<div class="total_part">
					<div class="total_part_top">
						<span class="total_price">총 금액</span> <span
							class="total_price_text" id="total_price"><fmt:formatNumber
								value="${plist.price }" maxFractionDigits="3"></fmt:formatNumber>
							원</span>
					</div>
					<div class="total_button">
						<button class="detail_cart">장바구니</button>
						<button class="detail_order">바로구매</button>
					</div>
				</div>
			</div>


		</div>
		<div class="jul0"></div>

		<div class="detail_middle2">
			<span class="forzero_text">제로들을 위한 추천</span>
			<div>
				<div class="forzero">
					<div class="forzero_list">
					<c:forEach items="${deliverylist4}" var="dtop" varStatus="status">
						<div class="forzero_sub">
							<div class="forzero_image">
							
								<img class="menupng" onclick="location.href='${Path }/product/productDetail.do?productId=${dtop.productId}'"
									src="https://zeronine.s3.ap-northeast-2.amazonaws.com/test.jpg">
							</div>
							<span class="menufont">${dtop.brand }</span> <span class="menufont_name">${dtop.pName}</span>
							<span class="menufont_price"> <fmt:formatNumber
									value="${dtop.price }" maxFractionDigits="3"></fmt:formatNumber> 원
							</span>
						</div>
						</c:forEach>
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
				<div id="sidebox">
					<span class="subtitle1">${plist.pName}</span>
					<div class="sidebox_right">
						<div class="sub_amountpm">
							<button class="minus" onclick="decrement()">-</button>
							<span class="sub_text" id="quantity-right">1</span>
							<button class="plus" onclick="increment()">+</button>
						</div>
						<span class="subtitle" id="total_price-right"><fmt:formatNumber
								value="${plist.price}" maxFractionDigits="3"></fmt:formatNumber>
							원</span>
					</div>
				</div>

				<div class="sidebottom"></div>
			</div>

		</div>


	</div>





	<%@include file="../common/footer.jsp"%>
	<script>
		var path = "${path}";
		var sidebox = $("#sidebox");

		var currentPosition = parseInt($("#sidebox").css("top"));

		$(window).scroll(function() {
			var position = $(window).scrollTop();
			if (position > 1600) {
				$("#sidebox").stop().animate({
					"top" : position + currentPosition - 1200 + "px"
				}, 500);
			} else {
				$("#sidebox").css("top", currentPosition + "px");
			}

		});

		var quantityValue = 1;
		var price = ${plist.price}; // Assuming product.price is a numeric value

		function increment() {
			if (quantityValue < 100) {
				quantityValue++;
				updateQuantityAndTotal();
			}
		}

		function decrement() {
			if (quantityValue > 1) {
				quantityValue--;
				updateQuantityAndTotal();
			}
		}

		function updateQuantityAndTotal() {
			var total = Math.max(quantityValue * price, 1);
			document.getElementById('quantity').innerText = quantityValue;
			document.getElementById('quantity-right').innerText = quantityValue;
			document.getElementById('total_price').innerText = total
					.toLocaleString()
					+ ' 원'; // Assuming you want to display price with two decimal places
			document.getElementById('total_price').innerText = total
					.toLocaleString()
					+ ' 원'; // Assuming you want to display price with two decimal places
		}
	</script>

</body>
</html>
