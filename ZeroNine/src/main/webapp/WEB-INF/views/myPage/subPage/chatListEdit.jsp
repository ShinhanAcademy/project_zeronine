<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../common/head.jsp"%>
<%@include file="../../common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/board/boardEdit.css" />

<title>MyPage</title>

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
						<option value="fastBoard" disabled>슝슝 즉배</option>
						<option value="freeDeliveryBoard" disabled>알뜰 무배</option>
						<option value="oneTooneBoard" selected}>1:1 직거래</option>
					</select>
				</div>

				<div id="edit_change_area">
				<div class="content">


	<div class="due_date">
		<ul>
			<li class="due_date_title">시간</li>
			<li class="due_date_cf"><span> * 시간은 최대 3시간까지 설정 가능합니다.</span>
		</ul>

		<div class="date_input">
			<select name="time_setting" id="time_setting">
				<option selected>${info.remainTime}</option>
				<option disabled value="5">5분</option>
				<option disabled value="10">10분</option>
				<option disabled value="15">15분</option>
				<option disabled value="20">20분</option>
				<option disabled value="25">25분</option>
				<option disabled value="30">30분</option>
				<option disabled value="60">1시간</option>
				<option disabled value="90">1시간 30분</option>
				<option disabled value="120">2시간</option>
				<option disabled value="150">2시간 30분</option>
				<option disabled value="180">3시간</option>
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
			<input id="address" class="location_input1" type="text" value="${info.address}"
				disabled="disabled">
			<button onclick="address_search()" disabled>주소 검색</button>
			 <input
				id="address_detail" class="location_input" type="text"
				value="${info.addressDetail}">
			<div id="map">
				<img src="#">
			</div>
		</div>
	</div>


</div>

<div class="write_content" style="padding-bottom: 0px">

	<div class="write_title">본문 작성</div>

	<div class="main_text">
		<div class="upload">
			<ul>
				<li class="pic_title">사진</li>
				<li class="pic_cf">* 최대 1장</li>
			</ul>
			<button class="upload_btn" onclick="upload()" disabled>
				<img src="${path}/images/board/upload.png">
			</button>
			<img class="preview" src="${info.oBoardImagePath}">

		</div>
		
		<ul>
			<li class="title">제목</li>
			<li><textarea class="title_input" placeholder="제목을 입력하세요." onchange="editTitleF()">${info.oTitle}</textarea></li>
			<li id="one_context" class="context">내용</li>
			<li><textarea class="context_input" placeholder="내용을 입력하세요." onchange="editContextF()">${info.oContent}</textarea>
			</li>
		</ul>
	</div>

</div>
	</div>

				<div class="done">
					<button class="done_btn">작성완료</button>
				</div>
			</div>

		</div>
	</div>



	<script>
	editTitle =  $(".title_input").val();
	editContext =  $(".context_input").val();
	
	function editTitleF(){
		editTitle =  $(".title_input").val();
	}
	function editContextF(){
		editContext =  $(".context_input").val();
	}
	
	$(".done_btn").click(function(){
		var obj = {
				"boardId" : "${info.oBoardId}",
				"title" : editTitle,
				"context" : editContext
				};
		
		$.ajax({
					url : "${path}/myPage/subPage/completeChatEdit.do",
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

	$(function() {
		printAddress();
	});

	function printAddress() {
		//주소 입력시, enter 적용
		var input_address_detail = document.querySelector("#address_detail")
		var fulladdress = $("#address").val() + " " + $("#address_detail").val();
		mapshow(fulladdress)		
	}

	function mapshow(fulladdress) {

		$.ajax({
			url : "https://dapi.kakao.com/v2/local/search/address.json?query="
					+ fulladdress,
			type : "GET",
			headers : {
				"Authorization" : "KakaoAK 541a67b3c7684c9057ee9e734dd5ee5a"
			},
			success : function(data) {
				//좌표찾기
				if (data.documents && data.documents.length > 0) {
					var documents = data.documents[0];
					if (documents.address_type == "ROAD_ADDR") {
						var xPoint = documents.road_address.x;
						var yPoint = documents.road_address.y;
					} else if (documents.address_type == "REGION_ADDR") {
						var xPoint = documents.address.x;
						var yPoint = documents.address.y;
					}
					console.log(xPoint);
					console.log(yPoint);
				}
				console.log(data);

				//map 그리기
				$("#map").show();
				var container = document.querySelector("#map"); //HTML의 #map에 지도 그리기
				var onptions = {
					center : new kakao.maps.LatLng(yPoint, xPoint), //좌표
					level : 3
				//확대 가능한 레벨
				};
				var map = new kakao.maps.Map(container, onptions); //map을 좌표에 맞춰 생성

				//marker 생성
				var markerPosition = new kakao.maps.LatLng(yPoint, xPoint); //marker위치를 장소 위치로 생성
				var marker = new kakao.maps.Marker({
					position : markerPosition
				//marker 생성
				});
				marker.setMap(map); //마커를 map에 위치하여 그림 (set:속성을 부여)
			},
			error : function(e) {
				console.log(e);
			}
		})
	}
	
	</script>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>