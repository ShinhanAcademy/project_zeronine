/*************************************
    ZERO NINE
	-- MyPage / myCartDetail
**************************************/
$(function () {
    let chkedBox, totalPrice;
    checkBoxAll = $("#cartList input[type=checkbox]");
    checkBoxAll.prop("checked", true);
	const likedArr = [];

    if ($(".tbl_orderlist_wrap th.check_all input").is(":checked")) {
        $(".tbl_orderlist_wrap th.check_all input").prop("checked", false);
    } else {
        if (
            $("#cartList input[type=checkbox]").length ==
            $("#cartList input[type=checkbox]:checked").length
        ) {
            $(".tbl_orderlist_wrap th.check_all input").prop("checked", true);
        } else {
            $(".tbl_orderlist_wrap th.check_all input").prop("checked", false);
        }
    }

    //total price
    calcTotalPrice(totalPrice);

    // 카트 전체 선택
    $(".tbl_orderlist_wrap th.check_all input").on("click", function () {
        checkBoxAll = $("#cartList input[type=checkbox]");

        if (checkBoxAll.is(":checked")) {
            //전체 해제
            checkBoxAll.prop("checked", false);
        } else {
            //전체 선택
            checkBoxAll.prop("checked", true);
        }

        calcTotalPrice(totalPrice);
    });

    // 체크 여부 확인 후 전체바꾸기
    $("#cartList input[type=checkbox]").on("click", function () {
        if ($(".tbl_orderlist_wrap th.check_all input").is(":checked")) {
            $(".tbl_orderlist_wrap th.check_all input").prop("checked", false);
        } else {
            if (
                $("#cartList input[type=checkbox]").length ==
                $("#cartList input[type=checkbox]:checked").length
            ) {
                $(".tbl_orderlist_wrap th.check_all input").prop(
                    "checked",
                    true
                );
            } else {
                $(".tbl_orderlist_wrap th.check_all input").prop(
                    "checked",
                    false
                );
            }
        }

        calcTotalPrice(totalPrice);
    });

    //td 구매가 변경 로직
    $(".product_count select").on("change", function () {
        let count = $(this).val();
        let prdPerPrice = $(this).closest("td").next().attr("data-price");
        let calcPrice = numberWithDots(prdPerPrice * count);

        $(this).closest("td").next().html(`${calcPrice} 원`);

        calcTotalPrice(totalPrice);
    });

    //cart - delete item
    $(".purchase_selection .btn_del").on("click", function () {
        const productId = $(this).closest("tr").attr("id");
        chkedBox = $(this).closest("tr").find("input[type=checkbox]:checked");
        console.log("productId >>>> " + productId);

        if (confirm("삭제하시겠습니까?")) {
            delCartAjax(productId);
            console.log("chkedBox", chkedBox);
            chkedBox.prop("checked", false);

            if ($("#cartList input[type=checkbox]").length == 0) {
                $("#cartList input[type=checkbox]").prop("checked", false);
            }

            calcTotalPrice(totalPrice);
        }
    });

    //cart - delete selected items
    $(".tbl_bottom_wrap .btn_del").on("click", function () {
        chkedBox = $("#cartList input[type=checkbox]:checked");
        console.log("chkedBox", chkedBox);

        if (confirm("삭제하시겠습니까?")) {
            chkedBox.each(function (idx, item) {
                const productId = $(this).closest("tr").attr("id");
                console.log("productId >>>> " + productId);

                delCartAjax(productId);
            });

            if ($("#cartList input[type=checkbox]").length == 0) {
                $("#cartList input[type=checkbox]").prop("checked", false);
            }

            chkedBox.prop("checked", false);

            calcTotalPrice(totalPrice);
        }
    });
	
	//바로 구매
	$(".purchase_selection .btn_buy").on("click", function(){
		chkedBox = $(this);
		callOrderSheet(chkedBox); //ajax
	});

	//선택 주문
	$(".partial_order").on("click", function(){
		chkedBox = $("#cartList input[type=checkbox]:checked");
		callOrderSheet(chkedBox);
	});
	
	//전체 주문
	$(".all_order").on("click", function(){
		chkedBox = $("#cartList input[type=checkbox]");
		
		let selectedCount;
	    var productIdArr = [];
	    var countArr = [];
	    chkedBox.each(function () {
			/*
			productId = $(this).closest("tr").attr("id");
			selectedCount = $(this).closest("tr").find("#select_count").val();
			//orderInfo.set(productId, selectedCount);
			productIdArr.push(productId);
			countArr.push(selectedCount);
			*/
			$(this).prop("checked", true);
	    });
		
		
		callOrderSheet(chkedBox);
	});

    //찜한 상품
    $(".purchase_selection .btn_addlike").on("click", function () {
        const targetItem = $(this);
		callLikeProdList(targetItem);
    });
}); //End

//delete cart item Ajax
function delCartAjax(productId) {
    $.ajax({
        url: contextPath + "/product/deleteCartItem.do",
        type: "POST",
        data: { productId },
        success: function (result) {
            console.log("deleteCartItem 성공 !!");
            console.log("result>>>>>", result);
            if (Object.keys(result).length > 0 && result.count > 0) {
                $("#" + productId).remove();
                console.log("????됐나");
            }
        },
        error: function () {
            console.log("deleteCartItem ajax 오류");
        },
    });
} // end_delCartAjax

function calcTotalPrice(totalPrice) {
    let targetChkedBox = $("#cartList input[type=checkbox]:checked").closest("tr").find(".price");
    const freeDeliveryAmount = 50000;
    let deliveryFee = 3000;
    let indicatedPrice = 0;
    totalPrice = 0;

    console.log("targetChkedBox??", targetChkedBox);
    targetChkedBox.each(function () {
        totalPrice += parseNumber($(this).text().trim());
    });

    
    $(".free_delivery_amount .text.free_delivery, .free_delivery_amount .text.pay_delivery").hide();
    if (totalPrice >= freeDeliveryAmount) {
        if(targetChkedBox.length == 0) {
            deliveryFee = 0;
        }
        
        //percentage
        $(".contents_wrap .now_amount").css({"width": "100%"});
        
        //상단 표시되는 금액
        $(".free_delivery_amount .text.free_delivery").show();
        
    } else {
        indicatedPrice = freeDeliveryAmount - totalPrice;
        
        //percentage
        $(".contents_wrap .now_amount").css({"width": `${(totalPrice / freeDeliveryAmount) * 100}%`});
        
        //상단 표시되는 금액
        $(".free_delivery_amount .text.pay_delivery span").html(numberWithDots(indicatedPrice));
        $(".free_delivery_amount .text.pay_delivery").show();
    }

    //총 판매가
    $(".total_selling_price .total_price").html(`${numberWithDots(totalPrice)} 원`);

    //배송비
    $(".delivery_fee .fee").html(`${numberWithDots(deliveryFee)} 원`);

    //총 결제예상금액
    $(".expected_payment span").html(`${numberWithDots(totalPrice + deliveryFee)} 원`);
}

//찜한 상품
function callLikeProdList(targetItem) {
    //console.log("???", targetItem);
    const prodId = targetItem.attr("data-prodId");
    let hasRedHeart = targetItem.hasClass("on");
    //console.log(hasRedHeart);

    if(hasRedHeart) {
        $.ajax({
            url : "/product/deleteLikedProduct.do",
            type: "POST",
            data : {"productId" :prodId},
            success : function(){
                targetItem.removeClass("on");
            },
            error : function(){
                alert("에러입니다.");
            }
        });
    }else{
            $.ajax({
            url : "/product/productLike.do",
            type: "POST",
            data : {"productId" :prodId},
            success : function(){
                targetItem.addClass("on");
            },
            error : function(){
                alert("에러입니다.");
            }
        });
    }
}

//주문서 Ajax
function callOrderSheet(chkedBox) {
	//let orderInfo = new Map();
	let productId;
	let selectedCount;
	let imagePath;
    var productIdArr = [];
    var countArr = [];
    var imagePathArr = [];
    
    var dataList = [];
    chkedBox.each(function () {
		productId = $(this).closest("tr").attr("id");
		selectedCount = $(this).closest("tr").find(".select_count").val();
		imagePath = $(this).closest("tr").find("img").attr("src");
		
		//orderInfo.set(productId, selectedCount);
		productIdArr.push(productId);
		countArr.push(selectedCount);
		imagePathArr.push(imagePath);
    });
	
	console.log("!!!", {"productIdArr":productIdArr,"countArr":countArr   });

	// let formData = new formData();
	// formData.append("productIdArr",productIdArr);
	// formData.append("countArr",countArr);
	$.ajax({
        url: contextPath + "/myPage/beforeOrderSheet.do",
        type: "POST",
        data:  {"productIdArr":productIdArr,"countArr":countArr},
        success: function (result) {
            console.log("callOrderSheet 성공 !!");
            console.log("result>>>>>", result);
           //if(result=="OK")
           //      location.href="orderSheet.do";
           
           var obj={
           			"productIdArr":productIdArr,
           			"countArr":countArr,
           			"imagePathArr":imagePathArr
           			};
           
   	 		var form = document.createElement("form");
            form.setAttribute("method","post");
            form.setAttribute("action",contextPath+"/myPage/orderSheet.do");
            for(let key in obj){
                    var input = document.createElement("input");
                    input.setAttribute("type","hidden");
                    input.setAttribute("name",key);
                    input.setAttribute("value",obj[key]);
                    form.appendChild(input);
             }
             document.body.appendChild(form);
             console.log($(form).serializeArray());
             form.submit();
           
        },
        error: function () {
            console.log("callOrderSheet ajax 오류");
        },
    });
}

