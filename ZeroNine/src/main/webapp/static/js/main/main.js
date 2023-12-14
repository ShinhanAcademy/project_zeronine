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
	
});