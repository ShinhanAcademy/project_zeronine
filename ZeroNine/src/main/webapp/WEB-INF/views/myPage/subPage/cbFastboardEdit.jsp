<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/head.jsp"%>
<%@include file="../../common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/myPage/myPageBoardEdit.css" />

<title>My page</title>


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
						<option value="freeDeliveryBoard" disabled="disabled">알뜰
							무배</option>
						<option value="oneTooneBoard" disabled="disabled">1:1 직거래</option>
					</select>
				</div>
				<div id="edit_change_area">
					<div class="content">
						<div class="due_date">
							<ul>
								<li class="due_date_title">날짜 및 시간</li>
								<li class="due_date_cf"><span> * 날짜는 최대 7일 후까시 설정
										가능합니다. <br> * 게재 날짜는 당일을 포함입니다.
								</span> <span class="due_date_ex">(ex.1월 1일 작성 시, 6일 후 → 1월 7일)
								</span></li>
								<li class="due_date_cf"><span> * 몇 시간 동안 기다릴지
										입력해주세요.<span class="due_date_ex">(게시글 최초 게시시간 기준입니다.)</span></span></li>
							</ul>

							<div class="date_input">
								<div>
									<select class="date" id="dateSelect">
										<option value="0">0일</option>
										<option value="1440">1일</option>
										<option value="2880">2일</option>
										<option value="4320">3일</option>
										<option value="5760">4일</option>
										<option value="7200">5일</option>
										<option value="8640">6일</option>
									</select>
								</div>
								<div class="time">
									<input class="remaintime" id="input_hour" type="number" value="${info.hour}" onchange="editHourF()">
									시간 <input class="remaintime" id="input_minute" type="number"
										value="${info.minute}" onchange="editMinuteF()"> 분 까지
								</div>
							</div>
						</div>

						<div id="cart">
							<div class="cart_ann">
								<ul>
									<li class="cart_ann_title">공구 상품 및 수량</li>
									<li class="cart_ann_cf">* 상품과 수량을 선택해주세요.</li>
								</ul>
							</div>
							<div class="cart_info">
								<div class="cart_list">
									<h1>게시물 공구 상품 보일거야~~~~</h1>
									<br>
									<ul>
										<li class="cart_pro_name"><input id="product_checkbox"
											type="checkbox" checked disabled>
											<p>
												${info.brand} <br> ${info.pName}
											</p></li>
										<li>
											<div class="count">
												<button>
													<img src="${path}/images/board/minus.png">
												</button>
												<input type="text" disabled value="${info.pickCount}">
												<button>
													<img src="${path}/images/board/plus.png">
												</button>
											</div>
											<hr>
										</li>
									</ul>
									<div class="cart_img">
										<img src="${info.imagePath}">
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="write_content">

						<div class="write_title">본문 작성</div>

						<div class="main_text">
							<ul>
								<li class="title">제목</li>
								<li><textarea class="title_input" placeholder="제목을 입력하세요." onchange="editTitleF()">${info.title}</textarea></li>
								<li class="context">내용</li>
								<li><textarea class="context_input"
										placeholder="내용을 입력하세요." onchange="editContextF()">${info.boardContent}</textarea></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="done">
					<button class="done_btn">수정완료</button>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../../common/footer.jsp"%>
	<script>
	
		var day = ${info.day} * 60 * 24;
		var selectElement = $("#dateSelect option");
		for(var i=0; i<selectElement.length; i++){
			var option = selectElement[i];
			if(option.value == day){
				option.selected = true;
				var editDay = $("#dateSelect option:selected").val();
				break
			}
		}
		
		editHour =  $("#input_hour").val();
		editMinute =  $("#input_minute").val();
		editTitle =  $(".title_input").val();
		editContext =  $(".context_input").val();
		
		if(${participant}>1){
			$(".remaintime").attr("readonly",true);
			$("#dateSelect").attr("disabled",true);
			//var editHour =  $("#input_hour").val();
			//var editMinute =  $("#input_minute").val();
			
		}else{
			$("#dateSelect").change(function(){
				editDay = $("#dateSelect option:selected").val();
			});
		}
		
		function editHourF(){
			editHour =  $("#input_hour").val();
		}
		function editMinuteF(){
			editMinute =  $("#input_minute").val();
		}
		function editTitleF(){
			editTitle =  $(".title_input").val();
		}
		function editContextF(){
			editContext =  $(".context_input").val();
		}
		
		
		$(".done_btn").click(function(){
			var obj = {
					"boardId" : "${info.boardId}",
					"participant" : "${participant}",
					"day" : editDay,
					"hour" : editHour,
					"minute" : editMinute,
					"title" : editTitle,
					"context" : editContext
					};
			
			$.ajax({
						url : "${path}/myPage/subPage/completeEdit.do",
						data : JSON.stringify(obj),
						type : "POST",
						contentType: "application/json",
						success : function(result) {
							$("#edit").html(result);
						},
						error : function() {
							alert("에러입니다.");
						}
					});
			
		});
	</script>
</body>
</html>