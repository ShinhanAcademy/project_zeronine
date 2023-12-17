<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="delivery_modal_wrap">
	<div class="dimmed">
	</div>
		<div class="modal_contents">
			<button class="btn_close">close</button>
			<div class="title has_line">배송 조회</div>
			<div class="delivery_status">
				<div class="bg"></div>
				<div class="progress_info">
					<div class="img_wrap progress">
						<%-- <img src="${path}/images/mypage/img_delivery_ready.png" alt="delivery progress image"> --%>
						<img src="${path}/images/mypage/img_delivery_ready_on.png"
							alt="delivery progress image">
					</div>
					<div class="img_wrap progress">
						<img src="${path}/images/mypage/img_delivery_sending.png"
							alt="delivery progress image">
						<%-- <img src="${path}/images/mypage/img_delivery_sending_on.png" alt="delivery progress image"> --%>
					</div>
					<div class="img_wrap progress">
						<img src="${path}/images/mypage/img_delivery_complete.png"
							alt="delivery progress image">
						<%-- <img src="${path}/images/mypage/img_delivery_complete.png" alt="delivery progress image"> --%>
					</div>
				</div>
			</div>
			<div class="delivery_info">
				<div class="delivery_tit">배송 정보</div>
				<div class="delivery_detail">
					<div class="detail_inner">
						<div>
							<span>배송 예정일</span><span>2023.11.29</span>
						</div>
						<div>
							<span>운송장번호</span><span>571138547620</span>
						</div>
						<div>
							<span>택배사</span><span>슝슝통운</span>
						</div>
						<div>
							<span>택배기사님</span><span>동작_관</span>
						</div>
					</div>
					<div class="delivery_tip">ZeroNine에서 직접 배송하는 상품입니다.</div>
				</div>
			</div>
		</div>
</div>