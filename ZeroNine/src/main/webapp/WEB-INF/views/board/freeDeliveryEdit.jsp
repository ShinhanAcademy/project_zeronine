<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content">

	<div class="due_date">
		<ul>
			<li class="due_date_title">날짜 및 시간</li>
			<li class="due_date_cf"><span> * 날짜는 최대 7일 후까시 설정 가능합니다.
					<br> * 게재 날짜는 당일을 포함합니다.
			</span> <span class="due_date_ex">(ex.1월 1일 작성 시, 7일 후 → 1월 7일) </span></li>
			<li class="due_date_cf"><span> * 몇 시간 동안 기다릴지 입력해주세요.</span></li>
		</ul>

		<div class="date_input">
			<div>
				<select class="date">
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
				<input type="number" placeholder="3" id="wait_hour"> 시간 
				<input type="number" placeholder="00" id="wait_minute"> 분 까지
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
								<img src="${path}/images/board/minus.png" class="minus" onclick="minus()" >
							</button>
							<input type="text" readonly="readonly" value="1" class="num">
							<button>
								<img src="${path}/images/board/plus.png" class="plus" onclick="add()">
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
			<li><textarea class="context_input" placeholder="내용을 입력하세요."></textarea></li>
		</ul>
	</div>



	<div class="done">
		<button class="done_btn" onclick="editCom()">작성완료</button>
	</div>
</div>



<script>
	document.querySelector(".date").addEventListener("change", function() {
		var selectedValue = this.value;
		console.log(selectedValue);
	})
	
	function add(){
		var num = Number($(".num").val());
		num += 1;
		$(".num").val(num);
	}
	
	function minus(){
		var num = Number($(".num").val());
		if(num>=1){
		num -= 1;
		}
		$(".num").val(num);
		console.log(num)
	}
</script>