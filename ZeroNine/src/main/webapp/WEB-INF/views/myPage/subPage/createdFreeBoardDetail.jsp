<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="detail_modal_wrap">

	<div id="detail_modal_body">
		<div class="detail_body">
			<button id="close_btn">
				<img src="${path}/images/common/close.png">
			</button>
			<div class="detail_chn_area">
				<div class="tbl_chart" id="t_chart">
						<div class="pie-chart" id="chart" value="${info.total/50000*100}"> 
							<span class="rate" id="ra">
							<fmt:formatNumber type="percent"
								maxIntegerDigits="3" value="${info.total/50000}" /></span>
						</div>
					</div>
				<div class="detail_pro_detail">
					<p class="title">${info.title}</p>
					<hr>
					<ul>
						<li><img class="graph" src="${path}/images/board/graph.png">
							<span><fmt:formatNumber type="percent"
								maxIntegerDigits="3" value="${info.total/50000}" /></span></li>
						<li><img class="card" src="${path}/images/board/card.png">
							<span><fmt:formatNumber type="number" value="${50000-info.total}" />원 남음</span></li>
						<li><img class="clock" src="${path}/images/board/clock.png">
							<span>${info.finishTime}까지</span></li>
					</ul>
					<hr>
					<p class="content">${info.boardContent}</p>
				</div>
			</div>

			<div class="update_btn_div">
				<button class="freeDelete_btn">삭제하기</button>
				<button class="freeUpdate_btn">수정하기</button>
			</div>
		</div>
	</div>
</div>
<script>
	var path = "${path}";
	var participant = "${participant}";
	var boardId = "${info.boardId}";
</script>
<script src="${path}/js/myPage/cBdetailView.js" type="text/javascript"></script>
