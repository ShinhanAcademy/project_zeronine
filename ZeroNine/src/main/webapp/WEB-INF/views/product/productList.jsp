<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/sangpum.css" />
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="zero_conatainer product_container" style="padding: 160px 0 0;">
		<div class="body-part" id="targetDiv">
			<div class="body-left">
				<img class="logo2" src="${path}/images/sangpumpage/banner.png">
				<div class="dist98"></div>
				<div class="menu_bar">
					<div class="category">
						<div class="img_wrap">
							<img src="${path}/images/sangpumpage/fluent_basket.png">
						</div>
						<p>채소류</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<img src="${path}/images/sangpumpage/lotion.png">
						</div>
						<p>생필품류</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<img src="${path}/images/sangpumpage/food_navi.png">
						</div>
						<p>음식류</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<img src="${path}/images/sangpumpage/raphael_cart.png">
						</div>
						<p>전체</p>
					</div>
				</div>
				<div class="dist49"></div>
				<div class="jul"></div>
				<div class="dist30"></div>
				</div>
				<div class="melong">
			
                                <!-- <form action="https://imecomall.co.kr/v2/shop/search.php" method="get"> -->
                                <div class="search_area">                                        
                                    <!-- <input type="hidden" name="sfl" value="it_name">
                                    <input type="hidden" name="sop" value="and"> -->
                                    <input type="text" name="q" placeholder="상품명, 제조사 검색">
                                    <button type="submit"></button>                                        
                               </div>
                             </div>
				<div class="content"></div>
				<div class="menulistpart">
				<div class="menulist">
					<c:forEach items="${plist}" var="product">
					<div class="menu_sub">
					<div class="menu_image">
						<img class="menupng" src="${path}/images/sangpumpage/ohddugi.png">
					</div>
					<span class="menufont">${product.brand}</span>
					<span class="menufont_name">${product.pName}</span>
					<span class="menufont_price">${product.price}</span>
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
</body>
</html>