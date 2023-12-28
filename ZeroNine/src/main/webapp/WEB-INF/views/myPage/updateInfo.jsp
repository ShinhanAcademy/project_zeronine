<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<title>MyPage</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<!-- zero_container -->
	<div class="zero_container zn_center">
		<!-- mypage_container -->
		<div class="mypage_container">
			<!-- zero_sbn -->
			<%@include file="common/myPageSnb.jsp" %>
			<!-- //zero_sbn -->
			<!-- mypage_detail_wrap -->
			<div class="mypage_detail_wrap">
	            <!-- my_info_wrap -->
	            <div id="personalInfo" class="my_info_wrap">
				</div>
	            <!-- //my_info_wrap -->
				<!-- contents_wrap -->
				<div class="contents_wrap">
					<span class="info_font">개인정보</span>
					<hr>
					<br>
					<br>
					<br>
					<div class="update_wrap">
						<form id="updateForm">
							<div class="update_container zn_center">
								<div class="form_group">
									<label>이름</label> <input disabled type="text" id="name" name="name"
										placeholder="방용수" required>
								</div>
								<div class="form_group">
									<label>이메일</label> <input disabled type="email" id="email"
										name="email" placeholder="yongsu@gmail.com" required>
								</div>
								<div class="form_group">
									<label>새 비밀번호</label> <input type="password" name="password"
										id="password" placeholder="비밀번호를 입력하세요." required>
								</div>
								<div class="form_group">
									<label>새비밀번호 확인</label> <input type="password"
										name="password_check" id="password_check"
										placeholder="비밀번호를 다시 입력하세요." required>
								</div>

								<div class="form_group">
									<label>휴대폰 번호</label> <input type="tel" id="phone" name="phone"
										pattern="[0-9]{11}" placeholder="(-)를 제외하고 휴대폰 번호를 입력하세요."
										required>
									<button type="button" class="double_check_btn" id="phone_check">중복확인</button>
									<input type="hidden" id="hidden_phone_check" value='0'>
								</div>
								<div class="form_group">
									<label>주소</label> <input type="text" id="address"
										name="address" class="update_address">
									<button type="button" class="address_search_btn">
										<img src="${path}/images/auth/search.png">우편 번호 검색
									</button>
								</div>
								<div class="form_group">
									<input class="update_address_detail" type="text"
										id="address_detail" name="address_detail"
										placeholder="상세 주소를 입력하세요." required>
								</div>
								<div class="form_group">
									<label>생년월일</label> <input type="date" id="date" name="date"
										required>
								</div>
							</div>
							<button type="button" id="update_btn">수정하기</button>
						</form>

					</div>
					<!-- contents -->

					<!--  -->
				</div>
				<!-- //contents -->
			</div>
			<!-- //contents_wrap -->
		</div>
		<!-- //mypage_detail_wrap -->
	</div>
	<!-- //mypage_container -->

	<!-- //zero_container -->
	<%@include file="../common/footer.jsp"%>
	<script>
		
	</script>



</body>
</html>

























 --%>