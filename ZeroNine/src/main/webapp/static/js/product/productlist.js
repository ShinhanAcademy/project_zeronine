 
  var bValue = sessionStorage.getItem("buttonValue");
console.log(bValue);
  $(function(){
  if(bValue!=null){
	console.log("갔나?");
	search(1,bValue);
	
}else{
	    	search();
	    	}
	    });

	    
	   
	   const productInCart = [];  
	   cartcheck = cartcheck.replace(/\[|\]/g, '');
 		cartcheckArray = cartcheck.split(',').map(function(item) {
	        return item.trim(); // Remove extra spaces
	    });
var previousClickedButton =null;
if(bValue!=null){
	console.log("갔냐?..");
	search(1,bValue);
}
function search(page,buttonValue) {

 selectedValue = $('select[name="ptype"]').val();
console.log(buttonValue);
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
         if (buttonValue && buttonValue.trim) {
        var trimmedButtonValue = buttonValue.trim();
        console.log("Trimmed Button Value:", trimmedButtonValue);
        if (previousClickedButton) {
          previousClickedButton.closest('.img_wrap').css('background-color', '#F2F2F2'); 
           previousClickedButton.closest('.category').find('p').css('color', '#000000'); 
        }
        var newButton = $('.buttonValuebtn[data-value="' + trimmedButtonValue + '"]');
        newButton.closest('.img_wrap').css('background-color', '#BFBFBF');
        newButton.closest('.category').find('p').css('color', '#0047FF');
        previousClickedButton = newButton;
      }
      sessionStorage.removeItem("buttonValue");
            },
            error: function () {
             console.error('Error loading modal content:', error);
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
				  url: path+"/product/alreadyInCartModal.do",
				  type: "POST",
				  success: function(response) {
					 $("#modal").show();
				    $('#modal').html(response);
				  },
				  error: function(error) {
				    console.error('Error loading modal content:', error);
				  }
				});
		}	
	 }

$(".like").click(function (){

			             currentImagePath = $(this).find("img.menu_heart").attr("src");
			             newImagePath = currentImagePath === path+"/images/board/heart.png" ?
			                path+"/images/board/red_heart.png" :
			                path+"/images/board/heart.png";

			            $(this).find("img.menu_heart").attr("src", newImagePath);
			});	