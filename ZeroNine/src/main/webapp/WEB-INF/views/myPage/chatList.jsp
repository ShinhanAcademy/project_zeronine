<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/chat_list.css">
<link rel="stylesheet" href="${path}/css/myPage/chatDetailView.css">
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp" %>
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
				<%@include file="common/mylInfo.jsp" %>
	            <!-- //my_info_wrap -->
	            <!-- contents_wrap -->
	            <div class="contents_wrap">
	                <div class="con_tit">채팅 목록</div> <%-- has_line --%>
	                <!-- contents -->
	                <div class="contents">
	                    <div class="chatlist_wrap">
	                    
	                    <div id="hereContents">
		                    <div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>${count}</span>건 &nbsp[진행중]
		                    	</div>
		                    	
		                    	<div class="chat_kind">
								<span class="btn_deli on" id="author_chat">작성자</span>
								<span>|</span>
								<span class="btn_deli" id="participant_chat">참여자</span>
								</div>
		                    	
		                    	<div class="btn_wrap">
		                    		<button class="btn_more">채팅방으로 가기 &gt;</button>
		                    	</div>
	                    	</div>
		                    <div class="tbl_wrap">
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
		                    				<td><img class="product_image" src="${board.oBoardImagePath}"></td>
		                    				<td class="td_font_title">${board.oTitle}</td>
		                    				<td class="td_font_upload">${board.uploadTime}</td>
		                    				<td class="td_font_remain">${board.remainTime}</td>
		                    				<td class="read_status">
		                    				<input id="hiddenBoardId" type="hidden" value="${board.oBoardId}">
											<button class="boardDetail">상세보기</button>	
		                    				</td>
		                    			</tr>
		                    			</c:forEach>
		                    		</tbody>
		                    	</table>
		                    	</div>
		                    	<br><br>
		                    	<div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>${successCount}</span>건 &nbsp[완료]
		                    	</div>
		                    	
	                    	</div>
		                    <div class="tbl_wrap">
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
		                    				<td><img class="product_image" src="${board.oBoardImagePath}"></td>
		                    				<td class="td_font_title">${board.oTitle}</td>
		                    				<td class="td_font_upload">${board.uploadTime}</td>
		                    				<td class="td_font_remain">${board.remainTime}</td>
		                    				<td class="read_status">
		                    				<input id="hiddenBoardId" type="hidden" value="${board.oBoardId}">
											<button class="boardDetail">상세보기</button>	
											<input id="hiddenIsSuccess" type="hidden" value="success">
											<p id="isSuccess">공구 성공</p>
		                    				</td>
		                    			</tr>
		                    			</c:forEach>
		                    		</tbody>
		                    	</table>
		                    	</div>
		                    </div>
	          
							
	                    </div>
	                    <!-- //chatlist_wrap  -->
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
	<%@include file="../common/footer.jsp" %>
	<script>
	var path = "${path}";
	</script>
	<script src="${path}/js/myPage/chatList.js" type="text/javascript"></script>
</body>
</html>