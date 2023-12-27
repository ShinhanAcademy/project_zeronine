var cookieEmail = getCookie("Cookie_email");

if(cookieEmail){
	$("#email").val(cookieEmail);
	$("#remember_id").attr("checked", true);
}

document.getElementById("join_btn").onclick = function(){
	location.href = path + "/auth/joinMembership.do";
};

function search() {

var email = $("#email").val();
var idChk = $("#remember_id").is(":checked");

if(idChk){
	setCookie("Cookie_email", email, 7); //7일동안 저장
}else{
	deleteCookie("Cookie_email");
}

var obj = { 
				"email" : $("#email").val(),
				"password" : $("#password").val()
			  };
			  
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
	}
$("#password").keypress(function(event){
	if(event.which===13){
	event.preventDefault();
	search();
	}
});
$("#login_btn").click(function() {
	search();
});

function setCookie(cookieName, value, exdays){
  var exdate = new Date();
  exdate.setDate(exdate.getDate() + exdays);	// 쿠키 저장 기간
  var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
  document.cookie = cookieName + "=" + cookieValue;
}

function getCookie(cookieName) {
  cookieName = cookieName + '=';
  var cookieData = document.cookie;
  var start = cookieData.indexOf(cookieName);
  var cookieValue = '';
  
  if(start != -1){
    start += cookieName.length;
    var end = cookieData.indexOf(';', start);
  if(end == -1)end = cookieData.length;
  	cookieValue = cookieData.substring(start, end);
  }
  return unescape(cookieValue);
}

function deleteCookie(cookieName){
  var expireDate = new Date();
  expireDate.setDate(expireDate.getDate() - 1);
  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

