<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../common/head.jsp"%>
<%@include file="../../common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />

<title>My page</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f8319ad3e87a23d9e09852a09ba8028&libraries=services,clusterer,drawing"></script>


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
					<div class="info_title">게시글 작성</div>
					<label>게시판 유형</label> <select name="board_type" id="be_board_type"
						onchange="selectBoardEdit()">
						<option disabled="disabled">==게시판 선택==</option>
						<option value="fastBoard">슝슝 즉배</option>
						<option value="freeDeliveryBoard">알뜰 무배</option>
						<option value="oneTooneBoard">1:1 직거래</option>
					</select>
				</div>

				<div id="edit_change_area"></div>

				<div class="done">
					<button class="done_btn" onclick="editCom()">작성완료</button>
				</div>
			</div>

		</div>
	</div>



	<script>
		
	</script>


	<%@include file="../../common/footer.jsp"%>
</body>
</html>

