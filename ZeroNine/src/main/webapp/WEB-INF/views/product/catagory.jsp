<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach items="${plist}" var="product" varStatus="status">
	<div class="menu_sub">
		<div class="menu_image">
			<img class="menupng"
				onclick="location.href='${Path }/product/productDetail.do?productId=${product.productId}'"
				src="${path}/images/sangpumpage/ohddugi.png">

			<div class="menu_gocart">

				<c:if test="${customerid != null}">
					<div class="heart_liked">
						<button class="like" id="like${status.index}" type="button"
							value="${product.productId}"
							onclick="handleLikeButtonClick(${status.index}, '${product.productId}')">



							<c:if test="${fn:contains(likedcid, product.productId)}">
								<img class="menu_heart" src="${path}/images/board/red_heart.png">
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
				value="${product.price}" maxFractionDigits="3"></fmt:formatNumber> 원
		</span>
	</div>
</c:forEach>
<div class="plus_btnpart">
			<div style="display: block; text-align: center;">		
		<c:choose>
		<c:when test="${paginating.pageNumber<=1}">
			<span>[<<]</span>
		</c:when>
		<c:otherwise>
			<a href="javascript:search(1)">[<<]</a>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${paginating.pageNumber<=1}">
			<span>[<]</span>
		</c:when>
		<c:otherwise>
			<a href="javascript:search(${paginating.pageNumber-1})">[<]</a>
		</c:otherwise>
	</c:choose>

	<c:forEach begin="${paginating.startPageNumber}"
		end="${paginating.endPageNumber}" var="i" step="1">
		<a href="javascript:search(${i})">${i}</a>
	</c:forEach>

	<c:choose>
		<c:when test="${paginating.pageNumber==paginating.maxPageNumber}">
			<span>[>]</span>
		</c:when>
		<c:otherwise>
			<a href="javascript:search(${paginating.pageNumber+1})">[>]</a>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${paginating.pageNumber==paginating.maxPageNumber}">
			<span>[>>]</span>
		</c:when>
		<c:otherwise>
			<a href="javascript:search(${paginating.maxPageNumber})">[>>]</a>
		</c:otherwise>
	</c:choose>
	    </div>

				<div class="dist49"></div>
			</div>
<script>
		var path = "${path}";
		var custid = "${customerid}";
	    console.log(custid);
	</script>

<script>
var custid = "${customerid}";
console.log(custid);
	 function handlegoCartButtonClick(index, productId) {
	     console.log(productId);
		 function isproductinCart(productId){
	    	  return cartcheckArray.some(function(item){
	    		  return item == productId;
	    	  })
	      }

	        var likeButtonId = "gocart" + index;
	   
		if(productInCart.includes(productId)==false){
				$.ajax({
					url : "/product/goProductCart.do",
					type: "POST",
					data : {"custid" :custid,"productId" :productId},
					success : function(){
						alert("잘담겼다!");
						
						if(!productInCart.includes(productId)) {
							productInCart.push(productId);
						}
						cartcheckArray.filter((element) => element !== productId);
					},
					error : function(){
						alert("에러입니다.");
					}
					}); 
		}else{
			$.ajax({
				url : "/product/plusProductCart.do",
				type: "POST",
				data : {"custid" :custid,"productId" :productId},
				success : function(){
					alert("또담겼다!");
				},
				error : function(){
					alert("에러입니다.");
				}
				}); 
		}
					 
				
	 };
	
	
	 var str = "${likedcid}";
	 var likedcidArr = [] ; 
	 //str.split(/!|@|~|,| |Z/);
	 likedcidArr = str.split(/,|\[|\]| /);
	 console.log(likedcidArr);
	 function handleLikeButtonClick(index, productId) {
	      
	        var likeButtonId = "like" + index;
	        var custid = "${customerid}";
	    
	    	//클래스가 heart liked => AJAX DELTE 호출
	        var isRedHeart = likedcidArr.indexOf(productId);
	    	
			console.log(isRedHeart);
			if(isRedHeart>=0) {
				$.ajax({
					url : "/product/deleteLikedProduct.do",
					type: "POST",
					data : {"custid" :custid,"productId" :productId},
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
						data : {"custid" :custid,"productId" :productId},
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

