<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- functions lib --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="tbl_top_wrap">
	<div class="total_count">
		총 <span>${orderCancelHistoryAll.size()}</span>건
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
				<th>취소 일자</th>
				<th>상품 정보</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderCancelHistoryAll}" var="cancellist" varStatus="i">
				<c:if test="${cancellist.deliveryId eq prev_row}">
					<c:set var="check_row" value="${check_row + 1}" />
				</c:if>
				<c:if test="${cancellist.deliveryId ne prev_row}">
					<c:set var="check_row" value="0" />
				</c:if>
				<tr>
					<c:if test="${check_row == 0}">
						<td rowspan="<c:out value='${cancellist.partcnt}' />">
							<fmt:formatDate
								value="${cancellist.refundRequestTime}" pattern="yyyy.MM.dd" />
							<div class="order_num color_blue">202311150000001</div>
						</td>
					</c:if>
					<td class="product_info">
						<div class="img_wrap">
							<img src="${cancellist.imagePath}"
								alt="product image" />
						</div>
						<div class="detail">
							<div class="brand_name">${cancellist.brand}</div>
							<div class="product_name">${cancellist.pName}</div>
						</div>
					</td>
					<td>${cancellist.productCount}</td>
					<td class="price color_red">${cancellist.price * cancellist.productCount}원</td>
					<c:if test="${check_row == 0}">
						<td class="order_status"
							rowspan="<c:out value='${cancellist.partcnt}' />">
							<%-- <c:choose>
								<c:when test="${cancellist.deliveryStatus eq 'ready'}"> 
									배송준비중
								</c:when>
								<c:when test="${cancellist.deliveryStatus eq 'process'}"> 
									배송중
								</c:when>
								<c:when test="${cancellist.deliveryStatus eq 'complete'}"> 
									배송완료
								<div>
									<button class="btn_blue btn_delivery_check">배송조회</button>
								</div>
								</c:when>
								<c:otherwise>
								    저는 모두 해당이 안됩니다.
								</c:otherwise>
							</c:choose> --%>
							취소 처리중
							<div class="refund_tip">카드 취소 최대 2영업일 소요</div>
						</td>
					</c:if>
				</tr>
				<c:set var="prev_row">
					<c:out value="${cancellist.deliveryId}" />
				</c:set>
			</c:forEach>
			<%-- <tr>
				<td rowspan="3">2023.11.14</td>
				<td class="product_info">
					<div class="img_wrap">
						<img src="${path}/images/mypage/img_product_04.png"
							alt="product image" />
					</div>
					<div class="detail">
						<div class="brand_name">에스쁘아</div>
						<div class="product_name">[증량기획] 에스쁘아 원터 스플래쉬 선크림 세라마이드
							60ml+20ml 세트</div>
					</div>
				</td>
				<td>3</td>
				<td class="price color_red ">66,000원</td>
				<td rowspan="3" class="order_status">취소 처리중
					<div class="refund_tip">카드 취소 최대 2영업일 소요</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">
					<div class="img_wrap">
						<img src="${path}/images/mypage/img_product_05.png"
							alt="product image" />
					</div>
					<div class="detail">
						<div class="brand_name">유시몰</div>
						<div class="product_name">[11/27 하루특가]유시몰 화이트닝 미백치약 106g+20g (가글 9ml 추가)</div>
					</div>
				</td>
				<td>3</td>
				<td class="price color_red ">66,000원</td>
			</tr>
			<tr>
				<td class="product_info">
					<div class="img_wrap">
						<img src="${path}/images/mypage/img_product_06.png"
							alt="product image" />
					</div>
					<div class="detail">
						<div class="brand_name">라보에이치</div>
						<div class="product_name">라보에이치 두피강화샴푸 탈모증상완화 333ml기획
							(+112ml 증정)</div>
					</div>
				</td>
				<td>3</td>
				<td class="price color_red ">66,000원</td>
			</tr>
			<tr>
				<td>2023.11.14</td>
				<td class="product_info">
					<div class="img_wrap">
						<img src="${path}/images/mypage/img_product_07.png"
							alt="product image" />
					</div>
					<div class="detail">
						<div class="brand_name">에스쁘아</div>
						<div class="product_name">[한정기획/베스트립증정]에스쁘아 비벨벳 커버쿠션 뉴클래스
							미니립 2종[한정기획/베스트립증정]에스쁘아 비벨벳 커버쿠션 뉴클래스 미니립 2종</div>
					</div>
				</td>
				<td>3</td>
				<td class="price color_red ">66,000원</td>
				<td class="order_status">취소 완료
					<div class="refund_tip">카드 취소 최대 2영업일 소요</div>
				</td>
			</tr> --%>
		</tbody>
	</table>
</div>
<!-- tbl_wrap -->
<!-- pagination -->
<%-- <c:if test="${booklist.size() != 0}"> --%>
<div class=pagination>
	<div class="pageLeft">
		<button class="btnFirst">첫페이지</button>
		<button class="btnPrev">이전페이지</button>
	</div>
	<ul class="pagingWrap">
		<li><a href="">1</a></li>
		<li><a href="">2</a></li>
		<li><a href="">3</a></li>
		<li><a href="">4</a></li>
		<li><a href="">5</a></li>
		<li><a href="">6</a></li>
		<li><a href="">7</a></li>
		<li><a href="">8</a></li>
		<li><a href="">9</a></li>
		<li><a href="">10</a></li>
	</ul>
	<div class="pageRight">
		<button class="btnNext">다음페이지</button>
		<button class="btnLast">마지막페이지</button>
	</div>
</div>
<%-- </c:if> --%>
<!-- //pagination -->