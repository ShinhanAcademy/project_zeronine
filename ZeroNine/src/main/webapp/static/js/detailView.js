//fast_board
$(".detail_btn").on("click",
function f_btn(){
	var board_id = $(this).val();
	console.log(board_id);
	
	
	$.ajax({
		type : "post",
		url : "/board/fastboardDetail.do",
		data: {boardId : board_id},
		success: function(response){
	
			$("#modal").html(response);
			$("#detail_modal_wrap").css("display","flex");
			esc_btn();
			
		},
		error: function(error) {
		alert("해당 글은 더 이상 존재하지 않습니다.");
		}
	});
});

//free_delivery
function fd_btn(){
	$("#detail_modal_wrap").css("display","flex");
}

//one_to_one_board
$(".detail_btn").on("click",
function o_btn(){
	var board_id = $(this).val();
	console.log(board_id);

	$.ajax({
		type : "post",
		url : "/board/oneboardDetail.do",
		data: {boardId : board_id},
		success: function(response){
		
		console.log(response);
			$("#modal").html(response);
			$("#detail_modal_wrap").css("display","flex");
			esc_btn();
		},
		error: function(error) {
		alert("해당 글은 더 이상 존재하지 않습니다.");
		}
	});
});


//esc function
function esc_btn(){
	$(document).keydown(function(event){
		if(event.keyCode == 27){
		$("#detail_modal_wrap").hide();
		}
	})
}



//close
function close_btn(){
	$("#detail_modal_wrap").hide();
}

//modal_body 를 제외한 부분을 클릭시 취소
window.onclick = function(event){
	if($(event.target).is("#detail_modal_wrap")){
		$("#detail_modal_wrap").hide();
	}
}
