<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<title>구독권 구매</title>
<link rel="stylesheet" href="${path}/css/main.css">
<link rel="stylesheet" href="${path}/css/subscription.css">
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
				<img src="${path}/images/subscription/recovery_no-delivery.png">
			</div>
			<div>
				<img src="${path}/images/subscription/recovery.png">
				<img src="${path}/images/subscription/no-delivery.png">
			</div>
			<div>
				<img src="${path}/images/subscription/trash.png">
				<img src="${path}/images/subscription/no-trash.png">
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
	<%@include file="../common/footer.jsp"%>
</body>
</html>