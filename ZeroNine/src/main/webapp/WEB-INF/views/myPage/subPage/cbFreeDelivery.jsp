<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="tbl_top_wrap">
	<div class="total_count">

		총 <span>${count}</span>건 &nbsp;[진행중]
	</div>
	<div class="delivery_kind">
		<span class="btn_deli" id="fastDelivery">즉배</span> <span>|</span> <span
			class="btn_deli on" id="freeDelivery">무배</span>
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
			<th>달성률</th>
			<th>게시글 제목</th>
			<th>게시일</th>
			<th>마감 기한</th>
			<th>더보기</th>
		</tr>
	</thead>
	<tbody>

		<c:forEach items="${info}" var="board" varStatus="status">
			<tr>
				<td>
					<div class="tbl_chart">
						<div class="pie-chart" value="${board.total/50000*100}">
							<span class="rate"> <fmt:formatNumber type="percent"
									maxIntegerDigits="3" value="${board.total/50000}" /></span>
						</div>
					</div>
				</td>
				<td class="td_font_title">${board.title}</td>
				<td class="td_font_upload">${board.uploadTime}</td>
				<td class="td_font_remain">${board.remainTime}</td>
				<td class="read_status"><input id="hiddenBoardId" type="hidden"
					value="${board.boardId}">
					<button class="freeBoardDetail">상세보기</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<br>
<br>
<div class="tbl_top_wrap">
	<div class="total_count">

		총 <span>${successCount}</span>건 &nbsp;[완료]
	</div>

</div>

<table class="tbl_chat_wrap">

	<colgroup>
		<col width="20%" />
		<col width="35%" />
		<col width="15%" />
		<col width="18%" />
		<col width="12%" />

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
		<c:forEach items="${successInfo}" var="board" varStatus="status">
			<tr>
				<td>
					<div class="tbl_chart">
						<div class="pie-chart" value="${board.total/50000*100}">
							<span class="rate"> <fmt:formatNumber type="percent"
									maxIntegerDigits="3" value="${board.total/50000}" /></span>
						</div>
					</div>
				</td>
				<td class="td_font_title">${board.title}</td>
				<td class="td_font_upload">${board.uploadTime}</td>
				<td class="td_font_remain">${board.remainTime}</td>
				<td class="read_status">
					<input id="hiddenBoardId" type="hidden" value="${board.boardId}"> 
					<input id="hiddenIsSuccess" type="hidden" value="success">
					<button class="freeBoardDetail">상세보기</button>
					<p id="isSuccess">공구 성공</p>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script src="${path}/js/myPage/createdBoard.js" type="text/javascript"></script>
