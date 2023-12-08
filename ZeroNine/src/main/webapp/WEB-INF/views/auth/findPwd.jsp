<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<title>아이디 찾기</title>
<link rel="stylesheet" href="${path}/css/auth/find.css">
<link rel="stylesheet" href="${path}/css/modal/findModal.css">
</head>
<%@include file="../common/header.jsp"%>
<body>
	<div class="find_wrap zero_container">
		<h1>비밀번호 찾기</h1>
		<form id="findPwdForm" onsubmit="return false;">
			<div class="find_container zn_center">
				<div class="form_group">
					<label>이름</label> <input type="text" name="name" id="name"
						placeholder="이름을 입력하세요."> <label>이메일</label> <input
						type="email" name="email" id="email" 
						placeholder="이메일을 입력하세요.">
					<button type="button" id="getCf_btn">인증번호 받기</button>
				</div>
			</div>
		</form>
	</div>
	<div id="modal"></div>

<%@include file="../common/footer.jsp"%>
	<script>
	var path = "${path}";
	</script>
<script src="${path}/js/auth/find.js" type="text/javascript"></script>	
</body>
</html>