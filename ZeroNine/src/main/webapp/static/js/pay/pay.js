var IMP = window.IMP; 
IMP.init("imp31265537"); //imp31265537

var today = new Date();   
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;

//var customerId = '490ef92a-d77f-432f-8bfb-2828eee6db77';
//var email = 'yongsu9630@gmail.com';

function requestPaySubscription(productName, price) {
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid: "IMP"+makeMerchantUid, 
        name : productName,
        //customerId : id,
        amount : price
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
            $.ajax({
                url: "/pay/subscription.do",
                method: "POST",
                headers: {"Content-Type": "application/json"},
                data : rsp
            })
        } else {
            console.log(rsp);
        }
    });
}