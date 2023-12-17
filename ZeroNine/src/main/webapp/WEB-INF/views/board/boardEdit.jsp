<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />

<title>BoardEdit</title>

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
			console.log("editCom() => send_bt_to_com :", send_bt_to_com);
			
			//1:1거래라면 이미지도 함께 전송이 되어야 한다.
			if(send_bt_to_com=="oneTooneBoard") {
				console.log("oneTooneBoard에 해당하는 AJAX를 실행할것이다.");
		
				var send_bt_to_com = $("#be_board_type").val();

				var form = $('#imgFile')[0].files[0];
				var formData = new FormData();
				
				var board_type = $("#be_board_type").val();
				var postingMinutes = $("#time_setting").val();
				var address = $("#address").val();
				var addressDetail = $("#address_detail").val();
				var title = $(".title_input").val();
				var content = $(".context_input").val();
				

				formData.append("imgFile", form);
				formData.append("board_type", board_type);
				formData.append("postingMinutes", postingMinutes);
				formData.append("address", address);
				formData.append("addressDetail", addressDetail);
				formData.append("title", title);
				formData.append("content", content);
				
				$.ajax({
					url : "/board/completeeditO.do",
					type : "POST",
					enctype: 'multipart/form-data',
					cache : false,
					contentType: false,
					processData: false,
					data: formData,
					success : function(responseData) {
						$("#edit").html(responseData);
					}
				});	
			}
			else {
				$.ajax({
					url : '/board/completeedit.do',
					data: {"send_bt_to_com" : send_bt_to_com},
					success : function(responseData) {
						$("#edit").html(responseData);
					}
				});	
			}
			
			
		}
	</script>


	<%@include file="../common/footer.jsp"%>
</body>
</html>