<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="modal_wrap">
		<div id="modal_body">
		<c:if test="${email==null}">
			<p>이메일이 존재하지 않습니다.</p>		
			<p>회원가입해주세요.</p>		
		</c:if>
		<c:if test="${email!=null}">
			<p>${name}님의 이메일은</p>
			<p>${email}입니다.</p>
		</c:if>
			<button id="modal_btn">확인</button>
		</div>
</div>

<script>
$("#modal_btn").click(function(){
	location.href = path + "/auth/login.do";
})
</script>