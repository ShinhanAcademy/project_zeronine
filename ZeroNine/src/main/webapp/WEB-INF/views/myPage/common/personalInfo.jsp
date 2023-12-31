<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- jstl lib --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- date format lib --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- functions lib --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- info_left -->
<div class="info_left">
	<div class="profile">
		<div class="img_wrap">
			<c:choose>
				<c:when test="${personalInfo.customerName eq '방용수' || personalInfo.customerId eq '4591549e-7eaa-4009-a4cd-b052d8b1f537' || personalInfo.customerId eq '490ef92a-d77f-432f-8bfb-2828eee6db77'}">
					<img src="${path}/images/common/img_user_ys.jpg"
						alt="profile image" class="has_user_img" />
				</c:when>
				<c:when test="${personalInfo.customerName eq '이예나' || personalInfo.customerId eq '87c5033c-ef9d-4934-930a-2f172cdad795'}">
					<img src="${path}/images/common/img_user_yn.jpg"
						alt="profile image" class="has_user_img" />
				</c:when>
				<c:when test="${personalInfo.customerName eq '정주영' || personalInfo.customerId eq 'e70c4145-25b8-43d3-9ff8-60ef51d4adb9'}">
					<img src="${path}/images/common/img_user_jy.jpg"
						alt="profile image" class="has_user_img" />
				</c:when>
				<c:when test="${personalInfo.customerName eq '노승광' || personalInfo.customerName eq '네이버승광' || personalInfo.customerId eq '68966705-7537-4e13-8262-dffaa09f39c8'}">
					<img src="${path}/images/common/img_user_sg.png"
						alt="profile image" class="has_user_img" />
				</c:when>
				<c:when test="${personalInfo.customerName eq '유은경' || personalInfo.customerId eq '7cb70b46-d6c2-462d-b785-dc27e1e7d045'}">
					<img src="${path}/images/common/img_user_ek.jpg"
						alt="profile image" class="has_user_img" />
				</c:when>
				<c:otherwise>
					<img src="${path}/images/common/img_user_profile.png"
						alt="profile image" class="has_user_img" />
				</c:otherwise>
			</c:choose>
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