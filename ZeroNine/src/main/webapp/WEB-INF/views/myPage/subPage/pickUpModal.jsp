<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="modal_wrap">
		<div id="detailmodal_body">
		<div class="modal_img">
		<img src="${pickUp.pickUpImagePath }">
		</div>
		<div>
		<span class="modal_text">${pickUp.isFoodWaste}
		</span>
		<span class="modal_text">${pickUp.message }</span>
		 
		 <div class="modal_btnpart">
			<button id="modal_btn1" onclick="esc_btn()">나가기</button>
		</div>
		</div>
		</div>
</div>

<script>

function esc_btn() {
  $("#modal").hide();
}

$(document).keydown(function(event) {
  if (event.keyCode == 27) {
    $("#modal").hide();
  }
});

window.onclick = function(event){
	if($(event.target).is("#detail_modal_wrap")){
		$("#detail_modal_wrap").hide();
	}
}

</script>