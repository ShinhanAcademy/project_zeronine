function selectAll(selectAll){
	const checkboxes = document.getElementsByName('agree');
	
	checkboxes.forEach((checkbox)=>{
		checkbox.checked = selectAll.checked;
	})
}

function f_email_check() {

				var obj = {	"email" : $("#email").val() };

				$.ajax({
					url : path + "/auth/confirmEmail.do",
					data : obj,
					type : "POST",
					success : function(result) {
						if (result == 0) {
							$("#hidden_email_check").val('1');
							alert("사용가능한 이메일입니다.");
						} else {
							$("#hidden_email_check").val('2');
							alert("누군가 이 이메일을 사용하고 있어요.");
						}
					},
					error : function() {
						alert("에러입니다.");
					}
				});
			}

function f_phone_check() {

				var obj = {	"phone" : $("#phone").val() };

				$.ajax({
					url : path + "/auth/confirmPhone.do",
					data : obj,
					type : "POST",
					success : function(result) {
						if (result == 0) {
							$("#hidden_phone_check").val('1');
							alert("사용가능한 번호입니다.");
						} else {
							$("#hidden_phone_check").val('2');
							alert("누군가 이 번호를 사용하고 있어요.");
						}
					},
					error : function() {
						alert("에러입니다.");
					}
				});
			}

function f_join(){
				
				if($("#password").val()!=$("#password_check").val()){
					alert("두 개의 비밀번호가 다릅니다.");
				}
				if($("#hidden_email_check").val()=='0'){
					alert("이메일 중복을 확인해주세요.");
				}
				if($("#hidden_email_check").val()=='2'){
					alert("다른 이메일을 사용해주세요.");
				}
				if($("#hidden_phone_check").val()=='0'){
					alert("휴대폰 번호 중복을 확인해주세요.");
				}
				if($("#hidden_phone_check").val()=='2'){
					alert("다른 휴대폰 번호를 사용해주세요.");
				}
				
				var obj = {
					"email" : $("#email").val(),
					"customerPassword": $("#password").val(),
					"customerName": $("#name").val(),
					"phoneNumber": $("#phone").val(),
					"address": $("#address_detail").val(),
					"birthday": $("#date").val()
				};
				$.ajax({
					url : path + "/auth/joinMembership.do",
					data : JSON.stringify(obj),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					type : "POST",
					success : function(result) {
						if(result>0){
							alert("회원가입에 성공하셨습니다.");
							location.href = path + "/auth/login.do";
						}
					},
					error : function() {
						alert("에러입니다.");
					}
				});
	
			}