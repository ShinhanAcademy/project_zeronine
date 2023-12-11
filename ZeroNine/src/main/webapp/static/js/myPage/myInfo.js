document.getElementById("pw_check_btn").onclick = function() {
			var email = $("#email").val();
			var password = $("#password").val();
			
			var obj = {
					"email" : email,
					"password" : password
			}
			
			$.ajax({
				url : path + "/myPage/validatePw.do",
				data: JSON.stringify(obj),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				type: "POST",
				success : function(result){
					console.log("result->", result);
					if(result.customerName == "invalid") {
						alert("틀린 비번");
						
						$('#modal').html(`
							<div id="modal_wrap">
									<div id="modal_body">
										<p>비밀번호가 틀렸습니다.</p>		
										<p>다시 입력해주세요.</p>	
										<button id="modal_btn" style="
										    font-size: 25px;
										    border-radius: 15px;
										">확인</button>	
									</div>
										
							</div>
							
							<script>
							var path = "${path}";
							
							$("#modal_btn").click(function(){
								location.href = path + "/myPage/myInfo.do";
							})
							</script>
						`);
						//alert("비밀번호가 틀렸습니다. 다시 입력하세요.");
					}
					else {
						//alert("good");
						
						var epochTime = result.birthday; // 주어진 Epoch 시간
						const KR_TIME_DIFF = 9 * 60 * 60 * 1000;
						epochTime += KR_TIME_DIFF;
						
						const date = new Date(epochTime);
						const formattedDate = date.toISOString().split('T')[0]; // "yyyy-mm-dd" 형식으로 변환
						
						result.birthdayFormmated = formattedDate;
						console.log("formatted =adfa=>", formattedDate);
						var updateForm = makeUpdateForm(result);
						$('.contents_wrap').html(updateForm);
						
						//location.href = path + "/main/main.do";
						//showUpdateForm(result);
					}
				},
				error : function(){
					alert("에러입니다.");
				}
			});
		}
		
function makeUpdateForm(result) {
	
	return `
		<div class="contents_wrap">
		<span class="info_font">개인정보</span>
		<hr>
		<br>
		<br>
		<br>
		<div class="update_wrap">
			<form id="updateForm">
				<div class="update_container zn_center">
					<div class="form_group">
						<label>이름</label> <input disabled type="text" id="name" name="name"
							value = "${result.customerName}"
								required>
					</div>
					<div class="form_group">
						<label>이메일</label> <input disabled type="email" id="email"
							name="email" value="${result.email}" required>
					</div>
					<div class="form_group">
						<label>새 비밀번호</label> <input type="password" name="password"
							id="password" placeholder="새 비밀번호를 입력하세요."
							onkeyup ="validatePassword()"
						>
					</div>
					<div class="form_group">
						<label>새비밀번호 확인</label> 
						<input type="password"
							name="password_check" id="password_check"
							placeholder="새 비밀번호를 다시 입력하세요."
							onkeyup="validatePassword()"	
						>
					</div>
					<div class="form_group">
						<label>휴대폰 번호</label> <input type="tel" id="phone" name="phone"
							pattern="[0-9]{11}" placeholder="(-)를 제외하고 휴대폰 번호를 입력하세요."
							value="${result.phoneNumber}"
							required>
						<button type="button" class="double_check_btn" id="phone_check">중복확인</button>
						<input type="hidden" id="hidden_phone_check" value='0'>
					</div>
					<div class="form_group">
						<label>주소</label> <input disabled type="text" id="address"
							name="address" class="update_address" 
							value="${result.address}">
							
						<button type="button" class="address_search_btn"
						onclick="sample6_execDaumPostcode()">
							<img src="${path}/images/auth/search.png">우편 번호 검색
						</button>
					</div>
					<div class="form_group">
						<input class="update_address_detail" type="text"
							id="address_detail" name="address_detail"
								value="${result.addressDetail}"
							placeholder="상세 주소를 입력하세요." required>
					</div>
					<div class="form_group">
						<label>생년월일</label> <input type="date" id="date" name="date"
							value="${result.birthdayFormmated}"
							required>
					</div>
				</div>
				<button type="button" id="update_btn">수정하기</button>
			</form>

		</div>
		<!-- contents -->

		<!--  -->
	</div>
	
	`;
		
}

document.getElementById("update_btn").onclick = function() {
	var obj = {}

	$.ajax(
		{
			url : path + "" + "",
			data : JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			type: "POST",
			success: function(result) {
				alert("ㅇㅇ");
			},
			error : function() {
				alert("ㄴㄴ");
			}

		}
	);

}
		

		