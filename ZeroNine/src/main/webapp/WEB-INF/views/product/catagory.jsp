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
			<c:if test="${paging.startPage != 1 }">
				<a href="javascript:pcountchange(${paging.startPage - 1},${paging.cntPerPage})">&lt;&lt;</a>
			</c:if>
			 <script>
			 	console.log("${paging.endPage}");
			 </script>
			<c:forEach begin="${paging.startPage}" end="${paging.lastPage}" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<%-- <b>${p}</b> --%>
						<a href="javascript:pcountchange(${p},${paging.lastPage})">${p}</a>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="javascript:pcountchange(${p},${paging.lastPage})">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="javascript:pcountchange(${paging.endPage+1},${paging.cntPerPage})">&gt;&gt;</a>
			</c:if>
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
		 //console.log(isproductinCart(productId));
		 	console.log(productInCart);
		 	console.log(productInCart.includes(productId));
	        var likeButtonId = "gocart" + index;
	    
	    console.log(productId);
		console.log(cartcheck);
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
	
	function pcountchange(currentpage,perpage){
		console.log(currentpage);
		var obj = {
				//"value":event.target.value,	
				"nowPage":currentpage,
				"cntPerPage":perpage
		};
		console.log("Clicked button value: " + obj);
		$.ajax({
			//url : "${path}/product/productList.do",
			url : "${path}/product/productPageCount.do",
			type: "GET",
			data : obj,
			success:function(responseData){
				$("#here").html(responseData);
			},
			error : function(){
				alert("에러입니다.");
			}
			});
	}
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
						likedcidArr.filter((element) => element !== productId);
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
	
	        
	
					
		$(".raphael_cart").click(function() {
			var obj = {
				"pCategoryId" : 0
			};

			$.ajax({
				url : path + "/product/productCategoryall.do",
				data : obj,
				type : "GET",
				success : output, 
				error : function() {
					alert("에러입니다.");
				}
			});
		})
		$(".like").click(function (){

			            var currentImagePath = $(this).find("img.menu_heart").attr("src");
			            var newImagePath = currentImagePath === path+"/images/board/heart.png" ?
			                path+"/images/board/red_heart.png" :
			                path+"/images/board/heart.png";

			            $(this).find("img.menu_heart").attr("src", newImagePath);
			});
		
	</script>

