<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/detailView.css" />
</head>
<body>
	<div id="detail_modal_wrap">

		<div id="detail_modal_body">
			<div class="detail_body">
				<button class="close_btn" onclick="close_btn()">
					<img src="${path}/images/common/close.png">
				</button>
				<div class="detail_chn_area">
					<img class="detail_img"
						src="https://zeronine.s3.ap-northeast-2.amazonaws.com/test.jpg">

					<div class="detail_pro_detail">
						<p class="title">토너 같이 사실 분~~~~~</p>
						<hr>
						<ul>
							<li><img class="cart" src="${path}/images/common/cart.png">
								<span> 마녀공장 [1+1] 판테토인 에센스 토너 200ml </span></li>
							<li><img class="user" src="${path}/images/board/user.png">
								<span> 1명 모집 </span></li>
							<li><img class="card" src="${path}/images/board/card.png">
								<span> 16,640원 </span></li>
							<li><img class="clock" src="${path}/images/board/clock.png">
								<span> 23.11.30 23:59까지 </span></li>
						</ul>
						<hr>
						<p class="content">저는 하나만 필요합니당 같이 사실 분 찾아요!!!</p>
					</div>
				</div>
				<div class="join_btn_div">
					<button class="join_btn">참여하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>