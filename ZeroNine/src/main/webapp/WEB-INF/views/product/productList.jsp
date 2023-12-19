
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/product.css" />

</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="zero_conatainer product_container"
		style="padding: 160px 0 0;">
		<div class="body-part">
			<div class="body-left">
				<img class="logo2" src="${path}/images/sangpumpage/banner.png">
				<div class="dist98"></div>
				<div class="menu_bar">

					<div class="category">
						<div class="img_wrap">
							<button class="fluent_basket">
								<img src="${path}/images/sangpumpage/fluent_basket.png">
							</button>
						</div>
						<p>채소류</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<button class="lotion">
								<img src="${path}/images/sangpumpage/lotion.png">
							</button>
						</div>
						<p>생필품류</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<button class="food_navi">
								<img src="${path}/images/sangpumpage/food_navi.png">
							</button>
						</div>
						<p>음식류</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<button class="raphael_cart">
								<img src="${path}/images/sangpumpage/raphael_cart.png">
							</button>
						</div>
						<p>전체</p>
					</div>
				</div>
				<div class="dist49"></div>
				<div class="jul"></div>
				<div class="dist30"></div>
			</div>
			<div class="melong">
				<div class="melong_hop">
					<img class="menupng" src="${path}/images/board/filter.png"> <select
						name="ptype" class="selectBox" onchange="chanb()">
						<option value="0" selected>전체</option>
						<option value="1">찜순</option>
						<option value="2">주문량순</option>
						<option value="3">낮은가격순</option>
						<option value="4">높은가격순</option>
					</select>
				</div>
				<div class="search_area">
					<form class="search_form">
						<input type="text" name="q" id="q" placeholder="상품명, 제조사 검색">
						<button type="button" name="searchbtn" id="searchbtn">
							<img src="${path}/images/sangpumpage/search.png">
						</button>
					</form>
				</div>
			</div>

			<div class="content"></div>
			<div class="menulistpart">


				<div class="menulist" id="here">

				</div>
			</div>
			<div class="dist100"></div>
		
		</div>

	</div>


	<%@include file="../common/footer.jsp"%>
	<script>
		var path = "${path}";
	    var cartcheck = "${cartcheckpid}";

	    // Remove square brackets and split into an array
	    cartcheck = cartcheck.replace(/\[|\]/g, ''); // Remove square brackets
	    var cartcheckArray = cartcheck.split(',').map(function(item) {
	        return item.trim(); // Remove extra spaces
	    });
		
	    const productInCart = [];
	    // Check if cartcheckArray is an array
	    if (Array.isArray(cartcheckArray)) {
	        // It's an array, you can use forEach
	        
			
	        // If it's an array of strings, you can directly use it
	        cartcheckArray.forEach(function(productId) {
	            
	            // You can perform other operations with productId
	        });
	    } else {
	        console.error("Parsed cartcheckArray is not an array. Check the structure of the data.");
	    }
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
	 function handlegoCartButtonClick(index, productId) {
		 function isproductinCart(productId){
	    	  return cartcheckArray.some(function(item){
	    		  return item == productId;
	    	  })
	      }
	        var likeButtonId = "gocart" + index;
	        var custid = "${customerid}";
	   
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
	 function handleLikeButtonClick(index, productId) {
	      
	        var likeButtonId = "like" + index;
	        var custid = "${customerid}";
	    
	    	//클래스가 heart liked => AJAX DELTE 호출
	        var isRedHeart = likedcidArr.indexOf(productId);
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
	<script src="../js/product/productlist.js"></script>
</body>
</html>