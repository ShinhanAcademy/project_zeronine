<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script>
	var rsp = sessionStorage.getItem("rsp");
	console.log(rsp[0]);
	console.log("rsp:", JSON.stringify(rsp, null, 2)); 
</script>

<meta charset="UTF-8">
<title>공동구매 참여 실패</title>
</head>
<body>
	<h1> 메~~~롱 ㅎ</h1>
	<div class="od_subtitle">결제금액</div>
	<div class="ob_subtext">
		<fmt:formatNumber value="${amount}" maxFractionDigits="3">
		</fmt:formatNumber>원
	</div>
	<h2> 날먹 햇지롱~ 환불 해줄까? </h2>
	
	<h1>
					
	</h1>
							
</body>
</html>