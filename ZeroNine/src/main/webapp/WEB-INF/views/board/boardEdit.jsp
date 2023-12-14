<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />

<title>BoardEdit</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f8319ad3e87a23d9e09852a09ba8028"></script>
<%-- <script type="text/javascript" src="<c:url value='/js/kakaoApi.js' />"></script> --%>

</head>
<!-- boardType 저장해서 페이지 뿌리기 >> 나중에 include만 존재해야 함   -->
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
						<option value="freeDeliveryBoard"
							${boardType =='freeDeliveryBoard' ?"selected":""}>알뜰 무배</option>
						<option value="oneTooneBoard"
							${boardType =='oneTooneBoard' ?"selected":""}>1:1 직거래</option>
					</select> <input type="hidden" name="boardType" id="boardType"
						value="${boardType}" />
				</div>

				<div id="edit_change_area"></div>

				<div class="done">
					<button class="done_btn" onclick="editCom()">작성완료</button>
				</div>
			</div>

		</div>
	</div>



	<script>
		$(function() {
			selectBoardEdit();
		});
		
	
		
		function selectBoardEdit() {
			/* var value = boardtype.value; */
			var board_type = $("#be_board_type").val();
			console.log(board_type);

			if (board_type == "fastBoard") {
				$.ajax({
					url : '/board/fastEdit.do',
					success : function(responseData) {
						console.log(responseData);
						$("#edit_change_area").html(responseData)
					}
				});
			} else if (board_type == "freeDeliveryBoard") {
				$.ajax({
					url : '/board/freeDeliveryEdit.do',
					success : function(responseData) {
						$("#edit_change_area").html(responseData)
					}
				});
			} else if (board_type == "oneTooneBoard") {
				$.ajax({
					url : '/board/oneTooneEdit.do',
					success : function(responseData) {
						$("#edit_change_area").html(responseData);
					}
				});
			}

		}

		function editCom() {
			var send_bt_to_com = $("#be_board_type").val();
			$.ajax({
				url : '/board/completeedit.do',
				data: {"send_bt_to_com" : send_bt_to_com},
				success : function(responseData) {
					$("#edit").html(responseData);
				}
			});
		}
	</script>


	<%@include file="../common/footer.jsp"%>
</body>
</html>

