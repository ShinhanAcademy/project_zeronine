<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>

<title>FastBoard</title>
<link rel="stylesheet" href="${path}/css/common/participateBoard.css" />
</head>
<body>
	<div class="banner zn_center">
		<div style="width: 1440px">
			<img src="${path}/images/board/banner1.png" style="width: 100%">
		</div>
	</div>

	<div class="zn_center" style="width: 1440px">
		<div id="here">
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
								<tr>
									<td class="check_item">
									<input id="check_box" type="checkbox" name="checkboxGroup" value="${info.productId}" checked disabled/>
									</td>
									<td class="product_info">
										<div class="img_wrap">

											<c:choose>
												<c:when test="${not empty cartItem.imagePath}">
													<img src="${info.imagePath}" alt="product image" />
												</c:when>
												<c:otherwise>
													<img src="${path}/images/common/img_preparing.png"
														alt="product image" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="detail">
											<div class="brand_name">${info.brand}</div>
											<div class="product_name">${info.pName}</div>
										</div>
									</td>
									<td class="product_count"><select id="select_count"
										name="select_count" onchange="countQuantityF()">
											<c:forEach var="countQuantity" begin="1"
												end="${remainCount}">
												<option value="${countQuantity}">${countQuantity}</option>
											</c:forEach>
									</select></td>
									<td class="price"><input type="hidden" id="onePrice"
										value="${Math.round(info.price/info.pCount)}">
										<fmt:formatNumber pattern="#,##0"
											value="${info.price/info.pCount}" />원(개당)
										<div class="originalPrice">
											(판매가:
											<fmt:formatNumber pattern="#,##0" value="${info.price}" />
											원)
										</div></td>
								</tr>
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
								총 결제예상금액 <span class="realTotalPrice">0&nbsp;원</span>
							</div>
						</div>
						<div class="btn_wrap">
						<form action="${path}/common/orderFast.do" method="POST">
								<input type="hidden" name="productId" id="productId"> 
								<input type="hidden" name="count" id="count">
								<button class="participate_btn">공구에 참여하기</button>
						</form>
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
		var isFreeDelivery = "${IsFreeDelivery}";
	</script>
	<script src="${path}/js/common/participateBoard.js" type="text/javascript"></script>
</body>
</html>