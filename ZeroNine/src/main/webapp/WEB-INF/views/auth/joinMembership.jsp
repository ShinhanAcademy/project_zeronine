<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<title>회원가입</title>
<link rel="stylesheet" href="${path}/css/auth/join.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
					<button type="button" class="address_search_btn" onclick ="address_search()">
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
						<input id="check_all" type="checkbox" name="agree" onclick="selectAll(this)">
						<p>전체 동의</p>
					</div>
					<hr>
					<div class="agree_part">
						<div>
							<input class="check_essential" type="checkbox" name="agree" onclick="BtnDisabled()">
							<p>(필수)이용약관 동의</p>
						</div>
						<div>
							<input class="check_essential" type="checkbox" name="agree" onclick="BtnDisabled()">
							<p>(필수)개인정보 수집,이용 동의</p>
						</div>
						<div>
							<input type="checkbox" name="agree" onclick="BtnDisabled()">
							<p>(선택)광고정보 수신 동의</p>
						</div>
						<div>
							<input class="check_essential" type="checkbox" name="agree" onclick="BtnDisabled()">
							<p>(필수)본인은 만 14세 이상입니다.</p>
						</div>
					</div>
				</div>
			</div>
			<button type="button" id="join_btn" disabled>가입하기</button>
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
		
		function address_search() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("address").value = extraAddr;

					} else {
						document.getElementById("address").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('address').value = data.zonecode;
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("address_detail").focus();
				}
			}).open();
		}
	</script>
</body>
</html>