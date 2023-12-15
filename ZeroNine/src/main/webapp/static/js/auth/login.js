document.getElementById("join_btn").onclick = function(){
	location.href = path + "/auth/joinMembership.do";
};

document.getElementById("login_btn").onclick = function(){
	var obj = { 
				"email" : $("#email").val(),
				"password" : $("#password").val()
			  }
			  
	$.ajax({
		url : path + "/auth/login.do",
		data: JSON.stringify(obj),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		type: "POST",
		success : function(result){
			if(result>0){
				location.href = path + "/main/main.do";
			}else{
				alert("로그인을 다시 시도해주세요.");
			}
		},
		error : function(){
			alert("에러입니다.");
		}
	});
};


