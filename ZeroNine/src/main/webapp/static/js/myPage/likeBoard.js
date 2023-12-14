function draw(max, classname, colorname){
	   var i=1;
	    var func1 = setInterval(function(){
	      if(i<=max){
	          color1(i,classname,colorname);
	          i++;
	      } else{
	        clearInterval(func1);
	      }
	    },10);
	};

	function color1(i, classname,colorname){

	   $(classname).css({
	        "background":"conic-gradient("+colorname+" 0% "+i+"%, #7390BA "+i+"% 100%)"
	   });
	};

$(".freeBoardDetail").click(function(){

	var boardId = $(this).closest('tr').find('#hiddenBoardId').val();

	var obj = {"boardId" : boardId};
	
		$.ajax({
					url : path + "/myPage/subPage/likeFreeBoardDetail.do",
					data : obj,
					type : "GET",
					success : function(result) {
						$("#here").html(result);
						draw($("#chart").attr("value"), "#chart", '#09244B');
					},
					error : function() {
						alert("에러입니다.");
					}
				});

});

$("#freeDelivery").click(function(){
	$.ajax({
					url : path + "/myPage/subPage/lbFreeDelivery.do",
					type : "GET",
					success : function(result) {
						$("#hereContents").html(result);
						
						$(".pie-chart").each(function(index,item){
							draw($(this).attr("value"), this, '#09244B');
						});
					
					},
					error : function() {
						alert("에러입니다.");
					}
				});
});


$("#fastDelivery").click(function(){
	$.ajax({
					url : path + "/myPage/subPage/lbFastDelivery.do",
					type : "GET",
					success : function(result) {
						$("#hereContents").html(result);
					},
					error : function() {
						alert("에러입니다.");
					}
				});
});

$(".boardDetail").click(function(){

	var boardId = $(this).closest('tr').find('#hiddenBoardId').val();

	var obj = {"boardId" : boardId};
	
		$.ajax({
					url : path + "/myPage/subPage/likeBoardDetail.do",
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