<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="detail_modal_wrap">

	<div id="detail_modal_body">
		<div class="detail_body">
			<button id="close_btn">
				<img src="${path}/images/common/close.png">
			</button>
			<div class="detail_chn_area">
				<img class="detail_img" src=${info.imagePath}>
				<div class="detail_pro_detail">
					<p class="title">${info.title}</p>
					<hr>
					<ul>
						<li><img class="cart" src="${path}/images/common/cart.png">
							<span>${info.pName}</span></li>
						<li><img class="user" src="${path}/images/board/user.png">
							<span> ${pCount}개 남음 </span></li>
						<li><img class="card" src="${path}/images/board/card.png">
							<span>${info.price}원 (개당) </span></li>
						<li><img class="clock" src="${path}/images/board/clock.png">
							<span>${info.finishTime}</span></li>
					</ul>
					<hr>
					<p class="content">${info.boardContent}</p>
				</div>
			</div>
			<div class="participate_btn_div">
				<button class="participate_btn">참여하기</button>
			</div>
		</div>
	</div>
</div>
<script>
	var path = "${path}";
	var boardId = "${info.boardId}"
</script>
<script src="${path}/js/myPage/cBdetailView.js" type="text/javascript"></script>
