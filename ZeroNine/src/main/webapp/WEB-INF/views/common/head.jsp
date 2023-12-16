<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- functions lib --%>
<c:set var="path" scope="application" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${path}/images/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${path}/images/favicon/favicon.ico" type="image/x-icon">
    <!-- css lib -->
    <link rel="stylesheet" href="${path}/css/csslib/datepicker.min.css">
    <!-- js lib -->
    <script src="${path}/js/jslib/jquery-3.7.1.min.js"></script>
  	<script src="${path}/js/jslib/datepicker.min.js"></script>
    <script src="${path}/js/jslib/i18n/datepicker.ko.js"></script>
    <link rel="stylesheet" href="${path}/css/common/common.css">
    <script defer src="${path}/js/common/common.js"></script>
    <script>
    	let contextPath = "${path}";
	</script>
    