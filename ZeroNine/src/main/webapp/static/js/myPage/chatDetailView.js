$(".close_btn").click(function(){
	$("#detail_modal_wrap").hide();
});

$(".update_btn").click(function(){
	location.href = path + "/myPage/subPage/chatListEdit.do?boardId=" + boardId;
});

if(isSuccess=="success"){
	$(".delete_btn").hide();
	$(".update_btn").hide();
	$(".join_btn").hide();
}