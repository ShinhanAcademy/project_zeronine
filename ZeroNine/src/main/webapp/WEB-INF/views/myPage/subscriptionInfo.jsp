<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
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
	                <div class="con_tit">구독 정보</div> <%-- has_line --%>
	                <!-- contents -->
	                <div class="contents">
	                    <div class="tbl_wrap">
		                    <div class="tbl_top_wrap">
		                    	<div class="total_count">
									총 <span>${count}</span>건
		                    	</div>
		                    	
	                    	</div>
	                    	<table class="tbl_chat_wrap">
							  <colgroup>  	
							    <col width="8%" />
							    <col width="40%" />
							    <col span="3" />
							  </colgroup>
	                    		<thead>
	                    			<tr>
	                    				<th>NO</th>
	                    				<th>제로나인 구독권</th>
	                    				<th>구독 날짜</th>
	                    				<th>남은 쿠폰 개수</th>
	                    				<th>다음 결제 안내</th>
	                    			</tr>
	                    		</thead>
	                    		<tbody>
	                    		<c:forEach items="${info}" var="subscription" varStatus="index">
	                    			<tr>
	                    				<td>${index.count}</td>
	                    				<td>${subscription.name}</td>
	                    				<td>${subscription.startDateTime}</td>
	                    				<td>${subscription.remainingCouponCount}</td>
	                    				<td>${subscription.after}</td>
	                    			</tr>
	                    		</c:forEach>	
	                    		</tbody>
	                    	</table>
		                    
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
	<%@include file="../common/footer.jsp" %>
</body>
</html>