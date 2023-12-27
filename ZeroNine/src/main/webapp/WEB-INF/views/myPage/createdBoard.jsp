<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/createdBoard.css">
<link rel="stylesheet" href="${path}/css/myPage/cBdetailView.css" />
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<!-- zero_container -->
	<div class="zero_container zn_center">
		<!-- mypage_container -->
		<div class="mypage_container">
			<!-- zero_sbn -->
			<%@include file="common/myPageSnb.jsp" %>
			<!-- //zero_sbn -->
			<!-- mypage_detail_wrap -->
			<div class="mypage_detail_wrap">
	            <!-- my_info_wrap -->
	            <div id="personalInfo" class="my_info_wrap">
				</div>
	            <!-- //my_info_wrap -->
				<!-- contents_wrap -->
				<div class="contents_wrap">
					<div class="con_tit">내가 쓴 게시글</div>
					<%-- has_line --%>
					<!-- contents -->
					<div class="contents">
						<div class="tbl_wrap">
						
						<div id="hereContents">
							<div class="tbl_top_wrap">
								<div class="total_count">
								
									 총 <span>${count}</span>건 &nbsp[진행중]
								</div>
								<div class="delivery_kind">
								<span class="btn_deli on" id="fastDelivery">즉배</span>
								<span>|</span>
								<span class="btn_deli" id="freeDelivery">무배</span>
								</div>
								
							</div>
							
							<table class="tbl_chat_wrap">
							
								<colgroup>
									<col width="20%" />
									<col width="35%" />
									<col width="15%" />
									<col width="18%" />
									<col width="12%" />
									
								</colgroup>
								<thead>
									<tr>
										<th>상품</th>
										<th>게시글 제목</th>
										<th>게시일</th>
										<th>마감 기한</th>
										<th>더보기</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${info}" var="board">
								<tr>
										<td><img class="product_image" src="${board.imagePath}"></td>
											<td class="td_font_title">${board.title}</td>
											<td class="td_font_upload">${board.uploadTime}</td>
											<td class="td_font_remain">${board.remainTime}</td>
											<td class="read_status">
										<input id="hiddenBoardId" type="hidden" value="${board.boardId}">
										<button class="boardDetail">상세보기</button>	
										</td>
									</tr>
									</c:forEach>
								</tbody>	
							</table>
							<br><br>
							<div class="tbl_top_wrap">
								<div class="total_count">
								
									 총 <span>${successCount}</span>건 &nbsp[완료]
								</div>
								
							</div>
							
							<table class="tbl_chat_wrap">
							
								<colgroup>
									<col width="20%" />
									<col width="35%" />
									<col width="15%" />
									<col width="18%" />
									<col width="12%" />
									
								</colgroup>
								<thead>
									<tr>
										<th>상품</th>
										<th>게시글 제목</th>
										<th>게시일</th>
										<th>마감 기한</th>
										<th>더보기</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${successInfo}" var="board">
								<tr>
										<td><img class="product_image" src="${board.imagePath}"></td>
											<td class="td_font_title">${board.title}</td>
											<td class="td_font_upload">${board.uploadTime}</td>
											<td class="td_font_remain">${board.remainTime}</td>
											<td class="read_status">
										<input id="hiddenBoardId" type="hidden" value="${board.boardId}">
										<input id="hiddenIsSuccess" type="hidden" value="success">
										<button class="boardDetail">상세보기</button>	
										<p id="isSuccess">공구 성공</p>
										</td>
									</tr>
									</c:forEach>
								</tbody>	
							</table>
							
							</div>
							
						</div>
						<!-- //chat_list -->
					</div>
					<!-- //contents -->
				</div>
				<!-- //contents_wrap -->
			</div>
			<!-- //mypage_detail_wrap -->
		</div>
		<!-- //mypage_container -->
	</div>
	<!-- //zero_container -->
	<div id="here"></div>
	<%@include file="../common/footer.jsp"%>
	<script>
	var path = "${path}";
	
	</script>
	<script src="${path}/js/myPage/createdBoard.js" type="text/javascript"></script>
</body>
</html>