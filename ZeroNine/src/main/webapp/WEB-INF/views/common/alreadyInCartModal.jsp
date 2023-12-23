<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="modal_wrap">
		<div id="modal_body">
		<span class="modal_text">동일한 상품이 장바구니에 존재합니다.
		</span>
		<span class="modal_text">장바구니로 이동하시겠습니까?</span>
		 <div class="modal_btnpart">
			<button id="modal_btn">이동</button>
			<button id="modal_btn1" onclick="esc_btn()">취소</button>
		</div>
		</div>
</div>

<script>
$("#modal_btn").click(function(){
	location.href = path + "/myPage/myCart.do";
	$("#modal").hide();
})
function esc_btn() {
  $("#modal").hide();
}

$(document).keydown(function(event) {
  if (event.keyCode == 27) {
    $("#modal").hide();
  }
});

</script>