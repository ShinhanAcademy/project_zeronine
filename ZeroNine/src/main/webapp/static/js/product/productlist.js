	
	 
$(".fluent_basket").click(function () {
			var obj = {	"pCategoryId" : 1};
			
			$.ajax({
					url : path + "/product/productCategory.do",
					data : obj,
					type : "GET",
					success : output,
					error : function() {
						alert("에러입니다.");
					}
				});
});
$(".lotion").click(function () {

			var obj = {	"pCategoryId" : 2};
			
			$.ajax({
					url : path + "/product/productCategory.do",
					data : obj,
					type : "GET",
					success : output,
					error : function() {
						alert("에러입니다.");
					}
				});
});
$(".food_navi").click(function () {
			var obj = {	"pCategoryId" : 3};
			
			$.ajax({
					url : path + "/product/productCategory.do",
					data : obj,
					type : "GET",
					success : output,
					error : function() {
						alert("에러입니다.");
					}
				});
});
$(".raphael_cart").click(function () {
			var obj = {	"pCategoryId" : 0};
			
			$.ajax({
					url : path + "/product/productCategoryall.do",
					data : obj,
					type : "GET",
					success : output,
					error : function() {
						alert("에러입니다.");
					}
				});
})
function search() {
var obj = { "q" : $("#q").val() };

	$.ajax({
            type: 'GET',
            url: path + "/product/selectByPnameBrand.do",
            data:obj,
            success: output,
           
            error: function () {
              alert("에러입니다.");
            }
        });
}
$("#q").keypress(function(event){
	if(event.which===13){
	event.preventDefault();
	search();
	}
});

$("#searchbtn").click(function() {

	search();
})

function chanb() {
    var selectedValue = $('select[name="ptype"]').val();
    // Check if the selected value is 1
    if (selectedValue === "1") {
    
        // Perform your AJAX request
        $.ajax({
            type: 'GET',
            url: path + "/product/selectBymanyLiked.do",
            
            success: output,
           
            error: function () {
              alert("에러입니다.");
            }
        });
    }else if(selectedValue === "0") {
    $.ajax({
            type: 'GET',
            url: path + "/product/selectByAll.do",
            
            success: output,
           
            error: function () {
              alert("에러입니다.");
            }
        });
    
}else if(selectedValue === "2") {
    $.ajax({
            type: 'GET',
            url: path + "/product/selectByDelivery.do",
            
            success: output,
           
            error: function () {
              alert("에러입니다.");
            }
        });
    
}else if(selectedValue === "3") {
    $.ajax({
            type: 'GET',
            url: path + "/product/selectBypriceAsc.do",
            
            success: output,
           
            error: function () {
              alert("에러입니다.");
            }
        });
    
}else if(selectedValue === "4") {
    $.ajax({
            type: 'GET',
            url: path + "/product/selectBypriceDesc.do",
            
            success: output,
           
            error: function () {
              alert("에러입니다.");
            }
        });
    
}
    }

function output(response){ 
 
 
$('#here').html(response);


} 


