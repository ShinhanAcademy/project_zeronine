function loadMore(){ 
	keyword = $("#search").val();
	console.log("keyword", keyword);
	var data = data_json;
	if(keyword==""){
		data = data_json;
	} else{
		data = result;
	}

	var totalLength = data.length;
	var endNum = initNum;

	if(endNum < totalLength){
		$("#loadMore_btn").show();
		showHtml(data.slice(initNum, initNum+9));
		initNum += 9;
		if(initNum >= totalLength){
			$("#loadMore_btn").hide();
		} 
	}
}
