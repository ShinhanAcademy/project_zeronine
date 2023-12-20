const free_delivery_ecocare = document.getElementsByClassName("free_delivery_ecocare");
const ecocare = document.getElementsByClassName("ecocare");
const free_delivery = document.getElementsByClassName("free_delivery");
const ecocare_5 = document.getElementsByClassName("ecocare_5");
const modal = document.getElementById("modal_wrap");
const close_btn = document.getElementById("btn_cancel");
const subscript_name = document.getElementById("subscript_name");

free_delivery_ecocare[0].onclick = function(){
		subscript_name.innerHTML = free_delivery_ecocare[0].getAttribute('data-value');
		modal.style.display = 'block';
}
ecocare[0].onclick = function(){
		subscript_name.innerHTML = ecocare[0].getAttribute('data-value');
		modal.style.display = 'block';
}
free_delivery[0].onclick = function(){
		subscript_name.innerHTML = free_delivery[0].getAttribute('data-value');
		modal.style.display = 'block';
}
ecocare_5[0].onclick = function(){
		subscript_name.innerHTML = ecocare_5[0].getAttribute('data-value');
		modal.style.display = 'block';
}
ecocare_5[1].onclick = function(){
		subscript_name.innerHTML = ecocare_5[1].getAttribute('data-value');
		modal.style.display = 'block';
}

close_btn.onclick = function(){
	modal.style.display = 'none';
}

btn_check.onclick = function(){
	if(subscript_name.innerHTML == "에코케어+무료 배송 이용권"){
		requestPaySubscription('에코케어 + 무료배송', 1); 
	}else if(subscript_name.innerHTML == "에코케어 이용권"){
		requestPaySubscription('에코케어 이용권', 1);
		//location.href='subscriptionBanner.do?subscriptionType=ecocare';
	}else if(subscript_name.innerHTML == "무료 배송 이용권"){
		requestPaySubscription('무료 배송 이용권', 1);
		//location.href='subscriptionBanner.do?subscriptionType=free_delivery';
	}else{
		requestPaySubscription('5회 이용권', 1);
		//location.href='subscriptionBanner.do?subscriptionType=ecocare_5';
	}
}
