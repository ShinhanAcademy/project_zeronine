<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>
<script src="${path}/js/dropbox.js">></script>


<title>BoardEdit</title>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />
</head>


<body>
	<div class="zero_container" style="padding-top: 180px;">
		<div class="banner zn_center">
			<div style="width: 1440px">
				<img src="${path}/images/board/edit_banner.png" style="width: 100%">
			</div>
		</div>

		<div id="edit">
			<div class="edit_content">
				<div class="content">
					<div class="dropdown-title">게시글 작성</div>


					<div class="dropdown_lb">게시판 유형</div>
					<div class="dropdown">
						<button class="dropbtn">
							<span class="dropdown_default"> 게시판 유형 </span>
							<span class="dropdown_btn" onclick="dropdown()">
							<img src="${path}/images/board/down_arrow.png">
							</span>
						</button>
						<div class="dropdown-content">
							<div class="boardtype" onclick="showbType(this.innerText)">슝슝
								즉배</div>
							<div class="boardtype" onclick="showbType(this.innerText)">알뜰
								무배</div>
							<div class="boardtype" onclick="showbType(this.innerText)">1:1
								직거래</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@include file="../common/footer.jsp"%>
</body>
</html>

