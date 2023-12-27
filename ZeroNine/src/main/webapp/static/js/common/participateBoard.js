plus = 0

selectedCount = $('#select_count').val();
onePrice = $('#onePrice').val();
$(".totalPrice").html(Intl.NumberFormat().format(selectedCount * onePrice) + " 원"); 
$("#productId").val($('#check_box').val());
$("#count").val($('#select_count').val());

totalPrice = selectedCount * onePrice; 

if(isFreeDelivery>0){
	document.getElementById("itemprice_deli").innerText = "0 원";
}else{
		if (totalPrice < 50000) {
			plus = 3000;
			document.getElementById("itemprice_deli").innerText = "3000 원";
		} else {
			document.getElementById("itemprice_deli").innerText = "0 원";
		}
}

$(".realTotalPrice").html(Intl.NumberFormat().format(totalPrice + plus) + " 원");

function countQuantityF(){
		selectedCount = $('#select_count').val();
		$(".totalPrice").html(Intl.NumberFormat().format(selectedCount * onePrice) + " 원");
		$("#count").val(selectedCount);
		totalPrice = selectedCount * onePrice; 
		if(totalPrice<50000){
			plus = 3000
			document.getElementById("itemprice_deli").innerText = "3000 원";
		}else{
			document.getElementById("itemprice_deli").innerText= "0 원";
		}
		
		$(".realTotalPrice").html(Intl.NumberFormat().format(totalPrice + plus) + " 원");
}



