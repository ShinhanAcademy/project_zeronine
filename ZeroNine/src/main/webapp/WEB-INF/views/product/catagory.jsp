<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					  <fmt:formatNumber value="${product.price}" maxFractionDigits="3"></fmt:formatNumber>
					원</span>
		</div>

</c:forEach>
<script>
$(".like").click(function (){

    var currentImagePath = $(this).find("img.menu_heart").attr("src");
    var newImagePath = currentImagePath === path+"/images/board/heart.png" ?
        path+"/images/board/red_heart.png" :
        path+"/images/board/heart.png";

    $(this).find("img.menu_heart").attr("src", newImagePath);
});
</script>

					