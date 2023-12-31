<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						src="${detail.imagePath}">

					<div class="detail_pro_detail">
						<p class="title"> ${detail.title} </p>
						<hr>
						<ul>
							<li><img class="cart" src="${path}/images/common/cart.png">
								<span> ${detail.brand}   /   ${detail.pName}</span></li>
							<li><img class="box" src="${path}/images/board/box.png">
								<span> ${detail.pCount - detail.totalpickCount} 남음 </span></li>
							<li><img class="card" src="${path}/images/board/card.png">
								<span> <fmt:formatNumber value="${detail.price/(detail.pCount - detail.pickCount)}" type="number"/>원  </span></li>
							<li><img class="clock" src="${path}/images/board/clock.png">
								 <fmt:parseDate value="${detail.finishTime}" var="parsedDate" pattern="yyyy-MM-dd HH:mm"/> 
									<span> <fmt:formatDate value="${parsedDate}" pattern="YY년 MM월 dd일 HH:mm" /> 까지 </span></li>
						</ul>
						<hr>
						<p class="content"> ${detail.boardContent} </p>
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