<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="tbl_top_wrap">
	<div class="total_count">

		총 <span>${count}</span>건
	</div>
	<div class="delivery_kind">
		<span class="btn_deli on" id="fastDelivery">즉배</span> <span>|</span> <span
			class="btn_deli" id="freeDelivery">무배</span>
	</div>
	<div class="btn_wrap">
		<button class="btn_more">채팅방으로 가기 ></button>
	</div>
</div>
<table class="tbl_chat_wrap">

	<colgroup>
		<col width="20%" />
		<col width="35%" />
		<col width="15%" />
		<col width="18%" />
		<col width="12%" />
		<!-- 
							    <col />
							    <col span="2" class="batman" />
							    <col span="2" class="flash" />
							    -->
	</colgroup>
	<thead>
		<tr>
			<th>상품</th>
			<th>게시글 제목</th>
			<th>게시일</th>
			<th>마감 기한</th>
			<th>더보기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${info}" var="board">
			<tr>
				<td><img class="product_image" src="${board.imagePath}"></td>
				<td class="td_font_title">${board.title}</td>
				<td class="td_font_upload">${board.uploadTime}</td>
				<td class="td_font_remain">${board.remainTime}</td>
				<td class="read_status"><input id="hiddenBoardId" type="hidden"
					value="${board.boardId}">
					<button class="boardDetail">상세보기</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script src="${path}/js/myPage/likeBoard.js" type="text/javascript"></script>