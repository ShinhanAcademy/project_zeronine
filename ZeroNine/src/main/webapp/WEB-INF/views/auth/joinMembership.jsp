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
						name="email" placeholder="이메일" required>
					<button type="button" class="double_check_btn" id="email_check">중복확인</button>
					<input type="hidden" id="hidden_email_check" value='0'>
				</div>
				<div class="form_group">
					<label>비밀번호<span>*</span></label> <input type="password"
						name="password" id="password" placeholder="비밀번호를 입력하세요." required>
				</div>
				<div class="form_group">
					<label>비밀번호 확인<span>*</span></label> <input type="password"
						name="password_check" id="password_check"
						placeholder="비밀번호를 다시 입력하세요." required>
				</div>
				<div class="form_group">
					<label>이름<span>*</span></label> <input type="text" id="name"
						name="name" placeholder="이름을 입력하세요." required>
				</div>
				<div class="form_group">
					<label>휴대폰 번호<span>*</span></label> <input type="tel" id="phone"
						name="phone" pattern="[0-9]{11}"
						placeholder="(-)를 제외하고 휴대폰 번호를 입력하세요." required>
					<button type="button" class="double_check_btn" id="phone_check">중복확인</button>
					<input type="hidden" id="hidden_phone_check" value='0'>
				</div>
				<div class="form_group">
					<label>주소<span>*</span></label> <input type="text" id="address"
						name="address" class="join_address">
					<button type="button" class="address_search_btn">
						<img src="${path}/images/auth/search.png">우편 번호 검색
					</button>
				</div>
				<div class="form_group">
					<input class="join_address_detail" type="text" id="address_detail"
						name="address_detail" placeholder="상세 주소를 입력하세요." required>
				</div>
				<div class="form_group">
					<label>생년월일<span>*</span></label> <input type="date" id="date"
						name="date" required>
				</div>
				<div class="agree_container zn_center">
					<p class="agree_tit">이용약관동의</p>
					<hr>
					<div class="agree_tot">
						<input type="checkbox" name="agree" onclick="selectAll(this)">
						<p>전체 동의</p>
					</div>
					<hr>
					<div class="agree_part">
						<div>
							<input type="checkbox" name="agree">
							<p>(필수)이용약관 동의</p>
						</div>
						<div>
							<input type="checkbox" name="agree">
							<p>(필수)개인정보 수집,이용 동의</p>
						</div>
						<div>
							<input type="checkbox" name="agree">
							<p>(선택)광고정보 수신 동의</p>
						</div>
						<div>
							<input type="checkbox" name="agree">
							<p>(필수)본인은 만 14세 이상입니다.</p>
						</div>
					</div>
				</div>
			</div>
			<button type="button" id="join_btn">가입하기</button>
		</form>

	</div>

	<%@include file="../common/footer.jsp"%>
	<script>
	var path = "${path}";
	</script>
	<script src="${path}/js/auth/join.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("#join_btn").click(f_join);		
			$("#phone_check").click(f_phone_check);				
			$("#email_check").click(f_email_check);
		});
	</script>
</body>
</html>