<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/like_product.css">
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<script defer src="${path}/js/myPage/likeProduct.js"></script>
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
				<%@include file="common/personalInfo.jsp" %>
	            <!-- //my_info_wrap -->
	            <!-- contents_wrap -->
	            <div id="like_contents_wrap" class="contents_wrap">
	                <div class="con_tit has_line">찜한 상품</div>
	                <!-- contents -->
	                <div class="contents">
	                	<!-- search_wrap -->
	                	<div class="search_wrap">
		                	<div class="search_word">
		                		<input type="text" placeholder="상품명, 브랜드명을 입력하세요.">
		                		<button class="btn_search"></button>
		                	</div>
		                </div>
	                	<!-- //search_wrap -->
	                	<!-- like_product_wrap -->
	                	<div id="like_product_wrapper" class="like_product_wrap">
	                	</div>
	                	<!-- //like_product_wrap -->
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