<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="modal_wrap">
		<div id="modal_body">
		<c:if test="${pwd==null}">
			<p>인증에 실패했습니다.</p>		
			<p>다시 시도해주세요.</p>	
			<button id="modal_btn_fin1">확인</button>
		</c:if>
		<c:if test="${pwd!=null}">
			<p>${name}님의 비밀번호는</p>		
			<p>${pwd}입니다.</p>	
			<button id="modal_btn_fin2">확인</button>
		</c:if>
				
		</div>
			
</div>

<script>
var path = "${path}";

$("#modal_btn_fin1").click(function(){
	location.href = path + "/auth/login.do";
	
})

$("#modal_btn_fin2").click(function(){
	location.href = path + "/auth/login.do";
	
})
</script>