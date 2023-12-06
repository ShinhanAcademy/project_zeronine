<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<title>회원가입</title>
<link rel="stylesheet" href="${path}/css/auth/join.css">
</head>
<%@include file="../common/header.jsp"%>
<body>
	<div class="join_wrap zero_container">
		<h1>회원가입</h1>
		<form id="joinForm">
			<div class="join_container zn_center">
				<div class="form_group">
					<label>이메일<span>*</span></label> <input type="email" id="email"
						placeholder="이메일">
					<button class="double_check_btn">중복확인</button>
				</div>
				<div class="form_group">
					<label>비밀번호<span>*</span></label> <input type="password"
						id="password" placeholder="비밀번호를 입력하세요.">
				</div>
				<div class="form_group">
					<label>비밀번호 확인<span>*</span></label> <input type="password"
						id="password_check" placeholder="비밀번호를 다시 입력하세요.">
				</div>
				<div class="form_group">
					<label>이름<span>*</span></label> <input type="text" id="name"
						placeholder="이름을 입력하세요.">
				</div>
				<div class="form_group">
					<label>휴대폰 번호<span>*</span></label> <input type="tel" id="tel"
						pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="휴대폰 번호를 입력하세요.">
					<button class="double_check_btn">중복확인</button>
				</div>
				<div class="form_group">
					<label>주소<span>*</span></label> <input type="text" id="address"
						class="join_address">
					<button class="address_search_btn">
						<img src="${path}/images/auth/search.png">우편 번호 검색
					</button>
				</div>
				<div class="form_group">
					<input class="join_address_detail" type="text" id="address_detail"
						placeholder="상세 주소를 입력하세요.">
				</div>
				<div class="form_group">
					<label>생년월일<span>*</span></label> <input type="date" id="date">
				</div>
				<div class="agree_container zn_center">
					<p class="agree_tit">이용약관동의</p>
					<hr>
					<div class="agree_tot"><input type="checkbox"><p>전체 동의</p></div>
					<hr>
				</div>
			</div>
		</form>

	</div>

	<%@include file="../common/footer.jsp"%>
</body>
</html>