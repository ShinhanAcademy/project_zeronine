<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>


<title>OnetoOneBoard</title>
<link rel="stylesheet" href="${path}/css/board/boardList.css" />
<script src="../js/like.js"></script>
<script src="../js/detailView.js"></script>
</head>


<body>
	<div class="banner zn_center">

		<div style="width: 1440px">
			<img src="${path}/images/board/banner3.png"
				style="width: 100%; padding-top: 80px;">
		</div>

		<div class="search">
			<ul>
				<li>
					<div class="search_area">
						<input type="text" name="q" placeholder="상품명, 제조사 검색">
						<button type="submit"></button>
					</div>
				</li>
			</ul>
		</div>
		<div class="section zn_center">
			<div style="width: 1440px">
				<div id="filter">
					<span> <img class="filter_img"
						src="${path}/images/board/filter.png">
					</span> <select name="board_type" class="filter" onchange="boardType()">
						<option value="recent">최신순</option>
						<option value="imminent">임박순</option>
					</select>
				</div>


				<div class="edit">
					<span> <img class="edit_img"
						src="${path}/images/board/edit.png">
					</span> <span class="edit_btn"> <a style="font-size: 25px;"
						href="${path}/board/boardedit.do?boardType=oneTooneBoard" data-value="oneTooneBoard">글쓰기</a>
					</span>
				</div>
			</div>
		</div>
		<div id="allList">
		<c:forEach items="${infoOne}" var="oneInfo">
			<div id="list">
				<div class="pro_info">
					<ul>
						<li><img class="pro_img"
							src="${oneInfo.oBoardImageId}"></li>
					</ul>


					<div class="pro_name">
						<ul>
							<li>${oneInfo.oTitle}</li>
						</ul>
					</div>
					<div class="pro_detail">
						<ul>
							<li><img class="clock" src="${path}/images/board/clock.png">
								<fmt:parseDate value="${oneInfo.finishtime}" var="parseDate" pattern="HHmm" />
								<span><fmt:formatDate value="${parseDate}" pattern="HH시 mm분"/> 까지</span></li>
							<li><img class="map_marker"
								src="${path}/images/board/map_marker.png"> <span>
									여기에 주소 뿌리기 </span></li>
						</ul>
					</div>
					<ul>
						<li class="detail_view">
							<button class="like" type="button">
								<img class="like" src="${path}/images/board/heart.png">
							</button>
							<button id="one_detail_btn" class="detail_btn" onclick="o_btn()">보기</button>
						</li>
					</ul>
				</div>

			</div>
			</c:forEach>
		</div>
	</div>


	<%@include file="../common/footer.jsp"%>
	<%@include file="../common/detailView.jsp"%>
	<script src="../js/detailView.js"></script>
	<script>
		$("#detail_modal_wrap").hide();
	</script>
</body>
</html>

