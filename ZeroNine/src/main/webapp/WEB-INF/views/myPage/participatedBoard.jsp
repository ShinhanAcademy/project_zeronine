<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<link rel="stylesheet" href="${path}/css/myPage/participatedBoard.css">
<link rel="stylesheet" href="${path}/css/myPage/pBdetailView.css" />
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
	            <div id="personalInfo" class="my_info_wrap">
				</div>
	            <!-- //my_info_wrap -->
	            <!-- contents_wrap -->
	            <div class="contents_wrap">
	                <div class="con_tit">내가 참여한 게시글</div> <%-- has_line --%>
	                <!-- contents -->
	                <div class="contents">
						<div class="tbl_wrap">
						
						<div id="hereContents">
						<div id ="hereContents1">
							
							
							</div>
							<br><br>
							<div id="hereContents2">
							
							</div>
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
	<%@include file="../common/footer.jsp" %>
	<script>
	var path = "${path}";
	$(function(){
		callFastDelivery();
		callSuccessFastDelivery();
    });
	</script>
	<script src="${path}/js/myPage/participatedBoard.js" type="text/javascript"></script>
</body>
</html>