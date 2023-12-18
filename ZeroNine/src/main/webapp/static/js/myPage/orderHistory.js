/***************************
    ZERO NINE
	-- MyPage / orderHistory
****************************/
$(function(){
	usingDatePicker();	//datePicker
	callOrderHistory();	//orderHistory Ajax
});

$(".search_wrap .btn_search").on("click", function(){
	callOrderHistory();
});
