function loadMore(){ 
	keyword = $("#search").val();
	console.log("keyword", keyword);
	var data = info_json;
	if(keyword==""){
		data = info_json;
	} else{
		data = result;
	}

	var totalLength = data.length;
	var endNum = initNum;

	if(endNum < totalLength){
		$("#loadMore_btn").show();
		show(data.slice(initNum, initNum+9));
		initNum += 9;
		if(initNum >= totalLength){
			$("#loadMore_btn").hide();
		} 
	}
}
