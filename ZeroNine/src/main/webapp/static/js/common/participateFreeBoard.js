myMap = new Map();
checkboxes = document.getElementsByName('checkboxGroup');

function handleCheckbox(){
	price = 0;
	checkboxes.forEach(function(checkbox){
		var row = checkbox.closest('tr');
		var productId = row.querySelector('#check_box').value;
		var selectedCount = row.querySelector('[name=select_count]').value;
		if(checkbox.checked){
			price = price + (row.querySelector('#onePrice').value * selectedCount);
			myMap.set(productId,selectedCount);
		}else{
			myMap.delete(productId);
		}
	})
	$(".totalPrice").html(Intl.NumberFormat().format(price) + " 원");
	}

function countQuantityF(clickedCheckbox) {
	handleCheckbox();
		
	var cRow = clickedCheckbox.closest('tr');
	var check = cRow.querySelector('#check_box');
	var itemPriceValue = cRow.querySelector('[name=select_count]').value * cRow.querySelector('#onePrice').value;
	var deliformattedValue = new Intl.NumberFormat('ko-KR', {
		style: 'decimal',
		currency: 'KRW' // 대한민국 원
		}).format(itemPriceValue);	
	cRow.querySelector('#ob_price').innerText = deliformattedValue+"원";
}

$(".participate_btn").click(function(){
	var obj = {"myMap":Object.fromEntries(myMap)};
	$.ajax({
					url : path + '/common/orderFree.do',
					type: "POST",
					data: JSON.stringify(obj),
					contentType: "application/json",
					success : function(responseData) {
						$("#here").html(responseData);
					}
			});

});


