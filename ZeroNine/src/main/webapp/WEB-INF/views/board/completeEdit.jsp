<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>


<title>EditComplete</title>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />
</head>


<body>
	<div class="zero_container" style="padding-top: 180px;">
		<div class="banner zn_center">
			<div style="width: 1440px">
				<img src="${path}/images/board/edit_banner.png" style="width: 100%">
			</div>

			<div class="com">
				<ul>
					<li>
						<div>게시물이 정상적으로 작성되었습니다.</div>
					</li>
					<li>
						<button type="button"
							onclick="location.href='${path}/board/fastboard.do'">게시글
							목록</button>
					</li>
				</ul>
			</div>
		</div>
	</div>




	<%@include file="../common/footer.jsp"%>
</body>
</html>

