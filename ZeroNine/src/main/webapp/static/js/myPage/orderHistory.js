/***************************
    ZERO NINE
	-- MyPage / orderHistory
	-- MyPage / orderCancelHistory
****************************/
$(function(){
	usingDatePicker();	//datePicker
	deliveryModal();	//modal
	callOrderHistory();	//orderHistory Ajax
});

$(".search_wrap .btn_search").on("click", function(){
	callOrderHistory();
});
