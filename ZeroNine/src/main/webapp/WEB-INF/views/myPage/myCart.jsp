<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/my_cart.css">
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<script defer src="${path}/js/myPage/myCart.js"></script>
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
	            <div id="my_cart_wrapper" class="contents_wrap">
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