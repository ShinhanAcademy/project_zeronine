
  var bValue = sessionStorage.getItem("buttonValue");
console.log(bValue);
  $(function(){
  if(bValue!=null){
	search(1,bValue);
	sessionStorage.removeItem("buttonValue");
  sessionStorage.removeItem("buttonVal");
}else{
	    	search();
	    	}
	    });

	    
	   
	 
var previousClickedButton =null;
if(bValue!=null){
	console.log("갔냐?..");
	search(1,bValue);
}
function search(page,buttonValue) {
	if(buttonValue != null){
	sessionStorage.setItem("buttonVal", buttonValue);
	}
	var buttonVal = sessionStorage.getItem("buttonVal");
	if(bValue != null){
		buttonVal = bValue;
	}
 selectedValue = $('select[name="ptype"]').val();
console.log(buttonValue);
var obj = { "inputValue" : $("#inputValue").val(),
 			"selectedValue" : $('select[name="ptype"]').val(),
 			"pCount": page,
 			"buttonValue" : buttonVal
 };

	$.ajax({
            type: 'GET',
            url: path + "/product/pcategoryPageCount.do",
            data:obj,
            success: function(response){
            $('#here').html(response);
            $("#inputValue").val("");
         if (buttonValue && buttonValue.trim) {
        var trimmedButtonValue = buttonValue.trim();
        console.log("Trimmed Button Value:", trimmedButtonValue);
        if (previousClickedButton) {
          previousClickedButton.closest('.img_wrap').css('background-color', '#F2F2F2'); 
           previousClickedButton.closest('.category').find('p').css('color', '#000000'); 
        }
        var newButton = $('.buttonValuebtn[data-value="' + trimmedButtonValue + '"]');
        newButton.closest('.img_wrap').css('background-color', '#BFBFBF');
        newButton.closest('.category').find('p').css('color', '#0F82FF');
        previousClickedButton = newButton;
      }
            },
            error: function () {
             console.error('Error loading modal content:', error);
            }
        });
}


$("#inputValue").keypress(function(event){
	if(event.which===13){
	event.preventDefault();
	
	search();
	sessionStorage.removeItem("buttonValue");
	}
});

$("#searchbtn").click(function() {
	search();
	sessionStorage.removeItem("buttonValue");
})

