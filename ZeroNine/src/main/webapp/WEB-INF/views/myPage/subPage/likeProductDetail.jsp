<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- functions lib --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script defer src="${path}/js/myPage/subPage/likeProductDetail.js"></script>
<!-- product_list -->
<div class="product_list">
	<c:forEach items="${likeProduct}" var="item">
		<div class="like_item">
			<div class="item_inner">
				<div class="img_wrap">
					<!-- <a href="javascript:void(0)"> -->
					<a href="${path}/product/productDetail.do?productId=${item.productId}">
						<c:choose>
							<c:when test="${not empty item.imagePath}"> 
								<img src="${item.imagePath}" alt="product image" />
							</c:when>
							<c:otherwise>
								<img src="${path}/images/common/img_preparing.png" alt="product image" />
							</c:otherwise>
						</c:choose>
					</a>
					<button class="btn_like" data-custId="${customerId}" data-prodId="${item.productId}">like</button>
				</div>
				<div>
					<div class="product_brand">${item.brand}</div>
					<div class="product_name">
						<a href="${path}/product/productDetail.do?productId=${item.productId}">${item.pName}</a>
					</div>
					<div class="price">
						<fmt:formatNumber pattern="#,##0" value="${item.price}" /> 원
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<c:if test="${likeProductCount != 0}">
		<div class=pagination>
			<div class="pageLeft">
				<c:choose>
					<c:when test="${pagenation.pageNumber<=1}">
						<button class="btnFirst" disabled="disabled">첫페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnFirst" id="btnFirst"
							onclick="javascript:likeProduct(1)">첫페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pagenation.pageNumber<=1}">
						<button class="btnPrev" disabled="disabled">이전페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnPrev" id="btnPrev"
							onclick="javascript:likeProduct(${pagenation.pageNumber-1})">이전페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
	<ul class="pagingWrap">
				<c:forEach begin="${pagenation.startPageNumber}"
					end="${pagenation.endPageNumber}" var="i" step="1">
					<li><a href="javascript:likeProduct(${i})">${i}</a></li>
				</c:forEach>
			</ul>
			<div class="pageRight">
				<c:choose>
					<c:when test="${pagenation.pageNumber==pagenation.maxPageNumber}">
						<button class="btnNext" id="btnNext" disabled="disabled">다음페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnNext" id="btnNext"
							onclick="javascript:likeProduct(${pagenation.pageNumber+1})">다음페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pagenation.pageNumber==pagenation.maxPageNumber}">
						<button class="btnLast" disabled="disabled">마지막페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnLast" id="btnLast"
							onclick="javascript:likeProduct(${pagenation.maxPageNumber})">마지막페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</c:if>
	<%-- </c:if> --%>
	<!-- //pagination -->