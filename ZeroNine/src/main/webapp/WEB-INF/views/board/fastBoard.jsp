<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>


<title>FastBoard</title>
<link rel="stylesheet" href="${path}/css/board/boardList.css" />
<script src="../js/like.js"></script>

</head>
<body>

	<div class="banner zn_center">
		<div style="width: 1440px">
			<img src="${path}/images/board/banner1.png" style="width: 100%">
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
						href="${path}/board/boardedit.do" data-value="fast_board">글쓰기</a>
					</span>
				</div>
			</div>
		</div>
		<div class="List">
		<div id="allList">
			<c:forEach items="${info}" var="info">
				<div id="list">
					<div class="pro_info">
						<ul>
							<li><img class="pro_img"
								src="${info.imagePath}"></li>
						</ul>


						<div class="pro_name">
							<ul>
								<li>${info.brand}</li>
								<li>${info.pName}</li>
							</ul>
						</div>
						<div class="pro_detail">
							<ul>
								<li><img class="user" src="${path}/images/board/box.png">
									<span> ${info.pCount - info.totalpickCount} 남음 </span></li>
								<li><img class="card" src="${path}/images/board/card.png">
									<span><fmt:formatNumber value="${(info.price/info.pCount)-((info.price/info.pCount)%10)}" type="number"/>원 </span> <span style="color: gray;">(개당)</span></li>
								<li><img class="clock" src="${path}/images/board/clock.png">
									<fmt:parseDate value="${info.finishTime}" var="parsedDate" pattern="yyyy-MM-dd HH:mm"/>
									<span><fmt:formatDate value="${parsedDate}" pattern="YY년 MM월 dd일 HH:mm" /> 까지 </span></li>
							</ul>
						</div>
						<ul>
							<li class="detail_view">
								<button class="like" type="button">
									<img class="like" src="${path}/images/board/heart.png">
								</button>
								<button id="fast_detail_btn" class="detail_btn" value="${info.boardId}" >보기</button>
							</li>
						</ul>
					</div>

				</div>
			</c:forEach>
		</div>
		<div id="modal"></div>
		</div>
	</div>


	<%@include file="../common/footer.jsp"%>
	<script src="../js/detailView.js"></script>
	
</body>
</html>

