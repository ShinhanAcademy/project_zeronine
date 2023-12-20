plus = 0

function handleCheckbox(clickedCheckbox) {

            var checkboxes = document.getElementsByName('checkboxGroup');
            checkboxes.forEach(function(checkbox) {
                if (checkbox !== clickedCheckbox) {
                    checkbox.checked = false;
                }
            });
           
            if($(clickedCheckbox).prop("checked")==false){
                   $(".totalPrice").html("0 원");
                   $(".realTotalPrice").html("0 원");
                   return;
            }
            
            row = clickedCheckbox.closest('tr');
            selectedCount = row.querySelector('[name=select_count]').value;
			onePrice = row.querySelector('#onePrice').value;
            
            $(".totalPrice").html(Intl.NumberFormat().format(selectedCount * onePrice) + " 원"); 
            $("#productId").val(row.querySelector('#check_box').value);
			$("#count").val(row.querySelector('#select_count').value);
			
			 totalPrice = selectedCount * onePrice; 
			 if(totalPrice<50000){
			 	plus = 3000;
				document.getElementById("itemprice_deli").innerText = "3000 원";
			}else{
				document.getElementById("itemprice_deli").innerText= "0 원";
			}
			
			$(".realTotalPrice").html(Intl.NumberFormat().format(totalPrice + plus) + " 원");
}

function countQuantityF(){
		selectedCount = row.querySelector('#select_count').value;
		$(".totalPrice").html(Intl.NumberFormat().format(selectedCount * onePrice) + " 원");
		$("#count").val(row.querySelector('#select_count').value);
		totalPrice = selectedCount * onePrice; 
		if(totalPrice<50000){
			plus = 3000
			document.getElementById("itemprice_deli").innerText = "3000 원";
		}else{
			document.getElementById("itemprice_deli").innerText= "0 원";
		}
		
		$(".realTotalPrice").html(Intl.NumberFormat().format(totalPrice + plus) + " 원");
}




