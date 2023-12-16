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