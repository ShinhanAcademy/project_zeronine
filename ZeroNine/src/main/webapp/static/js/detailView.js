

//fast_board
function f_btn(){
$("#detail_modal_wrap").show();
}

//free_delivery
function fd_btn(){
$("#detail_modal_wrap").show();
}

//one_to_one_board
function o_btn() {
$("#detail_modal_wrap").show();
}

//close
function close_btn(){
$("#detail_modal_wrap").hide();
}

//modal_body 를 제외한 부분을 클릭시 취소
window.onclick = function(){
	if($(event.target).is("#detail_modal_wrap")){
	$("#detail_modal_wrap").hide();
}
}
