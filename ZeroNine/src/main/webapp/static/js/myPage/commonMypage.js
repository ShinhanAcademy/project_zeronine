/***************************
    ZERO NINE
	-- MyPage / orderHistory
****************************/

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
		
	// $(document).mouseup(function (e){
	// 	console.log("eeeeevent",e);
	// 	console.log("?????", $(".delivery_modal_wrap .contents").has(e.target).length);
	// 	if($(".delivery_modal_wrap .contents").has(e.target).length == 0){
	// 		//closeModal();
	// 	};
	// });
	
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
