<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%-- functions lib --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script defer src="${path}/js/myPage/subPage/myCartDetail.js"></script>
<div class="free_delivery_amount">
	<div class="target_amount">
		<div class="now_amount"></div>
	</div>
	<div class="text pay_delivery"><span>32,000</span>원 추가하면 무료배송!!</div>
	<div class="text free_delivery"><span class="color_red">❤</span> 무.료.배.송 <span class="color_red">❤</span></div>
</div>
<div class="con_tit">장바구니</div>
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
					<col span="3" />
				</colgroup>
				<thead>
					<tr>
						<th class="has_check check_all">
							<c:choose>
								<c:when test="${myCart.size() != 0}"> 
									<input type="checkbox" />
								</c:when>
								<c:otherwise>
									<input type="checkbox" disabled="disabled" />
								</c:otherwise>
							</c:choose>
						</th>
						<th>상품 정보</th>
						<th>수량</th>
						<th>구매가</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody id="cartList">
					<c:choose>
						<c:when test="${myCart.size() != 0}"> 
							<form id="cartListForm" name="cartListForm">
							<c:forEach items="${myCart}" var="cartItem">
								<tr id="${cartItem.productId}">
									<td class="has_check check_item">
										<input type="checkbox" />
									</td>
									<td class="product_info">
										<div class="img_wrap">
											<a href="${path}/product/productDetail.do?productId=${cartItem.productId}">
												<c:choose>
													<c:when test="${not empty cartItem.imagePath}"> 
														<img src="${cartItem.imagePath}" alt="product image" />
													</c:when>
													<c:otherwise>
														<img src="${path}/images/common/img_preparing.png" alt="product image" />
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<div class="detail">
											<div class="brand_name">${cartItem.brand}</div>
											<div class="product_name">
												<a href="${Path}/product/productDetail.do?productId=${cartItem.productId}">
													${cartItem.pName}
												</a>
											</div>
										</div>
									</td>
									<td class="product_count">
										<select class="select_count" name="select_count">
											<c:forEach var="countQuantity" begin="1" end="100">
												<option value="${countQuantity}" ${countQuantity == cartItem.productCount ? "selected" : ""}>${countQuantity}</option>
											</c:forEach>
										</select>
									</td>
									<td class="price" data-price="${cartItem.price}">
										<fmt:formatNumber pattern="#,##0" value="${cartItem.price * cartItem.productCount}" /> 원
									</td>
									<td class="purchase_selection">
										<button class="btn_buy btn_blue">바로구매</button>
										<c:choose>
											<c:when test="${cartItem.likedProductId ne null}">
												<button class="btn_addlike btn_default on" data-prodId="${cartItem.productId}">쇼킹찜</button>
											</c:when>
											<c:otherwise>
												<button class="btn_addlike btn_default" data-prodId="${cartItem.productId}">쇼킹찜</button>
											</c:otherwise>
										</c:choose>
										<button class="btn_del btn_default">삭제</button>
									</td>
								</tr>
							</c:forEach>
							</form>				
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">내역이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!-- tbl_wrap -->
		<!-- tbl_bottom_wrap -->
		<div class="tbl_bottom_wrap">
			<div class="btn_wrap">
				<button class="btn_del" ${myCart.size() == 0 ? "disabled": ""}>선택상품 삭제</button>
			</div>
		</div>
		<!-- //tbl_bottom_wrap -->
		<div class="buy_price_wrap">
			<div class="price_top">
				<div class="price_info total_selling_price">
					<div>총 판매가</div>
					<div class="total_price"></div>
				</div>
				<div class="price_info delivery_fee">
					<div>배송비</div>
					<div class="fee"></div>
				</div>
			</div>
			<div class="price_bottom">
				<div class="noti">배송비는 구독권 및 공동구매여부에 따라 변경될 수 있습니다.</div>
				<div class="expected_payment">
					총 결제예상금액 <span>119,710원</span>
				</div>
			</div>
			<div class="btn_wrap">
			<button class="partial_order btn_blue" ${myCart.size() == 0 ? "disabled": ""}>선택 주문</button>
				<button class="all_order" ${myCart.size() == 0 ? "disabled": ""}>전체 주문</button>
				<input type="hidden" name="checkedVAl" value="val">
			</div>
		</div>
	</div>
	<!-- //my_cart_wrap  -->
</div>
<!-- //contents -->