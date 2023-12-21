<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%-- functions lib --%>

<style>
.active { 
   border:1px solid red;
}

</style>

<header class="zn_header">
	<div class="top">
		<div class="top_inner zn_center">
			<%-- member --%>
			<div class="member">
				<c:choose>
					<c:when test="${sessionScope.customerId ne null}">
						<p><a href="${path}/myPage/orderHistory.do" class="user_name">${sessionScope.customerName}</a> 님 에코에코한 하루되세요😊!</p>
						<ul>
							<li><a href="${path}/myPage/orderHistory.do">마이페이지</a></li>
							<li><a href="#">로그아웃</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul>
							<%-- <jsp:forward page="${path}/auth/login.do" /> --%>
							<li><a href="${path}/auth/login.do">로그인</a></li>
							<li><a href="${path}/auth/joinMembership.do">회원가입</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<%-- //member --%>
			<div class="logo">
				<h1>
					<a href="${path}/main/main.do"></a>
				</h1>
			</div>
		</div>
	</div>
	<div class="bot">
		<div class="bot_inner zn_center">
			<%-- menu --%>
			<ul class="menu gnb_1depth">
				<li><a href="${path}/product/productList.do">상품목록</a>
					<ul class="gnb_2depth" >
						<li onclick="changeCss('채소')"><a href="${path}/product/productList.do">채소</a></li>
						<li onclick="changeCss('생필품')"><a href="${path}/product/productList.do">생필품</a></li>
						<li onclick="changeCss('음식')"><a href="${path}/product/productList.do">음식</a></li>
						<li onclick="changeCss('전체')"><a href="${path}/product/productList.do">전체</a></li>
					</ul></li>
				<li><a href="${path}/board/">게시판</a></li>
				<li><a href="${path}/myPage/ecoCare.do">마이 에코케어</a></li>
				<li><a href="${path}/subscription/subscriptionBuy.do">구독권</a></li>
			</ul>
			<%-- //menu --%>
			<%-- user_fav --%>
			<div class="user_fav">
				<ul>
					<li class="icon_btn">
						<c:choose>
							<c:when test="${sessionScope.customerId ne null}">
								<button type="button" class="wish"
									onclick="location.href='${path}/myPage/likeProduct.do';">찜하기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="wish"
									onclick="location.href='${path}/auth/login.do';">찜하기</button>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="icon_btn">
						<c:choose>
							<c:when test="${sessionScope.customerId ne null}">
								<button type="button" class="my"
									onclick="location.href='${path}/myPage/orderHistory.do';">마이페이지</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="my"
									onclick="location.href='${path}/auth/login.do';">마이페이지</button>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="icon_btn">
						<c:choose>
							<c:when test="${sessionScope.customerId ne null}">
								<button type="button" class="cart"
									onclick="location.href='${path}/myPage/myCart.do';">카트</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="cart"
									onclick="location.href='${path}/auth/login.do';">카트</button>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
			<%-- //user_fav --%>
		</div>
	</div>
</header>
<!-- <script>
   function changeCss(category){
	   //sessionStorage.setItem("category", category);
	   
	   $("div.menu_bar > div").each(function(index, item){
		   var category2 = $(this).find("p").text();
		   if(category == category2){
			   $(this).addClass("active");
		   }else{
			   $(this).removeClass("active");
		   }
	   });
	    
	   
	   
   }
   
</script> -->





