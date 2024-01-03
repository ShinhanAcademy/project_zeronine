 
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
        newButton.closest('.category').find('p').css('color', '#0F82FF');
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

