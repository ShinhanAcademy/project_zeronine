<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="delete_modal_wrap">
		<div id="delete_modal_body">
			<p>게시물을 정말 삭제하시겠습니까?</p>
			<div id="delete_modal_btn">
			<button id="delete_btn_cancel">취소</button>
			<button id="delete_btn_check">확인</button>
			</div>
		</div>
</div>

<script>
$("#delete_btn_cancel").click(function(){
	$("#delete_modal_wrap").css("display","none");
});

$("#delete_btn_check").click(function(){
	var obj = {	"boardId" : "${boardId}" };
	
	$.ajax({
				url : "${path}/myPage/subPage/deleteChat.do",
				data : obj,
				type : "POST",
				success : function(result) {
					if(result>0){
						alert("게시물이 정상적으로 삭제되었습니다.");
						location.href = "${path}/myPage/chatList.do";
					}else{
						alert("게시물을 다시 삭제해주세요.");
					}
				},
				error : function() {
					alert("에러입니다.");
				}
			});
})

</script>