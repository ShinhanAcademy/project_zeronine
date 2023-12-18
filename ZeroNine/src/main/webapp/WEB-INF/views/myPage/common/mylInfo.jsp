<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="my_info_wrap">
	<!-- info_left -->
	<div class="info_left">
		<div class="profile">
			<div class="img_wrap">
				<img src="${path}/images/mypage/img_mypage_profile.png"
					alt="profile image" />
			</div>
			홍길동 님
		</div>
		<ul class="subscription_list">
			<li>
				<div class="img_wrap">
					<img src="${path}/images/mypage/img_bag_small.png"
						alt="subscription image">
				</div> 슝슝 무한 배송 구독중
			</li>
			<li>
				<div class="img_wrap">
					<img src="${path}/images/mypage/img_trash_small.png"
						alt="subscription image">
				</div> 쓰레기 수거 구독중
			</li>
			<li>현재 구독 중인 구독권이 없습니다.</li>
		</ul>
	</div>
	<!-- //info_left -->
	<!-- info_right -->
	<div class="info_right">
		<table>
			<tbody>
				<tr>
					<th>지구 지킴이 횟수</th>
					<td>36회</td>
				</tr>
				<tr>
					<th>My Point</th>
					<td>4,280
						<button class="btn_orange_small">충전하기</button>
					</td>
				</tr>
				<tr>
					<th>회수 쿠폰</th>
					<td>36회</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- //info_right -->
</div>