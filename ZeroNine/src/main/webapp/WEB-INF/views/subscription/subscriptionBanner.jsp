<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp"%>
<title>구독권 구매</title>
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>

	var IMP = window.IMP; 
	IMP.init("imp31265537"); //imp31265537
	
	var today = new Date();   
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	var seconds = today.getSeconds();  // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	var priceWon = document.getElementById("totalprice_text").innerText.replace(/,/g,'');
	var price = priceWon.substr(0, priceWon.length-1);
	var email =  "${customer.email}";
	var name = "${customer.customerName}";
	
	
	function requestPay() {
	    IMP.request_pay({
	    	pg : 'html5_inicis',
	        pay_method : 'card',
	        merchant_uid: "IMP"+makeMerchantUid, 
	        name : '즉시배송 결제', 
	        amount : price/100,
	        buyer_name : name,
	        buyer_email : email
	    }, function (rsp) { // callback
	        if (rsp.success) {
	        } else {
	        }
	    });
	}
</script>
</head>
<%@include file="../common/header.jsp"%>
<body>
<button onclick="requestPay()">결제하기</button>
<%@include file="../common/footer.jsp"%>
</body>
</html>