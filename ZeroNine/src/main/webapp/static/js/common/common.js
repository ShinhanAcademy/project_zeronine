/***************************
    ZERO NINE
    -- COMMON
****************************/
$(function () {
    let headerHeight = $(".zn_header").height();

    //nav
   
    $(".zn_header .bot .gnb_1depth > li").on("mouseover focusin", function(){
        $(this).addClass("on").find(".gnb_2depth").stop().slideDown(300);
    });
    $(".zn_header .bot .gnb_1depth > li").on("mouseout focusout", function(){
        $(this).removeClass("on").find(".gnb_2depth").stop().slideUp(300);
    });

    //header
    $(window).scroll(function () {
        let calSct = $(this).scrollTop();

        if (calSct >= headerHeight) {
            $(".zn_header, .zn_header .top").addClass("on");
        } else {
            $(".zn_header, .zn_header .top").removeClass("on");
        };
    });

});

const dateSet = {
    convertTime: function (date) { //YYYY-MM-DD
        let transOption = { hour: "numeric", minute: "numeric" };
        return new Date(date).toLocaleTimeString("ko-KR", transOption);
    },
    convertDate: function (date) { //YYYY-MM-DD
        date = new Date(date);
        let offset = date.getTimezoneOffset() * 60000; //ms단위라 60000곱해줌
        let dateOffset = new Date(date.getTime() - offset);
        return dateOffset.toISOString().split("T")[0];
    }
};

const isEmpty = function (value) {
    let result = false;
    if (value == "" || value == null || value == undefined || (value != null && typeof value == "object" && !Object.keys(value).length)) {
        return true;
    } 
    return result;
};
const numberWithDots = function (p_value) {
    p_value = p_value + '';
    p_value = parseInt(p_value.replace(/[^0-9]/gm, ''), 10);
   
    return p_value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');   
};
const parseNumber = function(p_value) {
    p_value = p_value + '';
    return parseInt(p_value.replace(/[^0-9]/gm, ''), 10);
};
