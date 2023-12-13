draw(80, '.pie-chart', '#F11B1B');
function draw(max, classname, colorname){
   var i=1;
    var func1 = setInterval(function(){
      if(i<max){
          color1(i,classname,colorname);
          i++;
      } else{
        clearInterval(func1);
      }
    },10);
};

function color1(i, classname,colorname){
   $(classname).css({
        "background":"conic-gradient("+colorname+" 0% "+i+"%, #F99E9E "+i+"% 100%)"
   });
};

$(".freeBoardDetail").click(function(){

	var boardId = $(this).closest('tr').find('#hiddenBoardId').val();

	var obj = {"boardId" : boardId};
	
		$.ajax({
					url : path + "/myPage/subPage/createdFreeBoardDetail.do",
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

$("#freeDelivery").click(function(){
	$.ajax({
					url : path + "/myPage/subPage/cbFreeDelivery.do",
					type : "GET",
					success : function(result) {
						$("#hereContents").html(result);
					},
					error : function() {
						alert("에러입니다.");
					}
				});
});


$("#fastDelivery").click(function(){
	$.ajax({
					url : path + "/myPage/subPage/cbFastDelivery.do",
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
					url : path + "/myPage/subPage/createdBoardDetail.do",
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