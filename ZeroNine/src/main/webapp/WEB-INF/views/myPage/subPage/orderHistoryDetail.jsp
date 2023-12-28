<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- functions lib --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script defer src="/js/myPage/subPage/orderHistoryDetail.js"></script>
<div class="tbl_top_wrap">
	<div class="total_count">
		총 <span>${pageCount}</span>건
	</div>
</div>
<!-- tbl_wrap -->
<div class="tbl_wrap">
	<table class="tbl_orderlist_wrap">
		<colgroup>
			<col width="22%" />
			<col width="40%" />
			<col width="8%" />
			<col width="15%" />
			<col width="15%" />
		</colgroup>
		<thead>
			<tr>
				<th>주문 일자</th>
				<th>상품 정보</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${pageCount != 0}"> 
					<c:forEach items="${orderHistoryAll}" var="orderlist" varStatus="i">
					<c:if test="${orderlist.deliveryId eq prev_row}">
						<c:set var="check_row" value="${check_row + 1}" />
					</c:if>
					<c:if test="${orderlist.deliveryId ne prev_row}">
						<c:set var="check_row" value="0" />
					</c:if>
					<tr>
						<c:if test="${check_row == 0}">
							<td rowspan="<c:out value='${orderlist.partcnt}' />">
								<fmt:formatDate
									value="${orderlist.purchaseDateTime}" pattern="yyyy.MM.dd" />
								<div class="order_num color_blue">202311150000001</div>
							</td>
						</c:if>
						<td class="product_info">
							<div class="img_wrap">
								<a href="${path}/product/productDetail.do?productId=${orderlist.productId}">
									<c:choose>
										<c:when test="${not empty orderlist.imagePath}"> 
											<img src="${orderlist.imagePath}" alt="product image" />
										</c:when>
										<c:otherwise>
											<img src="${path}/images/common/img_preparing.png" alt="product image" />
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="detail">
								<div class="brand_name">${orderlist.brand}</div>
								<div class="product_name">
									<a href="${path}/product/productDetail.do?productId=${orderlist.productId}">${orderlist.pName}</a>
								</div>
							</div>
						</td>
						<td>${orderlist.productCount}</td>
						<td class="price color_red ">
							<fmt:formatNumber pattern="#,##0" value="${orderlist.price * orderlist.productCount}"/>원
						</td>
						<c:if test="${check_row == 0}">
							<td class="order_status"
								rowspan="<c:out value='${orderlist.partcnt}' />">
								<c:choose>
									<c:when test="${orderlist.deliveryStatus eq 'ready'}"> 
										배송준비중
									</c:when>
									<c:when test="${orderlist.deliveryStatus eq 'process'}"> 
										배송중
									</c:when>
									<c:when test="${orderlist.deliveryStatus eq 'complete'}"> 
										배송완료
									<div>
										<button class="btn_blue btn_delivery_check">배송조회</button>
									</div>
									</c:when>
									<c:otherwise>
									    저는 모두 해당이 안됩니다.
									</c:otherwise>
								</c:choose>
							</td>
						</c:if>
					</tr>
					<c:set var="prev_row">
						<c:out value="${orderlist.deliveryId}" />
					</c:set>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">내역이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

<!-- //tbl_wrap -->
<!-- pagination -->
	<%-- <c:if test="${booklist.size() != 0}"> --%>
	<c:if test="${pageCount != 0}">
		<div class=pagination>
			<div class="pageLeft">
				<c:choose>
					<c:when test="${OHpagination.pageNumber<=1}">
						<button class="btnFirst" disabled="disabled">첫페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnFirst" id="btnFirst"
							onclick="javascript:callOrderHistory(1)">첫페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${OHpagination.pageNumber<=1}">
						<button class="btnPrev" disabled="disabled">이전페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnPrev" id="btnPrev"
							onclick="javascript:callOrderHistory(${OHpagination.pageNumber-1})">이전페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
			<ul class="pagingWrap">
				<c:forEach begin="${OHpagination.startPageNumber}"
					end="${OHpagination.endPageNumber}" var="i" step="1">
					<li><a href="javascript:callOrderHistory(${i})">${i}</a></li>
				</c:forEach>
			</ul>
			<div class="pageRight">
				<c:choose>
					<c:when test="${OHpagination.pageNumber==OHpagination.maxPageNumber}">
						<button class="btnNext" id="btnNext" disabled="disabled">다음페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnNext" id="btnNext"
							onclick="javascript:callOrderHistory(${OHpagination.pageNumber+1})">다음페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${OHpagination.pageNumber==OHpagination.maxPageNumber}">
						<button class="btnLast" disabled="disabled">마지막페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnLast" id="btnLast"
							onclick="javascript:callOrderHistory(${OHpagination.maxPageNumber})">마지막페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</c:if>
	<%-- </c:if> --%>
	<!-- //pagination -->


