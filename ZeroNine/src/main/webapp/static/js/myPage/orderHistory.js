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

//Ajax
function callOrderHistory() {
	let startDate = $(".mypage_container #datepicker").data("datepicker").selectedDates[0];
	let endDate = $(".mypage_container #datepicker").data("datepicker").selectedDates[1];
	var paramObj = {};
	paramObj.searchWord = $(".search_word input").val();
	paramObj.startDate = startDate.toISOString().split("T")[0];
	paramObj.endDate = endDate.toISOString().split("T")[0];
	
	console.log("paramObj", paramObj);
	
	$.ajax({
		url: contextPath + "/myPage/subPage/orderHistoryDetail.do",
		data: paramObj,
		success: function(resData) {
			console.log("성공 !!");
			$(".order_history_wrap").html(resData);
		},
		error:function() {
			console.log("ajax 오류");
		}
	});
}