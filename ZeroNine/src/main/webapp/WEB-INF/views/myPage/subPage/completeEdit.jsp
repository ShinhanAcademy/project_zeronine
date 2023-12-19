<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="com">
	<ul>
		<li class="title">
			<div>${message}</div>
		</li>
		<li class="btn">.
		<c:if test="${kind=='create'}">
		<button type="button" onclick="location.href='${path}/myPage/createdBoard.do'">내가 쓴 게시글</button>
		</c:if>
		<c:if test="${kind=='chat'}">
		<button type="button" onclick="location.href='${path}/myPage/chatList.do'">채팅목록</button>
		</c:if>
			
		</li>
	</ul>
</div>
