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


$(".delete_btn").click(function(){

	var obj = {"boardId" : boardId};
	
	$.ajax({
						url : path + "/myPage/subPage/isDeleteBoard.do",
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

$(".freeUpdate_btn").click(function(){
	location.href = path + "/myPage/subPage/cbFreeboardEdit.do?boardId=" + boardId + "&participant=" + participant;
});

$(".freeDelete_btn").click(function(){

	var obj = {"boardId" : boardId};
	
	$.ajax({
						url : path + "/myPage/subPage/isDeleteBoard.do",
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