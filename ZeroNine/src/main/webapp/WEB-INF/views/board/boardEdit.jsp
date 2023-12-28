<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />
<link rel="stylesheet" href="${path}/css/common/writeBoard.css" />
<link rel="stylesheet" href="${path}/css/product/productOrder.css" />

<title>BoardEdit</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f8319ad3e87a23d9e09852a09ba8028&libraries=services,clusterer,drawing"></script>


</head>
<body>
<div id="here">
	<div class="zero_container" style="padding-top: 20px;">
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
</div>


	<script>
	
		$(function() {
			selectBoardEdit();
			
		});
		
		function handleCheckbox(){
				price = 0;
				checkboxes.forEach(function(checkbox){
				var row = checkbox.closest('tr');
				var productId = row.querySelector('#check_box').value;
				var selectedCount = row.querySelector('[name=select_count]').value;
				if(checkbox.checked){
					price = price + (row.querySelector('#onePrice').value * selectedCount);
					myMap.set(productId,selectedCount);
				}else{
					myMap.delete(productId);
				}
			})
			$(".totalPrice").html(Intl.NumberFormat().format(price) + " 원");
		}

		function countQuantityF(clickedCheckbox) {
			handleCheckbox();
			
			var cRow = clickedCheckbox.closest('tr');
			var check = cRow.querySelector('#check_box');
			var itemPriceValue = cRow.querySelector('[name=select_count]').value * cRow.querySelector('#onePrice').value;
			var deliformattedValue = new Intl.NumberFormat('ko-KR', {
				    style: 'decimal',
				    currency: 'KRW' // 대한민국 원
				  }).format(itemPriceValue);	
			cRow.querySelector('#ob_price').innerText = deliformattedValue+"원";
			/* var cRow = clickedCheckbox.closest('tr');
			var check = cRow.querySelector('#check_box');
			beforeSelectedCount = cRow.querySelector('[name=select_count]').value;
			var changePrice = cRow.querySelector('#onePrice').value;
			if(check.checked){
				price = price - changePrice * beforeSelectedCount;
				console.log(price)
				selectedCount = cRow.querySelector('#select_count').value;
				price = price + changePrice * selectedCount;
				console.log(price)
				myMap.set(cRow.querySelector('#check_box').value,selectedCount);
			}
			$(".totalPrice").html(Intl.NumberFormat().format(price) + " 원"); */
		}
		
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
						myMap = new Map();
						checkboxes = document.getElementsByName('checkboxGroup');
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
			//console.log("editCom() => send_bt_to_com :", send_bt_to_com);
		
			//공통 내용
			var board_type = $("#be_board_type").val();
			var title = $(".title_input").val();
			var content = $(".context_input").val();
			
			//1:1거래라면 이미지도 함께 전송이 되어야 한다.
			if(send_bt_to_com=="oneTooneBoard") {
				//console.log("oneTooneBoard에 해당하는 AJAX를 실행할것이다.");
		
				var send_bt_to_com = $("#be_board_type").val();
				var postingMinutes = $("#time_setting").val();
				var address = $("#address").val();
				var addressDetail = $("#address_detail").val();
				
				var form = $('#imgFile')[0].files[0];
				var formData = new FormData();
				
				/* var board_type = $("#be_board_type").val();
				var postingMinutes = $("#time_setting").val();
				var address = $("#address").val();
				var addressDetail = $("#address_detail").val();
				var title = $(".title_input").val();
				var content = $(".context_input").val(); */
				

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
			else if(send_bt_to_com=="fastBoard") { //즉배
				//console.log($("#wait_minute"));
				var dayAsMinute = $(".date").val(); //val은 minute으로 설정됨
				
				var waitHourValue = Number($('#wait_hour').val());
				var waitMinuteValue = Number($('#wait_minute').val());
			    var productId = $('#productId').val();
			    var count = $('#count').val();
				
				//console.log(waitHourValue, waitMinuteValue, productId, count);
				
				var postingMinutes = Number(dayAsMinute) + waitHourValue * 60 + waitMinuteValue;
				
				//console.log(postingMinutes);
				
				var obj = {
						"send_bt_to_com" : board_type,
						"postingMinutes" : postingMinutes,
						"title" : title,
						"content" : content,
						"productId" : productId,
						"count" : count		
				}
				
				//console.log("obj at boardEdit.jsp==>", obj);
				
				$.ajax({
					url: '${path}/common/writeOrderFast.do',
					//url: '${path}/board/completeedit.do',
					type: "POST",
					data: JSON.stringify(obj),
					contentType: "application/json",
					success : function(responseData) {
						//$("#edit").html(responseData);
						$("#here").html(responseData);
					}
				});	
			}
			else { //무배
				//console.log($("#wait_minute"));
				var dayAsMinute = $(".date").val(); //val은 minute으로 설정됨
				
				var waitHourValue = Number($('#wait_hour').val());
				var waitMinuteValue = Number($('#wait_minute').val());
			    
				
				
				//console.log(waitHourValue, waitMinuteValue);
				
				var postingMinutes = Number(dayAsMinute) + waitHourValue * 60 + waitMinuteValue;
				
				//console.log(postingMinutes);
				var obj = {
						"send_bt_to_com" : board_type,
						"postingMinutes" : postingMinutes,
						"title" : title,
						"content" : content,
						"myMap" : Object.fromEntries(myMap)
						//구매 상품 정보도 넣어야 함
				}
				$.ajax({
					url : '${path}/common/writeOrderFree.do',
					type: "POST",
					data: JSON.stringify(obj),
					contentType: "application/json",
					success : function(responseData) {
						//$("#edit").html(responseData);
						$("#here").html(responseData);
					}
				});
				
			}
			
			
		}
	</script>


	<%@include file="../common/footer.jsp"%>
</body>
</html>