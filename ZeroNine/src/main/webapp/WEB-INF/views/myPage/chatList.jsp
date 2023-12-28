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
				<%@include file="common/personalInfo.jsp" %>
	            <!-- //my_info_wrap -->
	            <!-- contents_wrap -->
	            <div class="contents_wrap">
	                <div class="con_tit">채팅 목록</div> <%-- has_line --%>
	                <!-- contents -->
	                <div class="contents">
	                    <div class="chatlist_wrap">
	                    <div id="hereContents">   	
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
	var customerId = "${customerId}"
		$(function(){
	    	callChatList();
	    });

	</script>
	<script src="${path}/js/myPage/chatList.js" type="text/javascript"></script>
</body>
</html>