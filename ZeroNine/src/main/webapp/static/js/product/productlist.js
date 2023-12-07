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
});

function output(response){ 
 
 
$('#here').html(response);


} 


$(".like").click(function (){

            var currentImagePath = $(this).find("img.menu_heart").attr("src");
            var newImagePath = currentImagePath === path+"/images/board/heart.png" ?
                path+"/images/board/red_heart.png" :
                path+"/images/board/heart.png";

            $(this).find("img.menu_heart").attr("src", newImagePath);
});