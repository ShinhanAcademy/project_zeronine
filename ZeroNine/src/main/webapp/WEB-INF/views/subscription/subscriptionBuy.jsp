<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<title>구독권 구매</title>
<link rel="stylesheet" href="${path}/css/subscription/subscription.css">
<link rel="stylesheet" href="${path}/css/modal/modal.css">
</head>
<%@include file="../common/header.jsp"%>
<body>
	<div class="subscript_wrap zero_container">
		<div class="subscript_banner_up zn_center">
			<img src="${path}/images/subscription/banner_up.png">	
		</div>
		<div class="subscript_buy zn_center">
			<p>회원 이용권 평생 할인가</p>
			<p>회원별로 니즈에 맞게 원하는 구독권 선택</p>
		</div>
		<div class="subscript_coupon zn_center">
			<div>
				<img class="free_delivery_ecocare" data-value="에코케어+무료 배송 이용권" src="${path}/images/subscription/free_delivery_ecocare.png">
			</div>
			<div>
				<img class="ecocare" data-value="에코케어 이용권" src="${path}/images/subscription/ecocare.png">
				<img class="free_delivery" data-value="무료 배송 이용권" src="${path}/images/subscription/free_delivery.png">
			</div>
			<div>
				<img class="ecocare_5" data-value="5회 이용권" src="${path}/images/subscription/trash.png">
				<img class="ecocare_5" data-value="5회 이용권" src="${path}/images/subscription/no-trash.png">
			</div>
		</div>
		<div class="subscript_banner_down zn_center">
			<img src="${path}/images/subscription/banner_down.png">
		</div>
		<div class="subscript_review zn_center">
			<div class="img_wrap">
				<img src="${path}/images/subscription/review.png">
			</div>
		</div>
	</div>
	
	
	<div id="modal_wrap">
		<div id="modal_body">
			<p id="subscript_name"></p>
			<p>을(를) 구매하시겠습니까?</p>
			<div id="modal_btn">
			<button id="btn_cancel">취소</button>
			<button id="btn_check">확인</button>
			</div>
		</div>
	</div>
	
	<%@include file="../common/footer.jsp"%>
	<script src="${path}/js/subscription/subscription.js" type="text/javascript"></script>
</body>
</html>