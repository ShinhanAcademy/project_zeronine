<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach items="${plist}" var="product">
		<div class="menu_sub">
					<div class="menu_image">
						<img class="menupng" src="${path}/images/sangpumpage/ohddugi.png">
						<div class="menu_gocart">
									<div class="heart_liked">
											<button class="like" id="like${status.index}" type="button"
												value="${product.productId}"
												onclick="handleLikeButtonClick(${status.index}, '${product.productId}')">



												<c:if test="${fn:contains(likedcid, product.productId)}">
													<img class="menu_heart"
														src="${path}/images/board/red_heart.png">
												</c:if>
												<c:if
													test="${not(fn:contains(likedcid, product.productId))}">
													<img class="menu_heart"
														src="${path}/images/board/heart.png">
												</c:if>
											</button>
										</div>

										<button class="gocart" type="button">
											<img class="gocart"
												src="${path}/images/sangpumpage/gocart.png">
										</button>
					</div>
					</div>
					<span class="menufont">${product.brand}</span>
					<span class="menufont_name">${product.pName}</span>
					<span class="menufont_price">
					  <fmt:formatNumber value="${product.price}" maxFractionDigits="3"></fmt:formatNumber>
					원</span>
		</div>

</c:forEach>
	<script>
		var path = "${path}";
	</script>

	<script>

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

					