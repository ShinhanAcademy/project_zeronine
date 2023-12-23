/*************************************
    ZERO NINE
	-- MyPage / myCartDetail
**************************************/
$(function() {
	let chkedBox, totalPrice;
	checkBoxAll = $("#cartList input[type=checkbox]");
	checkBoxAll.prop("checked", true);

	if($(".tbl_orderlist_wrap th.check_all input").is(":checked")){
		$(".tbl_orderlist_wrap th.check_all input").prop("checked", false);
	} else {
		if($("#cartList input[type=checkbox]").length == $("#cartList input[type=checkbox]:checked").length) {
			$(".tbl_orderlist_wrap th.check_all input").prop("checked", true);
		} else {
			$(".tbl_orderlist_wrap th.check_all input").prop("checked", false);
		}
	}

	//total price
	calcTotalPrice(totalPrice);

	// 카트 전체 선택
	$(".tbl_orderlist_wrap th.check_all input").on("click", function() {
		checkBoxAll = $("#cartList input[type=checkbox]");

		if(checkBoxAll.is(":checked")) { //전체 해제
			checkBoxAll.prop("checked", false);
		} else { //전체 선택
			checkBoxAll.prop("checked", true);
		}

		calcTotalPrice(totalPrice);
	});

	// 체크 여부 확인 후 전체바꾸기
	$("#cartList input[type=checkbox]").on("click", function() {
		if($(".tbl_orderlist_wrap th.check_all input").is(":checked")){
			$(".tbl_orderlist_wrap th.check_all input").prop("checked", false);
		} else {
			if($("#cartList input[type=checkbox]").length == $("#cartList input[type=checkbox]:checked").length) {
				$(".tbl_orderlist_wrap th.check_all input").prop("checked", true);
			} else {
				$(".tbl_orderlist_wrap th.check_all input").prop("checked", false);
			}
		}

		calcTotalPrice(totalPrice);
	});

	// 체크여부확인후전체바꾸기
	$("#btn7").on("click", function() {
		i = $("#div_chk > #id_chk").length-1;
		console.log(i);
		if(i < 0){
			alert("체크박스가 존재 하지 않습니다.");
			return;
		}
		
		if($("#div_chk > #id_chk").is(":checked")){
			$("#div_chk > #id_chk").prop("checked",false);
		}else{
			$("#div_chk > #id_chk").prop("checked",true);
		}
		
	});

	//td 구매가 변경 로직
	$(".product_count select").on("change", function() {
		let count = $(this).val();
		let prdPerPrice = $(this).closest("td").next().attr("data-price");
		let calcPrice = numberWithDots(prdPerPrice * count);
		
		$(this).closest("td").next().html(`${calcPrice} 원`);
		
		calcTotalPrice(totalPrice);
	});

	//cart - delete item
	$(".purchase_selection .btn_del").on("click", function() {
		const productId = $(this).closest("tr").attr("id");
		chkedBox = $(this).closest("tr").find("input[type=checkbox]:checked");
		console.log("productId >>>> " + productId );
		
		if(confirm("삭제하시겠습니까?")){
			delCartAjax(productId);
			console.log("chkedBox", chkedBox);
			chkedBox.prop("checked", false);
			
			if($("#cartList input[type=checkbox]").length ==0 ) {
				$("#cartList input[type=checkbox]").prop("checked", false);
			}

			calcTotalPrice(totalPrice);
		}
	});

	//cart - delete selected items
	$(".tbl_bottom_wrap .btn_del").on("click", function() {
		chkedBox = $("#cartList input[type=checkbox]:checked");
		console.log("chkedBox" , chkedBox);

		if(confirm("삭제하시겠습니까?")){
			chkedBox.each(function( idx, item) {
				const productId = $(this).closest("tr").attr("id");
				console.log("productId >>>> " + productId );
				
				delCartAjax(productId);
			});
			
			if($("#cartList input[type=checkbox]").length ==0 ) {
				$("#cartList input[type=checkbox]").prop("checked", false);
			}

			chkedBox.prop("checked", false);
			
			calcTotalPrice(totalPrice);
		}
	});
});

//delete cart item Ajax
function delCartAjax(productId) {
	$.ajax({
		url: contextPath + "/product/deleteCartItem.do",
		type : "POST",
		data: {productId},
		success: function(result) {
			console.log("deleteCartItem 성공 !!");
			console.log("result>>>>>",result);
			if(Object.keys(result).length > 0 && result.count > 0){
				$("#" + productId).remove();
				console.log("????됐나");
			}
		},
		error:function() {
			console.log("deleteCartItem ajax 오류");
		}
	});
}// end_delCartAjax


function calcTotalPrice(totalPrice) {
	let targetChkedBox = $("#cartList input[type=checkbox]:checked").closest("tr").find(".price");
	totalPrice = 0;
	console.log("???", targetChkedBox);
	targetChkedBox.each(function() {
		console.log($(this));
		totalPrice += parseNumber($(this).text());
	});
	
	$(".expected_payment span").html(`${numberWithDots(totalPrice)} 원`);
	$(".total_selling_price .total_price").html(`${numberWithDots(totalPrice)} 원`);
}
