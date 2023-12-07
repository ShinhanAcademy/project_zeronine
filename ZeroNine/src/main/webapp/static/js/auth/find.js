


$("#find_btn").click(function(){
	
	var obj = {
		"name":$("#name").val(),
		"phone":$("#phone").val()
	};
	
	$.ajax({
		url : path + "/auth/findId.do",
		data : obj,
		type : "POST",
		success : function(response){
			$('#modal').html(response);
		},
		error : function(){
			alert("에러입니다.");
		}
	});

})