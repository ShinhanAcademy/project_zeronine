/***************************
    ZERO NINE
    -- COMMON
****************************/
$(function(){

	//nav
	/*
    $("#c_gnb_wrap>ul>li").on("mouseover focusin", function(){
        $(this).find("div").stop().slideDown(500);
    });
    $("#c_gnb_wrap>ul>li").on("mouseout focusout", function(){
        $(this).find("div").stop().slideUp(500);
    });
    */
    
    //header
    $(window).scroll(function(){
        var calSct=$(this).scrollTop();
        var bannerOffset=$(".main_visual_wrap").offset().top;
        console.log($(this).scrollTop());
        console.log(bannerOffset);
        if(calSct>=204) {
            $(".zn_header, .zn_header .top").addClass("on");
        }else{
            $(".zn_header, .zn_header .top").removeClass("on");
        };
    });

});

function convertDate(date) { //YYYY-MM-DD
  date = new Date(date);
  let offset = date.getTimezoneOffset() * 60000; //ms단위라 60000곱해줌
  let dateOffset = new Date(date.getTime() - offset);
  return dateOffset.toISOString().split("T")[0];
}

/*
function convertTime(date) { //HH24:MI:SS
  date = new Date(date);
  let offset = date.getTimezoneOffset() * 60000; //ms단위라 60000곱해줌
  let dateOffset = new Date(date.getTime() - offset);
  return dateOffset.toISOString().split("T")[0];
}
console.log("???시간"+convertTime(new Date()));
*/