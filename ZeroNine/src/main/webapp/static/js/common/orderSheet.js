/***************************
    ZERO NINE
	-- COMMON / orderSheet
****************************/

$(function() {
	//동의 checkbox
	$(".agreebtn").click( function() {
		const currentImagePath = $(this).find("img.purchaseAgree").attr("src");
		const unChecked = contextPath + "/images/sangpumpage/checkbox.png";
		const fillChecked = contextPath + "/images/sangpumpage/fillcheckbox.png";
		let newImagePath = (currentImagePath === unChecked) ? fillChecked : unChecked;

		$(this).find("img.purchaseAgree").attr("src", newImagePath);

		//체크 상태값 boolean
		let isCheckboxImage = (currentImagePath === fillChecked);
		document.getElementById("gobtn").disabled = isCheckboxImage;

	})


	//결제 금액 계산
	const itemPriceArr = document.querySelectorAll(".itemPrice");

	let calcAmount = 0;
	itemPriceArr.forEach(element => {
		calcAmount += parseNumber(element.innerText);
		console.log("??", calcAmount);
	});
	console.log("calcAmount total??", calcAmount);
	
	//주문 금액
	const orderAmountEle = document.getElementById("orderAmount");
	orderAmountEle.innerText = `${numberWithDots(calcAmount)} 원`;

	//배송비 체크
	const orderFeeEle = document.getElementById("itemprice_deli");
	const freeDeliveryAmount = 50000;
	let deliveryFee = 0;

	if(calcAmount < freeDeliveryAmount) {
		deliveryFee = 3000;
	} else {
		deliveryFee = 0;
	}

	orderFeeEle.innerText = `${numberWithDots(deliveryFee)} 원`;

	//총금액
	const totalPriceEle = document.getElementById("totalprice_text");
	let calcTotalAmount = calcAmount + deliveryFee;
	totalPriceEle.innerText =  `${numberWithDots(calcTotalAmount)} 원`;
});