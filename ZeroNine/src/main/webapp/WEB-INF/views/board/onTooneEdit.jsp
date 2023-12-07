<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content">
	<div class="info_title">게시글 작성</div>

	<label>게시판 유형</label> <select name="board_type" id="board_type"
		onchange="boardType()">
		<option disabled="disabled">==게시판 선택==</option>
		<option value="fast_board">슝슝 즉배</option>
		<option value="free_delivery_board">알뜰 무배</option>
		<option value="one_to_one_board" selected="selected">1:1 직거래</option>

	</select>

	<div class="due_date">
		<ul>
			<li class="due_date_title">시간</li>
			<li class="due_date_cf"><span> * 시간은 최대 3시간까지 설정 가능합니다.</span>
		</ul>

		<div class="date_input">
			<select name="time_setting" id="time_setting">
				<option>==시간 선택==</option>
				<option value="5">5분</option>
				<option value="10">10분</option>
				<option value="15">15분</option>
				<option value="20">20분</option>
				<option value="25">25분</option>
				<option value="30">30분</option>
				<option value="60">1시간</option>
				<option value="90">1시간 30분</option>
				<option value="120">2시간</option>
				<option value="150">2시간 30분</option>
				<option value="180">3시간</option>
			</select>
		</div>
	</div>

	<div id="location">
		<div class="location_ann">
			<ul>
				<li class="location_ann_title">위치</li>
				<li class="location_ann_cf">* 상품을 구매할 위치를 정확하게 입력해주세요.</li>
			</ul>
		</div>
		<div class="location_info">
			<input class="location_input1" type="text" placeholder="우편주소"
				disabled="disabled">
			<button onclick="location.href='#'">주소 검색</button>
			<input class="location_input" type="text" placeholder="도로명 주소"
				disabled="disabled"> <input class="location_input"
				type="text" placeholder="상세주소">
			<div class="location_img">
				<img src="#">
			</div>
		</div>
	</div>


</div>

<div class="write_content">

	<div class="write_title">본문 작성</div>

	<div class="main_text">
		<ul>
			<li class="pic_title">사진</li>
			<li class="pic_cf">* 최대 1장</li>
		</ul>
		<button class="upload_btn" onclick="upload()"><img src="${path}/images/board/upload.png"> </button>
			<input class="upload_file" type="file" hidden="hidden">
		<ul>
			<li class="title">제목</li>
			<li><textarea class="title_input" placeholder="제목을 입력하세요."></textarea></li>
			<li class="context">내용</li>
			<li><textarea class="context_input" placeholder="내용을 입력하세요."></textarea>
			</li>
		</ul>
	</div>



	<div class="done">

		<button class="done_btn" onclick="editCom()">작성완료</button>
	</div>
</div>

<script>
function upload(){
	$(".upload_file").click()
	};
</script>