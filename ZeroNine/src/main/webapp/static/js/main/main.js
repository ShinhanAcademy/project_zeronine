$(function(){
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
});