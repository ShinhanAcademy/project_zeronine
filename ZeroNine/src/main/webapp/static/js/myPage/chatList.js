$("#author_chat").click(function(){
	$.ajax({
					url : path + "/myPage/subPage/authorChatList.do",
					type : "GET",
					success : function(result) {
						$("#hereContents").html(result);					
					},
					error : function() {
						alert("에러입니다.");
					}
				});
});

$("#participant_chat").click(function(){
	$.ajax({
					url : path + "/myPage/subPage/participantChatList.do",
					type : "GET",
					success : function(result) {
						$("#hereContents").html(result);					
					},
					error : function() {
						alert("에러입니다.");
					}
				});
});

$(".boardDetail").click(function(){

	var boardId = $(this).closest('tr').find('#hiddenBoardId').val();

	var obj = {"boardId" : boardId};
	
		$.ajax({
					url : path + "/myPage/subPage/chatListDetail.do",
					data : obj,
					type : "GET",
					success : function(result) {
						$("#here").html(result);
					},
					error : function() {
						alert("에러입니다.");
					}
				});

});

$(".participantBoardDetail").click(function(){

	var boardId = $(this).closest('tr').find('#hiddenBoardId').val();

	var obj = {"boardId" : boardId};
	
		$.ajax({
					url : path + "/myPage/subPage/participantBoardDetail.do",
					data : obj,
					type : "GET",
					success : function(result) {
						$("#here").html(result);
					},
					error : function() {
						alert("에러입니다.");
					}
				});

});

