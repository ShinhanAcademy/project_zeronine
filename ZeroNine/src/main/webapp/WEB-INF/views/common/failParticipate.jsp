
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../common/head.jsp"%>
<title>FastBoard</title>
<link rel="stylesheet" href="${path}/css/board/productOrderSuccess.css" />

</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="zero_container order_success_part ">
		<div class="os_part zn_center">
			<div class="os_part_text" >
				<span class="os_t">참여 실패</span>
			</div>
			<div class="os_info" style="text-align:center">
				<span class="os_info_t" style="font-family:'JUA'">게시글이 마감되어 참여에 실패했습니다</span>
			</div>
			<div class="orderlist-go">
				<button class="orderlist-btn" style="width:190px">게시글 목록</button>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	</body>
	<script>
		$(".orderlist-btn").click(function(){
			//location.href = "${path}/myPage/participatedBoard.do";
			location.href = "${path}/board/"
		});
		
	</script>
</html>