/***************************
    ZERO NINE
	-- MyPage / orderCancelHistory
****************************/
$(function(){
	usingDatePicker();	//datePicker
	deliveryModal();	//modal
	callOrderCancelHistory();	//orderHistory Ajax
});

$(".search_wrap .btn_search").on("click", function(){
	callOrderCancelHistory();
});

