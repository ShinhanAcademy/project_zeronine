<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jsp"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>FastBoard</title>
<link rel="stylesheet" href="${path}/css/product/productOrder.css" />

</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="order_body">
		<div class="zero_container order_bodypart">
			<div class="order_bodypart_text">
				<span class="top_text">주문서</span>
			</div>

			<div class="orderinfo">
				<span class="orderinfo_text">주문내역</span>
				<div class="orderinfo_box">
					<div class="orderinfo_boxtext">
						<div class="infotext_space">
							<div class="infotext_space_left">
								<span class="box_text">${product.pName}</span>
							</div>
							<div class="infotext_space_left2">
								<span class="box_text2">${count}개</span>
							</div>
							<div class="infotext_space_right">
								<span id="itemPrice" class="box_text"><fmt:formatNumber
										value="${Math.round(product.price/product.pCount)*count}"
										maxFractionDigits="3"></fmt:formatNumber>원</span>
							</div>
						</div>
						<div class="jul"></div>
						<!--  orderinfo_boxtext -->
					</div>
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
										value="${customer.customerName }" readonly>
								</div>

							</div>
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">연락처</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input"
										value="${customer.phoneNumber }" readonly>
								</div>

							</div>
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">이메일</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input" value="${customer.email }"
										readonly>
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
									<dt id="order_name">${customer.customerName}</dt>
									<dd id="order_address">${customer.address }<br>
										${customer.addressDetail}
									</dd>
								</dl>
								<div class="delpPhone">
									<span id="order_phone">${customer.phoneNumber }</span>
								</div>
							</div>

						</div>

						<!-- tw_wb -->
					</div>
					<!-- tw_box -->
				</div>
				<!-- twinbox -->
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
								<span>주문금액</span><span id="itemprice2"></span>

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
				<input type="hidden" id="hidden_productId" value="${product.productId}">
				<input type="hidden" id="hidden_count" value="${count}">
				<button class="gobtn" id="gobtn" disabled>결제하기</button>
			</div>


			<!-- order-bodypart -->
		</div>
	</div>

	<%@include file="../common/footer.jsp"%>
	<script>
		var path = "${path}";
		//var isFreeDelivery = "${IsFreeDelivery}";
		
		$(".gobtn").click(function() {
			
			if(${isParticipate}>0){
				alert("이미 참여한 게시글입니다.")
				return;
			}
			
			/*결제 창*/
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
			var email =  "${customer.email}";
			var name = "${customer.customerName}";
			price /= 100;
			var priceInt = parseInt(price);
			IMP.request_pay({
				pg : 'html5_inicis',
		        pay_method : 'card',
		        merchant_uid: "IMP"+makeMerchantUid, 
		        name : '즉시배송 결제', 
		        amount : priceInt,
		        buyer_name : name,
		        buyer_email : email
		    }, function (rsp) { // callback
		    	var obj = {
						"productId":$("#hidden_productId").val(),
						"count":$("#hidden_count").val()
				}

				$.ajax({
					url : path + "/common/orderSuccess.do",
					data : obj,
					type : "POST",
					success : function() {
						location.href = path+"/common/orderSuccess.do";
					},
					error : function() {
						//alert("ERROR!"); 
						$.ajax(
							{
								url : "https://api.iamport.kr/payments/cancel",
								type : "POST",
								contentType : "application/json",
								data : {imp_uid : rsp.imp_uid},
								success : function() {
									location.href = path+"/common/failParticipateRefund.do";
									//결제 취소완료
								},
								error : function() {
									//결제 취소 실패		
									location.href = path+"/common/failParticipateRefund.do";
								}
							}		
						);
					}
				});
		    });
		})

		$(".agreebtn")
				.click(
						function() {
							var currentImagePath = $(this).find(
									"img.purchaseAgree").attr("src");
							var newImagePath = currentImagePath === path
									+ "/images/sangpumpage/checkbox.png" ? path
									+ "/images/sangpumpage/fillcheckbox.png"
									: path + "/images/sangpumpage/checkbox.png";

							$(this).find("img.purchaseAgree").attr("src",
									newImagePath);
							var isCheckboxImage = currentImagePath === path
									+ "/images/sangpumpage/fillcheckbox.png";
							document.getElementById("gobtn").disabled = isCheckboxImage;

						})
		var itemPriceText = document.getElementById("itemPrice").innerText;
		var itemPriceValue = parseFloat(document.getElementById("itemPrice").innerText
				.replace(/[^\d.]/g, ''));
		document.getElementById("itemprice2").innerText = itemPriceText;

		if(${IsFreeDelivery}>0){
			document.getElementById("itemprice_deli").innerText = 0;
		}else{
			if (itemPriceValue < 50000) {
				document.getElementById("itemprice_deli").innerText = 3000;
			} else {
				document.getElementById("itemprice_deli").innerText = 0;
			}
		}
		var deli = document.getElementById("itemprice_deli").innerText;

		var deliValue = parseFloat(deli);

		document.getElementById("totalprice_text").innerText = (deliValue + itemPriceValue);
		totalpriceValue = document.getElementById("totalprice_text").innerText;
		var deliformattedValue = new Intl.NumberFormat('ko-KR', {
			style : 'decimal',
			currency : 'KRW' // 대한민국 원
		}).format(deli);
		var formattedValue = new Intl.NumberFormat('ko-KR', {
			style : 'decimal',
			currency : 'KRW' // 대한민국 원
		}).format(totalpriceValue);
		document.getElementById("itemprice_deli").innerText = deliformattedValue
				+ "원";
		document.getElementById("totalprice_text").innerText = formattedValue
				+ "원";
		
	</script>
</body>
</html>
