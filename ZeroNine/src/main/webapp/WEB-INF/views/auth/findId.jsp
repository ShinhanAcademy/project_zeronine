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
		<h1>아이디 찾기</h1>
		<form id="findIdForm">
			<div class="find_container zn_center">
				<div class="form_group">
					<label>이름</label> <input type="text" name="name" id="name"
						placeholder="이름을 입력하세요."> <label>휴대폰 번호</label> <input
						type="tel" name="phone" id="phone" pattern="[0-9]{11}"
						placeholder="휴대폰 번호를 입력하세요.">
					<button type="button" id="find_btn">확인</button>
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