<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet" href="${path}/css/myPage/common_mypage.css">
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${path}/css/modal/findModal.css">
<script defer src="${path}/js/myPage/commonMypage.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>MyPage</title>
<script>
		function updateCustomerInfo() {
			alert("updateCustomerInfo()!!!!");
			var path = "${path}";
			
			var email = $("#email").val();
			var password = $("#password").val();
			var phoneNumber = $("#phone").val();
			var address = $("#address").val();
			var addressDetail = $("#address_detail").val();
			var birthday = $("#date").val();
			console.log("birthday @ AJAX call", birthday);
			
			var obj = {
					"email" : email,
					"password": password,
					"phoneNumber" : phoneNumber,
					"address" : address,
					"addressDetail" : addressDetail,
					"birthday" : birthday + ""
			}
			
			console.log(obj.birthday);
			
			$.ajax({
				url : path + "/myPage/updateCustomerInfo.do",
				data: JSON.stringify(obj),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				type: "POST",
				success : function(result) {
					if(result == true) {
						alert("수정이 완료되었습니다.");			
					}
					else {
						("수정 실패했습니다.");
					}
				},
				error : function() {
					alert("에러가 발생했습니다.");
				}
			})
		}
	</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<!-- zero_container -->
	<div class="zero_container zn_center">
		<!-- mypage_container -->
		<div class="mypage_container">
			<!-- zero_sbn -->
			<%@include file="common/myPageSnb.jsp" %>
			<!-- //zero_sbn -->
			<!-- mypage_detail_wrap -->
			<div class="mypage_detail_wrap">
	            <!-- my_info_wrap -->
	            <div id="personalInfo" class="my_info_wrap">
				</div>
	            <!-- //my_info_wrap -->
				<!-- contents_wrap -->
				<div class="contents_wrap">
					<span class="info_font">개인정보</span>
					<hr>
					<br>
					<br>
					<br>
					<span class="check_pw"> 비밀번호 확인 </span>
					<br>
					<br>
					<span class="prompt_msg">비밀번호 확인 고객님의
						소중한 개인정보 보호를 위해 비밀번호를 다시 한번 입력해 주세요</span>
					<br>
					<br>
					<br>
					<div class = "pw_container"> 
					<div class="container_left">비밀번호</div>
					<input class="pw_input" type="password" id="password" name="password"
						placeholder="비밀번호를 입력하세요." required> 
						<button type="button" class="btn_orange_small" id="pw_check_btn"> 확인</button>
						<input type="hidden" name="email" id="email" value=${customerVo.email}>
					</div>
				</div>
				<div id="modal"></div>
			</div>
			<!-- //contents_wrap -->
		</div>
		<!-- //mypage_detail_wrap -->
	</div>
	<!-- //mypage_container -->
	
	<!-- //zero_container -->
	<%@include file="../common/footer.jsp"%>
	<script>
	var path = "${path}";	
	</script>
	
	
	<script src="${path}/js/myPage/myInfo.js" type="text/javascript">
	</script>
	
	
	
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
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
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
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
	</script>
	
	<script>
		function validatePassword(){
			var password = document.getElementById("password");
		  	var password_check = document.getElementById("password_check");
		  	if(password.value != password_check.value) { // 만일 두 인풋 필드값이 같지 않을 경우
		    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
		    	//alert("비밀번호 확인 불일치");
		    	password_check.setCustomValidity("비밀번호가 일치하지 않습니다."); 
		  	} 
		  	else { // 만일 두 인풋 필드값이 같을 경우
		    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
		    // 따라서 빈값을 주어 update_btn 처리되게 한다
		  	  password_check.setCustomValidity(''); 
		  	}
		}
	</script>
	
	<script>
		document
		.getElementById("update_btn")
		.addEventListener("click", function(event){event.preventDefault();};)
	</script>

	
</body>
</html>

























