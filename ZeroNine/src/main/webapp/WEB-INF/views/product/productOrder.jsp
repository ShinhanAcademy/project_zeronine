<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/productOrder.css" />
	<script>
		var path = "${path}";
		var itempriceValue = document.getElementById("#itemprice").innerText;
	    document.getElementById("#itemprice2").innerText = itempriceValue;
	</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="order_body">
		<div class="zero_container order_bodypart">
			<div class="order_bodypart_text">
				<span class="top_text">주문서</span>
			</div>

			<div class="orderinfo">
			<c:forEach var="item" items="${orderonecart}">
				<span class="orderinfo_text">주문내역</span>
				<div class="orderinfo_box">
					<div class="orderinfo_boxtext">
						<div class="infotext_space">
							<div class="infotext_space_left">
								<span class="box_text">${item.pName}</span>
							</div>
							<div class="infotext_space_right">
								<span id="itemPrice" class="box_text"><fmt:formatNumber
								value="${item.price*item.productCount}" maxFractionDigits="3"></fmt:formatNumber>원</span>
							</div>
						</div>
						<div class="jul"></div>
						<!--  orderinfo_boxtext -->
					</div>
					<!-- orderinfo_box -->
				</div>
				<!-- orderinfo -->
				</c:forEach>
			</div>


			<div class="twinbox">
				<div class="tw_box">
					<div class="tw_box_top">
						<p class="tw_boxtext">주문자 정보</p>
						
					</div>
					<div class="tw_wb">
						<div class="orderpinfo">
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">주문자명</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input" value="${custlist.customerName }" readonly>
								</div>

							</div>
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">연락처</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input" value="${custlist.phoneNumber }" readonly>
								</div>

							</div>
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">이메일</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input" value="${custlist.email }" readonly>
								</div>

							</div>
						</div>
					</div>




				</div>
				<div class="tw_box">
					<div class="tw_box_top">
						<p class="tw_boxtext">배송지 정보</p>
						<button type="button" class="change_address" 
						onclick="$('.address_pop').fadeIn(200)">배송지 변경
						<img class="" src="${path}/images/sangpumpage/deliveryupdateicon.png"></button>
					</div>
					<div class="tw_wb">
						<div class="deliverypinfo">
							<div class="delpinfo">
								<dl>
									<dt id="order_name">${custlist.customerName}</dt>
									<dd id="order_address">${custlist.address }</dd>
								</dl>
								<div class="delpPhone">
									<span id="order_phone">${custlist.phoneNumber }</span>
								</div>
							</div>

						</div>

						<!-- tw_wb -->
					</div>
					<!-- tw_box -->
				</div>
				<!-- twinbox -->
			</div>
			<div class="p_box">
				<div class="p_box_top">
					<p class="p_boxtext">포인트</p>
				</div>
				<div class="p_wb">
					<div class="p_b">
						<div class="p_info">
							<dl>
								<dt>포인트 적용</dt>
								<dd>
									<input type="text" value="0" name="p_poing" id="p_point"
										class="p_input">
									<p class="useable_point">
										사용가능한 적립금 <strong>${custlist.point }</strong>
									</p>
									<button type="button" class="useptbtn" name="useptbtn"
										id="useptbtn">모두사용</button>

								</dd>
							</dl>

						</div>
					</div>

				</div>
			</div>

			<div class="buy_box">
				<div class="buy_box_top">
					<p class="buy_boxtext">주문자 정보</p>
				</div>
				<div class="buy_bx">
					<div class="buy_btn">
						<img class="img1" src="${path}/images/sangpumpage/Group 80.png">
						<img class="img2"
							src="${path}/images/sangpumpage/fillcheckbox.png">
					</div>
					<div class="buy_btn">
						<img class="img1" src="${path}/images/sangpumpage/Group 81.png">
						<img class="img2" src="${path}/images/sangpumpage/checkbox.png">
					</div>
					<div class="buy_btn">
						<img class="img1" src="${path}/images/sangpumpage/Group 82.png">
						<img class="img2" src="${path}/images/sangpumpage/checkbox.png">
					</div>
				</div>
			</div>


			<div class="last_area">
				<div class="last_area1">
					<div class="buy_box_top">
						<p class="buy_boxtext">개인정보 수집/제공</p>
					</div>
					<div class="jul"></div>
					<div class="accessforbuy">
						<img class="img2" src="${path}/images/sangpumpage/checkbox.png">
						<p class="accessforbuy_text">(필수) 구매 조건 및 결제 진행 동의</p>
					</div>
					<div class="jul"></div>
					<p class="accessforbuy_text">주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며,
						구매진행에 동의하시겠습니까? (전자 상거래법 제 8조 제 2항)</p>
					<div class="jul"></div>
				</div>
				<div class="last_area2">
					<div class="buy_box_top">
						<p class="buy_boxtext">결제 금액</p>
					</div>
					<div class="bb_wb">
						<div class="buy_box_middle">
							<div class="purchaseinfo">
								<span>주문금액</span><span>
							11,000원</span>
							</div>
							<div class="purchaseinfo">
								<span>배송비</span><span id="itemprice2"></span>
							</div>
							<div class="purchaseinfo">
								<span>포인트사용</span><strong><span>11,000원</span></strong>
							</div>
							<div class="jul"></div>
							<div class="total">
								<span>총금액</span>
								<p>14,000원</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="gopurchasebtn">
			<button id="gobtn">결제하기</button>
			</div>


			<!-- order-bodypart -->
		</div>
	</div>

	<%@include file="../common/footer.jsp"%>

</body>
</html>
