<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../common/head.jsp"%>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />

<title>BoardEdit</title>

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
					<div>
					
						<form action="#">
							<label for="lang">게시판 유형</label> <select name="board_type"
								id="board_type">
								<option>==게시판 선택==</option>
								<option value="fast_board">슝슝 즉배</option>
								<option value="free_delivery_board">알뜰 무배</option>
								<option value="one_to_one_board">1:1 직거래</option>
							</select>
						</form>
					</div>

					<div class="due_date">
						<ul>
							<li>날짜 및 시간</li>
							<li><span> * 날짜는 최대 7일 후까시 설정 가능합니다.</span> <span>(ex.1월
									1일 작성 → 1월 7일까지 설정 가능)</span></li>
							<li><span> * 시간은 24시간제로 입력해주세요.</span> <span>(ex.오후
									3시 → 15:00)</span></li>
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
								<li>공구 상품 및 수량</li>
								<li>* 상품과 수량을 선택해주세요.</li>
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
							</div>
							<div class="cart_img">
								<img src="${path}/images/board/product2.png">
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
							<li><textarea class="context_input" placeholder="내용을 입력하세요."></textarea>
							</li>
						</ul>
					</div>



					<div class="done">
				
							<button class="done_btn" onclick="call()">작성완료</button>				
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
    <script>
       function call(){
    	   $.ajax({
    		   url:'/board/completeedit.do',
    		   success: function(responseData){
    			   $("#edit").html(responseData);
    		   }
    	   });
       }
    </script>


	<%@include file="../common/footer.jsp"%>
</body>
</html>
