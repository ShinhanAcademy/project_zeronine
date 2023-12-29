function draw(max, classname, colorname, backgroundColor){
	   var i=1;
	    var func1 = setInterval(function(){
	      if(i<=max){
	          color1(i,classname,colorname, backgroundColor);
	          i++;
	      } else{
	        clearInterval(func1);
	      }
	    },10);
	};

	function color1(i, classname,colorname, backgroundColor){

	   $(classname).css({
	        "background":"conic-gradient("+colorname+" 0% " + i + "%, " + backgroundColor + " " + i + "% 100%)"
	   });
	};

$(".freeBoardDetail").click(function(){

	var boardId = $(this).closest('tr').find('#hiddenBoardId').val();
	var isSuccess = $(this).closest('tr').find('#hiddenIsSuccess').val();

	var obj = {
				"boardId" : boardId,
				"isSuccess" : isSuccess
				};
	
		$.ajax({
					url : path + "/myPage/subPage/participatedFreeBoardDetail.do",
					data : obj,
					type : "GET",
					success : function(result) {
						$("#here").html(result);
						var each_ratio = $("#chart").attr("value");
						var color = $("#chart").attr("value")<35?'#09244B':each_ratio>=35 && each_ratio<70?'#F1C21B':'#F11B1B';
						var back = $("#chart").attr("value")<35?'#7390BA':each_ratio>=35 && each_ratio<70?'#F9E59E':'#F99E9E';
						draw($("#chart").attr("value"), "#chart", color, back);
					},
					error : function() {
						alert("에러입니다.");
					}
				});

});
//무배
$("#freeDelivery").click(function(){
callFreeDelivery();
callSuccessFreeDelivery();
});

//즉배
$("#fastDelivery").click(function(){
callFastDelivery(1);
callSuccessFastDelivery(1);
});
function callFastDelivery(page){
	var obj = {"pCount" : page };
	$.ajax({
					url : path + "/myPage/subPage/pbFastDelivery.do",
					type : "GET",
					data : obj,
					success : function(result) {
						$("#hereContents1").html(result);
					},
					error : function() {
						alert("에러입니다.");
					}
				});
}

function callSuccessFastDelivery(page){
	var obj = {"pCount" : page };
	$.ajax({
					url : path + "/myPage/subPage/pbFastSuccessDelivery.do",
					type : "GET",
					data : obj,
					success : function(result) {
						$("#hereContents2").html(result);
					},
					error : function() {
						alert("에러입니다.");
					}
				});
}
function callFreeDelivery(page){
	var obj = {"pCount" : page };
	$.ajax({
					url : path + "/myPage/subPage/pbFreeDelivery.do",
					type : "GET",
					data : obj,
					success : function(result) {
						$("#hereContents1").html(result);
						$(".pie-chart").each(function(index,item){
							var each_ratio = $(this).attr("value");
							var color = $(this).attr("value")<35?'#09244B':each_ratio>=35 && each_ratio<70?'#F1C21B':'#F11B1B';
							var back = $(this).attr("value")<35?'#7390BA':each_ratio>=35 && each_ratio<70?'#F9E59E':'#F99E9E';
							draw($(this).attr("value"), this, color, back);
						});
					},
					error : function() {
						alert("에러입니다.");
					}
				});
}
function callSuccessFreeDelivery(page){
	var obj = {"pCount" : page };
	$.ajax({
					url : path + "/myPage/subPage/pbFreeDeliverySuccess.do",
					type : "GET",
					data : obj,
					success : function(result) {
						$("#hereContents2").html(result);
						$(".pie-chart").each(function(index,item){
							var each_ratio = $(this).attr("value");
							var color = $(this).attr("value")<35?'#09244B':each_ratio>=35 && each_ratio<70?'#F1C21B':'#F11B1B';
							var back = $(this).attr("value")<35?'#7390BA':each_ratio>=35 && each_ratio<70?'#F9E59E':'#F99E9E';
							draw($(this).attr("value"), this, color, back);
						});
					},
					error : function() {
						alert("에러입니다.");
					}
				});
}
$(".boardDetail").click(function(){

	var boardId = $(this).closest('tr').find('#hiddenBoardId').val();

	var obj = {"boardId" : boardId};
	
		$.ajax({
					url : path + "/myPage/subPage/participatedBoardDetail.do",
					data : obj,
					type : "GET",
					success : function(result) {
						$("#here").html(result);
					},
					error : function() {
						alert("에러입니다.");
					}
				});

});