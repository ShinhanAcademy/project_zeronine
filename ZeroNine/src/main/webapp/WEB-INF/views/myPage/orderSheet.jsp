<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet" href="${path}/css/product/productOrder.css" />
<link rel="stylesheet" href="${path}/css/common/order_sheet.css" />
<script defer src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script defer src="${path}/js/common/orderSheet.js"></script>
<title>상품목록</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div id="order_dtl_wrapper" class="order_body">
		<div class="zero_container order_bodypart">
			<div class="order_bodypart_text">
				<span class="top_text">주문서</span>
			</div>
			<div class="orderinfo">
				<!-- orderlist -->
				<span class="orderinfo_text">주문내역</span>
				<div class="orderinfo_box">
					<c:forEach var="item" items="${productList}" varStatus="index">
						<div class="orderinfo_boxtext">
							<div class="infotext_space">
								<div class="img_wrap">
									<img src="${item.imagePath}" alt="product image" />
								</div>
								<div class="infotext_space_left">
									<div>
										<div class="brand">${item.brand}</div>
										<div class="box_text">${item.pName}</div>
									</div>
									<div>
										<span class="box_text2">${item.pCount}개</span>
									</div>
								</div>
								<div class="infotext_space_right">
									<span class="itemPrice box_text">
										<fmt:formatNumber value="${item.price*item.pCount}" maxFractionDigits="3"></fmt:formatNumber> 원
									</span>
								</div>
							</div>
							<c:if test="${!index.last}">
								<div class="jul"></div>
							</c:if>
							<!--  orderinfo_boxtext -->
						</div>
					</c:forEach>
					<!-- orderinfo_box -->
				</div>
				<!-- orderinfo -->
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
									<input type="text" class="odd_input"
										value="${customerInfo.customerName }" readonly>
								</div>
							</div>
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">연락처</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input"
										value="${customerInfo.phoneNumber }" readonly>
								</div>
							</div>
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">이메일</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input"
										value="${customerInfo.email}" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tw_box">
					<div class="tw_box_top">
						<p class="tw_boxtext">배송지 정보</p>
					</div>
					<div class="tw_wb">
						<div class="deliverypinfo">
							<div class="delpinfo">
								<dl>
									<dt id="order_name">${customerInfo.customerName}</dt>
									<dd id="order_address">${customerInfo.address }<br>
										${customerInfo.addressDetail}
									</dd>
								</dl>
								<div class="delpPhone">
									<span id="order_phone">${customerInfo.phoneNumber }</span>
								</div>
							</div>
						</div>
						<!-- tw_wb -->
					</div>
					<!-- tw_box -->
				</div>
				<!-- twinbox -->
			</div>
			<div class="last_area">
				<div class="last_area1">
					<div class="buy_box_top">
						<p class="buy_boxtext">개인정보 수집/제공</p>
					</div>
					<div class="jul"></div>
					<div class="accessforbuy">
						<button class="agreebtn">
							<img id="purchaseAgree" class="purchaseAgree"
								src="${path}/images/sangpumpage/checkbox.png">
						</button>
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
								<span>주문금액</span><span id="orderAmount"></span>
							</div>
							<div class="purchaseinfo">
								<span>배송비</span><span id="itemprice_deli"></span>
							</div>
							<div class="jul"></div>
							<div class="total">
								<span>총금액</span> <span id="totalprice_text"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="gopurchasebtn">
				<button class="gobtn" id="gobtn" disabled>결제하기</button>
			</div>
			<!-- order-bodypart -->
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script>
		$(function() {
			//배송지(Ajax 정보)
			var adderessdetail = "${customerInfo.addressDetail}";
			var address = "${customerInfo.address}";
			var obj = {
				"address" : address,
				"addressdetail" : adderessdetail,
				"productId" : "${orderonecart[0].productId}"
			};

			/*결제 창*/
			$(".gobtn").click(function() {
				var IMP = window.IMP;
				IMP.init("imp31265537"); //imp31265537

				var today = new Date();   
				var hours = today.getHours(); // 시
				var minutes = today.getMinutes();  // 분
				var seconds = today.getSeconds();  // 초
				var milliseconds = today.getMilliseconds();
				var makeMerchantUid = hours +  minutes + seconds + milliseconds;
				var priceWon = document.getElementById("totalprice_text").innerText.replace(/,/g,'');
				var price = priceWon.substr(0, priceWon.length-1);
				var email =  "${customerInfo.email}";
				var name = "${customerInfo.customerName}";
				
				IMP.request_pay({
					pg : 'html5_inicis',
			        pay_method : 'card',
			        merchant_uid: "IMP"+makeMerchantUid, 
					name : '개인배송 결제',
					amount : price/100,
			        buyer_name : name,
			        buyer_email : email
				}, function(rsp) { // callback
					var obj = {
						"productId" : $("#hidden_productId").val(),
						"count" : $("#hidden_count").val()
					}
				
					if(rsp.success) {
						alert('구매가 완료되었습니다. 감사합니다.');
						location.href = "${path}/myPage/orderHistory.do"
					}
				});
			})
		});
	</script>
</body>
</html>
