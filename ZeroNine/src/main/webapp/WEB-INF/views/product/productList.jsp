<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/product.css" />

</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="zero_conatainer product_container" style="padding: 160px 0 0;">
		<div class="body-part" >
			<div class="body-left">
				<img class="logo2"  src="${path}/images/sangpumpage/banner.png">
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
				<img class="menupng" src="${path}/images/board/filter.png">
				<select name ="ptype" class="selectBox" onchange="chanb()">
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
                                    <button type="button" name="searchbtn" id="searchbtn"><img src="${path}/images/sangpumpage/search.png"></button>                                        
                               </form>
                               </div>
                             </div>
				<div class="content"></div>
				<div class="menulistpart">
				
				
				<div class="menulist" id="here">
				
					<c:forEach items="${plist}" var="product">
					<div class="menu_sub">
					<div class="menu_image">
						<img class="menupng" src="${path}/images/sangpumpage/ohddugi.png">
						<div class="menu_gocart">
						<button class="like" type="button">
						<img class="menu_heart" src="${path}/images/board/heart.png">
						</button>
						<img src="${path}/images/sangpumpage/gocart.png">
					</div>
					</div>
					<span class="menufont">${product.brand}</span>
					<span class="menufont_name">${product.pName}</span>
					<span class="menufont_price">
					<fmt:formatNumber value="${product.price}" maxFractionDigits="3"></fmt:formatNumber> 원</span>
					</div>
					</c:forEach>

				</div>
				</div>
				<div class="dist100"></div>
				<div class="plus_btnpart">
				<button class="plus_btn" type=submit >
				<span class="plus_text">더보기
				<img class="plus_icon" src="${path}/images/sangpumpage/plus_icon.png"></span>
				</button>
				<div class="dist49"></div>
				</div>
			</div>

		</div>
		

	<%@include file="../common/footer.jsp"%>
		<script>
	var path = "${path}";
	
	

	
	</script>
	<script src="../js/product/productlist.js"></script>
</body>
</html>