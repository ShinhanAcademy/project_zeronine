/***************************
    ZERO NINE
	-- MyPage COMMON
****************************/
$(function(){
	
	//SNB
	$(".snb_wrap li").each(function() {
		let href = $(this).find('a').attr('href');
		if (href == window.location.pathname) {
			$(this).addClass("on"); return false;
		}
		if (href.indexOf(window.location.pathname) > -1 ){
			$(this).addClass("on"); return false;
		}
	});
	
});

function usingDatePicker(){
	let currentDate = new Date();

	// Calendar(air-datepicker.js)
	$(".mypage_container #datepicker").datepicker({
		language: "ko",
		toggleSelected: false,
		maxDate: new Date(),
	});
	$(".mypage_container #datepicker").data("datepicker").selectDate(new Date(currentDate.setMonth(currentDate.getMonth() - 1)));
	$(".mypage_container #datepicker").data("datepicker").selectDate(new Date());
	$(".search_wrap .period button").click(function(){
		currentDate = new Date();
		$(".mypage_container #datepicker").data("datepicker").clear();
		$(".search_wrap .period button").removeClass("on");
		$(this).addClass("on");
		if($(this).attr("data-period") == "1") {
			$(".mypage_container #datepicker").data('datepicker').selectDate(new Date(currentDate.setMonth(currentDate.getMonth() - 1)));
		} else if($(this).attr("data-period") == "3") {
			$(".mypage_container #datepicker").data('datepicker').selectDate(new Date(currentDate.setMonth(currentDate.getMonth() - 3)));
		} else if($(this).attr("data-period") == "6") {
			$(".mypage_container #datepicker").data('datepicker').selectDate(new Date(currentDate.setMonth(currentDate.getMonth() - 6)));
		}
		$(".mypage_container #datepicker").data("datepicker").selectDate(new Date());
	});
}

function deliveryModal() {
	// delivery modal
	$(".btn_delivery_check").on("click", function(){
		$(".delivery_modal_wrap").show();
			
		//스크롤 제어
		$('.delivery_modal_wrap').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});
	

	$(".delivery_modal_wrap .btn_close").on("click", function(){
		closeModal();
	});
	
	/*	
	$(document).mouseup(function (e){
		e.stopPropagation();
		console.log("eeeeevent",e);
		let dimmed = $(".delivery_modal_wrap .modal_contents");
		console.log("?????", $(".delivery_modal_wrap .modal_contents").has(e.target).length);
		if(dimmed.has(e.target).length == 0){
		//	closeModal();
		};
	});
	*/
	
    $(".delivery_modal_wrap .dimmed").click(function(){
		closeModal();
    });
    
	
	// ESC key 이벤트
	$(document).keydown(function(e){
		let code = e.keyCode || e.which;
	
		if (code == 27) { 
			closeModal();
		}
	});
}

function closeModal() {
	$('.delivery_modal_wrap').hide();
	//스크롤 제어 해제
	$('.delivery_modal_wrap').off('scroll touchmove mousewheel');
}

//엔터 Trigger
const inputWord = document.querySelector(".search_word input");
if (inputWord) {
	inputWord.addEventListener("keyup", function(e) {
		if (e.keyCode === 13) {
			document.querySelector(".btn_search").click();
		};
	});
}

//orderHistory
//Ajax
function callOrderHistory() {
	let startDate = $(".mypage_container #datepicker").data("datepicker").selectedDates[0];
	let endDate = $(".mypage_container #datepicker").data("datepicker").selectedDates[1];

	var paramObj = {};

	paramObj.searchWord = $(".search_word input").val();
	paramObj.startDate = convertDate(startDate);
	paramObj.endDate = convertDate(endDate);
	
	$.ajax({
		url: contextPath + "/myPage/subPage/orderHistoryDetail.do",
		data: paramObj,
		success: function(resData) {
			console.log("OrderHistory 성공 !!");
			$("#order_history_wrapper").html(resData);
		},
		error:function() {
			console.log("OrderHistory ajax 오류");
		}
	});
}

//orderCancelHistory
//Ajax
function callOrderCancelHistory() {
	let startDate = $(".mypage_container #datepicker").data("datepicker").selectedDates[0];
	let endDate = $(".mypage_container #datepicker").data("datepicker").selectedDates[1];

	var paramObj = {};

	paramObj.searchWord = $(".search_word input").val();
	paramObj.startDate = convertDate(startDate);
	paramObj.endDate = convertDate(endDate);
	console.log("paramObj", paramObj);
	
	$.ajax({
		url: contextPath + "/myPage/subPage/orderCancelHistoryDetail.do",
		data: paramObj,
		success: function(resData) {
			console.log("orderHistoryCancelDetail 성공 !!");
			$("#cancel_history_wrapper").html(resData);
		},
		error:function() {
			console.log("orderHistoryCancelDetail ajax 오류");
		}
	});
}

//likeProduct
//Ajax
function likeProduct() {
	var paramObj = {};

	paramObj.searchWord = $(".search_word input").val();
	console.log("paramObj", paramObj);
	
	$.ajax({
		url: contextPath + "/myPage/subPage/likeProductDetail.do",
		data: paramObj,
		success: function(resData) {
			console.log("likeProduct 성공 !!");
			$("#like_product_wrapper").html(resData);
		},
		error:function() {
			console.log("likeProduct ajax 오류");
		}
	});
}

//myCartList
//Ajax
function myCartList() {
	$.ajax({
		url: contextPath + "/myPage/subPage/myCartDetail.do",
		success: function(resData) {
			console.log("myCartList 성공 !!");
			$("#my_cart_wrapper").html(resData);
		},
		error:function() {
			console.log("myCartList ajax 오류");
		}
	});
}


