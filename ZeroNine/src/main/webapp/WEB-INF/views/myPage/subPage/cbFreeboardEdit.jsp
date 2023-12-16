<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../common/head.jsp"%>
<%@include file="../../common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />

<title>My page</title>


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
						<option value="fastBoard" disabled>슝슝 즉배</option>
						<option value="freeDeliveryBoard" selected>알뜰 무배</option>
						<option value="oneTooneBoard" disabled>1:1 직거래</option>
					</select>
				</div>

				<div id="edit_change_area">

					<div class="content">
						<div class="due_date">
							<ul>
								<li class="due_date_title">날짜 및 시간</li>
								<li class="due_date_cf"><span> * 날짜는 최대 7일 후까시 설정
										가능합니다. <br> * 게재 날짜는 당일을 포함입니다.
								</span> <span class="due_date_ex">(ex.1월 1일 작성 시, 7일 후 → 1월 7일)
								</span></li>
								<li class="due_date_cf"><span> * 몇 시간 동안 기다릴지
										입력해주세요.<span class="due_date_ex">(게시글 최초 게시시간 기준입니다.)</span>
								</span></li>
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
										<option value="10080">7일</option>
									</select>
								</div>
								<div class="time">
									<input type="number" placeholder="3"> 시간 <input
										type="number" placeholder="00"> 분 까지
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
									<ul>
										<li class="cart_pro_name"><input id="product_checkbox"
											type="checkbox" >
											<p>
												오랄비 <br> 칫솔 벨벳 초미세모 초소형헤드 3개입
											</p></li>
										<li>
											<div class="count">
												<button>
													<img src="${path}/images/board/minus.png">
												</button>
												<input type="text" value="1">
												<button>
													<img src="${path}/images/board/plus.png">
												</button>
											</div>
											<hr>
										</li>
									</ul>
									<div class="cart_img">
										<img src="${path}/images/board/product2.png">
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
								<li><textarea class="title_input" placeholder="제목을 입력하세요."></textarea></li>
								<li class="context">내용</li>
								<li><textarea class="context_input"
										placeholder="내용을 입력하세요."></textarea></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="done">
					<button class="done_btn" onclick="editCom()">수정완료</button>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../../common/footer.jsp"%>
</body>
</html>

