
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/product.css" />
<link rel="stylesheet" href="${path}/css/modal/alreadyIncartModal.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="zero_conatainer product_container">
		<div class="body-part">
			<div class="body-left">
			<a href="${path}/main/introZeroNine.do">
				<img class="logo2" src="${path}/images/main/mainvisual_02.png">
			</a>	
				<div class="dist98"></div>
				<div class="menu_bar">

					<div class="category">
						<div class="img_wrap">
							<button class="buttonValuebtn" data-value="1" onclick="search(1,this.getAttribute('data-value'))">
								<img src="${path}/images/sangpumpage/fluent_basket.png">
							</button>
						</div>
						<p>식재료</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<button class="buttonValuebtn" data-value="2" onclick="search(1,this.getAttribute('data-value'))">
								<img src="${path}/images/sangpumpage/lotion.png">
							</button>
						</div>
						<p>생필품</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<button class="buttonValuebtn" data-value="4" onclick="search(1,this.getAttribute('data-value'))">
								<img src="${path}/images/sangpumpage/food_navi.png">
							</button>
						</div>
						<p>음식</p>
					</div>
					<div class="category">
						<div class="img_wrap">
							<button class="buttonValuebtn" data-value="%"
								onclick="search(1,this.getAttribute('data-value'))">
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
						name="ptype" class="selectBox" onchange="search(1)">
						<option value="0" selected>전체</option>
						<option value="1">찜순</option>
						<option value="2">주문량순</option>
						<option value="3">낮은가격순</option>
						<option value="4">높은가격순</option>
					</select>
				</div>
				<div class="search_area">
					<form class="search_form">
						<input type="text" name="inputValue" id="inputValue" placeholder="상품명, 제조사 검색">
						<button type="button" name="searchbtn" id="searchbtn">
							<img src="${path}/images/sangpumpage/search.png">
						</button>
					</form>
				</div>
			</div>

			<div class="content"></div>
			<div class="menulistpart" id="here">
			
				ERROR
			
			<div class="dist100"></div>

				<div class="dist49"></div>
			</div>
		</div>

	</div>
<div id="modal"></div>

	<%@include file="../common/footer.jsp"%>
<script>
var path = "${path}";
</script>
<script src="../js/product/productlist.js"></script>


	
</body>
</html>