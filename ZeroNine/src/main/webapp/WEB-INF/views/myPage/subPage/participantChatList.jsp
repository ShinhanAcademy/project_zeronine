<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="tbl_top_wrap">
	<div class="total_count">
		총 <span>${participantCount}</span>건 &nbsp[진행중]
	</div>

	<div class="chat_kind">
		<span class="btn_deli" id="author_chat">작성자</span> <span>|</span> <span
			class="btn_deli on" id="participant_chat">참여자</span>
	</div>

	<div class="btn_wrap">
		<button class="btn_more">채팅방으로 가기 &gt;</button>
	</div>
</div>
<div class="tbl_wrap">
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
			<c:forEach items="${partiInfo}" var="board">
				<tr>
					<td><img class="product_image" src="${board.oBoardImagePath}"></td>
					<td class="td_font_title">${board.oTitle}</td>
					<td class="td_font_upload">${board.uploadTime}</td>
					<td class="td_font_remain">${board.remainTime}</td>
					<td class="read_status"><input id="hiddenBoardId"
						type="hidden" value="${board.oBoardId}">
						<button class="participantChatDetail">상세보기</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<c:if test="${participantCount != 0}">
	<div class=pagination>
		<div class="pageLeft">
			<c:choose>
				<c:when test="${particiPaging.pageNumber<=1}">
					<button class="btnFirst" disabled="disabled">첫페이지</button>
				</c:when>
				<c:otherwise>
					<button class="btnFirst" id="btnFirst"
						onclick="javascript:participantList(1)">첫페이지</button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${particiPaging.pageNumber<=1}">
					<button class="btnPrev" disabled="disabled">이전페이지</button>
				</c:when>
				<c:otherwise>
					<button class="btnPrev" id="btnPrev"
						onclick="javascript:participantList(${particiPaging.pageNumber-1})">이전페이지</button>
				</c:otherwise>
			</c:choose>
		</div>
		<ul class="pagingWrap">
			<c:forEach begin="${particiPaging.startPageNumber}"
				end="${particiPaging.endPageNumber}" var="i" step="1">
				<li><a href="javascript:participantList(${i})">${i}</a></li>
			</c:forEach>
		</ul>
		<div class="pageRight">
			<c:choose>
				<c:when
					test="${particiPaging.pageNumber==particiPaging.maxPageNumber}">
					<button class="btnNext" id="btnNext" disabled="disabled">다음페이지</button>
				</c:when>
				<c:otherwise>
					<button class="btnNext" id="btnNext"
						onclick="javascript:participantList(${particiPaging.pageNumber+1})">다음페이지</button>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when
					test="${particiPaging.pageNumber==particiPaging.maxPageNumber}">
					<button class="btnLast" disabled="disabled">마지막페이지</button>
				</c:when>
				<c:otherwise>
					<button class="btnLast" id="btnLast"
						onclick="javascript:participantList(${particiPaging.maxPageNumber})">마지막페이지</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</c:if>
<%-- </c:if> --%>
<!-- //pagination -->
<br>
<br>

<%-- <c:if test="${booklist.size() != 0}"> --%>


<script src="${path}/js/myPage/chatList.js" type="text/javascript"></script>