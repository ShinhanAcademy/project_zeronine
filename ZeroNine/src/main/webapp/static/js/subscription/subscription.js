const free_delivery_ecocare = document.getElementsByClassName("free_delivery_ecocare");
const ecocare = document.getElementsByClassName("ecocare");
const free_delivery = document.getElementsByClassName("free_delivery");
const ecocare_5 = document.getElementsByClassName("ecocare_5");
const modal = document.getElementById("modal_wrap");
const close_btn = document.getElementById("btn_cancel");
const subscript_name = document.getElementById("subscript_name");

free_delivery_ecocare[0].onclick = function(){
		if(customerId==""){
			alert("로그인한 후 이용해주세요.");
			location.href = "/auth/login.do";
			return;	
		}
		subscript_name.innerHTML = free_delivery_ecocare[0].getAttribute('data-value');
		modal.style.display = 'block';
}
ecocare[0].onclick = function(){
		if(customerId==""){
			alert("로그인한 후 이용해주세요.");
			location.href = "/auth/login.do";	
			return;
		}
		subscript_name.innerHTML = ecocare[0].getAttribute('data-value');
		modal.style.display = 'block';
}
free_delivery[0].onclick = function(){
		if(customerId==""){
			alert("로그인한 후 이용해주세요.");
			location.href = "/auth/login.do";	
			return;
		}
		subscript_name.innerHTML = free_delivery[0].getAttribute('data-value');
		modal.style.display = 'block';
}
ecocare_5[0].onclick = function(){
		if(customerId==""){
			alert("로그인한 후 이용해주세요.");
			location.href = "/auth/login.do";
			return;	
		}
		subscript_name.innerHTML = ecocare_5[0].getAttribute('data-value');
		modal.style.display = 'block';
}
ecocare_5[1].onclick = function(){
		if(customerId==""){
			alert("로그인한 후 이용해주세요.");
			location.href = "/auth/login.do";
			return;	
		}
		subscript_name.innerHTML = ecocare_5[1].getAttribute('data-value');
		modal.style.display = 'block';
}

close_btn.onclick = function(){
	modal.style.display = 'none';
}

btn_check.onclick = function(){
	modal.style.display = 'none';
	if(subscript_name.innerHTML == "에코케어+무료 배송 이용권"){	
		requestPaySubscription('에코케어+무료 배송 이용권', 9000/100); 
	}else if(subscript_name.innerHTML == "에코케어 이용권"){
		requestPaySubscription('에코케어 이용권', 5900/100);
		//location.href='subscriptionBanner.do?subscriptionType=ecocare';
	}else if(subscript_name.innerHTML == "무료 배송 이용권"){
		requestPaySubscription('무료 배송 이용권', 5400/100);
		//location.href='subscriptionBanner.do?subscriptionType=free_delivery';
	}else{
		requestPaySubscription('5회 이용권', 2300/100);
		//location.href='subscriptionBanner.do?subscriptionType=ecocare_5';
	}
}
