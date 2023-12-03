<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/images/제로나인_로고.png"/>
<title>zeronine</title>
</head>
<body>
 <h1>안녕!!</h1>
 <p>${cpath}</p>
 <img src="../static/images/제로나인_로고.png">
</body>
</html>