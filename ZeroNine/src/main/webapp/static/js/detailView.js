const btn = document.querySelector("#detail_btn");
const modal = document.querySelector("#detail_modal_wrap");
const close_btn = document.querySelector(".close_btn");
const join_btn = document.querySelector(".join_btn");

btn.onclick = function(){
$("#detail_modal_wrap").show();
}

close_btn.onclick = function(){
modal.style.display="none";
}



//modal_body 를 제외한 부분을 클릭시 취소
window.onclick = function(){
	if(event.target == modal){
	modal.style.display="none";
}
}
