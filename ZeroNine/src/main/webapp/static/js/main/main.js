$(function(){
	//main visual
	$(document).ready(function(){
		$('.bxslider').bxSlider({
			auto: true,
			//autoHover: true,
			mode:'fade',
			controls: true,
			touchEnabled : (navigator.maxTouchPoints > 0),
    		//touchEnabled : false,
			speed: 300
		});
	});
	
	//board click event
	$(".smart_shopping .intro_unit").on("click", function(){
		let dataName = $(this).attr("data-name");
		if(dataName == "fast") {
			location.href = contextPath + "/board/fastboard.do";
		} else if(dataName == "free") {
			location.href = contextPath + "/board/freedeliveryboard.do";
		} else {
			location.href = contextPath + "/board/onetooneboard.do";
		}
	});
	
	//상품 추천
	let recommendedCount = 3;
	callRecommendedProduct(recommendedCount);
	
	$(".recommended_list .view_more").on("click", function(){
		recommendedCount = 6;
		console.log("???????????????");
		callRecommendedProduct(recommendedCount);
		$(this).hide();
	});
	
	
	
}); //End_Ready


//recommended products
//AJAX
function callRecommendedProduct(recommendedCount) {
	$.ajax({
	    url : contextPath + "/main/recommendedProducts.do",
        type: "POST",
        data:  {"count":recommendedCount},
	    success : function(res){
			if(res) {
				let html = "";
				$(res).each(function(idx, item) {
	    console.log("res", res[idx]);
					html += `
						<div class="item">
			                <div class="img_wrap">
			                	<a href= "${contextPath}/product/productDetail.do?productId=${res[idx].productId}" >
			                    	<img src="${res[idx].imagePath}" alt="product">
			                	</a>
			                </div>
			                <div class="info">
		                    	<div class="tit">
				                	<a href= "${contextPath}/product/productDetail.do?productId=${res[idx].productId}" >
				                    	${res[idx].pName}
				                    </a>
		                    	</div>
			                    <div class="price">${res[idx].price} 원</div>
			                </div>
			            </div>`;
	            });
	            $(".product_wrap").html(html);
			}
	    },
	    error : function(){
	        alert("recommended products 에러입니다.");
	    }
	});
}