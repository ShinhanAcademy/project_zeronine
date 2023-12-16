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
						class="idcheckboxfont">아이디 저장</span> <a href="${path}/auth/findId.do" class="idpwdfont">아이디
						찾기</a><span class="idpwdfont">|</span><a href="${path}/auth/findPwd.do" class="idpwdfont">비밀번호
						찾기</a>
				</div>
				<div class="loginormember">
					<button class="loginbtn" type="button" id="login_btn">로그인</button>
					<button class="memberbtn" type="button" id="join_btn">회원가입</button>
				</div>
				<div class="login-bottom">
					<button class="naver_login" onclick="location.href='/auth/naverLogin.do'">
						<div class="naverimg"  style="cursor:pointer;">
					    	<img src="${path}/images/login/loginnaverimg.png">
						</div>
						<span class="nklogin-bottom" >네이버 간편로그인</span>
					</button>
				
					<button class="kakao_login" onclick="location.href='#'">
						<div class="kakaoimg">
							<img src="${path}/images/login/loginkakakoimg.png">
						</div>
						<span class="nklogin-bottom">카카오 간편로그인</span>
					</button>
				</div>
			</div>
		</form>
	</div>


	<%@include file="../common/footer.jsp"%>
	<script>
	var path = "${path}";
	</script>
	<script src="${path}/js/auth/login.js" type="text/javascript"></script>
</body>
</html>