<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<title>로그인</title>
<link rel="stylesheet" href="${path}/css/auth/login.css">
</head>
<%@include file="../common/header.jsp"%>
<body>
	<div class="login_wrap zero_container">
		<h1>로그인</h1>
		<form id="loginForm">
			<div class="login_container zn_center">
				<div class="form_group">
					<input type="email" id="email" name="email"
						placeholder="이메일을 입력하세요." required> <input type="password"
						id="password" name="password" placeholder="비밀번호를 입력하세요." required>
				</div>
				<div class="login-middle">
					<img src="${path}/images/login/idcheckbox.png"> <span
						class="idcheckboxfont">아이디 저장</span> <span class="idpwdfont">아이디
						찾기</span><span class="idpwdfont">|</span><span class="idpwdfont">비밀번호
						찾기</span>
				</div>
				<div class="loginormember">
					<button class="loginbtn">로그인</button>
					<button class="memberbtn">회원가입</button>
				</div>
				<div class="login-bottom">
					<div class="naverimg">
						<img src="${path}/images/login/loginnaverimg.png">
					</div>
					<span class="nklogin-bottom">네이버 간편로그인</span>
					<div class="kakaoimg">
						<img src="${path}/images/login/loginkakakoimg.png">
					</div>
					<span class="nklogin-bottom">카카오 간편로그인</span>
				</div>
			</div>
		</form>
	</div>


	<%@include file="../common/footer.jsp"%>
</body>
</html>