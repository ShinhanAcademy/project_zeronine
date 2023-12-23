$(".close_btn").click(function(){
	$("#detail_modal_wrap").hide();
});

$(".update_btn").click(function(){
	location.href = path + "/myPage/subPage/chatListEdit.do?boardId=" + boardId;
});

$(".delete_btn").click(function(){

	var obj = {"boardId" : boardId};
	
	$.ajax({
						url : path + "/myPage/subPage/isDeleteChat.do",
						data : obj,
						type : "POST",
						success : function(result) {
							$("#delete_here").html(result);
						},
						error : function() {
							alert("에러입니다.");
						}
					});
});

if(isSuccess=="success"){
	$(".delete_btn").hide();
	$(".update_btn").hide();
	$(".join_btn").hide();
}