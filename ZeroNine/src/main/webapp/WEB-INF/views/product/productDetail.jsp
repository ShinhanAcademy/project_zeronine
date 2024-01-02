<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/productdetail.css" />
<link rel="stylesheet" href="${path}/css/modal/alreadyIncartModal.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="zero_container detail_bodypart zn_center">
		<div class="detail_link"></div>
		<div class="detail_middle">
			<div class="detail_img">
				<img src="${pImage}">
			</div>
			<div class="detail_right">

				<div class="detail_heartcart">
				<button class="like" id="like" type="button"
							value="${plist.productId}">

							<c:if test="${fn:contains(likedcid, plist.productId)}">
								<img class="detail_heart" src="${path}/images/board/red_heart.png">
							</c:if>
							<c:if test="${not(fn:contains(likedcid, plist.productId))}">
								<img class="detail_heart" src="${path}/images/board/heart.png">
							</c:if>
						</button>
				
				</div>
				<div class="detail_pnamepart">
				<span class="detail_pname">${plist.pName}</span>
				</div>
				<div class="detail_price">
					<span><fmt:formatNumber
								value="${plist.price }" maxFractionDigits="3"></fmt:formatNumber>원</span>
				</div>

				<div class="jul"></div>
				<div class="detail_right_middle">
					<div class="detail_text">
						<span class="subtitle">원산지</span> <span class="sub_explain">상품정보
							원산지표시 참조</span>
					</div>
					
					<div class="detail_text_bottom">
						<span class="subtitle_middle">배송정보</span> <span
							class="sub_explain">3,000원</span><br>

					</div>

					<div class="sub_delifree">
						<span class="sub_explain">동일 배송유형 상품 50,000이상 구매시 무료</span>
					</div>
					<div class="sub_amount">
					
						<span class="subtitle_middle">수량선택</span>
						<div class="sub_amountpm">
							<button class="minus" onclick="decrement()">-</button>
							<span class="sub_text" id="quantity">1</span>
							<button class="plus" onclick="increment()">+</button>
						</div>
					</div>
				</div>
				<div class="jul"></div>
				<div class="total_part">
					<div class="total_part_top">
						<span class="total_price">총 금액</span> <span
							class="total_price_text" id="total_price"><fmt:formatNumber
								value="${plist.price }" maxFractionDigits="3"></fmt:formatNumber>
							원</span>
					</div>
					<div class="total_button">
						<button   type="button" class="detail_cart" id="manygocart" onclick="manygocart()">장바구니</button>
						
						<button class="detail_order"id="goOrder" onclick="goOrder()">바로구매</button>
					</div>
				</div>
			</div>


		</div>
		<div class="jul0"></div>

		<div class="detail_middle2">
			<span class="forzero_text">제로들을 위한 추천</span>
			<div>
				<div class="forzero">
					<div class="forzero_list">
					<c:forEach items="${deliverylist4}" var="dtop" varStatus="status">
						<div class="forzero_sub">
							<div class="forzero_image">
							
								<img class="menupng" onclick="location.href='${Path }/product/productDetail.do?productId=${dtop.productId}'"
									src="${dtop.imagePath}">
							</div>
							<span class="menufont">${dtop.brand }</span> <span class="menufont_name">${dtop.pName}</span>
							<span class="menufont_price"> <fmt:formatNumber
									value="${dtop.price }" maxFractionDigits="3"></fmt:formatNumber> 원
							</span>
						</div>
						</c:forEach>
					</div>
					<div class="jul1"></div>
					<div class="jul100"></div>
				</div>
			</div>
		</div>
		<div class="detail_bottom">
			<div class="detail_bottom_left">
				<c:forEach items="${detailImage}" var="image">
					<img class="detail_img2" src="${image.imagePath}">
				</c:forEach>
			</div>

			<div class="detail_bottom_right">
				<div id="sidebox">
					<span class="subtitle1">${plist.pName}</span>
					<div class="sidebox_right">
						<div class="sub_amountpm">
							<button class="minus" onclick="decrement()">-</button>
							<span class="sub_text" id="quantity-right">1</span>
							<button class="plus" onclick="increment()">+</button>
						</div>
						<span class="subtitle" id="total_price-right"><fmt:formatNumber
								value="${plist.price}" maxFractionDigits="3"></fmt:formatNumber>
							원</span>
					</div>
					<div class="sidebox_btnpart">
						<button   type="button" class="sidebox_btnCart" id="manygocart1" onclick="manygocart()">장바구니</button>
						
						<button class="sidebox_btnOrder"id="goOrder1" onclick="goOrder()">바로구매</button>
					</div>
				</div>

				<div class="sidebottom"></div>
			</div>

		</div>


	</div>

<div id="modal"></div>



	<%@include file="../common/footer.jsp"%>
	<script>
		var path = "${path}";
		var sidebox = $("#sidebox");
		 var custid = "${customerId}";
		 var productid ="${plist.productId}";
		 var cartCheckpid ="${cartCheckPid}";
		var currentPosition = parseInt($("#sidebox").css("top"));
		
		$(window).scroll(function() {
			let position = $(this).scrollTop();
			let priceOffset = $(".detail_bottom").offset().top;
			console.log("position", position);
			if (position >= (priceOffset - 50)) {
				$("#sidebox").addClass("scroll_on");
			} else {
				$("#sidebox").removeClass("scroll_on");
			}

		});

		var quantityValue = 1;
		var price = ${plist.price};

		function increment() {
			if (quantityValue < 100) {
				quantityValue++;
				updateQuantityAndTotal();
			}
		}

		function decrement() {
			if (quantityValue > 1) {
				quantityValue--;
				updateQuantityAndTotal();
			}
		}

		function updateQuantityAndTotal() {
			var total = Math.max(quantityValue * price, 1);
			document.getElementById('quantity').innerText = quantityValue;
			document.getElementById('quantity-right').innerText = quantityValue;
			document.getElementById('total_price').innerText = total
					.toLocaleString()
					+ ' 원'; // Assuming you want to display price with two decimal places
			document.getElementById('total_price').innerText = total
					.toLocaleString()
					+ ' 원'; // Assuming you want to display price with two decimal places
			console.log(total);
			console.log(quantityValue);
			 return {
			        total: total,
			        quantityValue: quantityValue
			    };
		}
		cartCheck = cartCheckpid.replace(/\[|\]/g, ''); 
	    var cartcheckArray = cartCheck.split(',').map(function(item) {
	        return item.trim(); 
	    });
		var cartcheckarr =cartCheck.split(',');
		 function goOrder() {
			
			if(custid==""){
				alert("로그인 후 이용해주세요.");
				location.href = "/auth/login.do";
				return;
			}
			 
				var result = updateQuantityAndTotal();
			    var total = result.total;
			    var quantityValue = result.quantityValue;
				var obj = {
						"cartCheckpid":cartCheckpid,
					"productid" :productid,
					"pcount": quantityValue};
				 if(cartCheckpid.includes(productid)==false){
				$.ajax({
						url : path + "/product/goProductDCart.do",
						data : obj,
						type : "POST",
						success : function(){
							location.href = "${path}/product/productOrder.do?productid="+productid;
							
							},
							error : function(request,status,error) {
				                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				            }
					}); 
			}else{
				$.ajax({
					url : path + "/product/beforeproductOrder.do",
					data : obj,
					type : "POST",
					success : function(){
			location.href = "${path}/product/productOrder.do?productid="+productid;
					},
					error : function(request,status,error) {
		                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}); 
				
			} 
			
		 }
		 
		 function manygocart() {
			var result = updateQuantityAndTotal();
		    var total = result.total;
		    var quantityValue = result.quantityValue;
			var obj = {
				"productid" :productid,
				"pcount": quantityValue};
			if(cartCheckpid.includes(productid)==false){
			$.ajax({
					url : path + "/product/goProductDCart.do",
					data : obj,
					type : "POST",
					success : function(){
						alert("성공!");
					},
					error : function() {
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
		 	$(".like").click(function (event){
		 		var productId = $(this).val();
		 		 if(custid === ""){
					 alert("비로그인상태입니다. 로그인페이지로 이동합니다. ");
					 location.href ="${path}/auth/login.do";
					
				 }else{
					 var currentImagePath = $(this).find("img.detail_heart").attr("src");
				     var newImagePath = currentImagePath === path+"/images/board/heart.png" ?
				      	 path+"/images/board/red_heart.png" : path+"/images/board/heart.png";
				            $(this).find("img.detail_heart").attr("src", newImagePath);
				            handleLikeButtonClick(productId);
					 }
				}); 
		 function handleLikeButtonClick(productId) {
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
		 }
		 
		function esc_btn(){
			$(document).keydown(function(event){
				if(event.keyCode == 27){
				$("#modal").hide();
				}
			})
			
		}
	</script>

</body>
</html>
