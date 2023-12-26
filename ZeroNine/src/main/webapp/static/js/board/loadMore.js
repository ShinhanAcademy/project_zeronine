var initNum = 0;

//loadMore
function loadMore(data){ 
	keyword = $("#search").val();
	console.log(keyword);
	if(keyword==""){
		console.log("aa");
		var data = info_json;
	} else{
		console.log("bb");
		data = result;
	}
	console.log(data);
	totalList = data.length;
	if(initNum <= totalList){
		show(data.slice(initNum, initNum+9))
		initNum += 9;
	} else {
		$("#loadMore_btn").hide();
	}
}
	
