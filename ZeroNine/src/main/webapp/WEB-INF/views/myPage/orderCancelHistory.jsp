<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/order_history.css">
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<script defer src="${path}/js/myPage/orderCancelHistory.js"></script>
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
	                <div class="con_tit has_line">취소 / 반품 내역</div> <%-- has_line --%>
	                <!-- contents -->
	                <div class="contents">
	                	<!-- search_wrap -->
		                <div class="search_wrap">
		                	<div class="period">
		                		<span>구매 기간</span>
		                		<button class="on" data-period="1">1개월</button>
		                		<button data-period="3">3개월</button>
		                		<button data-period="6">6개월</button>
		                		<div class="calendar">
			                		<input type="text"
									    data-range="true"
									    data-multiple-dates-separator=" - "
	    								data-language="ko"
										id="datepicker"
									/>
		                		</div>
		                	</div>
		                	<div class="search_word">
		                		<span>검색어</span>
		                		<input type="text" placeholder="검색어를 입력하세요." />
		                		<button class="btn_search">검색</button>
		                	</div>
		                </div>
	                	<!-- //search_wrap -->
	                	<!-- orderhistory_wrap  -->
	                	<div id="cancel_history_wrapper" class="order_history_wrap">
	                	</div>
	                	<!-- //orderhistory_wrap  -->
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
	<%@include file="../common/footer.jsp" %>
</body>
</html>