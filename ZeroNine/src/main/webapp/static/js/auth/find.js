$("#getCf_btn").click(function(){

	var obj = {
		"name":$("#name").val(),
		"email":$("#email").val()
	};
	
	$.ajax({
		url : path + "/auth/findPwdCf.do",
		data : obj,
		type : "GET",
		success : function(response){	
			if(response.substr(30,3)==="yes"){
				$('#findPwdForm').html(response);
			}
			if(response.substr(34,2)==="no"){
				$('#modal').html(response);
			}
				
			
		},
		error : function(){
			alert("에러입니다.");
		}
	});

});



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

});