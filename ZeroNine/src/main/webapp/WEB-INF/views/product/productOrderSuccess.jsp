
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/productOrderSuccess.css" />
<script>
document.addEventListener('DOMContentLoaded', function () {
    // Get the element by its ID
    var element = document.getElementById('deliId');

    // Display only the first 8 characters
    var originalText = element.textContent.trim();
    var truncatedText = originalText.slice(0, 8);

    // Update the content of the element
    element.textContent = truncatedText;
});
</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="zero_container order_success_part ">
		<div class="os_part zn_center">
			<div class="os_part_text">
				<span class="os_t">주문완료</span>
			</div>
			<div class="os_info">
				<span class="os_info_t">주문정보</span>
				<div class="order_detail">
					<div class="od_part">
						<div class="od_subtitle">주문번호</div>
						<div class="ob_subtext" id="deliId">${deliproduct.deliveryId }</div>
					</div >
					<div class="jul"></div>
					<div class="od_part">
						<div class="od_subtitle">주문자</div>
						<div class="ob_subtext">${deliproduct.customerName}</div>
					</div>
					<div class="jul"></div>
					<div class="od_part">
						<div class="od_subtitle">주문일시</div>
						<div class="ob_subtext">${deliproduct.purchaseDateTime } </div>
					</div>
						<div class="jul"></div>
					<div class="od_part">
						<div class="od_subtitle">결제금액</div>
						<div class="ob_subtext" id="ob_price"><fmt:formatNumber
								value="${deliproduct.productCount*deliproduct.price}" maxFractionDigits="3"></fmt:formatNumber>원</div>
					</div>
				</div>
			</div>
			<div class="orderlist-go">
			<button class="orderlist-btn" onclick="location.href='${path}/myPage/orderHistory.do'">주문내역 바로가기</button>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script>
	var itemPriceValue = parseFloat(document.getElementById("ob_price").innerText.replace(/[^\d.]/g, ''));
	if(itemPriceValue < 50000){
		itemPriceValue = itemPriceValue + 3000;
	}
	var deliformattedValue = new Intl.NumberFormat('ko-KR', {
	    style: 'decimal',
	    currency: 'KRW' // 대한민국 원
	  }).format(itemPriceValue);	
	document.getElementById("ob_price").innerText = deliformattedValue+"원";
	</script>
	</body>
</html>