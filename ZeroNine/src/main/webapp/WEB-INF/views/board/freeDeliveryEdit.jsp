<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="content">

	<div class="due_date">
		<ul>
			<li class="due_date_title">날짜 및 시간</li>
			<li class="due_date_cf"><span> * 날짜는 최대 7일 후까시 설정 가능합니다.
					<br> * 게재 날짜는 당일을 포함합니다.
			</span> <span class="due_date_ex">(ex.1월 1일 작성 시, 7일 후 → 1월 7일) </span></li>
			<li class="due_date_cf"><span> * 몇 시간 동안 기다릴지 입력해주세요.</span></li>
		</ul>

		<div class="date_input">
			<div>
				<select class="date">
					<option value="1440">1일</option>
					<option value="2880">2일</option>
					<option value="4320">3일</option>
					<option value="5760">4일</option>
					<option value="7200">5일</option>
					<option value="8640">6일</option>
					<option value="10080">7일</option>
				</select>
			</div>
			<div class="time">
				<input type="number" placeholder="3" id="wait_hour"> 시간 
				<input type="number" placeholder="00" id="wait_minute"> 분 까지
			</div>
		</div>
	</div>

	<div id="cart">
		<div class="cart_ann">
			<ul>
				<li class="cart_ann_title">공구 상품 및 수량</li>
				<li class="cart_ann_cf">* 상품과 수량을 선택해주세요.</li>
			</ul>
		</div>
		<div class="cart_list contents">
			<!-- tbl_wrap -->
			<div class="tbl_wrap">
				<table class="tbl_orderlist_wrap">
					<colgroup>
						<col width="6%" />
						<col width="48%" />
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
			<div class="totalPrice_div">총 구매가 <span class="totalPrice">0&nbsp;원</span></div>
				
		</div>
	</div>
</div>

<div class="write_content">

	<div class="write_title">본문 작성</div>

	<div class="main_text">
		<ul>
			<li class="title">제목</li>
			<li><textarea class="title_input" placeholder="제목을 입력하세요."></textarea></li>
			<li class="context">내용</li>
			<li><textarea class="context_input" placeholder="내용을 입력하세요."></textarea></li>
		</ul>
	</div>
</div>

<script>

	document.querySelector(".date").addEventListener("change", function() {
		var selectedValue = this.value;
		console.log(selectedValue);
	})
	
	function add(){
		var num = Number($(".num").val());
		num += 1;
		$(".num").val(num);
	}
	
	function minus(){
		var num = Number($(".num").val());
		if(num>=1){
		num -= 1;
		}
		$(".num").val(num);
		console.log(num)
	}
</script>