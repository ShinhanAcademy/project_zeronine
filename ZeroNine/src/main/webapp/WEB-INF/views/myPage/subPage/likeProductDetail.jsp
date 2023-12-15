<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- functions lib --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- product_list -->
<div class="product_list">
	<c:forEach items="${likeProduct}" var="item">
		<div class="like_item">
			<div class="item_inner">
				<div class="img_wrap">
					<a href="javascript:void(0)"> <img
						src="${item.imagePath}" alt="product image" />
					</a>
					<button class="btn_like">like</button>
				</div>
				<div>
					<div class="product_brand">${item.brand}</div>
					<div class="product_name">
						<a href="javascript:void(0)">${item.pName}</a>
					</div>
					<div class="price">${item.price} 원</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<%-- <div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_08.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div>
	<div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_01.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div>
	<div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_01.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div>
	<div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_02.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div>
	<div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_02.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div>
	<div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_02.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div>
	<div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_08.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div>
	<div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_08.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div>
	<div class="like_item">
		<div class="item_inner">
			<div class="img_wrap">
				<a href="javascript:void(0)"> <img
					src="${path}/images/mypage/img_product_08.png" alt="product image" />
				</a>
				<button class="btn_like">like</button>
			</div>
			<div>
				<div class="product_brand">엑스투</div>
				<div class="product_name">
					<a href="javascript:void(0)">신세계백화점 TRADITION(앤트레디션) 세타고 Setago
						JH27 Maroon Grape신세계백화점 TRADITION(앤트레디션) 세타고 Setago JH27 Maroon
						Grape</a>
				</div>
				<div class="price">200,000원</div>
			</div>
		</div>
	</div> --%>

</div>
<!-- //product_list -->
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