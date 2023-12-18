<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%-- functions lib --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="free_delivery_amount">
	<div class="target_amount">
		<div class="now_amount"></div>
	</div>
	<div class="text">32,000원 추가하면 무료배송!!</div>
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
						<th class="check_all"><input type="checkbox" /></th>
						<th>상품 정보</th>
						<th>수량</th>
						<th>구매가</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
				
					<c:choose>
						<c:when test="${myCart.size() != 0}"> 
							<c:forEach items="${myCart}" var="cartItem">
								<tr>
									<td class="check_item"><input type="checkbox" /></td>
									<td class="product_info">
										<div class="img_wrap">
										
											<c:choose>
												<c:when test="${not empty cartItem.imagePath}"> 
													<img src="${cartItem.imagePath}" alt="product image" />
												</c:when>
												<c:otherwise>
													<img src="${path}/images/common/img_preparing.png" alt="product image" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="detail">
											<div class="brand_name">${cartItem.brand}</div>
											<div class="product_name">${cartItem.pName}</div>
										</div>
									</td>
									<td class="product_count">
										<select id="select_count" name="select_count">
											<c:forEach var="countQuantity" begin="1" end="100">
												<option value="${countQuantity}" ${countQuantity == cartItem.productCount ? "selected" : ""}>${countQuantity}</option>
											</c:forEach>
										</select>
									</td>
									<td class="price">
										<fmt:formatNumber pattern="#,##0" value="${cartItem.price}"/>원
									</td>
									<td class="purchase_selection">
										<button class="btn_buy btn_blue">바로구매</button>
										<button class="btn_addlike btn_default">쇼킹찜</button>
										<button class="btn_del btn_default">삭제</button>
									</td>
								</tr>
							</c:forEach>
							<script>
								$(function(){
									$(".btn_del").on("click", function(){
										deleteCartItem();
									});
									//deleteCartItem
									//Ajax
									function deleteCartItem() {
										var paramObj = {};
		
										paramObj.searchWord = $(".search_word input").val();
										console.log("paramObj", paramObj);
										
										$.ajax({
											url: contextPath + "/myPage/subPage/likeProductDetail.do",
											data: paramObj,
											success: function(resData) {
												console.log("likeProduct 성공 !!");
												$("#like_product_wrapper").html(resData);
											},
											error:function() {
												console.log("likeProduct ajax 오류");
											}
										});
									}
									
								});
							</script>					
							<%-- <tr>
								<td class="check_item"><input type="checkbox" /></td>
								<td class="product_info">
									<div class="img_wrap">
										<img src="${path}/images/mypage/img_product_04.png"
											alt="product image" />
									</div>
									<div class="detail">
										<div class="brand_name">에스쁘아</div>
										<div class="product_name">[증량기획] 에스쁘아 원터 스플래쉬 선크림 세라마이드
											60ml+20ml 세트</div>
									</div>
								</td>
								<td class="product_count"><select id="select_count">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
								</select></td>
								<td class="price">66,000원</td>
								<td class="purchase_selection">
									<button class="btn_buy btn_blue">바로구매</button>
									<button class="btn_addlike btn_default">쇼킹찜</button>
									<button class="btn_del btn_default">삭제</button>
								</td>
							</tr>
							<tr>
								<td class="check_item"><input type="checkbox" /></td>
								<td class="product_info">
									<div class="img_wrap">
										<img src="${path}/images/mypage/img_product_05.png"
											alt="product image" />
									</div>
									<div class="detail">
										<div class="brand_name">유시몰</div>
										<div class="product_name">[11/27 하루특가]유시몰 화이트닝 미백치약
											106g+20g (가글 9ml 추가</div>
									</div>
								</td>
								<td class="product_count"><select id="select_count">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
								</select></td>
								<td class="price">66,000원</td>
								<td class="purchase_selection">
									<button class="btn_buy btn_blue">바로구매</button>
									<button class="btn_addlike btn_default">쇼킹찜</button>
									<button class="btn_del btn_default">삭제</button>
								</td>
							</tr>
							<tr>
								<td class="check_item"><input type="checkbox" /></td>
								<td class="product_info">
									<div class="img_wrap">
										<img src="${path}/images/mypage/img_product_06.png"
											alt="product image" />
									</div>
									<div class="detail">
										<div class="brand_name">라보에이치</div>
										<div class="product_name">라보에이치 두피강화샴푸 탈모증상완화 333ml기획
											(+112ml 증정)</div>
									</div>
								</td>
								<td class="product_count"><select id="select_count">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
								</select></td>
								<td class="price">66,000원</td>
								<td class="purchase_selection">
									<button class="btn_buy btn_blue">바로구매</button>
									<button class="btn_addlike btn_default">쇼킹찜</button>
									<button class="btn_del btn_default">삭제</button>
								</td>
							</tr>
							<tr>
								<td class="check_item"><input type="checkbox" /></td>
								<td class="product_info">
									<div class="img_wrap">
										<img src="${path}/images/mypage/img_product_07.png"
											alt="product image" />
									</div>
									<div class="detail">
										<div class="brand_name">에스쁘아</div>
										<div class="product_name">[한정기획/베스트립증정]에스쁘아 비벨벳 커버쿠션 뉴클래스
											미니립 2종[한정기획/베스트립증정]에스쁘아 비벨벳 커버쿠션 뉴클래스 미니립 2종</div>
									</div>
								</td>
								<td class="product_count"><select id="select_count">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
								</select></td>
								<td class="price">66,000원</td>
								<td class="purchase_selection">
									<button class="btn_buy btn_blue">바로구매</button>
									<button class="btn_addlike btn_default">쇼킹찜</button>
									<button class="btn_del btn_default">삭제</button>
								</td>
							</tr> --%>							
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
				<button class="btn_del">선택상품 삭제</button>
			</div>
		</div>
		<!-- //tbl_bottom_wrap -->
		<div class="buy_price_wrap">
			<div class="price_top">
				<div class="price_info total_selling_price">
					<div>총 판매가</div>
					<div>119,710원</div>
				</div>
				<div class="price_info delivery_fee">
					<div>배송비</div>
					<div>0원</div>
				</div>
			</div>
			<div class="price_bottom">
				<div class="noti">배송비는 구독권 및 공동구매여부에 따라 변경될 수 있습니다.</div>
				<div class="expected_payment">
					총 결제예상금액 <span>119,710원</span>
				</div>
			</div>
			<div class="btn_wrap">
				<button class="partial_order btn_blue">선택 주문</button>
				<button class="all_order">전체 주문</button>
			</div>
		</div>
	</div>
	<!-- //my_cart_wrap  -->
</div>
<!-- //contents -->