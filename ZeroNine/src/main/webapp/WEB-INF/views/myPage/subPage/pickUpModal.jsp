<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${path}/css/detailView.css" />

<div id="modal_wrap">

		<div id="detailmodal_body">
			<div id="eco_detail_body" class="detail_body">
				<button id="eco_close_btn" class="close_btn" onclick="close_btn()">
					<img src="${path}/images/common/close.png">
				</button>
				<div class="detail_chn_area">
				<span>
					<img class="detail_img"
						src="${pickUp.pickUpImagePath}">
				</span>
					<div id="eco_detail_pro_detail" class="detail_pro_detail" >
						<p id="eco_title" class="title" > ${pickUp.message} </p>
						<hr>
						<ul>
							<li><img class="clock" src="${path}/images/board/clock.png">
									<span class="pickuptime"> </span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
var time=now.getFullYear()+"년 "+c_month+"월 "+now.getDate()+"일 "+now.getHours()+"시"+now.getMinutes()+"분";
console.log(time) 
$(".pickuptime").append(time+" 방문"); 

function close_btn(){
	$("#modal_wrap").hide();
}

function esc_btn() {
  $("#modal").hide();
}

$(document).keydown(function(event) {
  if (event.keyCode == 27) {
    $("#modal").hide();
  }
});

window.onclick = function(event){
	if($(event.target).is("#modal_wrap")){
		$("#modal_wrap").hide();
	}
}

</script>