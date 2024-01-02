<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=cdc6b7de5328dfd553ed184a128185fa&autoload=false"></script>


<div class="content">


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
			<input id="address" class="location_input1" type="text" placeholder="도로명 주소"
				disabled="disabled">
			<button onclick="address_search()">주소 검색</button>
			 <input
				id="address_detail" class="location_input" type="text"
				placeholder="상세주소">
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
			<button class="upload_btn" onclick="upload()">
				<img src="${path}/images/board/upload.png">
			</button>

			<img class="preview" src="#"> <a class="delete_btn"
				onclick="previewDelete()" style="cursor: pointer"> <img
				class="delete_btn" src="/images/common/close.png"></a>
		</div>
		<form id="oBoardForm" hidden="hidden" enctype="multipart/form-data">
			<input class="upload_file" type="file" hidden="hidden" id="imgFile">
		</form>
		<ul>
			<li class="title">제목</li>
			<li><textarea class="title_input" placeholder="제목을 입력하세요."></textarea></li>
			<li id="one_context" class="context">내용</li>
			<li><textarea class="context_input" style="margin-bottom: 45px;" placeholder="내용을 입력하세요."></textarea>
			</li>
		</ul>
	</div>

</div>

<script>
	//map
	$("#map").hide();

	$(function() {
		printAddress();
	});

	//주소 검색
	function address_search() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("address").value = extraAddr;

				} else {
					document.getElementById("address").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('address').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("address_detail").focus();
			}
		}).open();
	}

	function printAddress() {
		//주소 입력시, enter 적용
		var input_address_detail = document.querySelector("#address_detail")
		input_address_detail.addEventListener("keydown", function(event) {
			if (event.keyCode === 13) {
				console.log($("#address").val());
				console.log($("#address_detail").val());
				var fulladdress = $("#address").val() + " "
						+ $("#address_detail").val();
				console.log(fulladdress);
				mapshow(fulladdress)
			}
		})

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

	//파일 업로드 btn
	function upload() {
		$(".upload_file").click()
	};

	//미리보기 및 삭제
	$(".preview").hide();
	$(".delete_btn").hide();

	$(".upload_file").on("change", function() {
		imgPreview(this);
	});

	function imgPreview(input) {
		var preview = document.querySelector(".preview");
		var file = input.files[0];
		var imgType = [ ".jpg", ".png", ".jpeg" ];
		var i;
		var isValidImg = false;

		console.log(file);

		if (file && file.name) {
			for (i = 0; i < imgType.length; i++) {
				if (file && file.name.toLowerCase().endsWith(imgType[i])) {
					isValidImg = true;
				}
			}
		}

		if (isValidImg) {
			var imgURL = URL.createObjectURL(file);
			preview.src = imgURL;
			$(".preview").show();
			$(".delete_btn").show();
		} else {
			alert("이미지 파일 형식(.jpg, .jpeg, .png)만 업로드 가능합니다.");
			preview.src = "#";
			$(".upload_file").val("");
		}
	}

	function previewDelete() {
		$(".preview").hide();
		$(".delete_btn").hide();
		$(".upload_file").val("");
	}

	document.querySelector("#time_setting").addEventListener("change",
			function() {
				var selectedValue = this.value;
				console.log(selectedValue);
			})
</script>