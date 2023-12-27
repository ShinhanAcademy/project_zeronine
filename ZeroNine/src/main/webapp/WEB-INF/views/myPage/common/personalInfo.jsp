<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- functions lib --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- info_left -->
<div class="info_left">
	<div class="profile">
		<div class="img_wrap">
			<img src="${path}/images/mypage/img_mypage_profile.png"
				alt="profile image" />
		</div>
		${personalInfo.customerName} 님
	</div>
	<ul class="subscription_list">
		<c:choose>
			<c:when test="${personalInfo.deliverySubscription ne null || personalInfo.pickSubscription ne false}">
				<c:if test="${personalInfo.deliverySubscription ne null}">
					<li>
						<div class="img_wrap">
							<img src="${path}/images/mypage/img_bag_small.png"
								alt="subscription image">
						</div> 슝슝 무한 배송 구독중
					</li>
				</c:if>
				<c:if test="${personalInfo.pickSubscription ne false}">
					<li>
						<div class="img_wrap">
							<img src="${path}/images/mypage/img_trash_small.png"
								alt="subscription image">
						</div> 쓰레기 수거 구독중
					</li>
				</c:if>
			</c:when>
			<c:otherwise>
				<li>현재 구독 중인 구독권이 없습니다.</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<!-- //info_left -->
<!-- info_right -->
<div class="info_right">
	<table>
		<tbody>
			<tr>
				<th>지구 지킴이 횟수</th>
				<td>${personalInfo.saveEarth} 회</td>
			</tr>
			<tr>
				<th>My Point</th>
				<td>
					<fmt:formatNumber pattern="#,##0" value="${personalInfo.point}" />
				</td>
			</tr>
			<tr>
				<th>보유 회수 쿠폰</th>
				<td>${personalInfo.returnCoupon} 회</td>
			</tr>
		</tbody>
	</table>
</div>
<!-- //info_right -->