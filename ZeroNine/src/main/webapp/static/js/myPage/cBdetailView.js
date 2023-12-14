$("#close_btn").click(function(){
	$("#detail_modal_wrap").hide();
});

if(participant>1){
	$(".delete_btn").hide();
}

if(participant>1){
	$(".freeDelete_btn").hide();
}

$(".update_btn").click(function(){
	location.href = path + "/myPage/subPage/cbFastboardEdit.do?boardId=" + boardId + "&participant=" + participant;
});


