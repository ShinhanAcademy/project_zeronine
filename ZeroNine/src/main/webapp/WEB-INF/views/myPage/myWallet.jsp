<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${path}/images/zeronine_logo.png" />
<title>zeronine</title>
</head>
<body>
	<h1>안녕!!</h1>
	<p>${cpath}</p>
	<img src="${path}/images/zeronine_logo.png">
	<table border="1">
		<tr>
			<th>고객이름</th>
			<th>고객ID</th>
			<th>고객PW</th>
		</tr>
		<c:forEach items="${clist}" var="cust">
			<tr>
				<td>${cust.customerName}</td>
				<td>${cust.customerId}</td>
				<td>${cust.customerPassword}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>