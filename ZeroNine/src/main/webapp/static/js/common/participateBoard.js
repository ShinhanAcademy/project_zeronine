function handleCheckbox(clickedCheckbox) {
            var checkboxes = document.getElementsByName('checkboxGroup');
            checkboxes.forEach(function(checkbox) {
                if (checkbox !== clickedCheckbox) {
                    checkbox.checked = false;
                }
            });
            
            row = clickedCheckbox.closest('tr');
            selectedCount = row.querySelector('[name=select_count]').value;
			onePrice = row.querySelector('#onePrice').value;
            
            console.log("selectedCount",selectedCount);
            console.log("onePrice",onePrice);
            
            var tp = document.querySelectorAll('.totalPrice');
			for (var i=0; i<2; i++){
				tp[i].innerHTML = selectedCount * onePrice;
			}
            
            
}

function countQuantityF(){
		selectedCount = row.querySelector('[name=select_count]').value;
}



