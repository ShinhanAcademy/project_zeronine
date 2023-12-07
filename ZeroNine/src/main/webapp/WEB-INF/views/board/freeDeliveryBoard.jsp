<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>


<title>FreeDeliveryBoard</title>
<link rel="stylesheet" href="${path}/css/board/boardList.css" />
<script src="${path}/js/chart.js"></script>
<script src="../js/like.js"></script>
</head>


<body>
	<div class="zero_container" style="padding-top: 120px;">
		<div class="banner zn_center">
			<div style="width: 1440px">
				<img src="${path}/images/board/banner2.png" style="width: 100%">
			</div>

			<!-- 데이터 연결해서 loop 도는지 확인하기 -->
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
					<div class="filter">
						<span> <img class="filter_img"
							src="${path}/images/board/filter.png">
						</span> <span style="font-size: 20px;"> 최신순 </span>
						<button type="button" class="filter_btn">
							<img src="${path}/images/board/expand_arrow.png">
						</button>
					</div>


					<div class="edit">
						<span> <img class="edit_img"
							src="${path}/images/board/edit.png">
						</span> <span class="edit_btn"> <a style="font-size: 25px;"
							href="${path}/board/boardEdit.do">글쓰기</a>
						</span>
					</div>
				</div>
			</div>
			<div id="allList">
				<div id="list">
					<div class="pro_info">
						<ul>
							<li class="rate_info">
								<div class="pie-chart">
									<span class="rate">80%</span>
								</div>
							</li>
							<%-- <img class="rate_img"
								src="${path}/images/board/rate.png">
								73%
								</li> --%>
						</ul>


						<div class="pro_name">
							<ul>
								<li>마녀공장</li>
								<li>[1+1] 판테토인 에센스 토너 200ml</li>
							</ul>
						</div>
						<div class="pro_detail">
							<ul>
								<li><img class="graph" src="${path}/images/board/graph.png">
									<span> 73% </span></li>
								<li><img class="card" src="${path}/images/board/card.png">
									<span> 16,640원 남음 </span></li>
								<li><img class="clock" src="${path}/images/board/clock.png">
									<span> 23.11.30 23:59까지 </span></li>

							</ul>
						</div>
						<ul>
							<li class="detail_view">
								<button class="like" type="button">
									<img class="like" src="${path}/images/board/heart.png">
								</button> 
								<a class="free_detail_btn" href="~~~참여하기 페이지로 이동~~~">참여하기</a>
							</li>
						</ul>
					</div>

				</div>

			</div>
		</div>
	</div>


	<%@include file="../common/footer.jsp"%>
</body>
</html>

