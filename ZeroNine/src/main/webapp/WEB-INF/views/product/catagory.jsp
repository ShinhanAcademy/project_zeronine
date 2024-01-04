<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${pCount != 0}">

		<div class="menulist">
			<c:forEach items="${plist}" var="product" varStatus="status">
				<div class="menu_sub">
					<div class="menu_image">
						<img class="menupng"
							onclick="location.href='${Path }/product/productDetail.do?productId=${product.productId}'"
							src="${product.imagePath}">

						<div class="menu_gocart">

							<c:if test="${customerid != null}">
								<div class="heart_liked">
									<button class="like" id="like${status.index}" type="button"
										value="${product.productId}"
										onclick="handleLikeButtonClick(${status.index}, '${product.productId}')">



										<c:if test="${fn:contains(likedcid, product.productId)}">
											<img class="menu_heart"
												src="${path}/images/board/red_heart.png">
										</c:if>
										<c:if test="${not(fn:contains(likedcid, product.productId))}">
											<img class="menu_heart" src="${path}/images/board/heart.png">
										</c:if>
									</button>
								</div>

								<button class="gocart" id="gocart${status.index}" type="button"
									onclick="handlegoCartButtonClick(${status.index}, '${product.productId}')">
									<img class="gocart" src="${path}/images/sangpumpage/gocart.png">
								</button>
							</c:if>
						</div>
						<div class="index">${status.index}</div>
					</div>
					<span class="menufont">${product.brand}</span> <span
						class="menufont_name">${product.pName}</span> <span
						class="menufont_price"> <fmt:formatNumber
							value="${product.price}" maxFractionDigits="3"></fmt:formatNumber>
						원
					</span>
				</div>
			</c:forEach>
		</div>

		<!-- pagination -->
		<div class=pagination>
			<div class="pageLeft">
				<c:choose>
					<c:when test="${paginating.pageNumber<=1}">
						<button class="btnFirst" disabled="disabled">첫페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnFirst" id="btnFirst"
							onclick="javascript:search(1)">첫페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${paginating.pageNumber<=1}">
						<button class="btnPrev" disabled="disabled">이전페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnPrev" id="btnPrev"
							onclick="javascript:search(${paginating.pageNumber-1})">이전페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
			<ul class="pagingWrap">
				<c:forEach begin="${paginating.startPageNumber}"
					end="${paginating.endPageNumber}" var="i" step="1">
					<li class="${paginating.pageNumber == i? 'on':''}"><a href="javascript:search(${i})">${i}</a></li>
				</c:forEach>
			</ul>
			<div class="pageRight">
				<c:choose>
					<c:when test="${paginating.pageNumber==paginating.maxPageNumber}">
						<button class="btnNext" id="btnNext" disabled="disabled">다음페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnNext" id="btnNext"
							onclick="javascript:search(${paginating.pageNumber+1})">다음페이지</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${paginating.pageNumber==paginating.maxPageNumber}">
						<button class="btnLast" disabled="disabled">마지막페이지</button>
					</c:when>
					<c:otherwise>
						<button class="btnLast" id="btnLast"
							onclick="javascript:search(${paginating.maxPageNumber})">마지막페이지</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="noDataPart">
			<span class="noData">조회된 상품이 없습니다!</span>
		</div>
	</c:otherwise>

</c:choose>
<!-- //pagination -->



<script>
var path = "${path}";
var cartcheck = "${cartcheckpid}";

 cartcheck = cartcheck.replace(/\[|\]/g,'');
	cartcheckArray = cartcheck.split(',').map(function(item) {
      return item.trim();
  });
	console.log(cartcheckArray);
function handlegoCartButtonClick(index, productId) {
	 function isproductinCart(productId){
  	  return cartcheckArray.some(item => item === productId);
    }
	 console.log(isproductinCart(productId));
	if(isproductinCart(productId)==false){
			$.ajax({
				url : path +"/product/goProductCart.do",
				type: "POST",
				data : {"productId" :productId},
				success : function(){
					alert("장바구니에 성공적으로 담겼습니다!");
					cartcheckArray.push(productId);
				},
				error : function(){
					alert("에러입니다.");
				}
				}); 
	}else{
				$.ajax({
			  url: path+"/product/alreadyInCartModal.do",
			  type: "POST",
			  success: function(response) {
				 $("#modal").show();
			    $('#modal').html(response);
			  },
			  error: function(error) {
			    console.error('Error loading modal content:', error);
			  }
			});
	}	
}

	 var str = "${likedcid}";
	 var likedcidArr = [] ; 
	 likedcidArr = str.split(/,|\[|\]| /);
	 function handleLikeButtonClick(index, productId) {
	        var isRedHeart = likedcidArr.indexOf(productId);
			if(isRedHeart>=0) {
				$.ajax({
					url : "/product/deleteLikedProduct.do",
					type: "POST",
					data : {"productId" :productId},
					success : function(){
						likedcidArr = likedcidArr.filter(item => item !== productId);
					},
					error : function(){
						alert("에러입니다.");
					}
					});
					 
				}else{
	
				 $.ajax({
						url : "/product/productLike.do",
						type: "POST",
						data : {"productId" :productId},
						success : function(){
							likedcidArr.push(productId);
						},
						error : function(){
							alert("에러입니다.");
						}
						});
				}
					};
	
	        
		$(".like").click(function (){

			            var currentImagePath = $(this).find("img.menu_heart").attr("src");
			            var newImagePath = currentImagePath === path+"/images/board/heart.png" ?
			                path+"/images/board/red_heart.png" :
			                path+"/images/board/heart.png";

			            $(this).find("img.menu_heart").attr("src", newImagePath);
			});
		
	</script>
