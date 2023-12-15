/***************************
    ZERO NINE
	-- MyPage / likeProduct
****************************/
$(function(){
	likeProduct();	//likeProduct Ajax
});

$(".search_wrap .btn_search").on("click", function(){
	likeProduct();
});


//likeProduct
//Ajax
function likeProduct() {
/*
	var paramObj = {};

	paramObj.searchWord = $(".search_word input").val();
	console.log("paramObj", paramObj);
*/	
	$.ajax({
		url: contextPath + "/myPage/subPage/likeProduct.do",
		success: function(resData) {
			console.log("likeProduct 성공 !!");
			$("#like_product_wrapper").html(resData);
		},
		error:function() {
			console.log("likeProduct ajax 오류");
		}
	});
}
