<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="detail_modal_wrap">

	<div id="detail_modal_body">
		<div class="detail_body">
			<button class="close_btn">
				<img src="${path}/images/common/close.png">
			</button>
			<div class="detail_chn_area">
				<img class="detail_img" src="${info.oBoardImagePath}">

				<div class="detail_pro_detail">
					<p class="title">${info.oTitle}</p>
					<hr>
					<ul>
						<li><img class="map_marker"
							src="${path}/images/board/map_marker.png"> <span>
								${info.address} ${info.addressDetail}</span></li>
						<li><img class="clock" src="${path}/images/board/clock.png">
							<span>${info.finishTime}까지</span></li>
					</ul>
					<hr>
					<p class="content">${info.oContent}</p>
				</div>
			</div>
			<div class="join_btn_div">
				<button class="delete_btn">삭제하기</button>
				<button class="update_btn">수정하기</button>
			</div>
		</div>
	</div>
</div>
<div id="delete_here"></div>
<script>
	var path = "${path}";
	var boardId = "${info.oBoardId}";
	var isSuccess = "${isSuccess}";
</script>
<script src="${path}/js/myPage/chatDetailView.js" type="text/javascript"></script>