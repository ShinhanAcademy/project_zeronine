$("#find_btn").click(function(){
	
	var obj = {
		"name":$("#name").val(),
		"phone":$("#phone").val()
	};
	
	$.ajax({
		url : path + "",
		data : obj,
		type : "POST",
		success : function(result){},
		error : function(){}
	});

})