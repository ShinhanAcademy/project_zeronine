 
  $(function(){
	    	search();
	    });
	    
	    
	   
	   const productInCart = [];  
	   cartcheck = cartcheck.replace(/\[|\]/g, '');
 		cartcheckArray = cartcheck.split(',').map(function(item) {
	        return item.trim(); // Remove extra spaces
	    });

function search(page,buttonValue) {
 selectedValue = $('select[name="ptype"]').val();

var obj = { "q" : $("#q").val(),
 			"selectedValue" : $('select[name="ptype"]').val(),
 			"pCount": page,
 			"buttonValue" : buttonValue
 };

	$.ajax({
            type: 'GET',
            url: path + "/product/pcategoryPageCount.do",
            data:obj,
            success: function(response){
            $('#here').html(response);
            $("#q").val("");
            },
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
	search(1);
})


	$(".like").click(function (){

			             currentImagePath = $(this).find("img.menu_heart").attr("src");
			             newImagePath = currentImagePath === path+"/images/board/heart.png" ?
			                path+"/images/board/red_heart.png" :
			                path+"/images/board/heart.png";

			            $(this).find("img.menu_heart").attr("src", newImagePath);
			});	
 

function handlegoCartButtonClick(index, productId) {

		 function isproductinCart(productId){
	    	  return cartcheckArray.some(function(item){
	    		  return item == productId;
	    	  })
	      }
	         likeButtonId = "gocart" + index;
	      
	        
		if(productInCart.includes(productId)==false){
				$.ajax({
					url : path +"/product/goProductCart.do",
					type: "POST",
					data : {"productId" :productId},
					success : function(){
						alert("잘담겼다!");
						
						if(!productInCart.includes(productId)) {
							productInCart.push(productId);
						}
					},
					error : function(){
						alert("에러입니다.");
					}
					}); 
		}else{
			$.ajax({
				url : path +"/product/plusProductCart.do",
				type: "POST",
				data : {"productId" :productId},
				success : function(){
					alert("또담겼다!");
				},
				error : function(){
					alert("에러입니다.");
				}
				}); 
		}	
	 }

