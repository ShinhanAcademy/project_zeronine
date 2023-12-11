<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" scope="application" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/modal/findpwdmodal.css">
<span style='display: none'>no</span>
<div id="modal_wrap">

		<div id="modal_body">
			<p>해당하는 회원이 존재하지 않습니다.</p>		
			<p>회원가입해주세요.</p>	
			<button class="modal_btn_pwd">확인</button>	
		</div>
			
</div>

<script>
var path = "${path}";

$("#modal_btn_pwd").click(function(){
	location.href = path + "/auth/login.do";
})
</script>