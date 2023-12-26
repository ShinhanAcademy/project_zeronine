<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>

<title>FreeDeliveryBoard</title>
<link rel="stylesheet" href="${path}/css/common/participateBoard.css" />
<link rel="stylesheet" href="${path}/css/product/productOrder.css" />
</head>
<body>
<div id="here">
	<div class="banner zn_center">
		<div style="width: 1440px; padding:20px 0px">
				<img src="${path}/images/board/banner2.png" style="width: 100%">
		</div>
	</div>

	<div class="zn_center" style="width: 1440px">
		
			<div class="con_tit">공동 구매 물품</div>
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
								<col span="2" />
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>상품 정보</th>
									<th>수량</th>
									<th>구매가</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
							<c:when test="${cart.size() != 0}">
								<c:forEach items="${cart}" var="cartItem">
									<tr>
										<td class="check_item"><input id="check_box"
											type="checkbox" name="checkboxGroup" 
											onclick="handleCheckbox()" value="${cartItem.productId}" /></td>
										<td class="product_info">
											<div class="img_wrap">

												<c:choose>
													<c:when test="${not empty cartItem.imagePath}">
														<img src="${cartItem.imagePath}" alt="product image" />
													</c:when>
													<c:otherwise>
														<img src="${path}/images/common/img_preparing.png"
															alt="product image" />
													</c:otherwise>
												</c:choose>
											</div>
											<div class="detail">
												<div class="brand_name">${cartItem.brand}</div>
												<div class="product_name">${cartItem.pName}</div>
											</div>
										</td>
										<td class="product_count"><select id="select_count"
											name="select_count" onchange="countQuantityF(this)">
												<c:forEach var="countQuantity" begin="1"
													end="15">
													<option value="${countQuantity}">${countQuantity}</option>
												</c:forEach>
										</select></td>
										<td class="price">
										<input type="hidden" id="onePrice" value="${cartItem.price}">
											<div id="ob_price">
											<fmt:formatNumber pattern="#,##0" value="${cartItem.price}" />원
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr style="height: 50px;">
									<td colspan="4" >장바구니 내역이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
							</tbody>
						</table>
					</div>
					<div class="buy_price_wrap">
						<div class="price_top">
							<div class="price_info total_selling_price">
								<div>총 판매가</div>
								<div class="totalPrice">0&nbsp;원</div>
							</div>
							<div class="price_info delivery_fee">
								<div>배송비</div>
								<div id="itemprice_deli">0&nbsp;원</div>
							</div>
						</div>
						<div class="price_bottom">
							<div class="noti">배송비는 구독권 및 공동구매여부에 따라 변경될 수 있습니다.</div>
							<div class="expected_payment">
								총 결제예상금액 <span class="totalPrice">0&nbsp;원</span>
							</div>
						</div>
						<div class="btn_wrap">
								<button class="participate_btn">공구에 참여하기</button>
						</div>
					</div>
				</div>
				<!-- //my_cart_wrap  -->
			</div>
			<!-- //contents -->
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script>
		var path = "${path}";		
	</script>
	<script src="${path}/js/common/participateFreeBoard.js" type="text/javascript"></script>
</body>
</html>