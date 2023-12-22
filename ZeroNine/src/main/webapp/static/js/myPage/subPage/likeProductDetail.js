/*************************************
    ZERO NINE
	-- MyPage / likeProductDetail
**************************************/
$(function() {
	$(".product_list .btn_like").on("click", function(){
		let item = $(this).closest(".like_item");
		unLikeData = {
			custid: $(this).attr("data-custId"),
			productId: $(this).attr("data-prodId")
		}
	    $.ajax({
	        url: "/product/deleteLikedProduct.do",
	        type: "POST",
	        data: unLikeData,
	        success: function () {
				item.remove();
	        },
	        error: function () {
	            alert("에러입니다.");
	        },
	    });
	});
});

