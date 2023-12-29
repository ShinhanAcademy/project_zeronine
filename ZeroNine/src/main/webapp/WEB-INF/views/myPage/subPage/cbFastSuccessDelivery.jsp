<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
							<div class="tbl_top_wrap">
								<div class="total_count">
								
									 총 <span>${successCount}</span>건 &nbsp[완료]
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
								<c:forEach items="${successInfo}" var="board">
								<tr>
										<td><img class="product_image" src="${board.imagePath}"></td>
											<td class="td_font_title">${board.title}</td>
											<td class="td_font_upload">${board.uploadTime}</td>
											<td class="td_font_remain">${board.remainTime}</td>
											<td class="read_status">
										<input id="hiddenBoardId" type="hidden" value="${board.boardId}">
										<input id="hiddenIsSuccess" type="hidden" value="success">
										<button class="boardDetail">상세보기</button>	
										<p id="isSuccess">공구 성공</p>
										</td>
									</tr>
									</c:forEach>
								</tbody>	
							</table>
							
								<c:if test="${successCount != 0}">
		<div class=pagination>
			<div class="pageLeft">
				<c:choose>
					<c:when test="${myWritePaging.pageNumber<=1}">
						<button class="btnFirst" disabled="disabled">첫페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnFirst" id="btnFirst"
							onclick="javascript:callFastSuccessDelivery(1)">첫페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${myWritePaging.pageNumber<=1}">
						<button class="btnPrev" disabled="disabled">이전페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnPrev" id="btnPrev"
							onclick="javascript:callFastSuccessDelivery(${myWritePaging.pageNumber-1})">이전페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
			<ul class="pagingWrap">
				<c:forEach begin="${myWritePaging.startPageNumber}"
					end="${myWritePaging.endPageNumber}" var="i" step="1">
					<li><a href="javascript:callFastSuccessDelivery(${i})">${i}</a></li>
				</c:forEach>
			</ul>
			<div class="pageRight">
				<c:choose>
					<c:when test="${myWritePaging.pageNumber==myWritePaging.maxPageNumber}">
						<button class="btnNext" id="btnNext" disabled="disabled">다음페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnNext" id="btnNext"
							onclick="javascript:callFastSuccessDelivery(${myWritePaging.pageNumber+1})">다음페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${myWritePaging.pageNumber==myWritePaging.maxPageNumber}">
						<button class="btnLast" disabled="disabled">마지막페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnLast" id="btnLast"
							onclick="javascript:callFastSuccessDelivery(${myWritePaging.maxPageNumber})">마지막페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</c:if>
	<%-- </c:if> --%>
	<!-- //pagination -->
<script src="${path}/js/myPage/createdBoard.js" type="text/javascript"></script>