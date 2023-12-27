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
	var isSuccess = $(this).closest('tr').find('#hiddenIsSuccess').val();

	var obj = {
				"boardId" : boardId,
				"isSuccess" : isSuccess
			};
	
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

$(".participantChatDetail").click(function(){

	var boardId = $(this).closest('tr').find('#hiddenBoardId').val();
	var isSuccess = $(this).closest('tr').find('#hiddenIsSuccess').val();

	var obj = {
				"boardId" : boardId,
				"isSuccess" : isSuccess
				};
	
		$.ajax({
					url : path + "/myPage/subPage/participantChatDetail.do",
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

$(".chatlist_wrap .btn_more").on("click", function(){
	console.log("customerId: "+customerId);
	if(customerId==""){
		alert("로그인한 후 이용해주세요.");
		location.href = "/auth/login.do";	
	}else{
		location.href = "/chat.do";
	}
});

