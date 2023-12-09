<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="content">
					<div class="info_title">게시글 작성</div>
					<label>게시판 유형</label> <select name="board_type" id="board_type"
						onchange="boardType()">
						<option disabled="disabled">==게시판 선택==</option>
						<option value="fast_board" >슝슝 즉배</option>
						<option value="free_delivery_board" selected="selected">알뜰 무배</option>
						<option value="one_to_one_board">1:1 직거래</option>
					</select>
						<div class="due_date">
							<ul>
								<li class="due_date_title">날짜 및 시간</li>
								<li class="due_date_cf"><span> * 날짜는 최대 7일 후까시 설정
										가능합니다.</span> <span class="due_date_ex">(ex.1월 1일 작성 → 1월 7일까지
										설정 가능)</span></li>
								<li class="due_date_cf"><span> * 시간은 24시간제로 입력해주세요.</span>
									<span class="due_date_ex">(ex.오후 3시 → 15:00)</span></li>
							</ul>

							<div class="date_input">
								<div class="date">
									<input type="number" placeholder="01"> 월 <input
										type="number" placeholder="01"> 일
								</div>
								<div class="time">
									<input type="number" placeholder="15"> : <input
										type="number" placeholder="00"> 까지
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
									<ul>
										<li class="cart_pro_name"><input type="checkbox">
											<p>
												오랄비 <br> 칫솔 벨벳 초미세모 초소형헤드 3개입
											</p></li>
										<li>
											<div class="count">
												<button>
													<img src="${path}/images/board/minus.png">
												</button>
												<input type="text" readonly="readonly" value="1">
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



						<div class="done">
							<button class="done_btn" onclick="editCom()">작성완료</button>
						</div>
					</div>