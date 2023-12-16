
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/productOrderSuccess.css" />

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
						<div class="ob_subtext">20231123202304019</div>
					</div >
					<div class="jul"></div>
					<div class="od_part">
						<div class="od_subtitle">상품명</div>
						<div class="ob_subtext">20231123202304019</div>
					</div>
					<div class="jul"></div>
					<div class="od_part">
						<div class="od_subtitle">결제금액</div>
						<div class="ob_subtext">20231123202304019</div>
					</div>
					<div class="jul"></div>
					<div class="od_part">
						<div class="od_subtitle">적립금</div>
						<div class="ob_subtext">20231123202304019</div>
					</div>
				</div>
			</div>
			<div class="orderlist-go">
			<button class="orderlist-btn">주문내역 바로가기</button>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	</body>
</html>