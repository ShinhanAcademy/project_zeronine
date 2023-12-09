<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<span style='display: none'>yes</span>
<div class="find_container zn_center" id="pwd_container">
	<div class="form_group">
		<label>이름</label> <input type="text" name="name" id="name"
			value="${name}"> <label>이메일</label> <input type="email"
			name="email" id="email" value="${email}"> <label
			id="cf_label">인증번호</label> <input type="text" name="cfNum" id="cfNum"
			placeholder="인증번호 6자리">
		<button type="button" id="cf_btn">메일발송</button>
		<button type="button" id="find_btn_pwd">확인</button>
	</div>
</div>
<div id="modal"></div>


<script>
	var path = "${path}";

	$("#cf_btn").click(function() {

		var pwd = "${pwd}";

		var obj = {
			"pwd" : pwd,
			"name" : $("#name").val(),
			"email" : $("#email").val()
		};

		$.ajax({
			url : path + "/auth/findPwdCf.do",
			type : "POST",
			data : obj,
			success : function(response) {
				alert("인증번호가 발송되었습니다");
				$('#findPwdForm').html(response);
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	});

	$("#find_btn_pwd").click(function() {

		var authKey = "${authKey}";
		var inputAuthKey = $("#cfNum").val();
		var pwd = "${pwd}";

		var obj = {
			"authKey" : authKey,
			"inputAuthKey" : inputAuthKey,
			"pwd" : pwd,
			"name" : $("#name").val()
		};

		$.ajax({
			url : path + "/auth/findPwd.do",
			type : "POST",
			data : obj,
			success : function(response) {
				$('#modal').html(response);
			},
			error : function() {
				alert("에러입니다.");
			}
		});

	});
</script>
