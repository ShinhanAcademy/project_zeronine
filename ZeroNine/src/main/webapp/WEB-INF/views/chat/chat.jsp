<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet" href="${path}/css/chat/chat.css">
<script defer src="${path}/css/chat/chat.js"></script>
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<%-- zero_container --%>
	<div class="zero_container zn_center">
		<%-- chat_container --%>
		<div class="chat_container">
			<div class="title">채팅목록</div>
			<%-- chat_wrap --%>
			<div class="chat_wrap">
				<%-- chat_list --%>
				<div class="chat_list">
					<%-- chat_list_inner --%>
					<div class="chat_list_inner">
						<c:forEach begin="1" end="10">
							<div class="chat_unit on">
								<div class="profile img_wrap">
									<img src="${path}/images/mypage/img_chat_profile.png"
										alt="profile image" />
								</div>
								<div class="info">
									<div class="user_info">
										<div class="name">콩순이</div>
										<span>파리바게뜨 서교점</span>
									</div>
									<div class="message">
										안녕하세요~!! <br> Lorem ipsum dolor sit amet, consectetur
										adipiscing elit. Nulla mattis, lorem condimentum ullamcorper
										dictum, nulla enim malesuada mi, vel luctus felis eros id
										risus. Pellentesque porttitor luctus risus id facilisis.
										Vivamus pharetra at sapien ut lacinia. Nulla vel ultrices
										nisl, vel hendrerit elit. Donec congue velit in velit
										hendrerit blandit. Nulla vehicula lorem ut ante pharetra
										ultrices ac a lorem. Proin ut felis eget risus fermentum
										tempor vel eget quam. Nam lobortis nulla quis felis sodales
										fermentum et imperdiet arcu. Vivamus rhoncus ac lorem a
										vehicula. Praesent leo lorem, ornare dictum magna quis,
										malesuada commodo orci. Fusce metus neque, vulputate eu
										malesuada nec, iaculis vel nisl. Nunc feugiat ut ligula eu
										lacinia. Etiam in eros tellus.
									</div>
									<div class="deadline">D-6 (11/29 23:59까지)</div>
								</div>
								<div class="product img_wrap">
									<img src="${path}/images/mypage/img_product_03.png"
										alt="product image" />
								</div>
								<!-- <div class="read_status">1</div> -->
							</div>
							<div class="chat_unit">
								<div class="profile img_wrap">
									<img src="${path}/images/mypage/img_chat_profile.png"
										alt="profile image" />
								</div>
								<div class="info">
									<div class="user_info">
										<div class="name">모찌</div>
										<span>파리바게뜨 서교점</span>
									</div>
									<div class="message">안녕하세요~!! Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Nulla mattis, lorem condimentum
										ullamcorper dictum, nulla enim malesuada mi, vel luctus felis
										eros id risus. Pellentesque porttitor luctus risus id
										facilisis. Vivamus pharetra at sapien ut lacinia. Nulla vel
										ultrices nisl, vel hendrerit elit. Donec congue velit in velit
										hendrerit blandit. Nulla vehicula lorem ut ante pharetra
										ultrices ac a lorem. Proin ut felis eget risus fermentum
										tempor vel eget quam. Nam lobortis nulla quis felis sodales
										fermentum et imperdiet arcu. Vivamus rhoncus ac lorem a
										vehicula. Praesent leo lorem, ornare dictum magna quis,
										malesuada commodo orci. Fusce metus neque, vulputate eu
										malesuada nec, iaculis vel nisl. Nunc feugiat ut ligula eu
										lacinia. Etiam in eros tellus.</div>
									<div class="deadline">D-6 (11/29 23:59까지)</div>
								</div>
								<div class="product img_wrap">
									<img src="${path}/images/board/product2.png"
										alt="product image" />
								</div>
								<div class="read_status">NEW</div>
							</div>
						</c:forEach>
					</div>
					<%-- //chat_list_inner --%>
				</div>
				<%-- //chat_list --%>
				<div class="chat_detail_info">
					<div class="user_name">콩순이</div>
					<div class="product_info">
						<div class="product img_wrap">
							<img src="${path}/images/mypage/img_product_03.png"
								alt="product image" />
						</div>
						<div>
							<div class="brand_name">
								마녀공장
							</div>						
							<div class="prouct_tit">
								[1+1] 판테토인 에센스 토너 200ml
							</div>						
						</div>
					</div>
					<%-- chat_room_list --%>
					<div class="chat_room_list">
						<%-- chat_room_inner --%>
						<div class="chat_room_inner">
							<div class="date">
								<span>2022-01-01</span>
							</div>
							<c:forEach begin="1" end="10">
								<div class="talk other_talker">
									<div class="profile img_wrap">
										<img src="${path}/images/mypage/img_chat_profile.png"
											alt="profile image" />
									</div>
									<div class="msg">
										안녕하세요 같이 구매 원합니당.
									</div>
								</div>
								<div class="talk other_talker">
									<div class="msg">
										몇시 가능할까요?
									</div>
								</div>
								<div class="talk my_talk">
									<div class="msg">
										네넵
									</div>
								</div>
								<div class="talk my_talk">
									<div class="msg">
										저는 지금 앞이에요 ~!!
									</div>
								</div>
							</c:forEach>
							<div class="date">
								<span>2022-01-01</span>
							</div>
							<div class="talk other_talker">
								<div class="msg">
									몇시 가능할까요?
								</div>
							</div>
							<div class="talk my_talk">
								<div class="msg">
									네넵
								</div>
							</div>
							<div class="talk my_talk">
								<div class="msg">
									저는 지금 앞이에요 ~!!
								</div>
							</div>
						</div>
						<%-- //chat_room_inner --%>
					</div>
					<%-- //chat_room_list --%>
				</div>
			</div>
			<%-- //chat_wrap --%>
		</div>
		<%-- //chat_container --%>
	</div>
	<%-- //zero_container --%>
	<%@include file="../common/footer.jsp"%>
</body>
</html>